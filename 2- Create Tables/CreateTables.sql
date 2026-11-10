-- Run this script connected to the database created by "1- Create Database"
-- (sqlcmd -d Examination, or pick Examination in the SSMS database list).
IF DB_ID() <= 4  -- master, tempdb, model, msdb
BEGIN
    RAISERROR(N'Connected to a system database. Connect to the Examination database first. (In SSMS, run SET NOEXEC OFF afterwards.)', 16, 1);
    SET NOEXEC ON;  -- skip the remaining batches in this session
END
GO

------------- Create Schemas -------------------------------------
-- The views and procedures live in these three schemas.
IF SCHEMA_ID(N'InstructorSC') IS NULL EXEC (N'CREATE SCHEMA [InstructorSC] AUTHORIZATION [dbo]');
IF SCHEMA_ID(N'MangerSC') IS NULL EXEC (N'CREATE SCHEMA [MangerSC] AUTHORIZATION [dbo]');
IF SCHEMA_ID(N'StudentSC') IS NULL EXEC (N'CREATE SCHEMA [StudentSC] AUTHORIZATION [dbo]');
GO

------------- Create Table Answer -------------------------------------
CREATE TABLE [dbo].[Answer](
	[Student_ID] [int] NOT NULL,
	[Exam_ID] [int] NOT NULL,
	[Question_ID] [int] NOT NULL,
	[Student_answer] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Student_Exam_Ques] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC,
	[Exam_ID] ASC,
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) 


GO

