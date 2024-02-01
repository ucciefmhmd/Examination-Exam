

--  Insert data in table Answer

INSERT [dbo].[Answer] ([Student_ID], [Exam_ID], [Question_ID], [Student_answer]) VALUES (1, 1, 1, N'a')
INSERT [dbo].[Answer] ([Student_ID], [Exam_ID], [Question_ID], [Student_answer]) VALUES (1, 14, 31, N'd')
INSERT [dbo].[Answer] ([Student_ID], [Exam_ID], [Question_ID], [Student_answer]) VALUES (1, 14, 32, N'false')
INSERT [dbo].[Answer] ([Student_ID], [Exam_ID], [Question_ID], [Student_answer]) VALUES (2, 1, 2, N'c')
INSERT [dbo].[Answer] ([Student_ID], [Exam_ID], [Question_ID], [Student_answer]) VALUES (3, 7, 5, N'true')
INSERT [dbo].[Answer] ([Student_ID], [Exam_ID], [Question_ID], [Student_answer]) VALUES (5, 8, 10, N'c')


------------------------------------------------------------------------------------------------------

--  Insert data in table Branchs

INSERT [dbo].[Branchs] ([Branch_ID], [Branch_name], [Branch_address]) VALUES (1, N'Village bns', N'Beni suef')
INSERT [dbo].[Branchs] ([Branch_ID], [Branch_name], [Branch_address]) VALUES (2, N'Cairo University', N'Cairo')
INSERT [dbo].[Branchs] ([Branch_ID], [Branch_name], [Branch_address]) VALUES (3, N'ALex University', N'Alex')
INSERT [dbo].[Branchs] ([Branch_ID], [Branch_name], [Branch_address]) VALUES (4, N'Minya University', N'Minya')
INSERT [dbo].[Branchs] ([Branch_ID], [Branch_name], [Branch_address]) VALUES (5, N'Banha University', N'Banha')
INSERT [dbo].[Branchs] ([Branch_ID], [Branch_name], [Branch_address]) VALUES (6, N'Smart Village', N'October')
INSERT [dbo].[Branchs] ([Branch_ID], [Branch_name], [Branch_address]) VALUES (7, N'Mansoura', N'Kafr Al Mougi, El Mansoura
')
INSERT [dbo].[Branchs] ([Branch_ID], [Branch_name], [Branch_address]) VALUES (8, N'Assiut University', N'Assiut
')
INSERT [dbo].[Branchs] ([Branch_ID], [Branch_name], [Branch_address]) VALUES (9, N'New Sohag University', N'Sohag
')
INSERT [dbo].[Branchs] ([Branch_ID], [Branch_name], [Branch_address]) VALUES (10, N'South Valley University
', N'Qena
')
INSERT [dbo].[Branchs] ([Branch_ID], [Branch_name], [Branch_address]) VALUES (11, N'NULAswan
L', N'Abu Simbel, High Dam area
')



------------------------------------------------------------------------------------------------------

--  Insert data in table Class

INSERT [dbo].[Class] ([Class_ID], [Class_name]) VALUES (1, N'A1')
INSERT [dbo].[Class] ([Class_ID], [Class_name]) VALUES (2, N'A2')
INSERT [dbo].[Class] ([Class_ID], [Class_name]) VALUES (3, N'B1')
INSERT [dbo].[Class] ([Class_ID], [Class_name]) VALUES (4, N'B2')
INSERT [dbo].[Class] ([Class_ID], [Class_name]) VALUES (5, N'C1')
INSERT [dbo].[Class] ([Class_ID], [Class_name]) VALUES (6, N'C2')
INSERT [dbo].[Class] ([Class_ID], [Class_name]) VALUES (7, N'D1')
INSERT [dbo].[Class] ([Class_ID], [Class_name]) VALUES (8, N'D2')


------------------------------------------------------------------------------------------------------

--  Insert data in table Courses

INSERT [dbo].[Courses] ([C_ID], [C_name], [C_minDegree], [C_maxDegree], [C_Description]) VALUES (1, N'Html', 40, 90, N'HTML is the standard markup language for creating Web pages.')
INSERT [dbo].[Courses] ([C_ID], [C_name], [C_minDegree], [C_maxDegree], [C_Description]) VALUES (2, N'CSS', 49, 90, N'CSS describes how HTML elements are to be displayed on screen, paper, or in other media.')
INSERT [dbo].[Courses] ([C_ID], [C_name], [C_minDegree], [C_maxDegree], [C_Description]) VALUES (3, N'JaveScript', 45, 80, N'JavaScript is a scripting language that enables you to create dynamically updating content')
INSERT [dbo].[Courses] ([C_ID], [C_name], [C_minDegree], [C_maxDegree], [C_Description]) VALUES (4, N'Sql', 40, 90, N'Structured query language (SQL) is a programming language for storing and processing information in a relational database.')
INSERT [dbo].[Courses] ([C_ID], [C_name], [C_minDegree], [C_maxDegree], [C_Description]) VALUES (5, N'C#', 49, 80, N'C# is an object-oriented, component-oriented programming language.')
INSERT [dbo].[Courses] ([C_ID], [C_name], [C_minDegree], [C_maxDegree], [C_Description]) VALUES (6, N'Bootstrap
', 49, 90, N'Bootstrap for responsive web development
')
INSERT [dbo].[Courses] ([C_ID], [C_name], [C_minDegree], [C_maxDegree], [C_Description]) VALUES (7, N'Angular
', 40, 80, N'framework for building web applications
')
INSERT [dbo].[Courses] ([C_ID], [C_name], [C_minDegree], [C_maxDegree], [C_Description]) VALUES (8, N'ASP. Net MVC Core
', 49, 90, N'web development framework
')
INSERT [dbo].[Courses] ([C_ID], [C_name], [C_minDegree], [C_maxDegree], [C_Description]) VALUES (9, N'JQuery
', 49, 80, N'JavaScript library
')
INSERT [dbo].[Courses] ([C_ID], [C_name], [C_minDegree], [C_maxDegree], [C_Description]) VALUES (10, N'UX/UI design basics
', 49, 90, N'fundamentals of UI and UX design
')
INSERT [dbo].[Courses] ([C_ID], [C_name], [C_minDegree], [C_maxDegree], [C_Description]) VALUES (11, N'OOP using C++
', 49, 80, N'OOP concepts in C#
')
INSERT [dbo].[Courses] ([C_ID], [C_name], [C_minDegree], [C_maxDegree], [C_Description]) VALUES (12, N'Oracle SQL
', 40, 80, N'database query language
')
INSERT [dbo].[Courses] ([C_ID], [C_name], [C_minDegree], [C_maxDegree], [C_Description]) VALUES (13, N'python', 49, 90, N'fundamental data structures and algorithms
')



------------------------------------------------------------------------------------------------------

--  Insert data in table Department

INSERT [dbo].[Department] ([dept_ID], [dept_name]) VALUES (1, N'CS')
INSERT [dbo].[Department] ([dept_ID], [dept_name]) VALUES (2, N'IT')
INSERT [dbo].[Department] ([dept_ID], [dept_name]) VALUES (3, N'Sales')
INSERT [dbo].[Department] ([dept_ID], [dept_name]) VALUES (4, N'IS')
INSERT [dbo].[Department] ([dept_ID], [dept_name]) VALUES (5, N'MM')
INSERT [dbo].[Department] ([dept_ID], [dept_name]) VALUES (6, N'Marketing')



------------------------------------------------------------------------------------------------------

--  Insert data in table Exam

INSERT [dbo].[Exam] ([E_ID], [E_startTime], [E_endTime], [E_type], [E_year], [E_allownce], [Course_ID], [Instructor_ID], [Intake_ID], [Track_ID], [Branch_ID], [E_Date]) VALUES (1, CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), N'Normal', 2020, 1, 1, 1, 1, 1, 1, CAST(N'2024-01-21' AS Date))
INSERT [dbo].[Exam] ([E_ID], [E_startTime], [E_endTime], [E_type], [E_year], [E_allownce], [Course_ID], [Instructor_ID], [Intake_ID], [Track_ID], [Branch_ID], [E_Date]) VALUES (2, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), N'Normal', 2020, 1, 2, 1, 1, 2, 1, CAST(N'2024-01-20' AS Date))
INSERT [dbo].[Exam] ([E_ID], [E_startTime], [E_endTime], [E_type], [E_year], [E_allownce], [Course_ID], [Instructor_ID], [Intake_ID], [Track_ID], [Branch_ID], [E_Date]) VALUES (7, CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), N'Normal', 2022, 1, 5, 1, 1, 3, 1, CAST(N'2024-01-23' AS Date))
INSERT [dbo].[Exam] ([E_ID], [E_startTime], [E_endTime], [E_type], [E_year], [E_allownce], [Course_ID], [Instructor_ID], [Intake_ID], [Track_ID], [Branch_ID], [E_Date]) VALUES (8, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), N'Corrective', 2022, 1, 6, 1, 1, 2, 1, CAST(N'2024-01-25' AS Date))
INSERT [dbo].[Exam] ([E_ID], [E_startTime], [E_endTime], [E_type], [E_year], [E_allownce], [Course_ID], [Instructor_ID], [Intake_ID], [Track_ID], [Branch_ID], [E_Date]) VALUES (9, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), N'Corrective', 2022, 0, 9, 2, 2, 2, 2, CAST(N'2024-01-27' AS Date))
INSERT [dbo].[Exam] ([E_ID], [E_startTime], [E_endTime], [E_type], [E_year], [E_allownce], [Course_ID], [Instructor_ID], [Intake_ID], [Track_ID], [Branch_ID], [E_Date]) VALUES (10, CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time), N'Corrective', 2023, 0, 7, 3, 4, 1, 1, CAST(N'2024-01-29' AS Date))
INSERT [dbo].[Exam] ([E_ID], [E_startTime], [E_endTime], [E_type], [E_year], [E_allownce], [Course_ID], [Instructor_ID], [Intake_ID], [Track_ID], [Branch_ID], [E_Date]) VALUES (11, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), N'Corrective', 2023, 1, 11, 2, 3, 5, 1, CAST(N'2024-02-01' AS Date))
INSERT [dbo].[Exam] ([E_ID], [E_startTime], [E_endTime], [E_type], [E_year], [E_allownce], [Course_ID], [Instructor_ID], [Intake_ID], [Track_ID], [Branch_ID], [E_Date]) VALUES (12, CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), N'Normal', 2021, 1, 3, 5, 2, 1, 4, CAST(N'2024-02-03' AS Date))
INSERT [dbo].[Exam] ([E_ID], [E_startTime], [E_endTime], [E_type], [E_year], [E_allownce], [Course_ID], [Instructor_ID], [Intake_ID], [Track_ID], [Branch_ID], [E_Date]) VALUES (14, CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), N'Normal', 2025, 1, 3, 5, 2, 2, 2, CAST(N'2024-02-05' AS Date))
INSERT [dbo].[Exam] ([E_ID], [E_startTime], [E_endTime], [E_type], [E_year], [E_allownce], [Course_ID], [Instructor_ID], [Intake_ID], [Track_ID], [Branch_ID], [E_Date]) VALUES (15, CAST(N'06:00:00' AS Time), CAST(N'08:00:00' AS Time), N'Normal', 2024, 1, 1, 5, 1, 1, 1, CAST(N'2024-02-07' AS Date))
INSERT [dbo].[Exam] ([E_ID], [E_startTime], [E_endTime], [E_type], [E_year], [E_allownce], [Course_ID], [Instructor_ID], [Intake_ID], [Track_ID], [Branch_ID], [E_Date]) VALUES (16, CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), N'Normal', 2026, 1, 1, 5, 1, 1, 1, CAST(N'2024-02-09' AS Date))
INSERT [dbo].[Exam] ([E_ID], [E_startTime], [E_endTime], [E_type], [E_year], [E_allownce], [Course_ID], [Instructor_ID], [Intake_ID], [Track_ID], [Branch_ID], [E_Date]) VALUES (17, CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Normal', 2024, 1, 1, 5, 1, 1, 1, CAST(N'2024-02-15' AS Date))
INSERT [dbo].[Exam] ([E_ID], [E_startTime], [E_endTime], [E_type], [E_year], [E_allownce], [Course_ID], [Instructor_ID], [Intake_ID], [Track_ID], [Branch_ID], [E_Date]) VALUES (18, CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Normal', 2024, 1, 1, 5, 1, 1, 1, CAST(N'2024-03-10' AS Date))
INSERT [dbo].[Exam] ([E_ID], [E_startTime], [E_endTime], [E_type], [E_year], [E_allownce], [Course_ID], [Instructor_ID], [Intake_ID], [Track_ID], [Branch_ID], [E_Date]) VALUES (19, CAST(N'15:23:00' AS Time), CAST(N'17:23:00' AS Time), N'Normal', 2024, 1, 1, 5, 1, 1, 1, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[Exam] ([E_ID], [E_startTime], [E_endTime], [E_type], [E_year], [E_allownce], [Course_ID], [Instructor_ID], [Intake_ID], [Track_ID], [Branch_ID], [E_Date]) VALUES (20, CAST(N'19:57:00' AS Time), CAST(N'22:57:00' AS Time), N'Normal', 2024, 1, 5, 2, 1, 1, 1, CAST(N'2024-03-03' AS Date))
INSERT [dbo].[Exam] ([E_ID], [E_startTime], [E_endTime], [E_type], [E_year], [E_allownce], [Course_ID], [Instructor_ID], [Intake_ID], [Track_ID], [Branch_ID], [E_Date]) VALUES (25, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), N'Normal', 2025, 0, 1, 1, 1, 1, 1, CAST(N'2024-03-05' AS Date))




------------------------------------------------------------------------------------------------------

--  Insert data in table Exam_Question

INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (1, 23)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (1, 25)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (1, 27)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (1, 29)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (2, 29)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (7, 14)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (7, 16)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (8, 18)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (9, 7)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (10, 17)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (11, 1)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (12, 31)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (14, 31)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (14, 32)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (16, 25)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (16, 27)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (17, 25)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (17, 27)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (18, 25)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (18, 27)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (19, 25)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (19, 27)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (20, 14)
INSERT [dbo].[Exam_Question] ([Exam_ID], [Question_ID]) VALUES (20, 16)



------------------------------------------------------------------------------------------------------

--  Insert data in table Inst_teach_course

INSERT [dbo].[Inst_teach_course] ([course_ID], [Instructor_ID], [Class_ID], [year]) VALUES (1, 5, 1, 2023)
INSERT [dbo].[Inst_teach_course] ([course_ID], [Instructor_ID], [Class_ID], [year]) VALUES (2, 3, 2, 2020)
INSERT [dbo].[Inst_teach_course] ([course_ID], [Instructor_ID], [Class_ID], [year]) VALUES (3, 5, 1, 2021)
INSERT [dbo].[Inst_teach_course] ([course_ID], [Instructor_ID], [Class_ID], [year]) VALUES (4, 3, 5, 2022)
INSERT [dbo].[Inst_teach_course] ([course_ID], [Instructor_ID], [Class_ID], [year]) VALUES (5, 2, 1, 2022)
INSERT [dbo].[Inst_teach_course] ([course_ID], [Instructor_ID], [Class_ID], [year]) VALUES (5, 3, 6, 2020)



------------------------------------------------------------------------------------------------------

--  Insert data in table Instructors

INSERT [dbo].[Instructors] ([Inst_ID], [Inst_name], [Inst_email], [Inst_password], [manager_id]) VALUES (1, N'ahmed', N'hamada@gmail.com', N'123654', 1)
INSERT [dbo].[Instructors] ([Inst_ID], [Inst_name], [Inst_email], [Inst_password], [manager_id]) VALUES (2, N'mona', N'mona@gmail.com', N'12345', 1)
INSERT [dbo].[Instructors] ([Inst_ID], [Inst_name], [Inst_email], [Inst_password], [manager_id]) VALUES (3, N'ali', N'ali@gmail.com', N'123457', 2)
INSERT [dbo].[Instructors] ([Inst_ID], [Inst_name], [Inst_email], [Inst_password], [manager_id]) VALUES (5, N'hossam', N'hossam@gmai.com', N'12378', 1)
INSERT [dbo].[Instructors] ([Inst_ID], [Inst_name], [Inst_email], [Inst_password], [manager_id]) VALUES (6, N'uccief mhmd', N'ucief@gmail.com', N'4520987', 1)



------------------------------------------------------------------------------------------------------

--  Insert data in table Intake

INSERT [dbo].[Intake] ([Intake_ID], [Intake_name]) VALUES (1, N'Intake41')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_name]) VALUES (2, N'Intake42')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_name]) VALUES (3, N'Intake43')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_name]) VALUES (4, N'Intake44')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_name]) VALUES (5, N'Intake45')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_name]) VALUES (6, N'Intake15')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_name]) VALUES (7, N'Intake12')



