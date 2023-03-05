SELECT
	Data_Fechamento,
	Mes_Ano,
	Faturamento_MM,
	FORMAT((Faturamento_MM/LAG(
	Faturamento_MM,1)
	OVER (ORDER BY DATA_FECHAMENTO)) -1,'0.00%')
	AS '% MoM'
FROM
Resultado
---
--- null IF EQUALS ARGUMENT
SELECT
	Data_Fechamento,
	Mes_Ano,
	Faturamento_MM,
	FORMAT((Faturamento_MM/NULLIF(LAG(
	Faturamento_MM,1)
	OVER (ORDER BY DATA_FECHAMENTO), 0)) -1,'0.00%')
	AS '% MoM'
FROM
Resultado
-----
----
SELECT
	Data_Fechamento,
	Mes_Ano,
	Faturamento_MM,
	FIRST_VALUE(Faturamento_MM)
	OVER(ORDER BY DATA_FECHAMENTO)
	AS 'PRIMEIRO VALOR',
	LAST_VALUE(Faturamento_MM)
	OVER(ORDER BY DATA_FECHAMENTO
	ROWS BETWEEN UNBOUNDED PRECEDING
	AND UNBOUNDED FOLLOWING)
	AS 'PRIMEIRO VALOR'
FROM
Resultado
----
---