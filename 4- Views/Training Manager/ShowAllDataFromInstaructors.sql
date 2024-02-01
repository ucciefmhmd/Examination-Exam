USE [Examination]
GO


create view [MangerSC].[ShowAllDataFromInstaructors]
as
SELECT i.Inst_name, i.Inst_ID, i.Inst_email, i.Inst_password, 
	(select m.Inst_name from Instructors m where i.manager_id = m.Inst_ID ) as MangerName
FROM  dbo.Instructors i