------------------------------------------------------------------------------------------------------

--  Insert data in table Intake_Branch

INSERT [dbo].[Intake_Branch] ([bran_ID], [intak_ID]) VALUES (1, 2)
INSERT [dbo].[Intake_Branch] ([bran_ID], [intak_ID]) VALUES (1, 4)
INSERT [dbo].[Intake_Branch] ([bran_ID], [intak_ID]) VALUES (1, 5)
INSERT [dbo].[Intake_Branch] ([bran_ID], [intak_ID]) VALUES (2, 1)
INSERT [dbo].[Intake_Branch] ([bran_ID], [intak_ID]) VALUES (2, 5)
INSERT [dbo].[Intake_Branch] ([bran_ID], [intak_ID]) VALUES (2, 7)
INSERT [dbo].[Intake_Branch] ([bran_ID], [intak_ID]) VALUES (3, 1)
INSERT [dbo].[Intake_Branch] ([bran_ID], [intak_ID]) VALUES (4, 2)
INSERT [dbo].[Intake_Branch] ([bran_ID], [intak_ID]) VALUES (4, 5)
INSERT [dbo].[Intake_Branch] ([bran_ID], [intak_ID]) VALUES (6, 2)
INSERT [dbo].[Intake_Branch] ([bran_ID], [intak_ID]) VALUES (7, 5)
INSERT [dbo].[Intake_Branch] ([bran_ID], [intak_ID]) VALUES (8, 2)
INSERT [dbo].[Intake_Branch] ([bran_ID], [intak_ID]) VALUES (8, 6)



