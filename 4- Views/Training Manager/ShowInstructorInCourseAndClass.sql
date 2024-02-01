USE [Examination]
GO

create view [MangerSC].[ShowInstructorInCourseAndClass]
as
SELECT dbo.Instructors.Inst_name, dbo.Courses.C_name as Course_Name, dbo.Class.Class_name, dbo.Inst_teach_course.year
FROM    dbo.Class INNER JOIN dbo.Inst_teach_course 
		ON dbo.Class.Class_ID = dbo.Inst_teach_course.Class_ID 
			INNER JOIN dbo.Courses 
		ON dbo.Inst_teach_course.course_ID = dbo.Courses.C_ID 
			INNER JOIN dbo.Instructors 
		ON dbo.Inst_teach_course.Instructor_ID = dbo.Instructors.Inst_ID




