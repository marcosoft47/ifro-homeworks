#Dupla: Ana Vitória Ferreira, Marco Rigon
CREATE DATABASE BD_AnaMarco;
USE BD_AnaMarco;

CREATE TABLE Produto (
cod_prod INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome_prod VARCHAR(50),
preco_prod DOUBLE,
estoque_prod INTEGER
);

CREATE TABLE Venda(
cod_vend INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
valor_vend DOUBLE,
data_vend DATE,
cod_caixafk INTEGER NOT NULL,

FOREIGN KEY (cod_caixafk) REFERENCES caixa (cod_caixa)
);

CREATE TABLE Produto_venda(
cod_prodvend INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
quant_prodvend INTEGER,
cod_prodfk INTEGER NOT NULL,
cod_vendfk INTEGER NOT NULL,

FOREIGN KEY (cod_prodfk) REFERENCES Produto (cod_prod),
FOREIGN KEY (cod_vendfk) REFERENCES Venda (cod_vend)
);

CREATE TABLE Caixa(
cod_caixa INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
credito_caixa DOUBLE,
debito_caixa DOUBLE,
saldo_caixa DOUBLE
);

INSERT INTO Caixa VALUES (null, 200, 50, 150);

#EXERCÍCIOS

#1 

delimiter $$
CREATE PROCEDURE InserirRegistroProduto(nome VARCHAR(100), preco DOUBLE, estoque INTEGER)
BEGIN
	IF (preco > 0) THEN
		IF (estoque > 0) THEN
			IF (estoque < 1000) THEN
				INSERT INTO Produto VALUES(null, nome, preco, estoque);
                SELECT 'Produto cadastrado com sucesso' as 'Mensagem';
			ELSE
				SELECT 'Estoque tem que ser menor que Mil' as 'Erro';
			END IF;
		ELSE
			SELECT 'Estoque tem que ser maior que Zero' as 'Erro';
		END IF;
	ELSE
		SELECT 'Preço tem que ser maior que Zero!' as 'Erro';
	END IF;
END $$ delimiter ;

CALL InserirRegistroProduto ('Arroz 5Kg', 9.90, 10);
CALL InserirRegistroProduto ('Feijão 1Kg', 4.50, 5);
CALL InserirRegistroProduto ('Chocolate em pó 500g', 6, 5);
CALL InserirRegistroProduto ('Leite UHT 1Lt', 3.50, 5);

#2

DELIMITER $$
CREATE PROCEDURE InserirRegistroCaixa(codigoCaixaAnterior int, credito double)
BEGIN
	DECLARE saldoanterior double;
    SELECT saldo_caixa INTO saldoanterior FROM caixa WHERE cod_caixa = codigoCaixaAnterior;
    SET credito = credito + saldoanterior;
    
    INSERT INTO Caixa VALUES(null, credito, 0, credito);
    SELECT 'Caixa registrado com sucesso!' as 'Mensagem';
END $$ DELIMITER ;

CALL InserirRegistroCaixa(1, 450);

#3

DELIMITER $$
CREATE PROCEDURE NovaVenda(dataAtual date)
BEGIN
	INSERT INTO Venda VALUES(null, 0, dataAtual, 1);
    SELECT 'Nova Venda Registrada' as 'Mensagem';
END $$ DELIMITER ;

CALL NovaVenda(curdate());
CALL NovaVenda(curdate());

#4

describe venda;
DELIMITER $$
CREATE PROCEDURE InserirRegistroProdutoVenda(codigo_produto INTEGER, quantidade INTEGER, codigo_venda INTEGER, codigo_caixa INTEGER)
BEGIN
	DECLARE estoque INTEGER;
    DECLARE valor DOUBLE;
    SELECT estoque_prod INTO estoque FROM produto WHERE cod_prod = codigo_produto;
    SELECT preco_prod INTO valor FROM produto WHERE cod_prod = codigo_produto;
    
    IF (quantidade <= estoque) THEN
		INSERT INTO Produto_Venda VALUES (null, quantidade, codigo_produto, codigo_venda);
        UPDATE Venda SET cod_caixafk = codigo_caixa WHERE cod_vend = codigo_venda;
        SELECT 'Produto registrado na venda!' as 'Mensagem';
	ELSE
		SELECT 'Não há estoque suficiente para a compra.' as 'Erro';
	END IF;
END $$ DELIMITER ;


CALL InserirRegistroProdutoVenda(1, 3, 1, 1);
CALL InserirRegistroProdutoVenda(2, 2, 1, 1);
CALL InserirRegistroProdutoVenda(3, 1, 1, 1);


#5

DELIMITER $$
CREATE TRIGGER AtualizarCaixa AFTER UPDATE ON Venda FOR EACH ROW
BEGIN
	UPDATE Caixa SET credito_caixa = credito_caixa + NEW.valor_vend WHERE cod_caixa = NEW.cod_caixafk;
    UPDATE Caixa SET saldo_caixa = saldo_caixa + credito_caixa - debito_caixa WHERE cod_caixa = NEW.cod_caixafk;
END $$ DELIMITER ;

select * from VENDA;
select * from caixa;

drop trigger AtualizarCaixa;
CALL InserirRegistroProdutoVenda(1, 1, 1, 1);

#6

DELIMITER $$
CREATE TRIGGER AtualizarVenda AFTER INSERT ON Produto_Venda FOR EACH ROW
BEGIN
	DECLARE preco DOUBLE;
    SELECT preco_prod INTO preco FROM produto WHERE NEW.cod_prodfk = cod_prod;
    
	UPDATE Venda SET valor_vend = valor_vend + preco * NEW.quant_prodvend WHERE cod_vend = NEW.cod_vendfk;
    UPDATE Produto SET estoque_prod = estoque_prod - NEW.quant_prodvend WHERE cod_prod = NEW.cod_prodfk; 
END $$ DELIMITER ;

drop trigger AtualizarVEnda;
SELECT * FROM VENDA;
SELECT * FROM produto;


CALL InserirRegistroProdutoVenda(3, 2, 2, 2);