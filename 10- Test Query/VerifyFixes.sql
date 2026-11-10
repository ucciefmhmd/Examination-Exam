-- Verification checks for the grading and error-handling fixes.
--
-- Run it connected to a built Examination database, for example:
--   sqlcmd -S "(localdb)\MSSQLLocalDB" -d Examination -I -b -i "10- Test Query/VerifyFixes.sql"
--
-- It checks:
--   1. UpdateResultsTrigger re-scores every student in multi-row INSERT, UPDATE and DELETE.
--   2. CalculateTotalCorrectAnswers returns 0, not NULL, when nothing is correct.
--   3. InsertExamQuestionsRandomly adds exactly @NumberOfQuestions questions, and raises
--      error 50003 without inserting anything when more are requested than are available.
--   4. A forced error inside a procedure is raised to the caller and rolls the work back.
--
-- The script is repeatable: test data is created inside transactions that are rolled
-- back, and the error tests leave nothing behind. It prints one PASS/FAIL line per check
-- and ends with an error (so sqlcmd -b exits non-zero) if any check fails.

IF DB_ID() <= 4  -- master, tempdb, model, msdb
BEGIN
    RAISERROR(N'Connected to a system database. Connect to the Examination database first. (In SSMS, run SET NOEXEC OFF afterwards.)', 16, 1);
    SET NOEXEC ON;  -- skip the remaining batches in this session
END
GO

SET NOCOUNT ON;
IF OBJECT_ID(N'tempdb..#Results') IS NOT NULL DROP TABLE #Results;
CREATE TABLE #Results (Id INT IDENTITY PRIMARY KEY, Test NVARCHAR(200) NOT NULL, Passed BIT NOT NULL, Detail NVARCHAR(400) NULL);
GO

------------------------------------------------------------------------------------------
-- 1 and 2. Multi-row trigger, and 0 instead of NULL
------------------------------------------------------------------------------------------
SET NOCOUNT ON;
DECLARE @course INT, @exam INT, @q1 INT, @q2 INT, @s1 INT, @s2 INT, @s3 INT;
DECLARE @ins1 NVARCHAR(50), @ins2 NVARCHAR(50), @ins3 NVARCHAR(50),
        @upd1 NVARCHAR(50), @upd2 NVARCHAR(50),
        @del1 NVARCHAR(50), @del2 NVARCHAR(50),
        @wrong3 NVARCHAR(50), @fnNone INT, @fnWrong INT;

