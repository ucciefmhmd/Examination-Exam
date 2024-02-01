USE [Examination]
GO

/****** Object:  StoredProcedure [InstructorSC].[EidtQuestionsMark]    Script Date: 1/16/2024 11:33:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   PROC [InstructorSC].[EidtQuestionsMark]
@Mark int,
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
			 set  Q_Mark = @Mark 
			where Q_ID = @id

            PRINT 'Question Mark updated successfully.';
        END
        ELSE
        BEGIN
            PRINT 'Question not found. No update performed.';
        END
    END TRY
    BEGIN CATCH
        -- Handle errors if any
        PRINT 'An error occurred while updating the Question Mark. Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO


