SELECT
DepartmentName,
YEAR(HireDate) as ano,
COUNT(EmployeeKey) AS TOTAL_FUNCIONARIOS
FROM
DimEmployee
GROUP BY DepartmentName, YEAR(HireDate)
---
---
SELECT DISTINCT
	QUOTENAME(TRIM(DEPARTMENTNAME))
FROM DIMEMPLOYEE

---
----
SELECT
*
FROM
	(SELECT
		EMPLOYEEKEY,
		YEAR(HIREDATE) AS ANO,
		DEPARTMENTNAME
	FROM DimEmployee
PIVOT(
COUNT(EMPLOYEEKEY)
FOR DEPARTMENTNAME
IN([Document Control],
[Engineering],
[Executive],
[Facilities and Maintenance],
[Finance],
[Human Resources Contral],
[Human Resources],
[Information Services],
[Marketing],
[Production Control],
[Production],
[Purchasing],
[Quality Assurance],
[Research and Development],
[Sales],
[Shipping and Receiving],
[Tool Design])
----
----
SELECT
*
FROM
	(SELECT
		EMPLOYEEKEY,
		YEAR(HIREDATE) AS ANO,
		DEPARTMENTNAME
	FROM DimEmployee
PIVOT(
COUNT(EMPLOYEEKEY)
FOR DEPARTMENTNAME
IN([Document Control],
[Engineering],
[Executive],
[Facilities and Maintenance],
[Finance],
[Human Resources Contral],
[Human Resources],
[Information Services],
[Marketing],
[Production Control],
[Production],
[Purchasing],
[Quality Assurance],
[Research and Development],
[Sales],
[Shipping and Receiving],
[Tool Design])) AS PivotTable
ORDER BY Ano DESC
----
-----
DECLARE @NomeColunas NVARCHAR(MAX) = ''

SELECT @NomeColunas += QUOTENAME(TRIM(DEPARTMENTNAME))+','
FROM (
SELECT DISTINCT DEPARTMENTNAME FROM DimEmployee
) AS Aux

SET @NomeColunas = LEFT(@NomeColunas,LEN(@NomeColunas)-1)

PRINT @NomeColunas


SELECT
*
FROM
	(SELECT
		EMPLOYEEKEY,
		YEAR(HIREDATE) AS ANO,
		DEPARTMENTNAME
	FROM DimEmployee
PIVOT(
COUNT(EMPLOYEEKEY)
FOR DEPARTMENTNAME
IN(@NomeColunas) AS PivotTable
ORDER BY Ano DESC
-----
-----
DECLARE @NomeColunas NVARCHAR(MAX) = ''
DECLARE @SQL NVARCHAR(MAX)=''

SELECT @NomeColunas += QUOTENAME(TRIM(DEPARTMENTNAME))+','
FROM (
SELECT DISTINCT DEPARTMENTNAME FROM DimEmployee
) AS Aux

SET @NomeColunas = LEFT(@NomeColunas,LEN(@NomeColunas)-1)

PRINT @NomeColunas

SET @SQL = 'SELECT
*
FROM
	(SELECT
		EMPLOYEEKEY,
		YEAR(HIREDATE) AS ANO,
		DEPARTMENTNAME
	FROM DimEmployee
PIVOT(
COUNT(EMPLOYEEKEY)
FOR DEPARTMENTNAME
IN('+@NomeColunas+') AS PivotTable
ORDER BY Ano DESC'

PRINT @SQL
------
-----
DECLARE @NomeColunas NVARCHAR(MAX) = ''
DECLARE @SQL NVARCHAR(MAX)=''

SELECT @NomeColunas += QUOTENAME(TRIM(DEPARTMENTNAME))+','
FROM (
SELECT DISTINCT DEPARTMENTNAME FROM DimEmployee
) AS Aux

SET @NomeColunas = LEFT(@NomeColunas,LEN(@NomeColunas)-1)

PRINT @NomeColunas

SET @SQL = 'SELECT
*
FROM
	(SELECT
		EMPLOYEEKEY,
		YEAR(HIREDATE) AS ANO,
		DATENAME(MM,HireDate) AS Mes,
		DEPARTMENTNAME
	FROM DimEmployee AS Dados
PIVOT(
COUNT(EMPLOYEEKEY)
FOR DEPARTMENTNAME
IN('+@NomeColunas+') AS PivotTable
ORDER BY Ano DESC'

EXECUTE sp_execute @SQL
---
---
