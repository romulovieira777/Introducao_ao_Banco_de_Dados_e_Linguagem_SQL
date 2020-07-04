
SET
	DATESTYLE
TO
	PostgreSQL,
	European;


/* Criando Sequência do ID e Tabelas */
CREATE SEQUENCE
	IDVendedor;
	

CREATE TABLE Vendedores (
	IDVendedor INT DEFAULT NEXTVAL('IDVendedor'::REGCLASS) PRIMARY KEY,
	Nome VARCHAR(50)
);


CREATE SEQUENCE
	IDProduto;


CREATE TABLE Produtos (
	IDProduto INT DEFAULT NEXTVAL('IDProduto'::REGCLASS) PRIMARY KEY,
	Produto VARCHAR(100),
	Preco NUMERIC(10,2)
);


CREATE SEQUENCE
	IDCliente;
	
	
CREATE TABLE Clientes (
	IDCliente INT DEFAULT NEXTVAL('IDCliente'::REGCLASS) PRIMARY KEY,
	Cliente VARCHAR(50),
	Estado VARCHAR(2),
	Sexo CHAR(1),
	Status VARCHAR(50)
);


CREATE SEQUENCE
	IDVenda;


CREATE TABLE Vendas (
	IDVenda INT DEFAULT NEXTVAL('IDVenda'::REGCLASS) PRAGMA KEY,
	IDVendedor INT REFERENCES Vendedores (IDVendedor),
	IDCliente INT REFERENCES Clientes (IDCliente),
	Data DATE,
	Total NUMERIC(10,2)
);


CREATE TABLE ItensVenda (
	IDProduto INT REFERENCES Produtos ON DELETE RESTRICT,
	IDVenda INT REFERENCES Vendas ON DELETE CASCADE,
	Quantidade INT,
	ValorUnitario DECIMAL(10,2),
	ValorTotal DECIMAL(10,2),
	PRIMARY KEY (IDProduto, IDVenda)
);
	
	