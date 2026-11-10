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
    SET XACT_ABORT ON; -- any error rolls back the whole transaction

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Check if the student exists before deleting
        IF EXISTS (SELECT 1 FROM [dbo].[Instructors] WITH (UPDLOCK, HOLDLOCK) WHERE Inst_ID = @id)
        BEGIN
            -- Perform the deletion
            DELETE FROM [dbo].[Instructors]
            WHERE Inst_ID = @id;

            COMMIT TRANSACTION;
            PRINT 'Instructors deleted successfully.';
        END
        ELSE
        BEGIN
            THROW 50001, N'Instructors not found. No deletion performed.', 1;
        END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


