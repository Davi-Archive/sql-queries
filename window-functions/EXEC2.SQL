SELECT
ROW_NUMBER() OVER(ORDER BY CALENDARMONTH) AS 'ID',
CalendarYear AS 'ANO',
CalendarMonthLabel AS 'MÊS',
COUNT(OPENDATE) AS 'QTD_LOJAS'
FROM
DimDate
LEFT JOIN DimStore
ON DimDate.Datekey = DimStore.OpenDate
GROUP BY CalendarYear, CALENDARMONTHLABEL,CALENDARMONTH
---
CREATE VIEW vwHistoricoLojas AS
SELECT
ROW_NUMBER() OVER(ORDER BY CALENDARMONTH) AS 'ID',
CalendarYear AS 'ANO',
CalendarMonthLabel AS 'MÊS',
COUNT(OPENDATE) AS 'QTD_LOJAS'
FROM
DimDate
LEFT JOIN DimStore
ON DimDate.Datekey = DimStore.OpenDate
GROUP BY CalendarYear, CALENDARMONTHLABEL,CALENDARMONTH
-----
-----
SELECT
ID,
ANO,
MÊS,
QTD_LOJAS,
SUM(QTD_LOJAS)
OVER(ORDER BY ID
ROWS BETWEEN 2
PRECEDING AND
CURRENT ROW) AS '2 MONTHS'
FROM
vwHistoricoLojas
-----
-----
SELECT
ID,
ANO,
MÊS,
QTD_LOJAS,
SUM(QTD_LOJAS)
OVER(ORDER BY ID
ROWS BETWEEN UNBOUNDED
PRECEDING AND
CURRENT ROW) AS 'mês'
FROM
vwHistoricoLojas
---
---
USE Desafio

DECLARE @CURRENTDATE DATE
DECLARE @ENDDATE DATE

SET @CURRENTDATE = '2020-01-01'
SET @ENDDATE= '2020-12-31'

CREATE TABLE Calendario(data DATE)

WHILE(@CURRENTDATE<@ENDDATE)
BEGIN
INSERT INTO Calendario(data)
VALUES(@CURRENTDATE)
SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate)
END
---
---
USE Desafio

DECLARE @CURRENTDATE DATE
DECLARE @ENDDATE DATE

SET @CURRENTDATE = '2020-01-01'
SET @ENDDATE= '2020-12-31'

WHILE (@CurrentDate <= @EndDate)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Calendario WHERE Calendario.data = @CurrentDate)
    BEGIN
        INSERT INTO Calendario(data)
        VALUES (@CurrentDate);
    END

    SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate); /*increment current date*/
END
-----
-----

DECLARE @CURRENTDATE DATE
DECLARE @ENDDATE DATE

SET @CURRENTDATE = '2020-01-01'
SET @ENDDATE= '2020-12-31'

WHILE (@CurrentDate <= @EndDate)
BEGIN

        UPDATE Calendario
		SET Ano = YEAR(@CURRENTDATE),
		Mes = MONTH(@CURRENTDATE),
		Dia = DAY(@CURRENTDATE)
		WHERE data = @CURRENTDATE


    SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate); /*increment current date*/
END
----
----
DECLARE @CURRENTDATE DATE
DECLARE @ENDDATE DATE

SET @CURRENTDATE = '2020-01-01'
SET @ENDDATE= '2020-12-31'

WHILE (@CurrentDate <= @EndDate)
BEGIN

        UPDATE Calendario
		SET AnoMes = CONVERT(INT ,(YEAR(@CURRENTDATE)+MONTH(@CURRENTDATE))),
		NomesMes = DATENAME(MONTH,@CURRENTDATE)
		WHERE data = @CURRENTDATE

    SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate); /*increment current date*/
END
--
--
DECLARE @CURRENTDATE DATE
DECLARE @ENDDATE DATE

SET @CURRENTDATE = '2000-01-01'
SET @ENDDATE= '2005-12-31'

WHILE (@CurrentDate <= @EndDate)
BEGIN

        UPDATE Calendario
		SET Ano = YEAR(@CURRENTDATE),
		Mes = MONTH(@CURRENTDATE),
		Dia = DAY(@CURRENTDATE),
		AnoMes = CONVERT(INT ,(YEAR(@CURRENTDATE)+MONTH(@CURRENTDATE))),
		NomesMes = DATENAME(MONTH,@CURRENTDATE)
		WHERE data = @CURRENTDATE

    SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate); /*increment current date*/
END
----
---
DELETE FROM
Calendario
DECLARE @CURRENTDATE DATE
DECLARE @ENDDATE DATE

SET @CURRENTDATE = '2000-01-01'
SET @ENDDATE= '2005-12-31'

WHILE (@CurrentDate <= @EndDate)
BEGIN

        INSERT INTO Calendario(data,Ano,MES,DIA,AnoMes,NomesMes)
		VALUES (
		@CURRENTDATE,
		YEAR(@CURRENTDATE),
		MONTH(@CURRENTDATE),
		DAY(@CURRENTDATE),
		CONVERT(VARCHAR(50),YEAR(@CURRENTDATE))
		+'-'+CONVERT(VARCHAR(50),MONTH(@CURRENTDATE)),
		DATENAME(MONTH,@CURRENTDATE))

    SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate); /*increment current date*/
END
--
--
DECLARE @CURRENTDATE DATE
DECLARE @ENDDATE DATE

SET @CURRENTDATE = '2000-01-01'
SET @ENDDATE= '2005-12-31'

WHILE (@CurrentDate <= @EndDate)
BEGIN

        INSERT INTO Calendario(data,Ano,MES,DIA,AnoMes,NomesMes)
		VALUES (
		@CURRENTDATE,
		YEAR(@CURRENTDATE),
		MONTH(@CURRENTDATE),
		DAY(@CURRENTDATE),
		CONVERT(VARCHAR(50),YEAR(@CURRENTDATE))
		+'-'+CONVERT(VARCHAR(50),MONTH(@CURRENTDATE)),
CASE
	WHEN DATENAME(MONTH,@CURRENTDATE) = 'JANUARY' THEN 'Janeiro'
	WHEN DATENAME(MONTH,@CURRENTDATE) = 'FEBRuary' THEN 'Fevereiro'
	WHEN DATENAME(MONTH,@CURRENTDATE) = 'march' THEN 'March'
	WHEN DATENAME(MONTH,@CURRENTDATE) = 'april' THEN 'Abril'
	WHEN DATENAME(MONTH,@CURRENTDATE) = 'May' THEN 'Maio'
	WHEN DATENAME(MONTH,@CURRENTDATE) = 'June' THEN 'Junho'
	WHEN DATENAME(MONTH,@CURRENTDATE) = 'July' THEN 'Julho'
	WHEN DATENAME(MONTH,@CURRENTDATE) = 'August' THEN 'Agosto'
	WHEN DATENAME(MONTH,@CURRENTDATE) = 'September' THEN 'Setembro'
	WHEN DATENAME(MONTH,@CURRENTDATE) = 'October' THEN 'Outubro'
	WHEN DATENAME(MONTH,@CURRENTDATE) = 'November' THEN 'Novembro'
	WHEN DATENAME(MONTH,@CURRENTDATE) = 'December' THEN 'Dezembro'
END)

    SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate); /*increment current date*/
END

