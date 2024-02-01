USE [Examination]
GO

/****** Object:  StoredProcedure [InstructorSC].[CreateQuestion]    Script Date: 1/16/2024 11:31:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROC [InstructorSC].[CreateQuestion]
    @text nvarchar(200),
    @correctAns nvarchar(200),
	@type nvarchar(50),
	@IdCourse int

AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned

    BEGIN TRY
        -- Perform the insertion
        INSERT INTO [dbo].[Questions]
               ([Q_Text],[Q_correctAns],[Q_type],[Course_ID])
         VALUES
               (@text,@correctAns,@type,@IdCourse );

        PRINT 'Question added successfully.';
    END TRY
    BEGIN CATCH
        -- Handle errors if any
        PRINT 'An error occurred while Created the Question. Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO


