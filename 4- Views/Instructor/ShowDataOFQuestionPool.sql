USE [Examination]
GO



create view [InstructorSC].[ShowDataOFQuestionPool]
AS
SELECT  Questions.Q_Text, Questions.Q_correctAns, Questions.Q_type, Courses.C_name, Courses.C_minDegree, Courses.C_maxDegree, Questions.Q_Mark
FROM     Questions INNER JOIN Courses 
ON Questions.Course_ID = Courses.C_ID
GO


