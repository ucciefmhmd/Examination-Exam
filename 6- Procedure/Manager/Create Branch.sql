USE [Examination]
GO

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

    BEGIN TRY
        -- Perform the insertion
        INSERT INTO [dbo].[Branchs]
               ([Branch_name], [Branch_address] )
         VALUES
               (@name,@address );

        PRINT 'Branch Created successfully.';
    END TRY
    BEGIN CATCH
        -- Handle errors if any
        PRINT 'An error occurred while Created the Branch. Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO


