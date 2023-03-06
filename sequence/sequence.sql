CREATE SEQUENCE clientes_seq
AS INT
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NO CYCLE
----
SELECT NEXT VALUE FOR clientes_seq
-----
DROP SEQUENCE clientes_seq
-----
CREATE SEQUENCE projetos_seq
AS INT
START WITH 1
INCREMENT BY 1
NO MAXVALUE
NO CYCLE

CREATE TABLE dProjeto(
	id_projeto INT,
	nome_projeto VARCHAR(100) NOT NULL,
	CONSTRAINT dareas_id_area_pk PRIMARY KEY(id_projeto)
)

INSERT INTO dProjeto (id_projeto, nome_projeto)
VALUES
(NEXT VALUES FOR projetos_seq, 'Planejamento de processos');
---
CREATE SEQUENCE projetos_seq
AS INT
START WITH 1
INCREMENT BY 1
NO MAXVALUE
NO CYCLE

CREATE TABLE dProjeto(
	id_projeto INT,
	nome_projeto VARCHAR(100) NOT NULL,
	CONSTRAINT dareas_id_area_pk PRIMARY KEY(id_projeto)
)

INSERT INTO dProjeto
VALUES
(NEXT VALUE FOR projetos_seq,'Planejamento Estratégico'),
(NEXT VALUE FOR projetos_seq,'Desenvolvimento de Aço'),
(NEXT VALUE FOR projetos_seq,'Plano de Negócios'),
(NEXT VALUE FOR projetos_seq,'Visualização 3D')

SELECT * FROM dProjeto