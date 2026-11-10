/****** Object:  StoredProcedure [MangerSC].[EidtBranch]    Script Date: 1/17/2024 12:53:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROC [MangerSC].[EidtBranch]
@address nvarchar(50),
@id int
AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned
    SET XACT_ABORT ON; -- any error rolls back the whole transaction

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Check if the student exists before updating
        IF EXISTS (SELECT 1 FROM [dbo].[Branchs] WITH (UPDLOCK, HOLDLOCK) WHERE Branch_ID= @id)
        BEGIN
            -- Perform the update
            UPDATE [dbo].[Branchs]
			 set  Branch_address = @address 
			where Branch_ID = @id

            COMMIT TRANSACTION;
            PRINT 'Branchs information updated successfully.';
        END
        ELSE
        BEGIN
            THROW 50001, N'Branchs not found. No update performed.', 1;
        END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


