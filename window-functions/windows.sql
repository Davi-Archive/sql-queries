USE Exercicios

CREATE TABLE Lojas(
ID_Loja INT,
Nome_Loja VARCHAR(100),
Regiao VARCHAR(100),
Qtd_Vendida FLOAT
)

INSERT INTO Lojas(ID_Loja, Nome_Loja, Regiao, Qtd_Vendida)
VALUES
	(1,'Botafogo praia&mar','Sudeste',1800),
	(2,'Lojas Vitoria','Sudeste',800),
	(3,'Emporio Mineirinho','Sudeste',2300),
	(4,'Central Paulista','Sudeste',1800),
	(5,'Rio 50 graus','Sudeste',700),
	(6,'Casa Flor & Anápolis','Sul',1800),
	(7,'Pampas & Co','Sul',990),
	(8,'Paraná Papeis','Sul',1800),
	(9,'Amazonas Prime','sudeste',1800),
	(10,'Para Bens','Norte',3200),
	(11,'Tinias rio branco','Norte',1500),
	(12,'Destemido Hall','Nordeste',1800),
	(13,'Cachorrinha loft','nordeste',1800)
	----
SELECT
ID_Loja,
Nome_Loja,
Regiao,
Qtd_Vendida,
SUM(Qtd_Vendida) OVER(PARTITION BY REGIAO) AS 'TOTAL VENDIDO'
FROM
Lojas
--
--
SELECT
ID_Loja,
Nome_Loja,
Regiao,
Qtd_Vendida,
COUNT(*) OVER() AS 'QTD LOJAS'
FROM
Lojas
---
---
SELECT
ID_Loja,
Nome_Loja,
Regiao,
Qtd_Vendida,
AVG(Qtd_Vendida) OVER(PARTITION BY REGIAO) AS 'QTD LOJAS'
FROM
Lojas
--
--
SELECT
ID_Loja,
Nome_Loja,
Regiao,
Qtd_Vendida,
MAX(Qtd_Vendida) OVER(PARTITION BY REGIAO) AS 'MENOR VENDA'
FROM
Lojas
--
--
SELECT
	ID_Loja,
	Nome_Loja,
	Regiao,
	Qtd_Vendida,
	SUM(Qtd_Vendida) OVER() AS 'TOTAL VENDIDO',
	FORMAT(Qtd_Vendida/SUM(QTD_VENDIDA) OVER(),'0.00%')  AS '% TOTAL'

FROM Lojas
ORDER BY ID_Loja
---
---
SELECT
	ID_Loja,
	Nome_Loja,
	Regiao,
	Qtd_Vendida,
	ROW_NUMBER() OVER(ORDER BY QTD_VENDIDA DESC) AS 'ROWNUMBER'
FROM Lojas
ORDER BY ID_Loja
---
---
SELECT
	ID_Loja,
	Nome_Loja,
	Regiao,
	Qtd_Vendida,
	RANK() OVER(ORDER BY QTD_VENDIDA DESC) AS 'RANK'
FROM Lojas
ORDER BY ID_Loja
---
---
SELECT
	ID_Loja,
	Nome_Loja,
	Regiao,
	Qtd_Vendida,
	ROW_NUMBER() OVER(ORDER BY QTD_VENDIDA DESC) AS 'ROW',
	RANK() OVER(ORDER BY QTD_VENDIDA DESC) AS 'RANK',
	DENSE_RANK() OVER(ORDER BY QTD_VENDIDA DESC) AS 'DENSE',
	NTILE(3) OVER(ORDER BY QTD_VENDIDA DESC) AS 'NTILE'
FROM Lojas
ORDER BY ID_Loja
---
---
SELECT
	REGIAO AS 'REGIAO',
	SUM(QTD_VENDIDA) AS 'TOTAL VENDIDO',
	RANK() OVER(ORDER BY SUM(QTD_VENDIDA) DESC) AS 'RANKING'
FROM
	Lojas
GROUP BY Regiao
ORDER BY [TOTAL VENDIDO] DESC
---
---
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

