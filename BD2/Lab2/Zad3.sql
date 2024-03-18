--ZAD 3

USE AdventureWorks2019;
GO

--a

SELECT 
    CASE 
        WHEN RowNumber > 51 AND RowNumber < 100 THEN RowNumber 
        ELSE NULL 
    END AS RowNumber,
    FirstName, 
    LastName
FROM (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY LastName) AS RowNumber,
        FirstName, 
        LastName
    FROM Person.Person
) AS SubQuery
WHERE 
    (RowNumber > 51 AND RowNumber < 100) OR RowNumber IS NULL;

-- b

USE tempdb;
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pomiary]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Pomiary](
        [Godzina] [int] NULL,
        [Minuta] [int] NULL,
        [CO2] [float] NULL,
        [IloœæPojazdów] [int] NULL
    )
END
GO

INSERT INTO Pomiary (Godzina, Minuta, CO2, IloœæPojazdów)
VALUES
    (9, 0, 20.5, 15),
    (9, 15, 22.2, 18),
    (10, 0, 21.3, 17),
    (10, 15, 25.1, 20),
    (11, 0, 24.8, 22),
    (11, 15, 28.3, 25);

SELECT 
    *
FROM (
    SELECT 
        Godzina,
        CO2,
        IloœæPojazdów
    FROM Pomiary
) AS PivotData
PIVOT (
    MIN(CO2)
    FOR Godzina IN ([9], [10], [11])
) PivotTable_min_co2;

SELECT 
    *
FROM (
    SELECT 
        Godzina,
        CO2,
        IloœæPojazdów
    FROM Pomiary
) AS PivotData
PIVOT (
    MAX(CO2)
    FOR Godzina IN ([9], [10], [11])
) PivotTable_max_co2;


SELECT 
    *
FROM (
    SELECT 
        Godzina,
        CO2,
        IloœæPojazdów
    FROM Pomiary
) AS PivotData
PIVOT (
    SUM(CO2)
    FOR Godzina IN ([9], [10], [11])
) PivotTable_sum_co2;


SELECT 
    *
FROM (
    SELECT 
        Godzina,
        CO2,
        IloœæPojazdów
    FROM Pomiary
) AS PivotData
PIVOT (
    MIN(IloœæPojazdów)
    FOR Godzina IN ([9], [10], [11])
) PivotTable_min_IloscPojazdow;


SELECT 
    *
FROM (
    SELECT 
        Godzina,
        CO2,
        IloœæPojazdów
    FROM Pomiary
) AS PivotData
PIVOT (
    MAX(IloœæPojazdów)
    FOR Godzina IN ([9], [10], [11])
) PivotTable_max_IloscPojazdow;


SELECT 
    *
FROM (
    SELECT 
        Godzina,
        CO2,
        IloœæPojazdów
    FROM Pomiary
) AS PivotData
PIVOT (
    SUM(IloœæPojazdów)
    FOR Godzina IN ([9], [10], [11])
) PivotTable_sum_IloscPojazdow;
