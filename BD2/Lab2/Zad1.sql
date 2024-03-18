--ZAD 1

USE AdventureWorks2019
GO

--a)

SELECT *
FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY LastName) AS RowNumber,
    FirstName, LastName
    FROM Person.Person
) AS SubQuery
WHERE RowNumber > 51 AND RowNumber < 100;

--operator WHERE RowNumber > 51 AND RowNumber < 100 wypisze wszystkie wiersze w ktorych wartosc RowNumber (czyli pozycja wiersza w wyniku zapytania) zawiera sie pomiedzy 51 a 100.
--Zrealizowac w ten sposob mozna stronicowanie, czyli podzial wyniku na strony/karty, mniejszy podzbior, wybieramy ten podzbior w ktorym numer wiersza zawiera sie pomiedzy 51 a 100.

--b)

--I

CREATE TABLE #Temp (
	RowNumber INT,
	FirstName VARCHAR(50),
  LastName VARCHAR(50)
);

INSERT INTO #Temp(RowNumber, FirstName, LastName)
SELECT ROW_NUMBER() OVER (ORDER BY LastName) AS RowNumber,
       FirstName, LastName
FROM Person.Person;

SELECT * FROM 
#Temp
WHERE RowNumber > 51 AND RowNumber < 100;

--II

WITH CTEtemp
AS
(
	SELECT ROW_NUMBER() OVER (ORDER BY LastName) AS RowNumber,
    FirstName, LastName
	FROM Person.Person
)
SELECT * FROM CTEtemp
WHERE RowNumber > 51 AND RowNumber < 100;