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
    SET XACT_ABORT ON; -- any error rolls back the whole transaction

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Check if the student exists before updating
        IF EXISTS (SELECT 1 FROM [dbo].[Questions] WITH (UPDLOCK, HOLDLOCK) WHERE Q_ID = @id)
        BEGIN
            -- Perform the update
            UPDATE [dbo].[Questions]
			 set  Q_correctAns = @correct 
			where Q_ID = @id

            COMMIT TRANSACTION;
            PRINT 'Correct Answer Question information updated successfully.';
        END
        ELSE
        BEGIN
            THROW 50001, N'Correct Answer Question not found. No update performed.', 1;
        END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


