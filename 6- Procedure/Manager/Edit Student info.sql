/****** Object:  StoredProcedure [MangerSC].[EditStudent]    Script Date: 1/17/2024 12:53:27 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [MangerSC].[EditStudent]
    @name NVARCHAR(50),
    @email NVARCHAR(50),
    @id INT
AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned
    SET XACT_ABORT ON; -- any error rolls back the whole transaction

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Check if the student exists before updating
        IF EXISTS (SELECT 1 FROM Students WITH (UPDLOCK, HOLDLOCK) WHERE Std_ID = @id)
        BEGIN
            -- Perform the update
            UPDATE [dbo].[Students]
            SET Std_name = @name, Std_email = @email
            WHERE Std_ID = @id;

            COMMIT TRANSACTION;
            PRINT 'Student information updated successfully.';
        END
        ELSE
        BEGIN
            THROW 50001, N'Student not found. No update performed.', 1;
        END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


