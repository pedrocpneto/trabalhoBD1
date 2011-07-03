 -- Alunos Pedro Clemente Pereira Neto - 99618
 --		   Artur Campos Rodrigues - 99580
 
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
		ON DELETE RESTRICT git pull https://github.com/arturcampos/trabalhoBD1.git patch-4
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

CREATE TABLE Cardapio (
	codigoCardapio INTEGER PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL,
);

CREATE TABLE ListaProdCardapio (
	codigoCardapio INTEGER,
	codigoProduto INTEGER,
	CONSTRAINT PK_ListaProdCardapio PRIMARY KEY 
		(codigoCardapio, codigoProduto),
	CONSTRAINT FK_ListaProdCardapio_Cardapio FOREIGN KEY (codigoCardapio)
		REFERENCES Cardapio (codigoCardapio)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	CONSTRAINT FK_ListaProdCardapio_Produto PRIMARY KEY (codigoProduto)
		REFERENCES Produto (codigoProduto)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

CREATE TABLE Ingredientes (
	codigoProdutoPrato INTEGER,
	codigoProdutoMateriaPrima INTEGER,
	quantidade DECIMAL(10,2)
	CONSTRAINT PK_Ingredientes PRIMARY KEY (codigoProdutoPrato, codigoProdutoMateriaPrima),
	CONSTRAINT FK_Ingredientes_Prato FOREIGN KEY (codigoProdutoPrato)
		REFERENCES Prato(codigoProduto)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	CONSTRAINT FK_Ingredientes_MateriaPrima FOREIGN KEY (codigoProdutoMateriaPrima)
		REFERENCES MateriaPrima(codigoProduto)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

CREATE TABLE Endereco
(
	codigoCliente INTEGER PRIMARY KEY,
	rua VARCHAR(20) NOT NULL,
	numero INTEGER NOT NULL,
	bairro VARCHAR(10) NOT NULL,
	cidade VARCHAR(10) NOT NULL,
	estado VARCHAR(10),
	complemento VARCHAR(10),
	CONSTRAINT FK_cliente FOREIGN KEY (codigoCliente) 
		REFERENCES cliente(cpf)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

