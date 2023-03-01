SELECT
ProductName,
LEN(PRODUCTNAME)
FROM
DimProduct
ORDER BY LEN(PRODUCTNAME) DESC
--
SELECT
AVG(LEN(PRODUCTNAME))
FROM
DimProduct
ORDER BY AVG(LEN(PRODUCTNAME)) DESC
--
SELECT
REPLACE(REPLACE (ProductName,'WWI',''),'CONTOSO','')
FROM
DimProduct
--
SELECT
AVG(LEN(REPLACE(REPLACE (ProductName,'WWI',''),'CONTOSO','')))
FROM
DimProduct
--38
SELECT
REPLACE(REPLACE(
REPLACE(REPLACE(
REPLACE(REPLACE(
REPLACE(REPLACE(
REPLACE(REPLACE(StyleName,'9','J')
,'8','I')
,'7','H')
,'6','G')
,'5','F')
,'4','E')
,'3','D')
,'2','C')
,'1','B')
,'0','A')
FROM
DimProduct
--------
SELECT
SUBSTRING(EmailAddress,0,CHARINDEX('@',EmailAddress)) AS 'LOGIN',
UPPER(CONCAT(FirstName,DAY(BirthDate))) AS 'SENHA'
FROM
DimEmployee
--
SELECT
CONCAT(FirstName,' ',LastName) AS 'NOME COMPLETO',
EmailAddress,
SUBSTRING(EmailAddress,0,
CHARINDEX('@',EmailAddress)) AS 'LOGIN',
UPPER(CONCAT(FirstName,DAY(BirthDate))) AS 'SENHA'
FROM
DimEmployee
----------------------------------------------------------------
SELECT
FirstName,
DateFirstPurchase
FROM
DimCustomer
WHERE DateFirstPurchase
BETWEEN '2001-01-01' AND '2001-12-31'
----------------
SELECT
FirstName,
EmailAddress,
HireDate,
DAY(HIREDATE) AS 'DAY',
FORMAT(HIREDATE,'MMMM') AS 'MONTH',
YEAR(HIREDATE) AS 'YEAR'
FROM
DimEmployee
--------

DATEDIFF(DAY,OpenDate,GETDATE()) AS 'OPEN DAYS'
FROM
DimStore
WHERE CloseDate IS NULL
ORDER BY DATEDIFF(DAY,OpenDate,GETDATE()) DESC