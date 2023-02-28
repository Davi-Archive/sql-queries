SELECT TOP(30)
    DimProduct.ProductName,
    FactSales.UnitCost
FROM FactSales
LEFT JOIN
    DimProduct
ON
    FactSales.ProductKey = DimProduct.ProductKey


    -- RIGHT
SELECT TOP(30)
DimProduct.ProductName,
FactSales.UnitCost
FROM FactSales
RIGHT JOIN
DimProduct
ON
FactSales.ProductKey = DimProduct.ProductKey

-- INNER JOIN

SELECT TOP(30)
DimProduct.ProductName,
FactSales.UnitCost
FROM FactSales
INNER JOIN
DimProduct
ON
FactSales.ProductKey = DimProduct.ProductKey

---
SELECT
P.ProductKey,
P.ProductName,
C.ProductCategoryName
FROM DimProduct AS P
INNER JOIN
DimProductCategory AS C
ON
P.ProductSubcategoryKey = C.ProductCategoryKey

--
SELECT
P.ProductKey,
P.ProductName,
C.ProductCategoryName
FROM DimProduct AS P
RIGHT JOIN
DimProductCategory AS C
ON
P.ProductSubcategoryKey = C.ProductCategoryKey

--  CROSSJOIN
SELECT
*
FROM
MARCAS AS M
CROSSJOIN SUBCATEGORIA
--
