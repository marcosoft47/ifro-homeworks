DROP DATABASE IF EXISTS exercicio1;
DROP DATABASE IF EXISTS exercicio2;

#######################################################
######         CRIANDO AS BASES DE DADOS         ######
#######################################################
CREATE DATABASE exercicio1;
CREATE DATABASE exercicio2;


#######################################################
#####  Primeiramente, vamos fazer o exercício 1   #####
#######################################################
USE exercicio1;


CREATE TABLE pessoa_fisica(
codigo int PRIMARY KEY AUTO_INCREMENT,
nome varchar(50) NOT NULL,
telefone char(11) NOT NULL,
cpf char(11) UNIQUE NOT NULL
);


CREATE TABLE concessionaria(
codigo int PRIMARY KEY AUTO_INCREMENT,
razao_social varchar(50) NOT NULL,
cnpj char(14) UNIQUE NOT NULL,
endereco_logradouro varchar(40) NOT NULL,
endereco_numero mediumint NOT NULL,
endereco_bairro varchar(40) NOT NULL,
endereco_cidade varchar(40) NOT NULL,
endereco_uf char(2) NOT NULL,
endereco_cep char(8) NOT NULL
);

CREATE TABLE vendedor(
salario float NOT NULL,
fk_pessoa_fisica_codigo int,
fk_concessionaria_codigo int,
PRIMARY KEY (fk_pessoa_fisica_codigo, fk_concessionaria_codigo),
CONSTRAINT fk_pessoa_fisica_codigo_vendedor FOREIGN KEY(fk_pessoa_fisica_codigo) REFERENCES pessoa_fisica(codigo),
CONSTRAINT fk_concessionaria_codigo_vendedor FOREIGN KEY(fk_concessionaria_codigo) REFERENCES concessionaria(codigo)
);

CREATE TABLE cliente(
fk_pessoa_fisica_codigo int PRIMARY KEY,
fk_concessionaria_codigo int,
FOREIGN KEY(fk_pessoa_fisica_codigo) REFERENCES pessoa_fisica(codigo),
FOREIGN KEY(fk_concessionaria_codigo) REFERENCES concessionaria(codigo)
);

CREATE TABLE carro(
 codigo int PRIMARY KEY AUTO_INCREMENT,
 preco float NOT NULL,
 modelo varchar(150) NOT NULL,
 fk_cliente_codigo int,
 fk_concessionaria_codigo int,
 fk_vendedor_codigo int,
 CONSTRAINT fk_cliente_codigo_carro FOREIGN KEY(fk_cliente_codigo) REFERENCES cliente (fk_pessoa_fisica_codigo),
 CONSTRAINT fk_concessionaria_codigo_carro FOREIGN KEY(fk_concessionaria_codigo) REFERENCES concessionaria(codigo),
 CONSTRAINT fk_vendedor_codigo_carro FOREIGN KEY (fk_vendedor_codigo) REFERENCES vendedor(fk_pessoa_fisica_codigo)
);

CREATE TABLE acessorio(
codigo int PRIMARY KEY AUTO_INCREMENT,
descricao varchar(65) NOT NULL
);

CREATE TABLE possui(
fk_acessorio_codigo int,
fk_carro_codigo int,
PRIMARY KEY (fk_acessorio_codigo, fk_carro_codigo),
CONSTRAINT fk_acessorio_codigo_possui FOREIGN KEY(fk_acessorio_codigo) REFERENCES acessorio(codigo),
CONSTRAINT fk_carro_codigo_possui FOREIGN KEY(fk_carro_codigo) REFERENCES carro(codigo)
);

CREATE TABLE oficina(
codigo int PRIMARY KEY AUTO_INCREMENT,
cnpj char(14) UNIQUE NOT NULL,
razao_social varchar(50) NOT NULL
);

CREATE TABLE assisti(
fk_oficina_codigo int,
fk_carro_codigo int,
PRIMARY KEY (fk_oficina_codigo, fk_carro_codigo),
FOREIGN KEY(fk_oficina_codigo) REFERENCES oficina(codigo),
FOREIGN KEY(fk_carro_codigo) REFERENCES carro(codigo)
);


#######################################################
###########          Exercício 2            ###########
#######################################################
USE exercicio2;

CREATE TABLE biblioteca(
codigo int PRIMARY KEY AUTO_INCREMENT,
descricao char(100) NOT NULL,
endereco_logradouro varchar(40) NOT NULL,
endereco_numero mediumint NOT NULL,
endereco_bairro varchar(40) NOT NULL,
endereco_cidade varchar(40) NOT NULL,
endereco_uf char(2) NOT NULL,
endereco_cep char(8) NOT NULL
);

CREATE TABLE associado(
matricula int PRIMARY KEY AUTO_INCREMENT,
nome varchar(40) NOT NULL,
sexo char(1) NOT NULL
);

CREATE TABLE cadastra(
fk_biblioteca_codigo int,
fk_associado_matricula int,
PRIMARY KEY (fk_biblioteca_codigo, fk_associado_matricula),
CONSTRAINT fk_biblioteca_codigo_cadastra FOREIGN KEY(fk_biblioteca_codigo) REFERENCES biblioteca(codigo),
CONSTRAINT fk_associado_matricula_cadastra FOREIGN KEY(fk_associado_matricula) REFERENCES associado(matricula)
);

CREATE TABLE livro(
codigo int PRIMARY KEY AUTO_INCREMENT,
isbn char(15) UNIQUE NOT NULL,
titulo varchar(40) NOT NULL,
fk_biblioteca_codigo int,
CONSTRAINT fk_biblioteca_codigo_livro FOREIGN KEY(fk_biblioteca_codigo) REFERENCES biblioteca(codigo)
);

CREATE TABLE reserva(
fk_livro_codigo int,
fk_associado_matricula int,
data_reserva date NOT NULL,
PRIMARY KEY (fk_livro_codigo, fk_associado_matricula, data_reserva),
CONSTRAINT fk_livro_codigo_reserva FOREIGN KEY(fk_livro_codigo) REFERENCES livro(codigo),
CONSTRAINT fk_associado_matricula_reserva FOREIGN KEY(fk_associado_matricula) REFERENCES associado(matricula)
);

describe reserva;

CREATE TABLE assunto(
codigo int PRIMARY KEY AUTO_INCREMENT,
assunto varchar(30) NOT NULL
);

CREATE TABLE aborda(
fk_assunto_codigo int,
fk_livro_codigo int,
PRIMARY KEY (fk_assunto_codigo, fk_livro_codigo),
CONSTRAINT fk_assunto_codigo_aborda FOREIGN KEY(fk_assunto_codigo) REFERENCES assunto(codigo),
CONSTRAINT fk_livro_codigo_aborda FOREIGN KEY(fk_livro_codigo) REFERENCES livro(codigo)
);

CREATE TABLE autor(
codigo int PRIMARY KEY AUTO_INCREMENT,
nome varchar(40) NOT NULL
);

CREATE TABLE escreve(
fk_autor_codigo int,
fk_livro_codigo int,
PRIMARY KEY (fk_autor_codigo, fk_livro_codigo),
CONSTRAINT fk_autor_codigo_escreve FOREIGN KEY(fk_autor_codigo) REFERENCES autor(codigo),
CONSTRAINT fk_livro_codigo_escreve FOREIGN KEY(fk_livro_codigo) REFERENCES livro(codigo)
);