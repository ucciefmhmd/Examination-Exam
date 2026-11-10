/****** Object:  StoredProcedure [MangerSC].[EidtInstForEachCourse]    Script Date: 1/17/2024 12:54:48 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROC [MangerSC].[EidtInstForEachCourse]
@newInstID int,
@oldInstID int,
@oldClassID int,
@oldCourseID int
AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned
    SET XACT_ABORT ON; -- any error rolls back the whole transaction

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Check if the student exists before updating
        IF EXISTS (SELECT 1 FROM Inst_teach_course WITH (UPDLOCK, HOLDLOCK) WHERE course_ID= @oldCourseID and Class_ID = @oldClassID and  Instructor_ID = @oldInstID)
        BEGIN
            -- Perform the update
            UPDATE Inst_teach_course
			 set  Instructor_ID = @newInstID 
			where course_ID= @oldCourseID and Class_ID = @oldClassID and  Instructor_ID = @oldInstID

            COMMIT TRANSACTION;
            PRINT 'Inst_teach_course information updated successfully.';
        END
        ELSE
        BEGIN
            THROW 50001, N'Inst_teach_course not found. No update performed.', 1;
        END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


