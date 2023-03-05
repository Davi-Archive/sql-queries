CREATE TABLE Resultado(
Data_Fechamento DATETIME,
Mes_Ano VARCHAR(100),
Faturamento_MM FLOAT
)

INSERT INTO Resultado(Data_Fechamento,Mes_Ano,Faturamento_MM)
VALUES
	('2020-01-01','JAN-20',8),
	('2020-02-01','FEV-20',10),
	('2020-03-01','MAR-20',6),
	('2020-04-01','ABR-20',9),
	('2020-05-01','MAI-20',5),
	('2020-06-01','JUN-20',4),
	('2020-07-01','JUL-20',7),
	('2020-08-01','AGO-20',11),
	('2020-09-01','SET-20',9),
	('2020-10-01','OUT-20',12),
	('2020-11-01','NOV-20',11),
	('2020-12-01','DEZ-20',10)
-----
----
SELECT
Data_Fechamento,
Mes_Ano,
Faturamento_MM,
SUM(Faturamento_MM)
	OVER(
	ORDER BY DATA_FECHAMENTO
	ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
	) AS 'SOMA MÓVEL'
FROM
Resultado
----
----
SELECT
Data_Fechamento,
Mes_Ano,
Faturamento_MM,
AVG(Faturamento_MM)
	OVER(
	ORDER BY DATA_FECHAMENTO
	ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
	) AS 'MÉDIA MÓVEL'
FROM
Resultado