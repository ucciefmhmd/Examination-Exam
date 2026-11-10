/****** Object:  StoredProcedure [StudentSC].[InsertAnswer]    Script Date: 1/17/2024 1:29:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Stores one answer. The insert fires UpdateResultsTrigger, which re-scores
-- the student's result in Student_Exam inside the same transaction.
CREATE OR ALTER PROCEDURE [StudentSC].[InsertAnswer]
    @StudentID INT,
    @ExamID INT,
    @QuestionID INT,
    @StudentAnswer NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON; -- any error rolls back the whole transaction

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Check if the Student_ID and Exam_ID have a valid relationship
        IF NOT EXISTS (
            SELECT 1
            FROM dbo.Student_Exam WITH (UPDLOCK, HOLDLOCK)
            WHERE Student_ID = @StudentID
              AND Exam_ID = @ExamID
        )
            THROW 50003, N'This student is not allowed to this exam', 1;

        -- Check if the exam is available for answering
        IF NOT EXISTS (
            SELECT 1
            FROM dbo.GetAvailableExamsFun()
            WHERE E_ID = @ExamID
        )
            THROW 50003, N'This exam is not currently available for answering.', 1;

        -- Check if the Question_ID is associated with the Exam_ID
        IF NOT EXISTS (
            SELECT 1
            FROM dbo.Exam_Question
            WHERE Exam_ID = @ExamID
              AND Question_ID = @QuestionID
        )
            THROW 50003, N'This question is not associated with the provided exam.', 1;

        -- Insert into Answer table
        INSERT INTO dbo.Answer (Student_ID, Exam_ID, Question_ID, Student_answer)
        VALUES (@StudentID, @ExamID, @QuestionID, @StudentAnswer);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
