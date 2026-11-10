/****** Object:  StoredProcedure [MangerSC].[CreateBranch]    Script Date: 1/16/2024 11:59:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROC [MangerSC].[CreateBranch]
    @name nvarchar(50),
    @address nvarchar(50)

AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned
    SET XACT_ABORT ON; -- any error rolls back the whole transaction

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Perform the insertion
        INSERT INTO [dbo].[Branchs]
               ([Branch_name], [Branch_address] )
         VALUES
               (@name,@address );

        COMMIT TRANSACTION;
        PRINT 'Branch Created successfully.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


