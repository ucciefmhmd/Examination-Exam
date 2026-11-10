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
    SET XACT_ABORT ON; -- any error rolls back the whole transaction

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Check if the student exists before updating
        IF EXISTS (SELECT 1 FROM Courses WITH (UPDLOCK, HOLDLOCK) WHERE C_ID= @id)
        BEGIN
            -- Perform the update
            UPDATE Courses
 set  C_minDegree = @min , C_maxDegree = @max
where C_ID = @id

            COMMIT TRANSACTION;
            PRINT 'Course information updated successfully.';
        END
        ELSE
        BEGIN
            THROW 50001, N'Course not found. No update performed.', 1;
        END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

GO


