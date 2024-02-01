USE [Examination]
GO

/****** Object:  StoredProcedure [StudentSC].[InsertAnswer]    Script Date: 1/17/2024 1:29:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [StudentSC].[InsertAnswer]
    @StudentID INT,
    @ExamID INT,
    @QuestionID INT,
    @StudentAnswer NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the Student_ID and Exam_ID have a valid relationship
    IF EXISTS (
        SELECT 1
        FROM dbo.Student_Exam
        WHERE Student_ID = @StudentID
          AND Exam_ID = @ExamID
    )
    BEGIN
        -- Check if the exam is available for answering
        IF EXISTS (
            SELECT 1
            FROM dbo.GetAvailableExamsFun()
            WHERE E_ID = @ExamID
        )
        BEGIN
            -- Check if the Question_ID is associated with the Exam_ID
            IF EXISTS (
                SELECT 1
                FROM dbo.Exam_Question
                WHERE Exam_ID = @ExamID
                  AND Question_ID = @QuestionID
            )
            BEGIN
                -- Insert into Answer table
                INSERT INTO dbo.Answer (Student_ID, Exam_ID, Question_ID, Student_answer)
                VALUES (@StudentID, @ExamID, @QuestionID, @StudentAnswer);

            END
            ELSE
            BEGIN
                PRINT 'This question is not associated with the provided exam.';
            END;
        END
        ELSE
        BEGIN
            PRINT 'This exam is not currently available for answering.';
        END;
    END
    ELSE
    BEGIN
        PRINT 'This student is not allowed to this exam';
    END;
END;
GO


