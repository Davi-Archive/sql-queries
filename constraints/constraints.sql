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
		('André Matos','2015-10-12',6700),
		('Barbara Souza','2011-07-05',9900),
		('Cardoso Meira','2018-10-11',7200),
		('Martins Santos','2017-02-10',11000)
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

--
--
-----
CREATE TABLE fContratos(
	id_contrato INT IDENTITY(1,1),
	data_assinatura DATE DEFAULT GETDATE(),
	id_cliente INT,
	id_gerente INT,
	valor_contrato FLOAT,
	CONSTRAINT fcontratos_id_contrato_pk PRIMARY KEY(id_contrato),
	CONSTRAINT fcontratos_id_cliente_fk
	FOREIGN KEY(id_cliente)
	REFERENCES dCliente(id_cliente),
	CONSTRAINT fcontratos_id_gerente_fk
	FOREIGN KEY(id_gerente)
	REFERENCES dGerente(id_gerente),
	CONSTRAINT fcrontratos_valor_contrato_ck
	CHECK(valor_contrato>0)
);

INSERT INTO fContratos(data_assinatura,id_cliente,id_gerente,valor_contrato)
VALUES
	('2019-01-12',8,1,2300),
	('2019-02-10',3,2,15500),
	('2019-03-07',7,2,6500),
	('2019-01-15',1,3,33000),
	('2019-01-10',5,4,11100),
	('2019-05-12',4,2,5500),
	('2019-07-10',8,3,55000),
	('2019-08-17',2,1,31000),
	('2019-10-18',5,4,3420),
	('2019-11-15',6,2,9200)
---
---
ALTER TABLE fContratos
DROP CONSTRAINT fcontratos_id_contrato_fk
-----
ALTER TABLE fContratos
ADD CONSTRAINT fcontratos_id_contrato_fk PRIMARY KEY(id_contrato)
