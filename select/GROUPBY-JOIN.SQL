SELECT
	CALENDARYEAR AS 'ANO',
	SUM(SALESQUANTITY) AS 'TOTAL VENDIDO'
FROM
	FACTSALES
INNER JOIN
	DimDate
	ON FACTSALES.DATEKEY = DIMDATE.DATEKEY
GROUP BY CALENDARYEAR
--
--
SELECT
	CALENDARYEAR AS 'ANO',
	SUM(SALESQUANTITY) AS 'TOTAL VENDIDO'
FROM
	FACTSALES
INNER JOIN
	DimDate
	ON FACTSALES.DATEKEY = DIMDATE.DATEKEY
WHERE CalendarMonthLabel = 'JANUARY'
GROUP BY CALENDARYEAR
HAVING SUM(SalesQuantity) >= 1200000
--
--
