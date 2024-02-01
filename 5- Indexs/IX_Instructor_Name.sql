USE [Examination]
GO


-- NONCLUSTERED index on Instructor Name in Instructors Entity to get best performance 

CREATE INDEX [IX_Instructor_Name] 
	ON [dbo].[Instructors] ([Inst_name] )

