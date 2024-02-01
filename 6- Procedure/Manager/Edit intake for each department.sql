USE [Examination]
GO

/****** Object:  StoredProcedure [MangerSC].[EidtIntake_Depart]    Script Date: 1/17/2024 12:55:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROC [MangerSC].[EidtIntake_Depart]
@newDeptID int,
@oldDeptID int,
@id int
AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned

    BEGIN TRY
        -- Check if the student exists before updating
        IF EXISTS (SELECT 1 FROM [dbo].[Intake_Depart] WHERE [Intake_id]= @id and Depart_ID = @oldDeptID)
        BEGIN
            -- Perform the update
            UPDATE [dbo].[Intake_Depart]
			 set  Depart_ID = @newDeptID 
			where [Intake_id] = @id and Depart_ID = @oldDeptID

            PRINT 'Intake_Depart information updated successfully.';
        END
        ELSE
        BEGIN
            PRINT 'Intake_Depart not found. No update performed.';
        END
    END TRY
    BEGIN CATCH
        -- Handle errors if any
        PRINT 'An error occurred while updating the Intake_Depart information. Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO


