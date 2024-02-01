USE [Examination]
GO

/****** Object:  StoredProcedure [InstructorSC].[InsertExamQuestionsRandomly]    Script Date: 1/16/2024 11:39:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER     PROCEDURE [InstructorSC].[InsertExamQuestionsRandomly]
    @ExamID INT,
    @NumberOfQuestions INT
    --@CourseId int 
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @QuestionIDList TABLE (Q_id INt);

INSERT INTO @QuestionIDList (Q_id)
SELECT
    Questions.Q_ID
FROM
    Questions

WHERE
    Questions.Course_ID = (select Exam.Course_ID from Exam where Exam.E_ID =@ExamID)
ORDER BY
    NEWID();

    -- Check if the number of questions provided matches the actual count
    IF @NumberOfQuestions > (SELECT COUNT(*) FROM @QuestionIDList)
    BEGIN
        PRINT 'Number of questions does not supported in this course please add question or minimize question number';
        RETURN;
    END



    -- Insert data into Exam_Question table
    INSERT INTO dbo.Exam_Question (Exam_ID, Question_ID)
    SELECT @ExamID,Q_id
    FROM @QuestionIDList;

    PRINT 'Data inserted into Exam_Question successfully.';
END;
GO


