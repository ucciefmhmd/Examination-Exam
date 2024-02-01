USE [Examination]
GO

create view [InstructorSC].[ShowStudentsInClasses]
as
SELECT dbo.Students.Std_name, dbo.Class.Class_name
FROM   dbo.Class INNER JOIN dbo.Students 
ON dbo.Class.Class_ID = dbo.Students.class_id
GO


