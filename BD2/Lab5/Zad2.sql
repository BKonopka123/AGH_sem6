-- Zad 2

CREATE LOGIN [WINSERV01\grupa3] FROM WINDOWS;
CREATE LOGIN [WINSERV01\tester6] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english];
CREATE LOGIN [WINSERV01\tester7] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english];
GO

USE master;
CREATE USER grupa3 FOR LOGIN [WINSERV01\grupa3];
CREATE USER tester6 FOR LOGIN [WINSERV01\tester6];
CREATE USER tester7 FOR LOGIN [WINSERV01\tester7];
GO

USE master;
EXEC sp_addsrvrolemember 'WINSERV01\grupa3', 'dbcreator';
EXEC sp_addsrvrolemember 'WINSERV01\grupa3', 'serveradmin';
EXEC sp_addsrvrolemember 'WINSERV01\tester6', 'dbcreator';
EXEC sp_addsrvrolemember 'WINSERV01\tester6', 'serveradmin';
EXEC sp_addsrvrolemember 'WINSERV01\tester7', 'dbcreator';
EXEC sp_addsrvrolemember 'WINSERV01\tester7', 'serveradmin';
GO

SELECT * FROM sys.server_role_members;
SELECT * FROM sys.server_principals;
SELECT IS_SRVROLEMEMBER('dbcreator', 'WINSERV01\tester6');

USE master;
EXEC sp_revokelogin 'WINSERV01\tester6'
EXEC sp_revokelogin 'WINSERV01\tester7'
EXEC sp_revokelogin 'WINSERV01\grupa3'

--Testy
CREATE DATABASE TestDatabase;

USE TestDatabase;
SELECT 'Hello, world!' AS Message;

--Uzytkownicy tester6 i tester7 poprzez dodanie uprawnien dbcreator i serveradmin maja mzliwosc tworzenia i zarzadzania baza danych.