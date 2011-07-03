 CREATE TABLE Produto (
	codigo INTEGER PRIMARY KEY,
	clube VARCHAR(30),
	temperaturaArmazenamento FLOAT(6,3),
	nome VARCHAR(30),
	tipo INTEGER,
	tipoArmazenamento VARCHAR(10),
	precoCusto	DECIMAL(10,2) 
);

CREATE TABLE ComercializacaoDireta (
	codigoProduto INTEGER PRIMARY KEY,
	CONSTRAINT FK_ComercializacaoDireta_Produto FOREIGN KEY (codigoProduto)
		REFERENCES Produto (codigo)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

CREATE TABLE Prato (
	codigoProduto INTEGER PRIMARY KEY,
	descricao VARCHAR(150),
	nome VARCHAR(60),
	CONSTRAINT FK_Prato_ComercializacaoDireta FOREIGN KEY (codigoProduto)
		REFERENCES ComercializacaoDireta (codigoProduto)
		ON UPDATE CASCADE
		ON DELETE RESTRICT 
);
	
CREATE TABLE Preparo (
	codigo INTEGER PRIMARY KEY,
	descricao VARCHAR(200),
	custo DECIMAL(10, 2),
	tipo INTEGER,
	codigoProduto INTEGER,
	tempoCozimento TIME,
	CONSTRAINT FK_Preparo_Prato FOREIGN KEY (codigoProduto)
		REFERENCES Prato (codigoProduto)
		ON UPDATE CASCADE
		ON DELETE RESTRICT 
);

CREATE TABLE Clube (
	codigo INTEGER PRIMARY KEY,
	nome VARCHAR(20),
	desconto DECIMAL(10,2)
);

CREATE TABLE Mesa (
	codigo INTEGER PRIMARY KEY,
	nome VARCHAR(15)	
);

CREATE TABLE Comanda (
	codigo INTEGER PRIMARY KEY
);

CREATE TABLE MateriaPrima (
	codigoProduto INTEGER PRIMARY KEY,
	unidadeMedida CHAR(10) NOT NULL,
	CONSTRAINT FK_MateriaPrima_Produto FOREIGN KEY (codigoProduto)
		REFERENCES Produto(codigo)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

CREATE TABLE Lote (
	codigoLote INTEGER PRIMARY KEY,
	dataValidade DATE,
	dataFabricacao DATE,
	fornecedor VARCHAR(60),
	codigoProduto INTEGER,
	CONSTRAINT FK_Lote_Produto FOREIGN KEY (codigoProduto)
		REFERENCES Produto(codigo)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

CREATE TABLE Bebida (
	codigoBebida INTEGER PRIMARY KEY, 
	classificacao VARCHAR(10),
        CONSTRAINT FK_bebida_produto FOREIGN KEY (codigoBebida) 
               REFERENCES ComercializacaoDireta (codigoProduto)
               ON UPDATE CASCADE
               ON DELETE RESTRICT	 
);

CREATE TABLE Cliente (
	cpf	CHAR(11) PRIMARY KEY,
	dataCadastro DATE,
	descricao VARCHAR(80),
	nome VARCHAR(60) NOT NULL,
	dataNasc DATE,
	codigoProdutoClube INTEGER,
	codigoClube INTEGER
	CONSTRAINT FK_Cliente_Pertencem FOREIGN_KEY (codigoProdutoClube, codigoClube)
		REFERENCES Pertencem (codigoProduto, codigoClube)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

CREATE TABLE Listado (
        codigoProduto INTEGER,
	codigoComanda INTEGER,
	CONSTRAINT FK_produto FOREIGN KEY (codigoProduto) 
	       REFERENCES Produto(codigo)
		 ON UPDATE CASCADE
		 ON DELETE RESTRICT,
	CONSTRAINT FK_comanda foreign key(codigoComanda) 
		REFERENCES Comanda(codigo)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
        CONSTRAINT PRIMARY KEY(codigoProduto, codigoComanda)
);

<<<<<<< HEAD
CREATE TABLE Consumacao (
	codigoCliente INTEGER,
	codigoComanda INTEGER,
	codigoMesa INTEGER,
	dataConsumacao DATE NOT NULL,
	CONSTRAINT FK_cliente FOREIGN KEY (codigoCliente) 
		REFERENCES Cliente(cpf)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	CONSTRAINT FK_comanda FOREIGN KEY (codigoComanda) 
		REFERENCES Comanda(codigo)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	CONSTRAINT FK_mesa FOREIGN KEY (codigoMesa)
		REFERENCES Mesa(codigo)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	CONSTRAINT PRIMARY KEY (codigoCliente, codigoComanda, codigoMesa)
);

CREATE TABLE Telefone (
	codigoCliente INTEGER PRIMARY KEY,
	numeroTelefone VARCHAR(15) NOT NULL,
	CONSTRAINT FK_cliente FOREIGN KEY (codigoCliente) 
		REFERENCES cliente(cpf)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);