------------------------------------------------------------------------------------------------------

--  Insert data in table Intake_Depart

INSERT [dbo].[Intake_Depart] ([Depart_ID], [Intake_id]) VALUES (1, 5)
INSERT [dbo].[Intake_Depart] ([Depart_ID], [Intake_id]) VALUES (2, 1)
INSERT [dbo].[Intake_Depart] ([Depart_ID], [Intake_id]) VALUES (3, 2)
INSERT [dbo].[Intake_Depart] ([Depart_ID], [Intake_id]) VALUES (3, 3)
INSERT [dbo].[Intake_Depart] ([Depart_ID], [Intake_id]) VALUES (4, 3)
INSERT [dbo].[Intake_Depart] ([Depart_ID], [Intake_id]) VALUES (5, 2)
INSERT [dbo].[Intake_Depart] ([Depart_ID], [Intake_id]) VALUES (5, 4)



------------------------------------------------------------------------------------------------------

--  Insert data in table Questions

INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (1, N'"What does OOP stand for?
a. Object-Oriented Programming
b. Operator Overloading Principle
c. Object Optimization Protocol
d. Object-Oriented Protocol"
', N'a', N'MCQ', 11, 3)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (2, N'What is the default route template in ASP.NET MVC Core?    a. "{controller}/{action}/{id}"    b. "{controller=Home}/{action=Index}/{id?}"    c. "{controller=Default}/{action=Index}/{id?}"    d. "{action}/{controller}/{id}"
', N'b', N'MCQ', 8, 2)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (3, N'TempData in ASP.NET MVC Core is used for long-term data storage.
', N'false', N'T/F', 8, 3)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (4, N'Razor views in ASP.NET MVC Core have the file extension ".cshtml".
', N'true', N'T/F', 8, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (5, N'The self parameter in Python class methods is mandatory and must always be explicitly specified.
', N'true', N'T/F', 13, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (6, N'In Python, the del statement is used to delete an entire class definition.
', N'fakse', N'T/F', 13, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (7, N'jQuery simplifies DOM manipulation and traversal.
', N'true', N'T/F', 9, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (8, N'What is User Experience (UX) design?    a. Process of creating visually appealing interfaces    b. Process of enhancing user satisfaction by improving usability    c. Process of coding and programming    d. Process of server-side scripting
', N'b', N'MCQ', 10, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (9, N'What does a wireframe represent in UX/UI design?    a. Detailed design with colors and images    b. Basic visual representation of a layout    c. Interactive prototype    d. Final product
', N'b', N'MCQ', 10, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (10, N'How can accessibility be incorporated into UX/UI design?    a. Ignoring alternative text for images    b. Using complex and illegible fonts    c. Ensuring products are usable by people of all abilities    d. Following design trends only
', N'c', N'MCQ', 10, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (11, N'"What is the purpose of the SQL SELECT statement in a database?
a. To insert new records into a table
b. To retrieve data from one or more tables
c. To update existing records in a table
d. To delete records from a table"
', N'b', N'MCQ', 4, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (14, N'What is C#?
', N'C# is a modern, general-purpose, object-oriented programming language developed by Microsoft', N'Written', 5, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (16, N'What is Jagged Array in C#?', N'A Jagged array is an array of arrays.', N'Written', 5, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (17, N'What is Twitter Bootstrap?', N'Bootstrap is a sleek, intuitive, and powerful mobile first front-end framework for faster and easier web development. It uses HTML, CSS and Javascript.', N'Written', 6, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (18, N'What does Bootstrap package includes?`', N'Bootstrap package includes ?

Scaffolding ? Bootstrap provides a basic structure with Grid System, link styles, background. This is is covered in detail in the section Bootstrap Basic Structure', N'Written', 6, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (19, N'What is Angular?', N'Angular was introduced to create Single Page applications. This framework brings structure and consistency to web applications and provides excellent scalability and maintainability. 
', N'Written', 7, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (22, N'Why was it introduced?', N'Angular is an open-source, JavaScript framework wholly written in TypeScript. It uses HTML''s syntax to express your application''s components clearly. ', N'Written', 7, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (23, N'What is ASP.Net?', N'It is a framework developed by Microsoft on which we can develop new generation web sites using web forms(aspx), MVC, HTML, Javascript, CSS etc.', N'Written', 8, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (24, N'What’s the use of Response.Output.Write()?', N'We can write formatted output using Response.Output.Write().
', N'Written', 8, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (25, N'Among the following, which is the HTML paragraph tag?
a) <p>
b) <pre>
c) <hr>
d) <a>', N'a', N'MCQ', 1, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (27, N'<h1> tag is used for inserting the largest heading in HTML?', N'true', N'T/F', 1, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (29, N'Which of the following CSS selectors are used to specify a group of elements?
	a) tag
	b) id
	c) class
	d) both class and tag', N'c', N'MCQ', 2, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (30, N'<script> type of HTML tag is used to define an internal style sheet?', N'false', N'T/F', 2, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (31, N'Which of the following is not javascript data types?
	a) Null type
	b) Undefined type
	c) Number type
	d) All of the mentioned', N'd', N'MCQ', 3, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (32, N'Window is the main entry point to all client-side JavaScript features and APIs?', N'true', N'T/F', 3, 1)
