USE [Examination]

GO

-- show all Data from exam
create view [InstructorSC].[ShowAllDataFromExam]
as
SELECT 
dbo.Exam.E_ID, dbo.Exam.E_startTime, dbo.Exam.E_endTime, dbo.Exam.E_type, dbo.Exam.E_year, dbo.Exam.E_allownce, dbo.Courses.C_name, dbo.Instructors.Inst_name, dbo.Intake.Intake_name, dbo.Tracks.Track_name, 
                  dbo.Branchs.Branch_name, dbo.Exam.E_Date
FROM dbo.Branchs INNER JOIN dbo.Exam 
		ON dbo.Branchs.Branch_ID = dbo.Exam.Branch_ID INNER JOIN dbo.Courses 
		ON dbo.Exam.Course_ID = dbo.Courses.C_ID INNER JOIN dbo.Instructors 
		ON dbo.Exam.Instructor_ID = dbo.Instructors.Inst_ID INNER JOIN dbo.Intake 
		ON dbo.Exam.Intake_ID = dbo.Intake.Intake_ID INNER JOIN dbo.Tracks 
		ON dbo.Exam.Track_ID = dbo.Tracks.Track_ID
