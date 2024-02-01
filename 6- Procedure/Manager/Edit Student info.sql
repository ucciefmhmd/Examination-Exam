USE [Examination]
GO

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

    BEGIN TRY
        -- Check if the student exists before updating
        IF EXISTS (SELECT 1 FROM Students WHERE Std_ID = @id)
        BEGIN
            -- Perform the update
            UPDATE [dbo].[Students]
            SET Std_name = @name, Std_email = @email
            WHERE Std_ID = @id;

            PRINT 'Student information updated successfully.';
        END
        ELSE
        BEGIN
            PRINT 'Student not found. No update performed.';
        END
    END TRY
    BEGIN CATCH
        -- Handle errors if any
        PRINT 'An error occurred while updating the student information. Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO


