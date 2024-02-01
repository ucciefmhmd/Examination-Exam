-- Manager Role --

CREATE ROLE Manager_role;
GRANT CREATE TABLE TO Manager_role;
GRANT INSERT, UPDATE ON [dbo].[Tracks] TO Manager_role;
GRANT INSERT, UPDATE ON [dbo].[Branchs] TO Manager_role;
GRANT INSERT,SELECT ,UPDATE, DELETE ON [dbo].[Instructors] TO Manager_role ;
GRANT INSERT, UPDATE ON  [dbo].[Intake]TO Manager_role;
GRANT INSERT, UPDATE ON [dbo].[Students] TO Manager_role;
GRANT INSERT, SELECT,UPDATE, DELETE ON [dbo].[Courses] TO Manager_role;
GRANT SELECT ON [MangerSC].[ShowAllDataFromBranch] TO Manager_role;
GRANT SELECT ON [MangerSC].[ShowAllDataFromCourses] TO Manager_role;
GRANT SELECT ON [MangerSC].[ShowAllDataFromInstaructors] TO Manager_role;
GRANT SELECT ON [MangerSC].[ShowAllDataFromStudent] TO Manager_role;
GRANT SELECT ON [MangerSC].[ShowDepartmentInIntake] TO Manager_role;
GRANT SELECT ON [MangerSC].[ShowInstructorInCourseAndClass] TO Manager_role;
GRANT exec ON [MangerSC].[CreateBranch] TO Manager_role;
GRANT exec ON [MangerSC].[CreateCourses] TO Manager_role;
GRANT exec ON [MangerSC].[CreateInstructor] TO Manager_role;
GRANT exec ON [MangerSC].[CreateInstructorINCourse] TO Manager_role;
GRANT exec ON [MangerSC].[CreateStudent] TO Manager_role;
GRANT exec ON [MangerSC].[DeleteCourse] TO Manager_role;
GRANT exec ON [MangerSC].[DeleteInstructor] TO Manager_role;
GRANT exec ON [MangerSC].[EditStudent] TO Manager_role;
GRANT exec ON [MangerSC].[EidtBranch] TO Manager_role;
GRANT exec ON [MangerSC].[EidtCourse] TO Manager_role;
GRANT exec ON [MangerSC].[EidtInstForEachCourse] TO Manager_role;
GRANT exec ON [MangerSC].[EidtInstructor] TO Manager_role;
GRANT exec ON [MangerSC].[EidtIntake_Depart] TO Manager_role;


---------------------------------------------------------------------------------

SELECT* FROM [dbo].[Intake]

------------------------------------------------------------------------------------------

--Student Role --

CREATE ROLE Student_role;
GRANT SELECT ON [dbo].[Exam] TO Student_role;
GRANT SELECT ON [dbo].[Questions] TO Student_role;
GRANT SELECT ON [dbo].[Students] TO Student_role;
GRANT SELECT ON [dbo].[Student_Exam] TO Student_role;
GRANT insert ON [dbo].[Answer] TO Student_role;
GRANT exec ON [StudentSC].[GetAvailableExams] TO Student_role;
GRANT exec ON [StudentSC].[InsertAnswer] TO Student_role;
GRANT SELECT ON [StudentSC].[ShowStudentResults] TO Student_role;


--Instructor Role --
CREATE ROLE Instructor_role;
GRANT INSERT, UPDATE, DELETE ON [dbo].[Questions] TO Instructor_role;
GRANT INSERT ON [dbo].[Exam] TO Instructor_role;
GRANT select ON [dbo].Students TO Instructor_role;
GRANT INSERT ON [dbo].[Exam_Question] TO Instructor_role;
GRANT INSERT ON [dbo].[Student_Exam] TO Instructor_role; 
GRANT select ON [InstructorSC].[ShowAllDataFromExam] TO Instructor_role;
GRANT select ON [InstructorSC].[ShowDataOFQuestionPool] TO Instructor_role;
GRANT select ON [InstructorSC].[ShowQuestionsInExam] TO Instructor_role;
GRANT select ON [InstructorSC].[ShowStudentInExam] TO Instructor_role;
GRANT select ON [InstructorSC].[ShowStudentsInClasses] TO Instructor_role;
GRANT exec ON [InstructorSC].[CreateExam] TO Instructor_role;
GRANT exec ON [InstructorSC].[CreateQuestion] TO Instructor_role;
GRANT exec ON [InstructorSC].[DeleteQuestion] TO Instructor_role;
GRANT exec ON [InstructorSC].[EditQuestions] TO Instructor_role;
GRANT exec ON [InstructorSC].[EidtQuestionsMark] TO Instructor_role;
GRANT exec ON [InstructorSC].[GetStudentByID] TO Instructor_role;
GRANT exec ON [InstructorSC].[InsertExamQuestions] TO Instructor_role;
GRANT exec ON [InstructorSC].[InsertExamQuestionsRandomly] TO Instructor_role;
GRANT exec ON [InstructorSC].[insertStudentToExams] TO Instructor_role;


-- Assign User to Roles
ALTER ROLE Manager_role ADD MEMBER manager;
ALTER ROLE Instructor_role ADD MEMBER instructor;
ALTER ROLE Student_role ADD MEMBER student;