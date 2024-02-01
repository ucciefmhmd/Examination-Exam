USE [Examination]
GO

/****** Object:  StoredProcedure [InstructorSC].[insertStudentToExams]    Script Date: 1/16/2024 11:40:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [InstructorSC].[insertStudentToExams]
    @ExamID INT,
    @NumberOfStudents INT,
    @StudentIDs VARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StudentIDsList TABLE (ID INT);

    -- Split the comma-separated string of Question IDs and insert into a table variable
    INSERT INTO @StudentIDsList (ID)
    SELECT value
    FROM STRING_SPLIT(@StudentIDs, ',');

    -- Check if the number of questions provided matches the actual count
    IF @NumberOfStudents <> (SELECT COUNT(*) FROM @StudentIDsList)
    BEGIN
        PRINT 'Number of questions does not match the provided count.';
        RETURN;
    END

    -- Check if the provided Question IDs exist in the Questions table
    IF EXISTS (
        SELECT 1
        FROM @StudentIDsList Sl
        WHERE NOT EXISTS (
            SELECT 1
            FROM dbo.Students s
            WHERE s.Std_ID = sl.ID
        )
    )
    BEGIN
        PRINT 'One or more Question IDs do not exist in the Student table.';
        RETURN;
    END


    -- Insert data into Exam_Question table
    INSERT INTO [dbo].[Student_Exam] ([Student_ID],[Exam_ID],[Results])
    SELECT ID, @ExamID, '0'
    FROM @StudentIDsList;

    PRINT 'Data inserted into Student_Exam successfully.';
END;
GO


