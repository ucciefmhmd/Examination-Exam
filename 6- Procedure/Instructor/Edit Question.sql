USE [Examination]
GO

/****** Object:  StoredProcedure [InstructorSC].[EidtQuestions]    Script Date: 1/16/2024 11:32:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROC [InstructorSC].[EidtQuestions]
@correct nvarchar(200),
@id int
AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned

    BEGIN TRY
        -- Check if the student exists before updating
        IF EXISTS (SELECT 1 FROM [dbo].[Questions] WHERE Q_ID = @id)
        BEGIN
            -- Perform the update
            UPDATE [dbo].[Questions]
			 set  Q_correctAns = @correct 
			where Q_ID = @id

            PRINT 'Correct Answer Question information updated successfully.';
        END
        ELSE
        BEGIN
            PRINT 'Correct Answer Question not found. No update performed.';
        END
    END TRY
    BEGIN CATCH
        -- Handle errors if any
        PRINT 'An error occurred while updating the Correct Answer Question information. Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO


