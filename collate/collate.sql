CREATE TABLE Tabela(
ID INT,
Nome VARCHAR(100) COLLATE Latin1_General_CS_AS)

INSERT INTO Tabela(ID,Nome)
VALUES
(1,'Matheus'),(2,'Marcela'),(3,'marcos'),
(4,'Mauricio'),(5,'Marta'),(6,'Miranda'),
(7,'Melissa'),(8,'Lucas'),(9,'luisa'),(10,'Pedro')

SELECT
ID,
NOME
FROM TABELA
WHERE NOME COLLATE Latin1_General_CI_AS = 'MArCELA'
----
----
SELECT
ID,
NOME
FROM TABELA
WHERE NOME like 'Mar%'

SELECT
ID,
NOME
FROM TABELA
WHERE NOME like '[M][a][r]%'

SELECT
ID,
NOME
FROM TABELA
WHERE NOME like '[Mm][Aa][r]%'
---
---
SELECT
ID,
NOME
FROM TABELA
WHERE NOME like '[A-z][A-z]'
----
----
SELECT
ID,
NOME
FROM TABELA
WHERE NOME like '_[^Aa]%'
---
---
SELECT
ID,
NOME
FROM TABELA
WHERE NOME like '_[^Aa]%'

