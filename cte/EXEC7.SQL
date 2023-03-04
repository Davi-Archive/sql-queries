SELECT
*
FROM
FactSales
WHERE STOREKEY =
(SELECT StoreKey
FROM DimStore
WHERE StoreName = 'CONTOSO ORLANDO STORE')
---
---
SELECT
ProductKey,
ProductName,
UnitPrice,
(SELECT UnitPrice
FROM DimProduct
WHERE ProductKey = '1893')
FROM
DimProduct
WHERE UnitPrice >
(SELECT UnitPrice
FROM DimProduct
WHERE ProductKey = '1893')
--
--
SELECT
CONCAT(FirstName,' ',LastName) AS 'NAME'
FROM
DimEmployee
WHERE DepartmentName = (
SELECT DepartmentName FROM
DimEmployee WHERE
FIRSTNAME = 'MIGUEL'
AND LastName= 'SEVERINO'
)