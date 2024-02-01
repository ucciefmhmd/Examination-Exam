

------------- views for Student -------------------

-- Show Students in Exam and thier Results 
SELECT * from [StudentSC].[ShowStudentResults]





------------- Proc for Student -------------------

-- Get Available Exam now
exec [StudentSC].[GetAvailableExams]


-- Insert answer about student
exec [StudentSC].[InsertAnswer] 3,_,8,'d'
exec [StudentSC].[InsertAnswer] 3,_,9,'b'
exec [StudentSC].[InsertAnswer] 3,_,10,'a' --c 