USE [Examination]
GO

/****** Object:  StoredProcedure [InstructorSC].[DeleteQuestion]    Script Date: 1/16/2024 11:32:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROC [InstructorSC].[DeleteQuestion]
    @id INT
AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned

    BEGIN TRY
        -- Check if the student exists before deleting
        IF EXISTS (SELECT 1 FROM [dbo].[Questions] WHERE Q_ID = @id)
        BEGIN
            -- Perform the deletion
            DELETE FROM [dbo].[Questions]
            WHERE Q_ID = @id;

            PRINT 'Question deleted successfully.';
        END
        ELSE
        BEGIN
            PRINT 'Question not found. No deletion performed.';
        END
    END TRY
    BEGIN CATCH
        -- Handle errors if any
        PRINT 'An error occurred while deleting the Question. Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO


