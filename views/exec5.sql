CREATE VIEW VWPRODUTOS
AS
SELECT
ProductName,
ColorName,
UnitPrice,
UnitCost
FROM
DimProduct

SELECT * FROM VWPRODUTOS
----
----
CREATE VIEW VWEMPLOYEE AS
SELECT
FirstName,
BirthDate,
DepartmentName
FROM
DimEmployee
----
----
CREATE VIEW VWLOJAS AS
SELECT
StoreKey,
StoreName,
OpenDate
FROM
DimStore
---
---
CREATE VIEW VWCLIENTES
AS
SELECT
CONCAT(FirstName,' ',LastName) AS 'NOME COMPLETO',
CASE
	WHEN GENDER = 'M' THEN 'MASCULINO'
	WHEN GENDER = 'F' THEN 'FEMININO'
	ELSE 'EMPRESA'
END AS 'GÊNERO',
EmailAddress,
'R$ ' + FORMAT(YearlyIncome,'N')
FROM
DimCustomer
----
----
