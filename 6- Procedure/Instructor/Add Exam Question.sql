USE [Examination]
GO

/****** Object:  StoredProcedure [InstructorSC].[InsertExamQuestions]    Script Date: 1/16/2024 11:38:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [InstructorSC].[InsertExamQuestions]
    @ExamID INT,
    @NumberOfQuestions INT,
    @QuestionIDs VARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @QuestionIDList TABLE (ID INT);

    -- Split the comma-separated string of Question IDs and insert into a table variable
    INSERT INTO @QuestionIDList (ID)
    SELECT value
    FROM STRING_SPLIT(@QuestionIDs, ',');

    -- Check if the number of questions provided matches the actual count
    IF @NumberOfQuestions <> (SELECT COUNT(*) FROM @QuestionIDList)
    BEGIN
        PRINT 'Number of questions does not match the provided count.';
        RETURN;
    END

    -- Check if the provided Question IDs exist in the Questions table
    IF EXISTS (
        SELECT 1
        FROM @QuestionIDList ql
        WHERE NOT EXISTS (
            SELECT 1
            FROM dbo.Questions q
            WHERE q.Q_ID = ql.ID
        )
    )
    BEGIN
        PRINT 'One or more Question IDs do not exist in the Questions table.';
        RETURN;
    END

    -- Check if the Course_ID of selected questions matches the Course_ID of the specified exam
    IF EXISTS (
        SELECT 1
        FROM @QuestionIDList ql
        INNER JOIN dbo.Questions q ON ql.ID = q.Q_ID
        WHERE q.Course_ID <> (SELECT e.Course_ID FROM dbo.Exam e WHERE e.E_ID = @ExamID)
    )
    BEGIN
        PRINT 'Course_ID of selected questions does not match the Course_ID of the specified exam.';
        RETURN;
    END

    -- Insert data into Exam_Question table
    INSERT INTO dbo.Exam_Question (Exam_ID, Question_ID)
    SELECT @ExamID, ID
    FROM @QuestionIDList;

    PRINT 'Data inserted into Exam_Question successfully.';
END;
GO


