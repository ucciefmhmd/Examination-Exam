/****** Object:  StoredProcedure [InstructorSC].[DeleteQuestion]    Script Date: 1/16/2024 11:32:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROC [InstructorSC].[DeleteQuestion]
    @id INT
AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned
    SET XACT_ABORT ON; -- any error rolls back the whole transaction

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Check if the student exists before deleting
        IF EXISTS (SELECT 1 FROM [dbo].[Questions] WITH (UPDLOCK, HOLDLOCK) WHERE Q_ID = @id)
        BEGIN
            -- Perform the deletion
            DELETE FROM [dbo].[Questions]
            WHERE Q_ID = @id;

            COMMIT TRANSACTION;
            PRINT 'Question deleted successfully.';
        END
        ELSE
        BEGIN
            THROW 50001, N'Question not found. No deletion performed.', 1;
        END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


