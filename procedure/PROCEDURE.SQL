CREATE PROCEDURE prOrdernaGerentes
AS
BEGIN


SELECT
ID_GERENTE,
NOME_GERENTE,
SALARIO
FROM dGerente
ORDER BY salario DESC


END

EXECUTE prOrdernaGerentes
-----
----
CREATE OR ALTER PROCEDURE prListaClientes(@gen VARCHAR(MAX))
AS
BEGIN

	SELECT
	NOME_CLIENTE,
	GENERO,
	DATA_DE_NASCIMENTO
	FROM dCliente
	WHERE genero = @gen

END

EXECUTE prListaClientes 'M'
----
----
CREATE OR
ALTER
PROCEDURE prListaClientes(@gen VARCHAR(MAX),@ano INT)
AS
BEGIN

	SELECT
	NOME_CLIENTE,
	GENERO,
	DATA_DE_NASCIMENTO
	FROM dCliente
	WHERE genero = @gen and YEAR(data_de_nascimento)=@ano

END

EXECUTE prListaClientes 'M',1989
----
----
CREATE OR
ALTER
PROCEDURE prListaClientes(@gen VARCHAR(MAX)='M',@ano INT)
AS
BEGIN

	SELECT
	NOME_CLIENTE,
	GENERO,
	DATA_DE_NASCIMENTO
	FROM dCliente
	WHERE genero = @gen and YEAR(data_de_nascimento)=@ano

END

EXECUTE prListaClientes @ano=1989