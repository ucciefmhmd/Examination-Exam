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
    SET XACT_ABORT ON; -- any error rolls back the whole transaction

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Perform the insertion
        INSERT INTO [dbo].[Instructors]
               ([Inst_name],[Inst_email],[Inst_password] ,[manager_id] )
         VALUES
               (@name, @email, @password, @manager);

        COMMIT TRANSACTION;
        PRINT 'Instructor created successfully.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