BEGIN TRY
    BEGIN TRANSACTION;

    -- Fixture: a course with two questions (marks 2 and 3), one exam, three students in it
    INSERT INTO dbo.Courses (C_name, C_minDegree, C_maxDegree, C_Description)
    VALUES (N'Verify course', 10, 60, N'created by VerifyFixes.sql, rolled back');
    SET @course = SCOPE_IDENTITY();

    INSERT INTO dbo.Questions (Q_Text, Q_correctAns, Q_type, Course_ID, Q_Mark) VALUES (N'Verify Q1', N'a', N'MCQ', @course, 2);
    SET @q1 = SCOPE_IDENTITY();
    INSERT INTO dbo.Questions (Q_Text, Q_correctAns, Q_type, Course_ID, Q_Mark) VALUES (N'Verify Q2', N'true', N'T/F', @course, 3);
    SET @q2 = SCOPE_IDENTITY();

    INSERT INTO dbo.Exam (E_startTime, E_endTime, E_type, E_year, E_allownce, Course_ID, Instructor_ID, Intake_ID, Track_ID, Branch_ID, E_Date)
    SELECT '09:00', '11:00', N'Normal', YEAR(GETDATE()), 1, @course,
           (SELECT MIN(Inst_ID) FROM dbo.Instructors), (SELECT MIN(Intake_ID) FROM dbo.Intake),
           (SELECT MIN(Track_ID) FROM dbo.Tracks), (SELECT MIN(Branch_ID) FROM dbo.Branchs),
           DATEADD(DAY, 1, CAST(GETDATE() AS date));
    SET @exam = SCOPE_IDENTITY();

    SELECT @s1 = MIN(Std_ID) FROM dbo.Students;
    SELECT @s2 = MIN(Std_ID) FROM dbo.Students WHERE Std_ID > @s1;
    SELECT @s3 = MIN(Std_ID) FROM dbo.Students WHERE Std_ID > @s2;

    INSERT INTO dbo.Student_Exam (Student_ID, Exam_ID, Results)
    VALUES (@s1, @exam, N'0'), (@s2, @exam, N'0'), (@s3, @exam, N'0');

    -- Multi-row INSERT for two students in one statement:
    -- s1 gets both right (2 + 3 = 5), s2 gets only Q2 right (3), s3 answers nothing.
    INSERT INTO dbo.Answer (Student_ID, Exam_ID, Question_ID, Student_answer)
    VALUES (@s1, @exam, @q1, N'a'), (@s1, @exam, @q2, N'true'),
           (@s2, @exam, @q1, N'x'), (@s2, @exam, @q2, N'true');

    SELECT @ins1 = Results FROM dbo.Student_Exam WHERE Student_ID = @s1 AND Exam_ID = @exam;
    SELECT @ins2 = Results FROM dbo.Student_Exam WHERE Student_ID = @s2 AND Exam_ID = @exam;
    SELECT @ins3 = Results FROM dbo.Student_Exam WHERE Student_ID = @s3 AND Exam_ID = @exam;

    -- 0, not NULL, for a student with no answers
    SET @fnNone = dbo.CalculateTotalCorrectAnswers(@exam, @s3);

    -- Multi-row UPDATE: s1 changes Q2 to wrong (5 -> 2), s2 changes Q1 to right (3 -> 5)
    UPDATE dbo.Answer
    SET Student_answer = CASE WHEN Student_ID = @s1 THEN N'false' ELSE N'a' END
    WHERE Exam_ID = @exam
      AND ((Student_ID = @s1 AND Question_ID = @q2) OR (Student_ID = @s2 AND Question_ID = @q1));

    SELECT @upd1 = Results FROM dbo.Student_Exam WHERE Student_ID = @s1 AND Exam_ID = @exam;
    SELECT @upd2 = Results FROM dbo.Student_Exam WHERE Student_ID = @s2 AND Exam_ID = @exam;

    -- Multi-row DELETE: remove Q2 answers for both (s1 stays 2, s2 5 -> 2)
    DELETE FROM dbo.Answer WHERE Exam_ID = @exam AND Question_ID = @q2;

    SELECT @del1 = Results FROM dbo.Student_Exam WHERE Student_ID = @s1 AND Exam_ID = @exam;
    SELECT @del2 = Results FROM dbo.Student_Exam WHERE Student_ID = @s2 AND Exam_ID = @exam;

    -- 0, not NULL, for a student whose only answer is wrong
    INSERT INTO dbo.Answer (Student_ID, Exam_ID, Question_ID, Student_answer) VALUES (@s3, @exam, @q1, N'wrong');
    SET @fnWrong = dbo.CalculateTotalCorrectAnswers(@exam, @s3);
    SELECT @wrong3 = Results FROM dbo.Student_Exam WHERE Student_ID = @s3 AND Exam_ID = @exam;

    ROLLBACK TRANSACTION;

    INSERT INTO #Results (Test, Passed, Detail) VALUES
    (N'1a trigger: multi-row INSERT scores every student',
        CASE WHEN @ins1 = N'5' AND @ins2 = N'3' AND @ins3 = N'0' THEN 1 ELSE 0 END,
        CONCAT(N'expected 5/3/0, got ', @ins1, N'/', @ins2, N'/', @ins3)),
    (N'1b trigger: multi-row UPDATE re-scores every student',
        CASE WHEN @upd1 = N'2' AND @upd2 = N'5' THEN 1 ELSE 0 END,
        CONCAT(N'expected 2/5, got ', @upd1, N'/', @upd2)),
    (N'1c trigger: multi-row DELETE re-scores every student',
        CASE WHEN @del1 = N'2' AND @del2 = N'2' THEN 1 ELSE 0 END,
        CONCAT(N'expected 2/2, got ', @del1, N'/', @del2)),
    (N'2a function: 0, not NULL, with no answers',
        CASE WHEN @fnNone = 0 THEN 1 ELSE 0 END,
        CONCAT(N'expected 0, got ', COALESCE(CONVERT(NVARCHAR(20), @fnNone), N'NULL'))),
    (N'2b function and trigger: 0, not NULL, with only wrong answers',
        CASE WHEN @fnWrong = 0 AND @wrong3 = N'0' THEN 1 ELSE 0 END,
        CONCAT(N'expected 0/0, got ', COALESCE(CONVERT(NVARCHAR(20), @fnWrong), N'NULL'), N'/', COALESCE(@wrong3, N'NULL')));
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    INSERT INTO #Results (Test, Passed, Detail)
    VALUES (N'1-2 trigger and function checks', 0, CONCAT(N'unexpected error ', ERROR_NUMBER(), N': ', ERROR_MESSAGE()));
