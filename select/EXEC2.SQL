SELECT TOP(100)
ChannelName,
SUM(SalesQuantity)
FROM
FactSales AS F
INNER JOIN DimChannel AS C
ON F.channelKey = C.ChannelKey
GROUP BY ChannelName
ORDER BY SUM(SALESQUANTITY) DESC
--
--
SELECT TOP(100)
D.CalendarYear,
SUM(SalesAmount)
FROM
FactSales AS F
INNER JOIN DimDate AS D
ON F.DateKey = D.Datekey
GROUP BY CalendarYear
--
--
SELECT
ColorName,
SUM(SALESAMOUNT) AS 'AMOUNT',
SUM(SALESQUANTITY) AS 'QUANT'
FROM
FactSales AS F
INNER JOIN DimProduct AS P
ON F.ProductKey = P.ProductKey
GROUP BY ColorName
HAVING SUM(SALESAMOUNT) >= 3000000
ORDER BY SUM(SalesQuantity) DESC
--
--
SELECT
SUM(SALESQUANTITY) AS 'QUANT',
PRODUCTCATEGORYNAME
FROM FactSales AS F
INNER JOIN DimProduct AS P
ON F.ProductKey = P.ProductKey
INNER JOIN DimProductSubcategory AS S
ON P.ProductSubcategoryKey = S.ProductSubcategoryKey
INNER JOIN DimProductCategory AS C
ON S.ProductCategoryKey = C.ProductCategoryKey
GROUP BY ProductCategoryName
ORDER BY SUM(SalesQuantity) DESC
--
--
SELECT
DISTINCT FIRSTNAME,
SUM(SALESQUANTITY) AS 'SALES'
FROM
FactOnlineSales AS O
INNER JOIN DimCustomer AS C
ON O.CustomerKey = C.CustomerKey
WHERE FirstName IS NOT NULL
GROUP BY FirstName
ORDER BY SUM(SalesQuantity) DESC
--
--
SELECT TOP 10
ProductName,
SUM(SALESQUANTITY) AS 'SALES'
FROM
FactOnlineSales AS O
INNER JOIN DimCustomer AS C
ON O.CustomerKey = C.CustomerKey
INNER JOIN DimProduct AS P
ON O.ProductKey = P.ProductKey
WHERE FirstName = 'SETH'
GROUP BY ProductName
ORDER BY SUM(SalesQuantity) DESC
--
--
SELECT
GENDER,
SUM(SALESQUANTITY)
FROM
FactOnlineSales AS O
INNER JOIN DimCustomer AS C
ON O.CustomerKey = C.CustomerKey
WHERE GENDER IS NOT NULL
GROUP BY GENDER
--
--
SELECT
CurrencyDescription,
AVG(AverageRate)
FROM FactExchangeRate AS R
INNER JOIN DimCurrency AS C
ON R.CurrencyKey = C.CurrencyKey
GROUP BY CurrencyDescription
HAVING SUM(AverageRate) >= 10 AND SUM(AverageRate) <= 100
ORDER BY SUM(AVERAGERATE) DESC
--
--
SELECT
ScenarioName,
SUM(AMOUNT)
FROM
FactStrategyPlan AS P
INNER JOIN DimScenario AS S
ON P.ScenarioKey = S.ScenarioKey
WHERE ScenarioName IN ('ACTUAL','BUDGET')
GROUP BY ScenarioName
--
--
SELECT
D.CalendarYear,
SUM(AMOUNT)
FROM
FactStrategyPlan AS F
INNER JOIN DimDate AS D
ON F.Datekey = D.Datekey
GROUP BY D.CalendarYear
--
--
SELECT
DISTINCT ProductSubcategoryName,
COUNT(ProductName) AS 'QTD'
FROM DimProduct AS P
INNER JOIN DimProductSubcategory AS S
ON P.ProductSubcategoryKey = S.ProductSubcategoryKey
WHERE BrandName = 'CONTOSO' AND
ColorName = 'SILVER'
GROUP BY ProductSubcategoryName
ORDER BY COUNT(PRODUCTNAME) DESC
--
--
SELECT
BrandName,
ProductSubcategoryName,
count(*)
FROM DimProduct AS P
INNER JOIN DimProductSubcategory AS S
ON P.ProductSubcategoryKey = S.ProductSubcategoryKey
GROUP BY BrandName,ProductSubcategoryName
ORDER BY BrandName
