USE [Examination]
GO

/****** Object:  StoredProcedure [MangerSC].[CreateInstructor]    Script Date: 1/17/2024 12:00:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE OR ALTER PROC [MangerSC].[CreateInstructor]
    @name NVARCHAR(50),
    @email NVARCHAR(50),
    @password NVARCHAR(50),
    @manager INT
AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned

    BEGIN TRY
        -- Perform the insertion
        INSERT INTO [dbo].[Instructors]
               ([Inst_name],[Inst_email],[Inst_password] ,[manager_id] )
         VALUES
               (@name, @email, @password, @manager);

        PRINT 'Instructor created successfully.';
    END TRY
    BEGIN CATCH
        -- Handle errors if any
        PRINT 'An error occurred while creating the Instructor. Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO


