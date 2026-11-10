/****** Object:  StoredProcedure [MangerSC].[DeleteCourse]    Script Date: 1/17/2024 12:52:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROC [MangerSC].[DeleteCourse]
    @id INT
AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned
    SET XACT_ABORT ON; -- any error rolls back the whole transaction

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Check if the student exists before deleting
        IF EXISTS (SELECT 1 FROM [dbo].[Courses] WITH (UPDLOCK, HOLDLOCK) WHERE C_ID = @id)
        BEGIN
            -- Perform the deletion
            DELETE FROM [dbo].[Courses]
            WHERE C_ID = @id;

            COMMIT TRANSACTION;
            PRINT 'Cousre deleted successfully.';
        END
        ELSE
        BEGIN
            THROW 50001, N'Cousre not found. No deletion performed.', 1;
        END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


