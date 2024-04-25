USE MASTER
DROP DATABASE testCLR;
CREATE DATABASE testCLR;
GO

USE testCLR
GO

EXEC sp_configure 'show advanced options', 1
RECONFIGURE;

EXEC sp_configure 'clr strict security', 0;
RECONFIGURE;

CREATE ASSEMBLY lab7Assembly 
	FROM 'C:\Users\Administrator\source\repos\Lab7\Lab7\Lab7.dll'

