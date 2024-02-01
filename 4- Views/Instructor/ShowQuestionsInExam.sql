USE [Examination]


GO

CREATE view [InstructorSC].[ShowQuestionsInExam]
as
SELECT  
	dbo.Exam.E_ID, dbo.Questions.Q_Text, dbo.Questions.Q_correctAns, dbo.Questions.Q_type, dbo.Questions.Q_Mark
FROM    dbo.Exam INNER JOIN dbo.Exam_Question 
		ON dbo.Exam.E_ID = dbo.Exam_Question.Exam_ID INNER JOIN dbo.Questions 
		ON dbo.Exam_Question.Question_ID = dbo.Questions.Q_ID
GO


