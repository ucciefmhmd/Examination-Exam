-- Run in SQLCMD mode, connected to the Examination database, and supply the passwords, for example:
--   sqlcmd -S . -d Examination -I -b -i "9- Accounts/Accounts.sql" -v ManagerPassword="..." InstructorPassword="..." StudentPassword="..."
-- (In SSMS: Query > SQLCMD Mode, then add  :setvar ManagerPassword "..."  lines at the top.)
--
-- Each login is created only if it doesn't exist yet (an existing login keeps its password),
-- and its default database is the database this script runs in.
-- Each database user is created only if it doesn't exist yet.

IF DB_ID() <= 4  -- master, tempdb, model, msdb
BEGIN
    RAISERROR(N'Connected to a system database. Connect to the Examination database first. (In SSMS, run SET NOEXEC OFF afterwards.)', 16, 1);
    SET NOEXEC ON;  -- skip the remaining batches in this session
END
GO

DECLARE @SetDefaultDb nvarchar(max);

--Training Manager Account--

IF SUSER_ID(N'manager') IS NULL
BEGIN
    CREATE LOGIN manager
    WITH PASSWORD = '$(ManagerPassword)';

    SET @SetDefaultDb = N'ALTER LOGIN [manager] WITH DEFAULT_DATABASE = ' + QUOTENAME(DB_NAME());
    EXEC (@SetDefaultDb);
END;

IF DATABASE_PRINCIPAL_ID(N'manager') IS NULL
    CREATE USER manager
    FOR LOGIN manager;


-----------------------------------------------------------
--  Instructor Account  --

IF SUSER_ID(N'instructor') IS NULL
BEGIN
    CREATE LOGIN instructor
    WITH PASSWORD = '$(InstructorPassword)';

    SET @SetDefaultDb = N'ALTER LOGIN [instructor] WITH DEFAULT_DATABASE = ' + QUOTENAME(DB_NAME());
    EXEC (@SetDefaultDb);
END;

IF DATABASE_PRINCIPAL_ID(N'instructor') IS NULL
    CREATE USER instructor
    FOR LOGIN instructor;


--------------------------------------------------------------
--  Student Account  --

IF SUSER_ID(N'student') IS NULL
BEGIN
    CREATE LOGIN student
    WITH PASSWORD = '$(StudentPassword)';

    SET @SetDefaultDb = N'ALTER LOGIN [student] WITH DEFAULT_DATABASE = ' + QUOTENAME(DB_NAME());
    EXEC (@SetDefaultDb);
END;

IF DATABASE_PRINCIPAL_ID(N'student') IS NULL
    CREATE USER student
    FOR LOGIN student;
GO
