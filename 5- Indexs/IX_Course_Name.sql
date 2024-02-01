USE [Examination]
GO

-- NONCLUSTERED index on Course Name in Course Entity to get best performance 
CREATE INDEX [IX_Course_Name] 
	
	ON [dbo].[Courses] ([C_name] )


