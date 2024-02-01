USE [Examination]

GO

Create view [InstructorSC].[ShowStudentInExam]
as
SELECT dbo.Students.Std_name, dbo.Exam.E_ID, dbo.Student_Exam.Results
FROM	dbo.Exam INNER JOIN dbo.Student_Exam 
		ON dbo.Exam.E_ID = dbo.Student_Exam.Exam_ID INNER JOIN dbo.Students 
		ON dbo.Student_Exam.Student_ID = dbo.Students.Std_ID
GO




