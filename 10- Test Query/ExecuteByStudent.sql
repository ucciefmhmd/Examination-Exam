

------------- views for Student -------------------

-- Show Students in Exam and thier Results 
SELECT * from [StudentSC].[ShowStudentResults]





------------- Proc for Student -------------------

-- Get Available Exam now
exec [StudentSC].[GetAvailableExams]


-- Insert answer about student
-- (student 3 is registered for exam 1, which has questions 25, 27 and 29)
-- InsertAnswer only accepts answers while the exam is running: on its date, between its
-- start and end time (see GetAvailableExamsFun). Exam_check_date only allows exam dates
-- after today, so on a freshly built database no exam is running yet and each call
-- raises "This exam is not currently available for answering." The TRY/CATCH blocks
-- print that message so the rest of the script still runs.
BEGIN TRY exec [StudentSC].[InsertAnswer] 3,1,25,'a' END TRY BEGIN CATCH PRINT ERROR_MESSAGE() END CATCH
BEGIN TRY exec [StudentSC].[InsertAnswer] 3,1,27,'true' END TRY BEGIN CATCH PRINT ERROR_MESSAGE() END CATCH
BEGIN TRY exec [StudentSC].[InsertAnswer] 3,1,29,'b' END TRY BEGIN CATCH PRINT ERROR_MESSAGE() END CATCH --c 