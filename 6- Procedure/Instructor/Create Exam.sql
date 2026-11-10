/****** Object:  StoredProcedure [InstructorSC].[CreateExam]    Script Date: 1/16/2024 11:30:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   PROCEDURE [InstructorSC].[CreateExam]
    @StartTime DATETIME,
    @EndTime DATETIME,
    @Type NVARCHAR(50),
    @Year INT,
    @Allowance BIT,
    @CourseID INT,
    @InstructorID INT,
    @IntakeID INT,
    @TrackID INT,
    @BranchID INT,
	@Date date
AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned
    SET XACT_ABORT ON; -- any error rolls back the whole transaction
	
    BEGIN TRY
        BEGIN TRANSACTION;

        IF EXISTS (
            SELECT 1
            FROM dbo.Inst_teach_course WITH (UPDLOCK, HOLDLOCK)
            WHERE course_ID = @CourseID
            AND Instructor_ID = @InstructorID
        )
        BEGIN
            -- Perform the insertion
            INSERT INTO [dbo].[Exam]
                ([E_startTime], [E_endTime], [E_type], [E_year],[E_allownce] , [Course_ID],
                 [Instructor_ID], [Intake_ID], [Track_ID], [Branch_ID] ,[E_Date] )
            VALUES
                (@StartTime, @EndTime, @Type, @Year, @Allowance, @CourseID, @InstructorID,
                 @IntakeID, @TrackID, @BranchID , @date);

            COMMIT TRANSACTION;
            PRINT 'Exam Created successfully.';
        END
        ELSE
        BEGIN
            THROW 50003, N'Instructor is not assigned to the specified course. Exam creation failed.', 1;
        END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


