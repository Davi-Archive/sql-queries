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
---
---
SELECT
CustomerKey,
FirstName,
LastName,
EmailAddress,
YearlyIncome,
(SELECT AVG(YearlyIncome) FROM DimCustomer)
FROM
DimCustomer
WHERE YearlyIncome > (
SELECT AVG(YearlyIncome) FROM DimCustomer)
---
---
SELECT
*
FROM
DimCustomer
WHERE CustomerKey IN (SELECT
	CustomerKey
	FROM
	FactOnlineSales
	WHERE PromotionKey IN (
		SELECT PromotionKey FROM DimPromotion
		WHERE PromotionName = 'Asian Holiday Promotion'
		)
	)
--
--
SELECT
CompanyName
FROM
DimCustomer
WHERE CustomerKey IN (SELECT
CustomerKey
FROM
FactOnlineSales
GROUP BY CustomerKey
HAVING COUNT(*) >= 3000
)
--
--
SELECT
	ProductKey,
	ProductName,
	BrandName,
	UnitPrice,
	(SELECT AVG(UNITPRICE) FROM DimProduct) AS 'MÉDIA'
	FROM
	DimProduct
