USE [Examination]
GO

/****** Object:  StoredProcedure [dbo].[UpdateStudentExamResults]    Script Date: 1/16/2024 11:28:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[UpdateStudentExamResults]
    @StudentID INT,
    @ExamID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TotalCorrectAnswers INT;

    -- Calculate total correct answers using the function
    SET @TotalCorrectAnswers = dbo.CalculateTotalCorrectAnswers(@ExamID, @StudentID);

    -- Update the results in Student_Exam table
    UPDATE dbo.Student_Exam
    SET Results = CONVERT(NVARCHAR(50), @TotalCorrectAnswers)
    WHERE Student_ID = @StudentID
    AND Exam_ID = @ExamID;
END;
GO


