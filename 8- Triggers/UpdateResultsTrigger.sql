USE [Examination]
GO

CREATE TRIGGER [dbo].[UpdateResultsTrigger]
ON [dbo].[Answer]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StudentID INT, @ExamID INT;

    -- Get the Student_ID and Exam_ID from the inserted rows
    SELECT @StudentID = Student_ID, @ExamID = Exam_ID
    FROM inserted;

    -- Update the results using the stored procedure
    EXEC dbo.UpdateStudentExamResults @StudentID, @ExamID;
END;
GO

ALTER TABLE [dbo].[Answer] ENABLE TRIGGER [UpdateResultsTrigger]
GO


