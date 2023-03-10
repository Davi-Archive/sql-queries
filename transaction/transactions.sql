SELECT * FROM CLIENTE_AUX

BEGIN TRANSACTION
INSERT INTO cliente_AUX(nome_cliente,genero,data_de_nascimento,cpf)
VALUES
('Maria Julia','F','1995-05-10','987.054.321-00')

ROLLBACK TRANSACTION
-----
----
SELECT * FROM CLIENTE_AUX

BEGIN TRANSACTION Nome_aqui
INSERT INTO cliente_AUX(nome_cliente,genero,data_de_nascimento,cpf)
VALUES
('Maria Julia','F','1995-05-10','987.054.321-00')

--ROLLBACK TRANSACTION
--COMMIT TRANSACTION

-----
-----
DECLARE @contador INT

BEGIN TRANSACTION T1
INSERT INTO
cliente_AUX(nome_cliente,genero,data_de_nascimento,cpf)
VALUES
('Ruth Campos','F','1995-05-10','987.154.321-00')

SELECT @contador = COUNT(*)
FROM cliente_AUX WHERE nome_cliente = 'Ruth Campos'

IF @contador = 1
	BEGIN
		COMMIT TRANSACTION T1
		PRINT 'RUTH CAMPOS CADASTRADA COM SUCESSO'
	END
ELSE
	BEGIN
	ROLLBACK TRANSACTION T1
	PRINT 'RUTH CAMPOS JÁ ESTÁ CADASTRADA'
	END

SELECT * FROM CLIENTE_AUX

--ROLLBACK TRANSACTION
--COMMIT TRANSACTION
----
-----
-----
BEGIN TRY
	BEGIN TRANSACTION T1

		UPDATE cliente_AUX
		SET data_de_nascimento = '19912-03-15'
		WHERE id_cliente = 4
	COMMIT TRANSACTION T1
	PRINT 'DATA ATUALIZADA COM SUCESSO'
END TRY
BEGIN CATCH

	ROLLBACK TRANSACTION T1
	PRINT 'DATA CADASTRADA INVÁLIDA'

END CATCH


SELECT * FROM CLIENTE_AUX
-----
-----
BEGIN TRANSACTION T1
BEGIN TRANSACTION T2

COMMIT TRANSACTION T1

PRINT @@TRANCOUNT
-----
-----
BEGIN TRANSACTION T1

	PRINT @@TRANCOUNT
	BEGIN TRANSACTION T2

	PRINT @@TRANCOUNT
	COMMIT TRANSACTION T2

	PRINT @@TRANCOUNT
COMMIT TRANSACTION T1
