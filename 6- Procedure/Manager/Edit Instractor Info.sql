USE [Examination]
GO

/****** Object:  StoredProcedure [MangerSC].[EidtInstructor]    Script Date: 1/17/2024 12:55:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROC [MangerSC].[EidtInstructor]
@email nvarchar(50),
@password nvarchar(50),
@id int
AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned

    BEGIN TRY
        -- Check if the student exists before updating
        IF EXISTS (SELECT 1 FROM [Instructors] WHERE Inst_ID = @id)
        BEGIN
            -- Perform the update
            UPDATE [dbo].[Instructors]
 set  Inst_email = @email , Inst_password = @password
where Inst_ID = @id

            PRINT 'Instructor information updated successfully.';
        END
        ELSE
        BEGIN
            PRINT 'Instructor not found. No update performed.';
        END
    END TRY
    BEGIN CATCH
        -- Handle errors if any
        PRINT 'An error occurred while updating the Instructor information. Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO


