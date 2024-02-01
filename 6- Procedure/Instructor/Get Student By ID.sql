USE [Examination]
GO

/****** Object:  StoredProcedure [InstructorSC].[GetStudentByID]    Script Date: 1/16/2024 11:38:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER Proc [InstructorSC].[GetStudentByID]
    @id INT
AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned

    BEGIN TRY
        -- Retrieve the student by ID
        SELECT *
        FROM Students
        WHERE Std_ID = @id;

        -- Check if any rows were affected
        IF @@ROWCOUNT = 0
        BEGIN
            PRINT 'No student found with the specified ID.';
        END
    END TRY
    BEGIN CATCH
        -- Handle errors if any
        PRINT 'An error occurred while retrieving the student. Error: ' + ERROR_MESSAGE();
    END CATCH
END;

GO


