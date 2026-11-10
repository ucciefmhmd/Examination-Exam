-- Run in SQLCMD mode and supply the passwords, for example:
--   sqlcmd -S . -i Accounts.sql -v ManagerPassword="..." InstructorPassword="..." StudentPassword="..."
-- (In SSMS: Query > SQLCMD Mode, then add  :setvar ManagerPassword "..."  lines at the top.)


--Training Manager Account--

CREATE LOGIN manager
WITH PASSWORD = '$(ManagerPassword)' ,
DEFAULT_DATABASE = [Examination]
GO

Use [Examination]
CREATE USER manager 
FOR LOGIN manager
GO


-----------------------------------------------------------
--  Instructor Account  --
CREATE LOGIN instructor
WITH PASSWORD = '$(InstructorPassword)' ,
DEFAULT_DATABASE = [Examination]
GO

Use [Examination]
CREATE USER instructor 
FOR LOGIN instructor
GO


--------------------------------------------------------------
--  Student Account  --
CREATE LOGIN student
WITH PASSWORD = '$(StudentPassword)' ,
DEFAULT_DATABASE = [Examination]
GO

Use [Examination]
CREATE USER student 
FOR LOGIN student
GO