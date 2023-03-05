SELECT
	Data_Fechamento,
	Mes_Ano,
	Faturamento_MM,
	LAG(Faturamento_MM,2,0)
	OVER(ORDER BY DATA_FECHAMENTO) AS 'LAG',
	LEAD(Faturamento_MM,1,0)
	OVER(ORDER BY DATA_FECHAMENTO) AS 'LEAD'
FROM
Resultado