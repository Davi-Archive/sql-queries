CREATE TABLE dGerente(
	id_gerente INT IDENTITY(1,1),
	nome_gerente VARCHAR(100) NOT NULL,
	data_contratacao VARCHAR(100) NOT NULL,
	salario FLOAT NOT NULL,
	CONSTRAINT dgerente_id_gerente_pk PRIMARY KEY(id_gerente),
	CONSTRAINT dgerente_salario_ck CHECK(salario>0)
	);

	INSERT INTO dGerente(nome_gerente,data_contratacao,salario)
	VALUES
		('André Martins','2015-10-12',6700),
		('Barbara Campos','2011-07-05',9900),
		('Diego Cardoso','2018-10-11',7200),
		('Fabiana Martins','2017-02-10',11000)
----
----
CREATE TABLE dCliente(
	id_cliente INT IDENTITY(1,1),
	nome_cliente VARCHAR(100) NOT NULL,
	genero VARCHAR(100) NOT NULL,
	data_de_nascimento DATE NOT NULL,
	cpf VARCHAR(100) NOT NULL,
	CONSTRAINT dcliente_id_cliente_pk PRIMARY KEY(id_cliente),
	CONSTRAINT dcliente_genero_ck CHECK(GENERO IN('M','F','O','PND')),
	CONSTRAINT dcliente_cpf_un UNIQUE(cpf));

	INSERT INTO dCliente(nome_cliente,genero,data_de_nascimento,cpf)
	VALUES
		('André Martins','M','1989-10-12','839.283.190-00'),
		('Barbara Campos','F','1992-07-05','151.391.410-02'),
		('Diego Cardoso','M','1994-10-11','192.371.190-17'),
		('Fabiana Martins','F','1989-02-10','839.783.190-05'),
		('Gustavo Barbosa','M','1989-05-06','839.183.190-00'),
		('Helen Viana','F','1989-07-08','839.286.190-00'),
		('Igor Castro','M','1989-09-21','144.283.190-00'),
		('Juliana Pires','F','1991-04-10','416.283.190-00')
