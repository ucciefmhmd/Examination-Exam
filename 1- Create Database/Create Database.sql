
------------------------- Create Database [Examination]
-- Run this script while connected to master.
--
-- It creates the database with the same filegroups as the original design
-- (PRIMARY, Fourth, Secoundary, Third). The files go into the server's
-- default data folder instead of a hard-coded SQL Server Express path, so the
-- script works on any instance (Express, Developer, LocalDB).
--
-- The database is named [Examination]. To build a copy under another name
-- (for example a throwaway test database), run this first in the same session:
--     EXEC sys.sp_set_session_context @key = N'DatabaseName', @value = N'OtherName';
-- and then run the remaining scripts connected to that database.

SET NOCOUNT ON;

DECLARE @DatabaseName sysname =
    COALESCE(CONVERT(sysname, SESSION_CONTEXT(N'DatabaseName')), N'Examination');

IF DB_ID(@DatabaseName) IS NOT NULL
BEGIN
    DECLARE @msg nvarchar(400) = N'Database ' + QUOTENAME(@DatabaseName) + N' already exists. Drop it first to rebuild from empty.';
    THROW 50000, @msg, 1;
END;

DECLARE @db nvarchar(300) = QUOTENAME(@DatabaseName);
DECLARE @sql nvarchar(max) = N'CREATE DATABASE ' + @db + N' CONTAINMENT = NONE;';
EXEC (@sql);

-- Put the filegroup files next to the primary data file.
DECLARE @DataFolder nvarchar(260);
SELECT @DataFolder = LEFT(physical_name, LEN(physical_name) - CHARINDEX(N'\', REVERSE(physical_name)) + 1)
FROM sys.master_files
WHERE database_id = DB_ID(@DatabaseName) AND file_id = 1;

DECLARE @prefix nvarchar(600) = REPLACE(@DataFolder + @DatabaseName, N'''', N'''''');

SET @sql = N'
ALTER DATABASE ' + @db + N' ADD FILEGROUP [Fourth];
ALTER DATABASE ' + @db + N' ADD FILEGROUP [Secoundary];
ALTER DATABASE ' + @db + N' ADD FILEGROUP [Third];
ALTER DATABASE ' + @db + N' ADD FILE (NAME = N''ExamGroup'', FILENAME = N''' + @prefix + N'_ExamGroup.ndf'', SIZE = 8192KB, MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB) TO FILEGROUP [Fourth];
ALTER DATABASE ' + @db + N' ADD FILE (NAME = N''studentGroup'', FILENAME = N''' + @prefix + N'_studentGroup.ndf'', SIZE = 8192KB, MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB) TO FILEGROUP [Secoundary];
ALTER DATABASE ' + @db + N' ADD FILE (NAME = N''InstructorGroup'', FILENAME = N''' + @prefix + N'_InstructorGroup.ndf'', SIZE = 8192KB, MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB) TO FILEGROUP [Third];';
EXEC (@sql);

PRINT N'Database ' + @db + N' created.';
GO
