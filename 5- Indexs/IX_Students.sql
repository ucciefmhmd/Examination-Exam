USE [Examination]
GO

-- NONCLUSTERED index on Student Name in Students Entity to get best performance 
CREATE NONCLUSTERED INDEX [IX_Students] 
ON [dbo].[Students] ([Std_name] )