INSERT [dbo].[Questions] ([Q_ID], [Q_Text], [Q_correctAns], [Q_type], [Course_ID], [Q_Mark]) VALUES (33, N'Which SQL function is used to count the number of rows in a SQL query?
	a) COUNT()
	b) NUMBER()
	c) SUM()
	d) COUNT(*)', N'd', N'MCQ', 4, 1)





------------------------------------------------------------------------------------------------------

--  Insert data in table Student_Exam

INSERT [dbo].[Student_Exam] ([Student_ID], [Exam_ID], [Results]) VALUES (1, 1, N'70')
INSERT [dbo].[Student_Exam] ([Student_ID], [Exam_ID], [Results]) VALUES (1, 14, N'1')
INSERT [dbo].[Student_Exam] ([Student_ID], [Exam_ID], [Results]) VALUES (2, 2, N'60')
INSERT [dbo].[Student_Exam] ([Student_ID], [Exam_ID], [Results]) VALUES (3, 1, N'45')
INSERT [dbo].[Student_Exam] ([Student_ID], [Exam_ID], [Results]) VALUES (4, 1, N'0')
INSERT [dbo].[Student_Exam] ([Student_ID], [Exam_ID], [Results]) VALUES (5, 1, N'0')
INSERT [dbo].[Student_Exam] ([Student_ID], [Exam_ID], [Results]) VALUES (5, 7, N'80')
INSERT [dbo].[Student_Exam] ([Student_ID], [Exam_ID], [Results]) VALUES (6, 1, N'0')
INSERT [dbo].[Student_Exam] ([Student_ID], [Exam_ID], [Results]) VALUES (10, 7, N'70')
INSERT [dbo].[Student_Exam] ([Student_ID], [Exam_ID], [Results]) VALUES (15, 8, N'60')



