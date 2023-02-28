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

--
--
SELECT TOP(100)
P.StrategyPlanKey,
P.Datekey,
S.ScenarioName,
P.Amount
FROM
FactStrategyPlan AS P
INNER JOIN
DimAccount AS A
ON
P.AccountKey = A.AccountKey
INNER JOIN DimScenario AS S
ON
S.ScenarioKey = S.ScenarioKey
--
--
SELECT
P.ProductName,
S.ProductSubcategoryName
FROM
DimProduct AS P
FULL JOIN
DimProductSubcategory AS S
ON
P.ProductSubcategoryKey=S.ProductSubcategoryKey
WHERE P.ProductSubcategoryKey IS NULL
--
--
SELECT
DISTINCT P.BrandName,
C.ChannelName
FROM
FactSales AS F
INNER JOIN
DimProduct AS P
ON
F.ProductKey = P.ProductKey
INNER JOIN
DimChannel AS C
ON
F.channelKey = C.ChannelKey
WHERE P.BrandName IN ('CONTOSO','FABRIKAM','LITWARE')
--
--
SELECT TOP (100)
F.SalesKey,
F.DateKey,
P.PromotionName,
F.SalesAmount
FROM
FactSales AS F
INNER JOIN
DimPromotion AS P
ON
F.PromotionKey = P.PromotionKey
WHERE P.PromotionType != 'NO DISCOUNT'
ORDER BY F.DateKey
--
--
SELECT TOP(100)
SalesKey,
ChannelName,
StoreName,
ProductName,
SalesAmount
FROM
FactSales AS F
INNER JOIN
DimChannel AS C
ON F.channelKey = C.ChannelKey
INNER JOIN
DimStore AS S
ON F.StoreKey = S.StoreKey
INNER JOIN
DimProduct AS P
ON F.ProductKey = P.ProductKey
ORDER BY SalesAmount DESC
--
--
