USE [Examination]
GO


create view [MangerSC].[ShowDepartmentInIntake]
 as
 SELECT  dbo.Intake.Intake_name, dbo.Department.dept_name
 FROM		dbo.Department INNER JOIN dbo.Intake_Depart 
			ON dbo.Department.dept_ID = dbo.Intake_Depart.Depart_ID INNER JOIN dbo.Intake 
			ON dbo.Intake_Depart.Intake_id = dbo.Intake.Intake_ID


