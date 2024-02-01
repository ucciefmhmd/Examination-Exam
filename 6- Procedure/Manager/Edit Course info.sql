USE [Examination]
GO

/****** Object:  StoredProcedure [MangerSC].[EidtCourse]    Script Date: 1/17/2024 12:54:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROC [MangerSC].[EidtCourse]
@min int,
@max int,
@id int
AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned

    BEGIN TRY
        -- Check if the student exists before updating
        IF EXISTS (SELECT 1 FROM Courses WHERE C_ID= @id)
        BEGIN
            -- Perform the update
            UPDATE Courses
 set  C_minDegree = @min , C_maxDigree = @max
where C_ID = @id

            PRINT 'Course information updated successfully.';
        END
        ELSE
        BEGIN
            PRINT 'Course not found. No update performed.';
        END
    END TRY
    BEGIN CATCH
        -- Handle errors if any
        PRINT 'An error occurred while updating the Course information. Error: ' + ERROR_MESSAGE();
    END CATCH
END;

GO


