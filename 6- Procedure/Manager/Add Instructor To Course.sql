/****** Object:  StoredProcedure [MangerSC].[CreateInstructorINCourse]    Script Date: 1/17/2024 12:05:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROC [MangerSC].[CreateInstructorINCourse]
    @IdCourses int,
    @IdInstructor int,
    @IdClass int

AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned
    SET XACT_ABORT ON; -- any error rolls back the whole transaction

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Perform the insertion
        INSERT INTO [dbo].[Inst_teach_course]
               ([course_ID],[Instructor_ID], [Class_ID],  [year])
         VALUES
               (@IdCourses, @IdInstructor, @IdClass, year(GETDATE()));

        COMMIT TRANSACTION;
        PRINT 'Instructor added in Course successfully.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


