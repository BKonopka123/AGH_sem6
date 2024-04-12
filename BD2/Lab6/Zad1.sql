USE master;
IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'Lab6user')
BEGIN
    DROP LOGIN Lab6user;
END
GO

USE master;
CREATE LOGIN Lab6user WITH PASSWORD = 'Haslo123';
GO

USE master;
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Lab6db')
BEGIN
    ALTER DATABASE Lab6db SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Lab6db;
END
GO

USE master;
CREATE DATABASE Lab6db;
GO

CREATE USER Lab6user FOR LOGIN Lab6user;

EXEC sp_addrolemember 'db_owner', 'Lab6user'
GO