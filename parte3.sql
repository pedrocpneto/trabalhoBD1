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
		ON UPDATE CASCADE,
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
		ON UPDATE CASCADE,
		ON DELETE RESTRICT 
);

CREATE TABLE clube (
	codigo INTEGER PRIMARY KEY,
	nome VARCHAR(20),
	desconto DECIMAL(10,2)
);


CREATE TABLE mesa (
	codigo INTEGER PRIMARY KEY,
	nome VARCHAR(15)	
);

CREATE TABLE comanda (
	codigo INTEGER PRIMARY KEY,
         ON UPDATE CASCADE
);
CREATE TABLE Bebida (
	codigoBebida INTEGER PRIMARY KEY, 
	classificacao varchar(10),
        CONSTRAINT FK_bebida_produto FOREIGN KEY (codigoBebida) 
               REFERENCES ComercializacaoDireta (codigoProduto)
               ON UPDATE CASCADE,
               ON DELETE RESTRICT	 
);	
	
