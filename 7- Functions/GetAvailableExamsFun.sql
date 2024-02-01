USE [Examination]
GO
-- this function to show to student which exam is available now to insert Answers

CREATE   FUNCTION [dbo].[GetAvailableExamsFun]()
RETURNS TABLE
AS
RETURN
(

SELECT Exam.E_ID , Questions.Q_Text, Questions.Q_type, Questions.Q_Mark, Exam.E_allownce
FROM    Exam_Question INNER JOIN
                  Exam ON Exam_Question.Exam_ID = Exam.E_ID INNER JOIN
                Questions ON Exam_Question.Question_ID = Questions.Q_ID
WHERE
        Exam.E_startTime <= CONVERT(TIME, GETDATE())
        AND Exam.E_endTime > CONVERT(TIME, GETDATE())
        AND Exam.E_Date = CONVERT(date, GETDATE())
);
GO


