

--Training Manager Account--

CREATE LOGIN manager
WITH PASSWORD = '$(LoginPassword)' ,
DEFAULT_DATABASE = [Examination]
GO

Use [Examination]
CREATE USER manager 
FOR LOGIN manager
GO


-----------------------------------------------------------
--  Instructor Account  --
CREATE LOGIN instructor
WITH PASSWORD = '$(LoginPassword)' ,
DEFAULT_DATABASE = [Examination]
GO

Use [Examination]
CREATE USER instructor 
FOR LOGIN instructor
GO


--------------------------------------------------------------
--  Student Account  --
CREATE LOGIN student
WITH PASSWORD = '$(LoginPassword)' ,
DEFAULT_DATABASE = [Examination]
GO

Use [Examination]
CREATE USER student 
FOR LOGIN student
GO