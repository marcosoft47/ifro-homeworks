CREATE DATABASE atividade1;
CREATE DATABASE atividade2;


USE atividade1;


CREATE TABLE pessoa(
codigo int PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome varchar(50),
telefone char(10),
cpf char(11) UNIQUE
);

CREATE TABLE concessionaria(
codigo int PRIMARY KEY AUTO_INCREMENT,
razao_social varchar(60),
cnpj char(14) UNIQUE,
endereco_logradouro VARCHAR(40) NOT NULL,
enderceo_numero SMALLINT,
endereco_bairro VARCHAR(30),
endereco_cep CHAR(8),
endereco_cidade VARCHAR(30),
endereco_estado CHAR(2)
);

CREATE TABLE vendedor(
salario float NOT NULL,
fk_pessoa_codigo int PRIMARY KEY,
fk_concessionaria_codigo int,
FOREIGN KEY (fk_pessoa_codigo) REFERENCES pessoa (codigo),
FOREIGN KEY (fk_concessionaria_codigo) REFERENCES concessionaria (codigo)
);

CREATE TABLE cliente(
fk_pessoa_codigo int PRIMARY KEY AUTO_INCREMENT,
fk_concessionaria_codigo int,
FOREIGN KEY (fk_pessoa_codigo) REFERENCES pessoa(codigo),
FOREIGN KEY (fk_concessionaria_codigo) REFERENCES concessionaria(codigo)
);

CREATE TABLE carro(
codigo int PRIMARY KEY AUTO_INCREMENT,
preco float,
modelo varchar(20) NOT NULL,
fk_carro_fk_cliente int,
fk_concessionaria_codigo int,
fk_vendedor_codigo int ,
FOREIGN KEY (fk_carro_fk_cliente) REFERENCES cliente(fk_pessoa_codigo),
FOREIGN KEY (fk_concessionaria_codigo) REFERENCES concessionaria(codigo),
FOREIGN KEY (fk_vendedor_codigo) REFERENCES vendedor(fk_pessoa_codigo)
);

CREATE TABLE acessorio(
codigo int PRIMARY KEY AUTO_INCREMENT,
descricao varchar(60)
);

CREATE TABLE possui(
fk_acessorio_codigo int,
fk_carro_codigo int,
PRIMARY KEY (fk_acessorio_codigo, fk_carro_codigo),
FOREIGN KEY (fk_acessorio_codigo) REFERENCES acessorio(codigo),
FOREIGN KEY (fk_carro_codigo) REFERENCES carro(codigo)
);

CREATE TABLE oficina(
codigo int PRIMARY KEY,
cnpj char(12) UNIQUE,
razao_social varchar(60)
);

/* MUDANÇAS */

ALTER TABLE concessionaria 
MODIFY COLUMN codigo int NOT NULL;

DESCRIBE concessionaria;


ALTER TABLE cliente
ADD FOREIGN KEY (fk_pessoa_codigo) REFERENCES pessoa(codigo);
ALTER TABLE cliente
ADD FOREIGN KEY (fk_concessionaria_codigo) REFERENCES concessionaria(codigo);

DESCRIBE cliente;

ALTER TABLE carro
MODIFY COLUMN preco float NOT NULL;
ALTER TABLE carro
MODIFY COLUMN modelo varchar(20) NOT NULL;
ALTER TABLE acessorio
MODIFY COLUMN descricao varchar(100) NOT NULL;
/*ALTER TABLE oficina
DROP COLUMN cnpj;

ALTER TABLE oficina
ADD COLUMN cnpj char(12) UNIQUE;

DESCRIBE oficina;

ALTER TABLE oficina
ADD COLUMN marcorigon_patriciareis varchar(2);*/








######### ATVIDADE 2 #########

USE atividade2;

CREATE TABLE biblioteca(
codigo int PRIMARY KEY AUTO_INCREMENT,
descricao varchar(40),
endereco varchar(20) NOT NULL
);

CREATE TABLE associado(
matricula int PRIMARY KEY AUTO_INCREMENT,
sexo varchar(10),
nome varchar(50) NOT NULL
);

CREATE TABLE cadastra(
fk_biblioteca_codigo int,
FOREIGN KEY (fk_biblioteca_codigo) REFERENCES biblioteca(codigo),
fk_associado_matricula int,
FOREIGN KEY (fk_associado_matricula) REFERENCES associado(matricula)
);

ALTER TABLE cadastra
ADD PRIMARY KEY (fk_biblioteca_codigo, fk_associado_matricula);
DESCRIBE cadastra;

CREATE TABLE livro(
codigo int PRIMARY KEY AUTO_INCREMENT,
isbn char(13) NOT NULL,
titulo varchar(10) NOT NULL,
fk_biblioteca_codigo int,
FOREIGN KEY (fk_biblioteca_codigo) REFERENCES biblioteca(codigo)
);
ALTER TABLE livro
DROP COLUMN isbn;
ALTER TABLE livro
ADD COLUMN isbn char(13);

CREATE TABLE reserva(
fk_livro_codigo int,
CONSTRAINT fk_livro_codigo FOREIGN KEY (fk_livro_codigo) REFERENCES livro(codigo),
fk_associado_codigo int,
CONSTRAINT fk_associado_codigo FOREIGN KEY (fk_associado_codigo) REFERENCES associado(matricula)
);