------------- Create Table Branchs -------------------------------------
CREATE TABLE [dbo].[Branchs](
	[Branch_ID] [int] IDENTITY(1,1) NOT NULL,
	[Branch_name] [nvarchar](50) NOT NULL,
	[Branch_address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Branchs] PRIMARY KEY CLUSTERED 
(
	[Branch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Secoundary]
) 


GO

------------- Create Table Class -------------------------------------
CREATE TABLE [dbo].[Class](
	[Class_ID] [int] IDENTITY(1,1) NOT NULL,
	[Class_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Class_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Fourth]
) 


GO

------------- Create Table Courses -------------------------------------
CREATE TABLE [dbo].[Courses](
	[C_ID] [int] IDENTITY(1,1) NOT NULL,
	[C_name] [nvarchar](50) NOT NULL,
	[C_minDegree] [int] NULL,
	[C_maxDegree] [INT] NULL,
	[C_Description] [nvarchar](150) NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[C_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) 


GO

------------- Create Table Deparments -------------------------------------
CREATE TABLE [dbo].[Department](
	[dept_ID] [int] IDENTITY(1,1) NOT NULL,
	[dept_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[dept_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
)


GO

------------- Create Table Exam -------------------------------------
CREATE TABLE [dbo].[Exam](
	[E_ID] [int] IDENTITY(1,1) NOT NULL,
	[E_startTime] [time](7) NOT NULL,
	[E_endTime] [time](7) NOT NULL,
	[E_type] [NVARCHAR](50) NOT NULL,
	[E_year] [int] NOT NULL,
	[E_allownce] [bit] NOT NULL,
	[Course_ID] [int] NOT NULL,
	[Instructor_ID] [int] NOT NULL,
	[Intake_ID] [int] NOT NULL,
	[Track_ID] [int] NOT NULL,
	[Branch_ID] [int] NOT NULL,
	[E_Date] [date] NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[E_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Fourth]
) 


GO

------------- Create Table Exam_Question -------------------------------------
CREATE TABLE [dbo].[Exam_Question](
	[Exam_ID] [int] NOT NULL,
	[Question_ID] [int] NOT NULL,
 CONSTRAINT [PK_Exam_Question] PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC,
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
)


GO

------------- Create Table Inst_teach_course -------------------------------------
CREATE TABLE [dbo].[Inst_teach_course](
	[course_ID] [int] NOT NULL,
	[Instructor_ID] [int] NOT NULL,
	[Class_ID] [int] NOT NULL,
	[year] [int] NOT NULL,
 CONSTRAINT [PK_Inst_teach_course] PRIMARY KEY CLUSTERED 
(
	[course_ID] ASC,
	[Instructor_ID] ASC,
	[Class_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) 


GO

------------- Create Table Instructors -------------------------------------
CREATE TABLE [dbo].[Instructors](
	[Inst_ID] [int] IDENTITY(1,1) NOT NULL,
	[Inst_name] [nvarchar](50) NOT NULL,
	[Inst_email] [nvarchar](50) NOT NULL,
	[Inst_password] [nvarchar](50) NOT NULL,
	[manager_id] [int] NULL,
 CONSTRAINT [PK_Instructors] PRIMARY KEY CLUSTERED 
(
	[Inst_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Third],
 CONSTRAINT [IX_Uniqe_Instructor_Email] UNIQUE NONCLUSTERED 
(
	[Inst_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) 



GO

------------- Create Table Intake -------------------------------------
CREATE TABLE [dbo].[Intake](
	[Intake_ID] [int] IDENTITY(1,1) NOT NULL,
	[Intake_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Intake] PRIMARY KEY CLUSTERED 
(
	[Intake_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Third]
) 



GO

------------- Create Table Intake_Branch -------------------------------------
CREATE TABLE [dbo].[Intake_Branch](
	[bran_ID] [int] NOT NULL,
	[intak_ID] [int] NOT NULL,
 CONSTRAINT [PK_Intake_Branch] PRIMARY KEY CLUSTERED 
(
	[bran_ID] ASC,
	[intak_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) 


GO

------------- Create Table Intake_Depart -------------------------------------
CREATE TABLE [dbo].[Intake_Depart](
	[Depart_ID] [int] NOT NULL,
	[Intake_id] [int] NOT NULL,
 CONSTRAINT [PK_Intake_Depart] PRIMARY KEY CLUSTERED 
(
	[Depart_ID] ASC,
	[Intake_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) 



GO

------------- Create Table Questions -------------------------------------
CREATE TABLE [dbo].[Questions](
	[Q_ID] [int] IDENTITY(1,1) NOT NULL,
	[Q_Text] [nvarchar](250) NOT NULL,
	[Q_correctAns] [nvarchar](200) NOT NULL,
	[Q_type] [nvarchar](50) NOT NULL,
	[Course_ID] [int] NOT NULL,
	[Q_Mark] [int] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[Q_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Third]
)



GO

------------- Create Table Student_Exam -------------------------------------
CREATE TABLE [dbo].[Student_Exam](
	[Student_ID] [int] NOT NULL,
	[Exam_ID] [int] NOT NULL,
	[Results] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Student_Exam] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC,
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) 



GO

------------- Create Table Students -------------------------------------
CREATE TABLE [dbo].[Students](
	[Std_ID] [int] IDENTITY(1,1) NOT NULL,
	[Std_name] [nvarchar](50) NOT NULL,
	[Std_email] [nvarchar](50) NOT NULL,
	[Std_password] [nvarchar](50) NOT NULL,
	[Intake_id] [int] NOT NULL,
	[barch_id] [int] NOT NULL,
	[track_id] [int] NOT NULL,
	[class_id] [int] NOT NULL,
 CONSTRAINT [PK_Students'] PRIMARY KEY CLUSTERED 
(
	[Std_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Secoundary],
 CONSTRAINT [IX_Students'] UNIQUE NONCLUSTERED 
(
	[Std_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) 



GO

------------- Create Table Tracks -------------------------------------
CREATE TABLE [dbo].[Tracks](
	[Track_ID] [int] IDENTITY(1,1) NOT NULL,
	[Track_name] [nvarchar](50) NOT NULL,
	[Department_ID] [int] NULL,
 CONSTRAINT [PK_Tracks] PRIMARY KEY CLUSTERED 
(
	[Track_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) 



GO

-------------------------------- Constraints ---------------------------------------------------

ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_Exam_Ques_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([E_ID])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Student_Exam_Ques_Exam]

ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_Exam_Ques_Questions] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Questions] ([Q_ID])

ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Student_Exam_Ques_Questions]

ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_Exam_Ques_Students] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Students] ([Std_ID])

ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Student_Exam_Ques_Students]

ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Branchs] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branchs] ([Branch_ID])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Branchs]

ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Courses] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Courses] ([C_ID])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Courses]

ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Instructors] FOREIGN KEY([Instructor_ID])
REFERENCES [dbo].[Instructors] ([Inst_ID])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Instructors]

ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Intake] FOREIGN KEY([Intake_ID])
REFERENCES [dbo].[Intake] ([Intake_ID])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Intake]

ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Tracks] FOREIGN KEY([Track_ID])
REFERENCES [dbo].[Tracks] ([Track_ID])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Tracks]

ALTER TABLE [dbo].[Exam_Question]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Question_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([E_ID])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[Exam_Question] CHECK CONSTRAINT [FK_Exam_Question_Exam]

ALTER TABLE [dbo].[Exam_Question]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Question_Questions] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Questions] ([Q_ID])

ALTER TABLE [dbo].[Exam_Question] CHECK CONSTRAINT [FK_Exam_Question_Questions]

ALTER TABLE [dbo].[Inst_teach_course]  WITH CHECK ADD  CONSTRAINT [FK_Inst_teach_couerse_Class] FOREIGN KEY([Class_ID])
REFERENCES [dbo].[Class] ([Class_ID])
ON UPDATE CASCADE

ALTER TABLE [dbo].[Inst_teach_course] CHECK CONSTRAINT [FK_Inst_teach_couerse_Class]

ALTER TABLE [dbo].[Inst_teach_course]  WITH CHECK ADD  CONSTRAINT [FK_Inst_teach_couerse_Courses] FOREIGN KEY([course_ID])
REFERENCES [dbo].[Courses] ([C_ID])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[Inst_teach_course] CHECK CONSTRAINT [FK_Inst_teach_couerse_Courses]

