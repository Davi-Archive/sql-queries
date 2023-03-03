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