ALTER TABLE reserva
ADD PRIMARY KEY (fk_livro_codigo, fk_associado_codigo);
DESCRIBE cadastra;

CREATE TABLE aborda(
fk_livro_codigo int,
FOREIGN KEY (fk_livro_codigo) REFERENCES livro(codigo),
fk_assunto_codigo int,
FOREIGN KEY (fk_assunto_codigo) REFERENCES assunto(codigo)
);

ALTER TABLE aborda
ADD PRIMARY KEY (fk_livro_codigo, fk_assunto_codigo);
DESCRIBE aborda;

CREATE TABLE assunto(
codigo int PRIMARY KEY AUTO_INCREMENT,
assunto char(50)
);

CREATE TABLE autor(
codigo int PRIMARY KEY AUTO_INCREMENT,
nome char(50) NOT NULL
);

CREATE TABLE escreve(
fk_autor_codigo int,
CONSTRAINT fk_autor_codigo FOREIGN KEY (fk_autor_codigo)
REFERENCES autor(codigo),
fk_livro_codigo int,
PRIMARY KEY (fk_autor_codigo, fk_livro_codigo)
);

/*ALTERAÇÕES*/

ALTER TABLE livro
MODIFY COLUMN isbn char(13) NOT NULL;

ALTER TABLE escreve
ADD FOREIGN KEY (fk_livro_codigo) REFERENCES livro(codigo); 
DESCRIBE escreve;

ALTER TABLE autor
DROP COLUMN nome;
DESCRIBE autor;

ALTER TABLE autor
ADD COLUMN marcorigon_patriciareis varchar(2);










DROP DATABASE atividade1;

describe pessoa;

INSERT INTO pessoa VALUES (1, "Marco Rigon", "993481849", "10123456789");

INSERT INTO pessoa(nome, telefone, cpf)
VALUES ("Patricia Reis Santos", "993481849", "20123456789");
INSERT INTO pessoa(nome, telefone, cpf)
VALUES ("John Doe", "993481849", "30123456789");
INSERT INTO pessoa (nome, telefone, cpf)
VALUES ("Jane Doe", "993481849", "40123456789");
INSERT INTO pessoa (nome, telefone, cpf)
VALUES ("Amanda", "993481849", "50123456789");
INSERT INTO pessoa (nome, telefone, cpf)
VALUES ("Bento", "993481849", "60123456789");
INSERT INTO pessoa (nome, telefone, cpf)
VALUES ("Chico", "993481849", "70123456789");
INSERT INTO pessoa (nome, telefone, cpf)
VALUES ("Danilo", "993481849", "80123456789");
INSERT INTO pessoa (nome, telefone, cpf)
VALUES ("Enzo", "993481849", "90123456789");
INSERT INTO pessoa (nome, telefone, cpf)
VALUES ("Flavio", "993481849", "12345678910");

SELECT * FROM pessoa;


DESCRIBE carro;

INSERT INTO carro (preco, modelo)
VALUES (1234, "Corona");
INSERT INTO carro (preco, modelo)
VALUES (1234, "Mugello Farina Duo");
INSERT INTO carro (preco, modelo)
VALUES (1234, "Rolimã");
INSERT INTO carro (preco, modelo)
VALUES (1234, "Strada");
INSERT INTO carro (preco, modelo)
VALUES (1234, "Ford Ka");

UPDATE carro
SET fk_carro_fk_cliente = 1
WHERE codigo=1;

DESCRIBE carro;
SELECT * FROM carro;

DESCRIBE acessorio;

INSERT INTO acessorio (descricao)
VALUES ("Acendedor de cigarro.");
INSERT INTO acessorio (descricao)
VALUES ("Tapete de carro.");

SELECT * FROM acessorio;

DESCRIBE concessionaria;
INSERT INTO concessionaria (razao_social, cnpj, endereco_logradouro, enderceo_numero, endereco_bairro, endereco_cep, endereco_cidade, endereco_estado)
VALUES ("Atoyota vendas", 01234567891011, "Avenida Brasil", 123, "do Limoeiro", 12345678, "Ouro Preto do Oeste", "RO");

SELECT * FROM concessionaria;

DESCRIBE cliente;

INSERT INTO cliente (fk_pessoa_codigo)
VALUES (1);
INSERT INTO cliente (fk_pessoa_codigo)
VALUES (2);
INSERT INTO cliente (fk_pessoa_codigo)
VALUES (3);
INSERT INTO cliente (fk_pessoa_codigo)
VALUES (4);
INSERT INTO cliente (fk_pessoa_codigo)
VALUES (5);
INSERT into cliente (fk_pessoa_codigo)
VALUES (6);
INSERT INTO cliente (fk_pessoa_codigo)
VALUES (7);
INSERT into cliente (fk_pessoa_codigo)
VALUES (8);
INSERT INTO cliente (fk_pessoa_codigo)
VALUES (9);
INSERT INTO cliente (fk_pessoa_codigo)
VALUES (10);

UPDATE cliente
SET fk_concessionaria_codigo = 1
WHERE fk_pessoa_codigo = 1;
SELECT * FROM cliente;