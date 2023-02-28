SELECT
D.ProductName,
S.ProductSubcategoryName
FROM
DimProduct AS D
INNER JOIN
DimProductSubcategory AS S
ON D.ProductSubcategoryKey = S.ProductSubcategoryKey

--
SELECT
*
FROM
DimProductSubcategory AS S
LEFT JOIN
DimProductCategory AS C
ON S.ProductCategoryKey = C.ProductCategoryKey
--
SELECT
S.StoreKey,
S.StoreName,
S.EmployeeCount,
D.ContinentName,
D.RegionCountryName
FROM
DimStore AS S
LEFT JOIN
DimGeography AS D
ON S.GeographyKey = D.GeographyKey
--
SELECT
P.ProductName,
F.ProductCategoryDescription,
C.ProductSubcategoryName
FROM
DimProduct AS P
LEFT JOIN
DimProductSubcategory AS C
ON
P.ProductSubcategoryKey = C.ProductSubcategoryKey
LEFT JOIN
DimProductCategory AS F
ON
C.ProductCategoryKey = F.ProductCategoryKey

--
--
SELECT TOP(100)
P.StrategyPlanKey,
P.Datekey,
A.AccountName,
P.Amount
FROM
FactStrategyPlan AS P
INNER JOIN
DimAccount AS A
ON
P.AccountKey = A.AccountKey