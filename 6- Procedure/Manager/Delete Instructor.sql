USE [Examination]
GO

/****** Object:  StoredProcedure [MangerSC].[DeleteInstructor]    Script Date: 1/17/2024 12:52:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROC [MangerSC].[DeleteInstructor]
    @id INT
AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned

    BEGIN TRY
        -- Check if the student exists before deleting
        IF EXISTS (SELECT 1 FROM [dbo].[Instructors] WHERE Inst_ID = @id)
        BEGIN
            -- Perform the deletion
            DELETE FROM [dbo].[Instructors]
            WHERE Inst_ID = @id;

            PRINT 'Instructors deleted successfully.';
        END
        ELSE
        BEGIN
            PRINT 'Instructors not found. No deletion performed.';
        END
    END TRY
    BEGIN CATCH
        -- Handle errors if any
        PRINT 'An error occurred while deleting the student. Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO


