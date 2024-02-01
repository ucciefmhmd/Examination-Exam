
-- views for Manager Account

-- show all Branchs and their details (address and name )
Select * FROM [MangerSC].[ShowAllDataFromBranch]

-- show all Courses and their details (name & min and max degree & description)
SELECT * FROM[MangerSC].[ShowAllDataFromCourses]

-- show all Instructor and their details (name $ email & password & their manager's name)
SELECT * FROM[MangerSC].[ShowAllDataFromInstaructors]


-- show all Student and their personal details and their branch & track & inatke & class
SELECT * FROM[MangerSC].[ShowAllDataFromStudent]

--show all department in all intakes
SELECT * FROM[MangerSC].[ShowDepartmentInIntake]

--show all department in specific intake
SELECT dept_name FROM[MangerSC].[ShowDepartmentInIntake] WHERE Intake_name = 'Intake43'

-- show which intakes this department was in
SELECT * FROM[MangerSC].[ShowDepartmentInIntake]

-- show instructor and their course in class
SELECT * FROM[MangerSC].[ShowInstructorInCourseAndClass]

-- show courses that this instructor teach
SELECT Course_Name FROM[MangerSC].[ShowInstructorInCourseAndClass] WHERE Inst_name ='ali'

-- show by which instructor this course teached
SELECT Inst_name FROM[MangerSC].[ShowInstructorInCourseAndClass] WHERE Course_Name ='C#'

GO


--------------------------- all procedure to Manager

-- to create new branch with add new and address
exec [MangerSC].[CreateBranch] 'newbranch22','branch22 address'

-- to edit addres of branch if something happen
exec[MangerSC].[EidtBranch] 'new Address22', '1'


go
------------------------- Crud for Courses 

-- add new course
exec [MangerSC].[CreateCourses] 'new course2', '20', '78','desc for new course2'

-- edit degree for course with select id of it
exec[MangerSC].[EidtCourse] '40','95','7'

-- delete course by its ID
exec [MangerSC].[DeleteCourse] 7

go

-------------------------- Crud for Instructor 

-- add new instructor
exec [MangerSC].[CreateInstructor]'Sereen Waleed', 'Sereen@gamil.com','Sereen123','3'

-- edit email and Password for instructor by id
exec[MangerSC].[EidtInstructor] 'rad@yahho.com','R#23456',3

-- delete instructor by his /her ID
exec[MangerSC].[DeleteInstructor] 6

go

------------------------------- instructors for each course

--add course to new instructor in class 
-- course id >> instructor id >> class id
exec [MangerSC].[CreateInstructorINCourse] 4,2,5

-- edit new instructors for this Course and class 

-- new inst >> old inst,class,course
exec[MangerSC].[EidtInstForEachCourse] 1,5,1,1

go

--CRUD for Student 

-- add new student
exec [MangerSC].[CreateStudent] 'Randa','Rand@gamil.com','Rand3242',1,1,1,1

-- delete Student by his /her ID
exec[MangerSC].[DeleteStudent] 7

go

--edit each department in intake 
exec [MangerSC].[EidtIntake_Depart]  2,4,3