ALTER TABLE [dbo].[Inst_teach_course]  WITH CHECK ADD  CONSTRAINT [FK_Inst_teach_couerse_Instructors] FOREIGN KEY([Instructor_ID])
REFERENCES [dbo].[Instructors] ([Inst_ID])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[Inst_teach_course] CHECK CONSTRAINT [FK_Inst_teach_couerse_Instructors]

ALTER TABLE [dbo].[Instructors]  WITH CHECK ADD  CONSTRAINT [FK_Instructors_Instructors] FOREIGN KEY([manager_id])
REFERENCES [dbo].[Instructors] ([Inst_ID])

ALTER TABLE [dbo].[Instructors] CHECK CONSTRAINT [FK_Instructors_Instructors]

ALTER TABLE [dbo].[Intake_Branch]  WITH CHECK ADD  CONSTRAINT [FK_Intake_Branch_Branchs] FOREIGN KEY([bran_ID])
REFERENCES [dbo].[Branchs] ([Branch_ID])

ALTER TABLE [dbo].[Intake_Branch] CHECK CONSTRAINT [FK_Intake_Branch_Branchs]

ALTER TABLE [dbo].[Intake_Branch]  WITH CHECK ADD  CONSTRAINT [FK_Intake_Branch_Intake] FOREIGN KEY([intak_ID])
REFERENCES [dbo].[Intake] ([Intake_ID])

ALTER TABLE [dbo].[Intake_Branch] CHECK CONSTRAINT [FK_Intake_Branch_Intake]

ALTER TABLE [dbo].[Intake_Depart]  WITH CHECK ADD  CONSTRAINT [FK_Intake_Depart_Department] FOREIGN KEY([Depart_ID])
REFERENCES [dbo].[Department] ([dept_ID])

ALTER TABLE [dbo].[Intake_Depart] CHECK CONSTRAINT [FK_Intake_Depart_Department]

ALTER TABLE [dbo].[Intake_Depart]  WITH CHECK ADD  CONSTRAINT [FK_Intake_Depart_Intake] FOREIGN KEY([Intake_id])
REFERENCES [dbo].[Intake] ([Intake_ID])

ALTER TABLE [dbo].[Intake_Depart] CHECK CONSTRAINT [FK_Intake_Depart_Intake]

ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Courses] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Courses] ([C_ID])

ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Courses]

ALTER TABLE [dbo].[Student_Exam]  WITH CHECK ADD  CONSTRAINT [FK_Student_Exam_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([E_ID])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[Student_Exam] CHECK CONSTRAINT [FK_Student_Exam_Exam]

ALTER TABLE [dbo].[Student_Exam]  WITH CHECK ADD  CONSTRAINT [FK_Student_Exam_Students] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Students] ([Std_ID])

ALTER TABLE [dbo].[Student_Exam] CHECK CONSTRAINT [FK_Student_Exam_Students]

ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students'_Branchs] FOREIGN KEY([barch_id])
REFERENCES [dbo].[Branchs] ([Branch_ID])

ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students'_Branchs]

ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students'_Class] FOREIGN KEY([class_id])
REFERENCES [dbo].[Class] ([Class_ID])

ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students'_Class]

ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students'_Intake] FOREIGN KEY([Intake_id])
REFERENCES [dbo].[Intake] ([Intake_ID])

ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students'_Intake]

ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students'_Tracks] FOREIGN KEY([track_id])
REFERENCES [dbo].[Tracks] ([Track_ID])

ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students'_Tracks]

ALTER TABLE [dbo].[Tracks]  WITH CHECK ADD  CONSTRAINT [FK_Tracks_Department] FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Department] ([dept_ID])

ALTER TABLE [dbo].[Tracks] CHECK CONSTRAINT [FK_Tracks_Department]

ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [Course_check_maxDegree] CHECK  (([C_maxDegree]>=(51) AND [C_maxDegree]<=(100)))

ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [Course_check_maxDegree]

ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [Course_check_minDegree] CHECK  (([C_minDegree]>=(10) AND [C_minDegree]<=(50)))

ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [Course_check_minDegree]

ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [Exam_check_date] CHECK  ((CONVERT([date],[E_date])>=getdate()))

ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [Exam_check_date]

ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [Exam_check_end] CHECK  (([E_endTime]<>[E_startTime] AND [E_endTime]>[E_startTime]))

ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [Exam_check_end]

ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [Exam_check_start] CHECK  (([E_startTime]<>[E_endTime] AND [E_startTime]<[E_endTime]))

ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [Exam_check_start]

ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [Exam_check_Type] CHECK  (([E_type]='Normal' OR [E_type]='Corrective'))

ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [Exam_check_Type]

ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [Question_check_Type] CHECK  (([Q_type]='MCQ' OR [Q_type]='T/F' OR [Q_type]='Written'))

ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [Question_check_Type]

ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [Questions_Defult_Mark] CHECK  (([Q_Mark]>=(1)))

ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [Questions_Defult_Mark]
GO
