 CREATE TABLE Produto (
	codigo INTEGER PRIMARY KEY,
	clube VARCHAR(30),
	temperaturaArmazenamento FLOAT(6,3),
	nome VARCHAR(30),
	tipo INTEGER,
	tipoArmazenamento VARCHAR(10),
	precoCusto	DECIMAL(18,2) );

CREATE TABLE ComercializacaoDireta (
	codigoProduto INTEGER PRIMARY KEY,
	CONSTRAINT FK_ComercializacaoDireta_Produto FOREIGN KEY (codigoProduto)
		REFERENCES Produto (codigo));