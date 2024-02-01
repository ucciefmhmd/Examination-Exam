USE [Examination]
GO

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

    BEGIN TRY
        -- Perform the insertion
        INSERT INTO [dbo].[Inst_teach_course]
               ([course_ID],[Instructor_ID], [Class_ID],  [year])
         VALUES
               (@IdCourses, @IdInstructor, @IdClass, year(GETDATE()));

        PRINT 'Instructor added in Course successfully.';
    END TRY
    BEGIN CATCH
        -- Handle errors if any
        PRINT 'An error occurred while added the Instructor in Course. Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO


