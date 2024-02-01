
--        views for Instructor             --
go

-- show all detials for all Exam to Instructor
select * from[InstructorSC].[ShowAllDataFromExam]

-- show all detials for specific Exam 
select * from[InstructorSC].[ShowAllDataFromExam] where E_ID = 1


-- show selected detials for specific exam 
select E_startTime,E_endTime from [InstructorSC].[ShowAllDataFromExam] where E_ID = 9


-- show all Questions with their Correct Answers with their Cousre Name 
select * from[InstructorSC].[ShowDataOFQuestionPool] 


-- show all Questions with their Correct Answers in Specific  Cousre
select * from[InstructorSC].[ShowDataOFQuestionPool] where C_name = 'html'  
select * from[InstructorSC].[ShowDataOFQuestionPool] where C_name = 'sql'
select * from[InstructorSC].[ShowDataOFQuestionPool] where C_name = 'C#'


-- show all Questions with their Correct Answers in all Exams
select * from[InstructorSC].[ShowQuestionsInExam]


-- show all Questions with their Correct Answers in specific Exams
select * from[InstructorSC].[ShowQuestionsInExam] where E_ID=1 


---- show all Studnets with their Exams that was allowed to enter and their Results in
select * from[InstructorSC].[ShowStudentInExam]


---- show Results for All Students in Specific exam 
select Std_name, Results from[InstructorSC].[ShowStudentInExam] where E_ID =1

---- show Results for a Student in all his/her exam 
select E_ID, Results from[InstructorSC].[ShowStudentInExam] where Std_name ='shrouk ali'


-- all students in all class
select * from[InstructorSC].[ShowStudentsInClasses]




--   procedure for instructor     

-- for make new exam with enter start time, end time, type and all details
exec [InstructorSC].[CreateExam] '10:00:00','16:00:00','Normal','2024','true','10','6','1','1','1', '2024-01-17'
 

 -- make a new question with select which course belongs to 
exec [InstructorSC].[CreateQuestion]  'Which of the following are examples of UI? A.Key (for opening door) B.TV Remote C.Button (in an app) D.All of the above','D','MCQ',10


--for delete question with select its id
exec [InstructorSC].[DeleteQuestion] 6


--to edit correct answer for Question with selected its id 
exec [InstructorSC].[EditQuestions] 'd',8


--to edit degree for each Question
exec [InstructorSC].[EidtQuestionsMark] 4,12


-- selected no oF Questions to an Exam and selected these Questions
exec [InstructorSC].[InsertExamQuestions] _,4,'8,9,10'


-- -- selected no oF Questions to an Exam and select Questions will be random
exec [InstructorSC].[InsertExamQuestionsRandomly] _,3


-- selected Students for Specific Exam
exec [InstructorSC].[insertStudentToExams] _,2,'2,3'

