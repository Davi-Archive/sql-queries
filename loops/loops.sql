DECLARE  @VARCONTADOR INT
SET @VARCONTADOR = 1

WHILE  @VARCONTADOR <= 10
BEGIN
	PRINT @VARCONTADOR
	SET @VARCONTADOR = @VARCONTADOR +1
END
-----
----
DECLARE  @VARCONTADOR INT
SET @VARCONTADOR = 1

WHILE  @VARCONTADOR <= 100
BEGIN
	IF @VARCONTADOR = 15 BREAK

	PRINT 'O VALOR DO CONTADOR É: ' + CONVERT(VARCHAR, @VARCONTADOR)
	SET @VARCONTADOR = @VARCONTADOR +1
END
---
---
DECLARE @VARCONTADOR INT
SET @VARCONTADOR = 0

WHILE @VARCONTADOR <=10
BEGIN
	SET @VARCONTADOR +=1
	IF @VARCONTADOR = 3 OR @VARCONTADOR = 6 CONTINUE
	PRINT 'O VALOR DE VARIÁVEL É: '+ CONVERT(VARCHAR,@VARCONTADOR)
END
---
---
