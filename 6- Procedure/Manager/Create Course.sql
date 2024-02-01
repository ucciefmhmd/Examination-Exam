USE [Examination]
GO

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

    BEGIN TRY
        -- Perform the insertion
        INSERT INTO [dbo].[Courses]
               ([C_name], [C_minDegree] ,[C_maxDigree],  [C_Description])
         VALUES
               (@name, @min, @max, @decs);

        PRINT 'Courses created successfully.';
    END TRY
    BEGIN CATCH
        -- Handle errors if any
        PRINT 'An error occurred while creating the Courses. Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO


