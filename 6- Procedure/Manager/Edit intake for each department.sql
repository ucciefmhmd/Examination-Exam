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
    SET XACT_ABORT ON; -- any error rolls back the whole transaction

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Check if the student exists before updating
        IF EXISTS (SELECT 1 FROM [dbo].[Intake_Depart] WITH (UPDLOCK, HOLDLOCK) WHERE [Intake_id]= @id and Depart_ID = @oldDeptID)
        BEGIN
            -- Perform the update
            UPDATE [dbo].[Intake_Depart]
			 set  Depart_ID = @newDeptID 
			where [Intake_id] = @id and Depart_ID = @oldDeptID

            COMMIT TRANSACTION;
            PRINT 'Intake_Depart information updated successfully.';
        END
        ELSE
        BEGIN
            THROW 50001, N'Intake_Depart not found. No update performed.', 1;
        END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