END CATCH;
GO

------------------------------------------------------------------------------------------
-- 3a. InsertExamQuestionsRandomly inserts exactly @NumberOfQuestions
------------------------------------------------------------------------------------------
SET NOCOUNT ON;
DECLARE @course INT, @exam INT, @after3 INT, @after5 INT, @wrongCourse INT, @distinct INT;

BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO dbo.Courses (C_name, C_minDegree, C_maxDegree, C_Description)
    VALUES (N'Verify course', 10, 60, N'created by VerifyFixes.sql, rolled back');
    SET @course = SCOPE_IDENTITY();

    -- five questions in the course
    INSERT INTO dbo.Questions (Q_Text, Q_correctAns, Q_type, Course_ID, Q_Mark)
    VALUES (N'Verify R1', N'a', N'MCQ', @course, 1), (N'Verify R2', N'a', N'MCQ', @course, 1),
           (N'Verify R3', N'a', N'MCQ', @course, 1), (N'Verify R4', N'a', N'MCQ', @course, 1),
           (N'Verify R5', N'a', N'MCQ', @course, 1);

    INSERT INTO dbo.Exam (E_startTime, E_endTime, E_type, E_year, E_allownce, Course_ID, Instructor_ID, Intake_ID, Track_ID, Branch_ID, E_Date)
    SELECT '09:00', '11:00', N'Normal', YEAR(GETDATE()), 1, @course,
           (SELECT MIN(Inst_ID) FROM dbo.Instructors), (SELECT MIN(Intake_ID) FROM dbo.Intake),
           (SELECT MIN(Track_ID) FROM dbo.Tracks), (SELECT MIN(Branch_ID) FROM dbo.Branchs),
           DATEADD(DAY, 1, CAST(GETDATE() AS date));
    SET @exam = SCOPE_IDENTITY();

    EXEC [InstructorSC].[InsertExamQuestionsRandomly] @exam, 3;
    SELECT @after3 = COUNT(*) FROM dbo.Exam_Question WHERE Exam_ID = @exam;

    -- the remaining two, none of them repeated
    EXEC [InstructorSC].[InsertExamQuestionsRandomly] @exam, 2;
    SELECT @after5 = COUNT(*), @distinct = COUNT(DISTINCT Question_ID) FROM dbo.Exam_Question WHERE Exam_ID = @exam;
    SELECT @wrongCourse = COUNT(*)
    FROM dbo.Exam_Question eq JOIN dbo.Questions q ON q.Q_ID = eq.Question_ID
    WHERE eq.Exam_ID = @exam AND q.Course_ID <> @course;

    ROLLBACK TRANSACTION;

    INSERT INTO #Results (Test, Passed, Detail) VALUES
    (N'3a random questions: exactly 3 of 5 inserted',
        CASE WHEN @after3 = 3 THEN 1 ELSE 0 END, CONCAT(N'expected 3, got ', @after3)),
    (N'3b random questions: 2 more gives 5 distinct, all from the exam''s course',
        CASE WHEN @after5 = 5 AND @distinct = 5 AND @wrongCourse = 0 THEN 1 ELSE 0 END,
        CONCAT(N'expected 5/5/0, got ', @after5, N'/', @distinct, N'/', @wrongCourse));
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    INSERT INTO #Results (Test, Passed, Detail)
    VALUES (N'3a-3b random question count', 0, CONCAT(N'unexpected error ', ERROR_NUMBER(), N': ', ERROR_MESSAGE()));
