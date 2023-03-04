CREATE DATABASE BD_Teste
DROP DATABASE DB_Teste
CREATE DATABASE Exercicios
--
--
CREATE TABLE dCliente(
ID_Cliente int,
Nome_Cliente varchar(100),
Data_de_Nascimento datetime
);

CREATE TABLE dGerente(
ID_Gerente int,
Nome_Gerente varchar(100),
Data_de_Contratacao datetime,
Salario float
);

CREATE TABLE dContratos(
ID_Contrato int,
Data_de_Assinatura datetime,
ID_Cliente int,
ID_Gerente int,

);
---
---
INSERT INTO DCONTRATOS(id_CONTRATO,
DATA_DE_ASSINATURA,
ID_CLIENTE,ID_GERENTE
,VALOR_DO_CONTRATO) VALUES
(1,CAST('2019-01-12' AS datetime),5,1,23000),
(2,CAST('2019-01-12' AS datetime),4,3,23000),
(3,CAST('2019-01-12' AS datetime),3,2,23000),
(4,CAST('2019-01-12' AS datetime),2,1,23000),
(5,CAST('2019-01-12' AS datetime),1,1,23000),
(6,CAST('2019-01-12' AS datetime),6,3,23000),
(7,CAST('2019-01-12' AS datetime),2,4,23000),
(8,CAST('2019-01-12' AS datetime),4,1,23000),
(9,CAST('2019-01-12' AS datetime),3,2,23000)
------
CREATE TABLE funcionarios(
id_funcionario int,
nome varchar(50),
idade int,
sexo varchar(2))

INSERT INTO funcionarios(id_funcionario,nome,idade,sexo)
VALUES
(1,'JULIA',20,'F'),
(2,'MARCOS',22,'F'),
(3,'DANIEL',23,'F'),
(4,'AMANDA',24,'F'),
(5,'PEDRO',25,'F'),
(6,'ANDRÉ',26,'F')
----
--
SELECT * FROM funcionarios
WHERE idade = ANY (
SELECT idade FROM funcionarios WHERE SEXO='M')
----
----
select
PRODUCTKEY,
PRODUCTNAME,
(SELECT COUNT(PRODUCTKEY)
FROM FactSales
WHERE
FactSaleS.ProductKey = DimProduct.ProductKey)
AS 'QTD. VENDAS'
FROM
DimProduct

----
----
SELECT
CustomerKey,
FirstName,
LastName,
YearlyIncome
FROM
DimCustomer
WHERE YearlyIncome = (
SELECT MAX(YEARLYINCOME)
FROM DimCustomer
WHERE YearlyIncome < (
	SELECT MAX(YearlyIncome)
	FROM DimCustomer
	WHERE CustomerType = 'PERSON'
)
)