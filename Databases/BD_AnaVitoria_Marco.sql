#Sistema de Controle de Gastos Domésticos
#Dupla: Ana Vitória Ferreira, Marco Rigon
create database BD_AnaVitoria_Marco;
use BD_AnaVitoria_Marco;

create table controle (
cod_cont int not null primary key auto_increment,
mes_cont varchar (100) not null,
saldoanterior_cont float not null,
totalrenda_cont float not null,
totalgastos_cont float not null,
saldofinal_cont float not null );
insert into controle values (null, 'Agosto/2020', 0, 4000, 1000, 3000 );
create table renda (
cod_ren int not null primary key auto_increment,
referencia_ren varchar (100) not null,
valor_ren float not null,
data_ren date,
cod_cont_fk int not null,
foreign key (cod_cont_fk) references Controle (cod_cont) );
insert into renda values (null, 'Salario Marido', 2000, '2020-08-05', 1);
insert into renda values (null, 'Salario Esposa', 2000, '2020-08-05', 1);
create table gasto (
cod_gas int not null primary key auto_increment,
referencia_gas varchar (100) not null,
valor_gas float not null,
data_gas date,
cod_cont_fk int not null,
foreign key (cod_cont_fk) references Controle (cod_cont) );
insert into gasto values (null, 'Energia', 300, '2020-08-15', 1);
insert into gasto values (null, 'Aluguel', 600, '2020-08-20', 1);
insert into gasto values (null, 'Agua', 100, '2020-08-20', 1);

#### EXERCICÍOS #####

# 1

DELIMITER $$
CREATE PROCEDURE InserirControle (mes_referencia varchar(100))
BEGIN
	declare testemes varchar(100);
    declare saldopassado float;
    
    SELECT mes_cont INTO testemes FROM CONTROLE WHERE mes_referencia = mes_cont;
    SELECT saldofinal_cont INTO saldopassado FROM CONTROLE HAVING MAX(cod_cont);
    
	IF (testemes IS NOT NULL) THEN
		SELECT 'Mês já tem registro!';
	else
		INSERT INTO controle VALUES(null, mes_referencia, saldopassado, 0, 0, saldopassado);
		SELECT 'Mês registrado com sucesso!';
    END IF;
END $$ DELIMITER ;

CALL InserirControle ('Setembro/2020');


########## 2 #############

DELIMITER $$
CREATE TRIGGER InserirRenda AFTER INSERT ON Renda FOR EACH ROW
BEGIN
	UPDATE CONTROLE SET totalrenda_cont = totalrenda_cont + NEW.valor_ren WHERE cod_cont = new.cod_cont_fk;
	UPDATE CONTROLE SET saldofinal_cont = saldofinal_cont + NEW.valor_ren WHERE cod_cont = new.cod_cont_fk;
END $$ DELIMITER ;

DELIMITER $$
CREATE TRIGGER UpadteRenda AFTER UPDATE ON Renda FOR EACH ROW
BEGIN
	UPDATE CONTROLE SET totalrenda_cont = totalrenda_cont + NEW.valor_ren - OLD.valor_ren WHERE cod_cont = new.cod_cont_fk;
	UPDATE CONTROLE SET saldofinal_cont = saldofinal_cont + NEW.valor_ren - OLD.valor_ren WHERE cod_cont = new.cod_cont_fk;
END $$ DELIMITER ;

DELIMITER $$
CREATE TRIGGER DeleteRenda AFTER DELETE ON Renda FOR EACH ROW
BEGIN
	UPDATE CONTROLE SET totalrenda_cont = totalrenda_cont - OLD.valor_ren WHERE cod_cont = OLD.cod_cont_fk;
	UPDATE CONTROLE SET saldofinal_cont = saldofinal_cont - OLD.valor_ren WHERE cod_cont = OLD.cod_cont_fk;
END $$ DELIMITER ;




######## 3 ##########


DELIMITER $$
CREATE TRIGGER InserirGasto AFTER INSERT ON Gasto FOR EACH ROW
BEGIN
	UPDATE CONTROLE SET totalgastos_cont = totalgastos_cont + NEW.valor_gas WHERE cod_cont = new.cod_cont_fk;
	UPDATE CONTROLE SET saldofinal_cont = saldofinal_cont - NEW.valor_gas WHERE cod_cont = new.cod_cont_fk;
END $$ DELIMITER ;

DELIMITER $$
CREATE TRIGGER UpdateGasto AFTER UPDATE ON Gasto FOR EACH ROW
BEGIN
	UPDATE CONTROLE SET totalgastos_cont = totalgastos_cont + NEW.valor_gas - OLD.valor_gas WHERE cod_cont = new.cod_cont_fk;
	UPDATE CONTROLE SET saldofinal_cont = saldofinal_cont - NEW.valor_gas + OLD.valor_gas WHERE cod_cont = new.cod_cont_fk;
END $$ DELIMITER ;

DELIMITER $$
CREATE TRIGGER DeleteGasto AFTER DELETE ON Gasto FOR EACH ROW
BEGIN
	UPDATE CONTROLE SET totalgastos_cont = totalgastos_cont - OLD.valor_gas WHERE cod_cont = OLD.cod_cont_fk;
	UPDATE CONTROLE SET saldofinal_cont = saldofinal_cont + OLD.valor_gas WHERE cod_cont = OLD.cod_cont_fk;
END $$ DELIMITER ;


######### 4 ##########

DELIMITER $$
CREATE PROCEDURE InserirNovaRenda(descricao varchar(100), valor int, controle int)
BEGIN
	IF (valor > 0) THEN
		INSERT INTO Renda VALUES(null, descricao, valor, curdate(), controle);
        SELECT 'Renda Registrada';
	ELSE
		SELECT 'Valor tem que ser maior que ZERO';
	END IF;
END $$ DELIMITER ;

CALL InserirNovaRenda('Investimento', 1500, 2);
CALL InserirNovaRenda('Venda do Sofá', 3000, 2);
CALL InserirNovaRenda('Dívida do Sérgio', 10, 2);
CALL InserirNovaRenda('Doações da Igreja', 50, 2);

########### 5 ##############


DELIMITER $$
CREATE PROCEDURE InserirNovoGasto(descricao varchar(100), valor float, controle INT)
BEGIN
	DECLARE saldo float;
    SELECT saldofinal_cont INTO saldo FROM controle WHERE cod_cont = controle;
    
    IF (saldo >= valor) THEN
		INSERT INTO Gasto VALUES(null, descricao, valor, curdate(), controle);
		SELECT saldofinal_cont INTO saldo FROM controle WHERE cod_cont = controle;
        IF (saldo = 0) THEN
			SELECT concat('Saldo Final está ZERADO') AS RETORNO;
		ELSE
			SELECT concat('Saldo Final está POSITIVO : ', saldo) as RETORNO;
		END IF;
	ELSE
		INSERT INTO Gasto VALUES(null, descricao, valor, curdate(), controle);
		SELECT saldofinal_cont INTO saldo FROM controle WHERE cod_cont = controle;
        SELECT concat('Saldo Final está NEGATIVO : ', saldo) as RETORNO;
	END IF;

END $$ DELIMITER ;

CALL InserirNovoGasto('Mercado', 500, 2);
CALL InserirNovoGasto('Conta de Energia', 500, 2);
CALL InserirNovoGasto('Dívida pro agiota', 6000, 2);
CALL InserirNovoGasto('Compra do sofá', 560, 2);
CALL InserirNovoGasto('Jogo da Mega Sena', 6, 2);
