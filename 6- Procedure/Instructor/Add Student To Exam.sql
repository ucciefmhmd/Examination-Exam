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
    SET XACT_ABORT ON; -- any error rolls back the whole transaction

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @StudentIDsList TABLE (ID INT);

        -- Split the comma-separated string of Student IDs and insert into a table variable
        INSERT INTO @StudentIDsList (ID)
        SELECT value
        FROM STRING_SPLIT(@StudentIDs, ',');

        -- Check if the number of students provided matches the actual count
        IF @NumberOfStudents <> (SELECT COUNT(*) FROM @StudentIDsList)
            THROW 50002, N'Number of students does not match the provided count.', 1;

        -- Check if the provided Student IDs exist in the Students table
        IF EXISTS (
            SELECT 1
            FROM @StudentIDsList Sl
            WHERE NOT EXISTS (
                SELECT 1
                FROM dbo.Students s
                WHERE s.Std_ID = sl.ID
            )
        )
            THROW 50001, N'One or more Student IDs do not exist in the Student table.', 1;


        -- Insert data into Student_Exam table
        INSERT INTO [dbo].[Student_Exam] ([Student_ID],[Exam_ID],[Results])
        SELECT ID, @ExamID, '0'
        FROM @StudentIDsList;

        COMMIT TRANSACTION;
        PRINT 'Data inserted into Student_Exam successfully.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