END CATCH;
GO

------------------------------------------------------------------------------------------
-- 3c. Requesting more questions than are available raises 50003 and inserts nothing
------------------------------------------------------------------------------------------
SET NOCOUNT ON;
DECLARE @exam INT, @available INT, @before INT, @after INT, @err INT = NULL, @tc INT = NULL;

SELECT TOP (1) @exam = e.E_ID FROM dbo.Exam e ORDER BY e.E_ID;
SELECT @available = COUNT(*)
FROM dbo.Questions q
WHERE q.Course_ID = (SELECT Course_ID FROM dbo.Exam WHERE E_ID = @exam)
  AND NOT EXISTS (SELECT 1 FROM dbo.Exam_Question eq WHERE eq.Exam_ID = @exam AND eq.Question_ID = q.Q_ID);
SELECT @before = COUNT(*) FROM dbo.Exam_Question WHERE Exam_ID = @exam;

DECLARE @request INT = @available + 1;
BEGIN TRY
    EXEC [InstructorSC].[InsertExamQuestionsRandomly] @exam, @request;
END TRY
BEGIN CATCH
    SELECT @err = ERROR_NUMBER(), @tc = @@TRANCOUNT;
END CATCH;
SELECT @after = COUNT(*) FROM dbo.Exam_Question WHERE Exam_ID = @exam;

INSERT INTO #Results (Test, Passed, Detail) VALUES
(N'3c random questions: too many requested raises 50003, inserts nothing',
    CASE WHEN @err = 50003 AND @tc = 0 AND @after = @before THEN 1 ELSE 0 END,
    CONCAT(N'requested ', @request, N' of ', @available, N' available; error ', COALESCE(CONVERT(NVARCHAR(20), @err), N'none'),
           N', questions before/after ', @before, N'/', @after));
GO

------------------------------------------------------------------------------------------
-- 4a. Forced error inside a procedure: raised to the caller, whole unit rolled back
------------------------------------------------------------------------------------------
SET NOCOUNT ON;
DECLARE @name NVARCHAR(50) = CONCAT(N'Verify ', LEFT(CONVERT(NVARCHAR(36), NEWID()), 8));
DECLARE @before INT, @after INT, @err INT = NULL, @tc INT = NULL, @mid INT = NULL;
SELECT @before = COUNT(*) FROM dbo.Branchs;

BEGIN TRY
    BEGIN TRANSACTION;
    EXEC [MangerSC].[CreateBranch] @name, N'verification address';      -- succeeds
    SELECT @mid = COUNT(*) FROM dbo.Branchs WHERE Branch_name = @name;
    EXEC [MangerSC].[CreateBranch] NULL, N'verification address';       -- forced error: Branch_name is NOT NULL
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    SELECT @err = ERROR_NUMBER(), @tc = @@TRANCOUNT;
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
END CATCH;
SELECT @after = COUNT(*) FROM dbo.Branchs;

INSERT INTO #Results (Test, Passed, Detail) VALUES
(N'4a forced error: raised to caller (515) and the first insert rolled back',
    CASE WHEN @mid = 1 AND @err = 515 AND @tc = 0 AND @after = @before
              AND NOT EXISTS (SELECT 1 FROM dbo.Branchs WHERE Branch_name = @name) THEN 1 ELSE 0 END,
    CONCAT(N'error ', COALESCE(CONVERT(NVARCHAR(20), @err), N'none'), N', open transactions after error ', @tc,
           N', branches before/after ', @before, N'/', @after));
