SELECT
ProductName,
ClassName,
CASE
WHEN ClassName = 'ECONOMY' THEN UnitCost*0.95
WHEN ClassName = 'REGULAR' THEN UnitCost*0.93
WHEN ClassName = 'DELUXE'THEN UnitCosT*0.91
END AS 'DESCONTO',
CASE
WHEN ClassName = 'ECONOMY' THEN '5%'
WHEN ClassName = 'REGULAR' THEN '7%'
WHEN ClassName = 'DELUXE'THEN '9%'
END
FROM
DimProduct
-----
SELECT
BrandName,
CASE
WHEN COUNT(*) >500 THEN 'CATEGORIA A'
WHEN COUNT(*) >= 100 AND COUNT(*) <= 500 THEN 'CATEGORIA B'
ELSE 'CATEGORIA C'
END
FROM
DimProduct
GROUP BY BrandName
----
SELECT
StoreName,
EMPLOYEECOUNT,
CASE
WHEN EmployeeCount >= 50 THEN 'Acima de 50 funcionários'
WHEN EmployeeCount >= 40 THEN 'Entre 40 e 50 funcionários'
WHEN EmployeeCount >= 30 THEN 'Entre 30 e 40 funcionários'
WHEN EmployeeCount >= 20 THEN 'Entre 20 e 30 funcionários'
WHEN EmployeeCount >= 40 THEN 'Entre 10 e 20 funcionários'
ELSE 'Abaixo de 10 funcionários'
END
FROM
DimStore
----
SELECT
ProductSubcategoryName,
SUM(Weight) AS 'PESO TOTAL',
CASE
	WHEN SUM(WEIGHT) < 1000 THEN 'ROTA 1'
	WHEN SUM(WEIGHT)>= 1000 THEN 'ROTA 2'
	WHEN SUM(Weight) IS NULL THEN 'VIRTUAL'
END AS 'ROTA'
FROM
DimProduct AS D
INNER JOIN
DimProductSubcategory AS S
ON
D.ProductSubcategoryKey = S.ProductSubcategoryKey
GROUP BY ProductSubcategoryName
ORDER BY SUM(Weight) DESC
---
SELECT
FirstName,
GENDER,
TOTALCHILDREN,
EMAILADDRESS,
CASE
WHEN TOTALCHILDREN > 0 AND GENDER = 'F' THEN 'MÃE DO ANO'
WHEN TOTALCHILDREN > 0 AND GENDER = 'M' THEN 'PAI DO ANO'
WHEN TotalChildren = 0 THEN 'CAMINHÃO DE PRÊMIOS'
END AS 'PROMOÇÃO'
FROM
DimCustomer

