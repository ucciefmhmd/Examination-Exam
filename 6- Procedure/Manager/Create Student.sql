USE [Examination]
GO

/****** Object:  StoredProcedure [MangerSC].[CreateStudent]    Script Date: 1/17/2024 12:06:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROC [MangerSC].[CreateStudent]
    @name NVARCHAR(50),
    @email NVARCHAR(50),
    @password NVARCHAR(50),
    @intakeID INT,
    @branchID INT,
    @trackID INT,
    @classID INT
AS
BEGIN
    SET NOCOUNT ON; -- This prevents the count of the number of rows affected from being returned

    BEGIN TRY
        -- Perform the insertion
        INSERT INTO [dbo].[Students]
               ([Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id])
         VALUES
               (@name, @email, @password, @intakeID, @branchID, @trackID, @classID);

        PRINT 'Student created successfully.';
    END TRY
    BEGIN CATCH
        -- Handle errors if any
        PRINT 'An error occurred while creating the student. Error: ' + ERROR_MESSAGE();
    END CATCH
END;

GO


