USE [Examination]
GO

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

    BEGIN TRY
        -- Check if the student exists before updating
        IF EXISTS (SELECT 1 FROM [dbo].[Branchs] WHERE Branch_ID= @id)
        BEGIN
            -- Perform the update
            UPDATE [dbo].[Branchs]
			 set  Branch_address = @address 
			where Branch_ID = @id

            PRINT 'Branchs information updated successfully.';
        END
        ELSE
        BEGIN
            PRINT 'Branchs not found. No update performed.';
        END
    END TRY
    BEGIN CATCH
        -- Handle errors if any
        PRINT 'An error occurred while updating the Branchs information. Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO


