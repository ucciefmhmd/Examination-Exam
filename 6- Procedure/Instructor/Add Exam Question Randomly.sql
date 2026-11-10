/****** Object:  StoredProcedure [InstructorSC].[InsertExamQuestionsRandomly]    Script Date: 1/16/2024 11:39:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Adds exactly @NumberOfQuestions questions, picked at random, to exam @ExamID.
-- The questions come from the exam's course and must not already be in that exam.
--
-- If fewer questions are available than requested, the procedure raises an
-- error and inserts nothing (no partial exam). It also raises an error when the
-- exam doesn't exist or @NumberOfQuestions is not a positive number.
CREATE OR ALTER     PROCEDURE [InstructorSC].[InsertExamQuestionsRandomly]
    @ExamID INT,
    @NumberOfQuestions INT
    --@CourseId int
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @CourseID INT;

        SELECT @CourseID = Course_ID
        FROM dbo.Exam WITH (UPDLOCK, HOLDLOCK)
        WHERE E_ID = @ExamID;

        IF @CourseID IS NULL
            THROW 50001, N'Exam not found. No questions inserted.', 1;

        IF @NumberOfQuestions IS NULL OR @NumberOfQuestions < 1
            THROW 50002, N'Number of questions must be a positive number.', 1;

        DECLARE @QuestionIDList TABLE (Q_id INT PRIMARY KEY);

        -- Questions of the exam's course that are not in this exam yet
        INSERT INTO @QuestionIDList (Q_id)
        SELECT q.Q_ID
        FROM dbo.Questions AS q
        WHERE q.Course_ID = @CourseID
          AND NOT EXISTS (
                SELECT 1
                FROM dbo.Exam_Question AS eq WITH (UPDLOCK, HOLDLOCK)
                WHERE eq.Exam_ID = @ExamID
                  AND eq.Question_ID = q.Q_ID
          );

        IF @NumberOfQuestions > (SELECT COUNT(*) FROM @QuestionIDList)
            THROW 50003, N'Number of questions does not supported in this course please add question or minimize question number', 1;

        -- Insert exactly @NumberOfQuestions random questions into Exam_Question
        INSERT INTO dbo.Exam_Question (Exam_ID, Question_ID)
        SELECT TOP (@NumberOfQuestions) @ExamID, Q_id
        FROM @QuestionIDList
        ORDER BY NEWID();

        COMMIT TRANSACTION;

        PRINT 'Data inserted into Exam_Question successfully.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
