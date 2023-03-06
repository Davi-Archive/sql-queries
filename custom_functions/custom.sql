SELECT * FROM dCliente

SELECT
nome_cliente,
data_de_nascimento,
dbo.fnDataCompleta(data_de_nascimento)
FROM dCliente

CREATE FUNCTION fnDataCompleta(@data AS DATE)
RETURNS VARCHAR(MAX)
AS
BEGIN
 RETURN DATENAME(DW,@data)+', '+
DATENAME(D,@data)+' DE '+
DATENAME(M,@data)+' DE '+
DATENAME(YYYY,@data)
END
----
----
INSERT INTO dGerente(nome_gerente, data_contratacao,salario)
VALUES
('João','2019-01-10',3100)

SELECT
nome_gerente,
LEFT(nome_gerente,CHARINDEX(' ',nome_gerente)-1) as 'primeiro nome'
FROM
dGerente

CREATE OR ALTER FUNCTION fnPrimeiroNome(@nomeCompleto AS VARCHAR(MAX))
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @posicaoEspaco AS INT
	DECLARE @resposta AS VARCHAR(MAX)

	SET @posicaoEspaco = CHARINDEX(' ',@nomeCompleto)

	IF @posicaoEspaco = 0
		SET @resposta = @nomeCompleto
	ELSE
		SET @resposta = LEFT(@nomeCompleto,@posicaoEspaco -1)

	RETURN @resposta
END
----
---
INSERT INTO dGerente(nome_gerente, data_contratacao,salario)
VALUES
('João','2019-01-10',3100)

SELECT
nome_gerente,
dbo.fnPrimeiroNome(nome_gerente) as 'primeiro nome'
FROM
dGerente

CREATE OR ALTER FUNCTION fnPrimeiroNome(@nomeCompleto AS VARCHAR(MAX))
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @posicaoEspaco AS INT
	DECLARE @resposta AS VARCHAR(MAX)

	SET @posicaoEspaco = CHARINDEX(' ',@nomeCompleto)

	IF @posicaoEspaco = 0
		SET @resposta = @nomeCompleto
	ELSE
		SET @resposta = LEFT(@nomeCompleto,@posicaoEspaco -1)

	RETURN @resposta
END