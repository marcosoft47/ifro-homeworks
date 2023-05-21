CREATE DATABASE exemplo1;

USE exemplo1;

CREATE TABLE medico(
codigo int PRIMARY KEY,
cpf char(11) UNIQUE NOT NULL,
crm char(9) UNIQUE,
nome varchar(50)
);

DESCRIBE medico;

CREATE TABLE paciente(
codigo int PRIMARY KEY AUTO_INCREMENT,
cpf char(11) UNIQUE NOT NULL,
nome varchar(50)
);

describe paciente;

create table atende(
fk_medico_codigo int,
fk_paciente_codigo int
);

describe atende;

ALTER TABLE medico
MODIFY COLUMN cpf char(11) NOT NULL;

ALTER TABLE medico
MODIFY COLUMN codigo int AUTO_INCREMENT;

alter table medico
modify column crm char(9) not null;

ALTER TABLE paciente
MODIFY COLUMN cpf char(11) NOT NULL;

DESCRIBE atende;

ALTER TABLE atende
DROP COLUMN fk_paciente_codigo;

ALTER TABLE atende
ADD CONSTRAINT FOREIGN KEY(fk_medico_codigo) REFERENCES medico(codigo);

ALTER TABLE atende
ADD COLUMN fk_paciente_codigo int;

ALTER TABLE atende
ADD CONSTRAINT fk_paciente_codigo FOREIGN KEY(fk_paciente_codigo) REFERENCES paciente(codigo);