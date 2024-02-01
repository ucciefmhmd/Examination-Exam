USE [Examination]
GO



create view [MangerSC].[ShowAllDataFromStudent]
as
SELECT dbo.Students.Std_name, dbo.Students.Std_email, dbo.Students.Std_password, dbo.Intake.Intake_name, dbo.Branchs.Branch_name, dbo.Tracks.Track_name, dbo.Class.Class_name
FROM    dbo.Branchs INNER JOIN dbo.Students 
		ON dbo.Branchs.Branch_ID = dbo.Students.barch_id INNER JOIN dbo.Class 
		ON dbo.Students.class_id = dbo.Class.Class_ID INNER JOIN dbo.Intake 
		ON dbo.Students.Intake_id = dbo.Intake.Intake_ID INNER JOIN dbo.Tracks 
		ON dbo.Students.track_id = dbo.Tracks.Track_ID



