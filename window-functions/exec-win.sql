SELECT
Marca,
cor,
Quantidade_Vendida,
Receita_Total,
SUM(Quantidade_Vendida) OVER() AS 'SOLD PRODS',
SUM(QUANTIDADE_VENDIDA)
OVER(ORDER BY MARCA)
AS 'SOLD PROD MARCA'
FROM
vwProdutos
---
---
SELECT
Marca,
Quantidade_Vendida,
Receita_Total,
FORMAT(SUM(Quantidade_Vendida) OVER(ORDER BY MARCA)/
(SUM(CONVERT(FLOAT,Quantidade_Vendida)) over()), '0.00%')
FROM
vwProdutos
GROUP BY MARCA,Quantidade_Vendida,Receita_Total
---
---
SELECT
Marca,
Cor,
Quantidade_Vendida,
RANK() OVER(ORDER BY QUANTIDADE_VENDIDA DESC)
FROM
vwProdutos
WHERE Marca = 'CONTOSO'
---
---

