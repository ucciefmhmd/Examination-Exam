/****** Object:  StoredProcedure [MangerSC].[CreateCourses]    Script Date: 1/17/2024 12:00:22 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE OR ALTER PROC [MangerSC].[CreateCourses]
    @name NVARCHAR(50),
    @min int,
    @max int,
	@decs NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned
    SET XACT_ABORT ON; -- any error rolls back the whole transaction

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Perform the insertion
        INSERT INTO [dbo].[Courses]
               ([C_name], [C_minDegree] ,[C_maxDegree],  [C_Description])
         VALUES
               (@name, @min, @max, @decs);

        COMMIT TRANSACTION;
        PRINT 'Courses created successfully.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