GO

------------------------------------------------------------------------------------------
-- 4b. Forced error on the write itself: duplicate question in InsertExamQuestions
--     (validation passes, the INSERT hits the primary key) -> error 2627, nothing inserted
------------------------------------------------------------------------------------------
SET NOCOUNT ON;
DECLARE @exam INT, @newQ INT, @dupQ INT, @before INT, @after INT, @err INT = NULL, @tc INT = NULL;

-- an exam that already has a question of its course, and another question of that course it doesn't have yet
SELECT TOP (1) @exam = e.E_ID, @dupQ = eq.Question_ID, @newQ = q2.Q_ID
FROM dbo.Exam e
JOIN dbo.Exam_Question eq ON eq.Exam_ID = e.E_ID
JOIN dbo.Questions q1 ON q1.Q_ID = eq.Question_ID AND q1.Course_ID = e.Course_ID
JOIN dbo.Questions q2 ON q2.Course_ID = e.Course_ID
WHERE NOT EXISTS (SELECT 1 FROM dbo.Exam_Question x WHERE x.Exam_ID = e.E_ID AND x.Question_ID = q2.Q_ID)
ORDER BY e.E_ID, q2.Q_ID;

IF @exam IS NULL
    INSERT INTO #Results (Test, Passed, Detail)
    VALUES (N'4b forced error: duplicate exam question rolled back', 0, N'no suitable exam found in the data');
ELSE
BEGIN
    SELECT @before = COUNT(*) FROM dbo.Exam_Question WHERE Exam_ID = @exam;
    DECLARE @list VARCHAR(50) = CONCAT(@newQ, ',', @dupQ);
    BEGIN TRY
        EXEC [InstructorSC].[InsertExamQuestions] @exam, 2, @list;
    END TRY
    BEGIN CATCH
        SELECT @err = ERROR_NUMBER(), @tc = @@TRANCOUNT;
    END CATCH;
    SELECT @after = COUNT(*) FROM dbo.Exam_Question WHERE Exam_ID = @exam;

    INSERT INTO #Results (Test, Passed, Detail) VALUES
    (N'4b forced error: duplicate exam question raises 2627, nothing inserted',
        CASE WHEN @err = 2627 AND @tc = 0 AND @after = @before
                  AND NOT EXISTS (SELECT 1 FROM dbo.Exam_Question WHERE Exam_ID = @exam AND Question_ID = @newQ) THEN 1 ELSE 0 END,
        CONCAT(N'exam ', @exam, N'; error ', COALESCE(CONVERT(NVARCHAR(20), @err), N'none'),
               N', questions before/after ', @before, N'/', @after));
END;
GO

------------------------------------------------------------------------------------------
-- Summary
------------------------------------------------------------------------------------------
SET NOCOUNT ON;
DECLARE @line NVARCHAR(800);
DECLARE results CURSOR LOCAL FAST_FORWARD FOR
    SELECT CONCAT(CASE Passed WHEN 1 THEN N'PASS  ' ELSE N'FAIL  ' END, Test, N'  (', Detail, N')')
    FROM #Results ORDER BY Id;
OPEN results;
FETCH NEXT FROM results INTO @line;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @line;
    FETCH NEXT FROM results INTO @line;
END;
CLOSE results;
DEALLOCATE results;

DECLARE @total INT = (SELECT COUNT(*) FROM #Results);
DECLARE @failed INT = (SELECT COUNT(*) FROM #Results WHERE Passed = 0);
PRINT CONCAT(@total - @failed, N' of ', @total, N' checks passed.');
DROP TABLE #Results;

IF @failed > 0 OR @total = 0
BEGIN
    DECLARE @msg NVARCHAR(200) = CONCAT(@failed, N' verification check(s) failed.');
    THROW 50000, @msg, 1;
END;
GO
