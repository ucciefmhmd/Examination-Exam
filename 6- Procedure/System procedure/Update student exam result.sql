/****** Object:  StoredProcedure [dbo].[UpdateStudentExamResults]    Script Date: 1/16/2024 11:28:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Re-scores one student's exam on demand. UpdateResultsTrigger applies the
-- same calculation automatically whenever answers change.
CREATE OR ALTER PROCEDURE [dbo].[UpdateStudentExamResults]
    @StudentID INT,
    @ExamID INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON; -- any error rolls back the whole transaction

    BEGIN TRY
        DECLARE @TotalCorrectAnswers INT;

        -- Calculate total correct answers using the function
        SET @TotalCorrectAnswers = dbo.CalculateTotalCorrectAnswers(@ExamID, @StudentID);

        -- Update the results in Student_Exam table
        UPDATE dbo.Student_Exam
        SET Results = CONVERT(NVARCHAR(50), @TotalCorrectAnswers)
        WHERE Student_ID = @StudentID
        AND Exam_ID = @ExamID;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
