USE [Examination]
GO

/****** Object:  StoredProcedure [MangerSC].[DeleteStudent]    Script Date: 1/17/2024 12:53:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROC [MangerSC].[DeleteStudent]
    @id INT
AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned

    BEGIN TRY
        -- Check if the student exists before deleting
        IF EXISTS (SELECT 1 FROM Students WHERE Std_ID = @id)
        BEGIN
            -- Perform the deletion
            DELETE FROM Students
            WHERE Std_ID = @id;

            PRINT 'Student deleted successfully.';
        END
        ELSE
        BEGIN
            PRINT 'Student not found. No deletion performed.';
        END
    END TRY
    BEGIN CATCH
        -- Handle errors if any
        PRINT 'An error occurred while deleting the student. Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO


