USE [Examination]
GO
-- this function to check answers for student and return degree for all correct answer 

CREATE   FUNCTION [dbo].[CalculateTotalCorrectAnswers](@ExamID INT, @StudentID INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalCorrectAnswers INT;

    SELECT @TotalCorrectAnswers = sum(q.Q_Mark)
    FROM dbo.Answer a
    INNER JOIN dbo.Questions q ON a.Question_ID = q.Q_ID
    WHERE a.Exam_ID = @ExamID
    AND a.Student_ID = @StudentID
    AND a.Student_answer = q.Q_correctAns;

    RETURN @TotalCorrectAnswers;
END;



