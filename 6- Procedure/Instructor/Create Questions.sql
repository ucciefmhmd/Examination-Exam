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
    SET XACT_ABORT ON; -- any error rolls back the whole transaction

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Perform the insertion
        INSERT INTO [dbo].[Questions]
               ([Q_Text],[Q_correctAns],[Q_type],[Course_ID],[Q_Mark])
         VALUES
               (@text,@correctAns,@type,@IdCourse, 1);  -- Q_Mark is NOT NULL; start at 1 (the minimum allowed), change it with EidtQuestionsMark

        COMMIT TRANSACTION;
        PRINT 'Question added successfully.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


