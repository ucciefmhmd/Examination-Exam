
-- Recalculates Student_Exam.Results whenever answers are inserted, changed or deleted.
-- Set-based: one statement handles every (student, exam) pair touched by the DML,
-- so multi-row inserts, updates and deletes all keep the results correct.
-- The score comes from dbo.CalculateTotalCorrectAnswers, the same rule that
-- dbo.UpdateStudentExamResults uses.
CREATE OR ALTER TRIGGER [dbo].[UpdateResultsTrigger]
ON [dbo].[Answer]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM inserted) AND NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;

    UPDATE se
    SET Results = CONVERT(NVARCHAR(50), dbo.CalculateTotalCorrectAnswers(se.Exam_ID, se.Student_ID))
    FROM dbo.Student_Exam AS se
    INNER JOIN (
        SELECT Student_ID, Exam_ID FROM inserted
        UNION
        SELECT Student_ID, Exam_ID FROM deleted
    ) AS changed
        ON  changed.Student_ID = se.Student_ID
        AND changed.Exam_ID    = se.Exam_ID;
END;
GO

ALTER TABLE [dbo].[Answer] ENABLE TRIGGER [UpdateResultsTrigger]
GO
