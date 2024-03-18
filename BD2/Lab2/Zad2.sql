--ZAD 2

USE AdventureWorks2019
GO

SELECT SP.StateProvinceCode, A.City, COUNT(V.BusinessEntityID) AS NumberOfVendors FROM
Person.StateProvince AS SP
INNER JOIN
Person.Address AS A ON SP.StateProvinceID = A.StateProvinceID
INNER JOIN
Person.BusinessEntityAddress AS BEA ON BEA.AddressID = A.AddressID
INNER JOIN
Person.BusinessEntity AS BE ON BE.BusinessEntityID = BEA.BusinessEntityID
INNER JOIN 
Purchasing.Vendor AS V ON V.BusinessEntityID = BE.BusinessEntityID
GROUP BY GROUPING SETS( 
	(SP.StateProvinceCode, A.City),
	(SP.StateProvinceCode),
	(A.City),
	()
)
ORDER BY SP.StateProvinceCode, A.City
;