------------------------------------------------------------------------------------------------------

--  Insert data in table Students

INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (1, N'youssef mohamed', N'youssef@gmail.com', N'123456', 1, 2, 2, 1)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (2, N'sama ahmed', N'sama@gmail.com', N'12345', 2, 1, 2, 1)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (3, N'rofida ashraf', N'rofida@gmail.com', N'123789', 3, 3, 1, 1)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (4, N'sameh osama', N'sameh@gmail.com', N'123654', 2, 2, 3, 3)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (5, N'shrouk ali', N'shrouk@gmail.com', N'198723', 2, 1, 1, 4)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (6, N'Sara ahmed', N'sara@gmail.com', N'123695', 7, 5, 6, 4)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (7, N'Mostafa Waled
', N'mostafa@gmail.com', N'125478', 1, 8, 4, 7)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (8, N'Karim Essam
', N'karim@gmail.com', N'366578', 3, 6, 8, 5)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (9, N'Waled Khalid
', N'waled@gmail.com', N'365478', 2, 5, 4, 4)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (10, N'Saly Tarek
', N'saly@gmail.com', N'32155', 5, 5, 5, 5)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (11, N'Nada Ahmed
', N'nada@gmail.com', N'95475', 6, 5, 4, 3)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (12, N'Marwa Helmy
', N'marwa@gmail.com', N'475622', 2, 5, 5, 4)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (13, N'Mai Bahaa
', N'mai@gmail.com', N'954752', 3, 3, 1, 1)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (14, N'Bassem Serag
', N'basem@gmail.com', N'362412', 7, 8, 7, 7)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (15, N'Manal Ali
', N'manal@gmail.com', N'456325', 6, 6, 2, 1)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (16, N'Menna Omar
', N'menna@gmail.com', N'654123', 5, 8, 1, 2)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (17, N'Abdelrahman Dyaa
', N'abdo@gmail.com', N'854236', 4, 6, 7, 1)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (20, N'yasser ali', N'yasserr@gmail.com', N'222311', 5, 6, 3, 1)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (21, N'Engy Mohamed
', N'engy@gmail.com', N'665412', 4, 6, 2, 4)
INSERT [dbo].[Students] ([Std_ID], [Std_name], [Std_email], [Std_password], [Intake_id], [barch_id], [track_id], [class_id]) VALUES (24, N'ali ahmed', N'alii@gmail.com', N'123624', 1, 1, 2, 1)



------------------------------------------------------------------------------------------------------

--  Insert data in table Tracks

INSERT [dbo].[Tracks] ([Track_ID], [Track_name], [Department_ID]) VALUES (1, N'web Development', 2)
INSERT [dbo].[Tracks] ([Track_ID], [Track_name], [Department_ID]) VALUES (2, N'Python', 1)
INSERT [dbo].[Tracks] ([Track_ID], [Track_name], [Department_ID]) VALUES (3, N'ASP .Net', 3)
INSERT [dbo].[Tracks] ([Track_ID], [Track_name], [Department_ID]) VALUES (4, N'Mern', 5)
INSERT [dbo].[Tracks] ([Track_ID], [Track_name], [Department_ID]) VALUES (5, N'PHP', 4)
INSERT [dbo].[Tracks] ([Track_ID], [Track_name], [Department_ID]) VALUES (6, N'Testing', 3)
INSERT [dbo].[Tracks] ([Track_ID], [Track_name], [Department_ID]) VALUES (7, N'Data Analysis', 1)
INSERT [dbo].[Tracks] ([Track_ID], [Track_name], [Department_ID]) VALUES (8, N'Software Engineering Fundamentals
', 6)
