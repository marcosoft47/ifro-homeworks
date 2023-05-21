# Sistema KareKones
# Ana Vitória, Kayo Cavilia, Lucas Vieira, Marco Rigon, Raiane Brito, Wallyson Gabriel.

# Cadastrar endereço, cadastrar cliente, cadastrar funcionário, cadastrar produto, cadastrar lanches, cadastrar mesas,
# cadastrar pedido, controlar caixa, receber pedido, entregar pedido, cadastrar despesa, pagar despesa;

create database karekones;
use karekones;

create table produto (
cod_prod int not null primary key auto_increment,
marca_prod varchar(50),
nome_prod varchar(50), 
UND_prod int,
preco_prod double,
estoque_prod int
);

create table mesa (
cod_mesa int not null primary key auto_increment,
numero_mesa int,
local_mesa varchar (40),
status_mesa varchar(25)
);

create table endereco (
cod_end int not null primary key auto_increment,
rua_end varchar (100),
numero_end int,
bairro_end varchar (100),
cidade_end varchar (50),
UF_end varchar (2)
);

create table cliente (
cod_cli int not null primary key auto_increment,
nome_cli varchar (100),
CPF_cli float,
RG_cli int,
telefone_cli float,
email_cli varchar (50),
cod_end_fk int not null,
foreign key (cod_end_fk) references endereco (cod_end)
);

create table funcionario (
cod_func  int not null primary key auto_increment,
nome_func varchar (100),
CPF_func float,
RG_func int,
telefone_func float,
email_func varchar (50),
funcao_func varchar(20),
cod_end_fk int not null,
foreign key (cod_end_fk) references endereco (cod_end)
);

create table usuario (
cod_user int not null primary key auto_increment,
nome_user varchar(30),
senha_user varchar(20),
pin_user varchar(4),
cod_func_fk int not null,
foreign key (cod_func_fk) references funcionario (cod_func)
);

create table lanche (
cod_lan  int not null primary key auto_increment,
nome_lan varchar (70),
ingredientes_lan varchar(120),
preco_lan double
);

create table pedido (
cod_ped int not null primary key auto_increment,
valor_ped double,
data_ped date,
cod_cli_fk int not null,
cod_mesa_fk int not null,
cod_func_fk int not null,
foreign key (cod_cli_fk) references cliente (cod_cli),
foreign key (cod_mesa_fk) references mesa (cod_mesa),
foreign key (cod_func_fk) references funcionario (cod_func) 
);

create table caixa(
cod_cai int not null primary key auto_increment,
saldo_inicial_cai double,
total_creditos_cai double,
total_debitos_cai double,
saldo_final_cai double,
data_cai date,
numero_cai int
); 

create table recebimento (
cod_rec int not null primary key auto_increment,
valor_rec double,
forma_recebimento_rec varchar(20),
cod_cai_fk int not null,
cod_ped_fk int not null,
foreign key (cod_ped_fk) references pedido (cod_ped),
foreign key (cod_cai_fk) references caixa (cod_cai) 
);

create table despesa (
cod_des int not null primary key auto_increment,
valor_des double,
fornecedor_des varchar (100),
data_vencimento date
);

create table pagamento(
cod_pag int not null primary key auto_increment,
valor_pag double,
forma_recebimento_pag varchar (100),
cod_cai_fk int not null,
cod_des_fk int not null,
foreign key (cod_cai_fk) references caixa (cod_cai),
foreign key (cod_des_fk) references despesa (cod_des) 
);

create table Pedido_Lanche (
cod_pedlan int not null primary key auto_increment,
quant_pedlan int,
cod_lan_fk int not null,
cod_ped_fk int not null,
foreign key (cod_ped_fk) references pedido (cod_ped),
foreign key (cod_lan_fk) references lanche (cod_lan) 
);

create table Pedido_Produto (
cod_pedprod int not null primary key auto_increment,
quant_pedprod int,
cod_prod_fk int not null,
cod_ped_fk int not null,
foreign key (cod_ped_fk) references pedido (cod_ped),
foreign key (cod_prod_fk) references produto (cod_prod) 
);


############### PROCEDIMENTOS #############

DELIMITER $$
CREATE PROCEDURE CadastrarProduto(marca varchar(50), nome varchar(50), UND int(11), preco double, estoque int(11))
BEGIN
	IF (estoque between 1 and 1000 and preco > 0) THEN
		INSERT INTO produto VALUES(null, marca, nome, und, preco, estoque);
        SELECT 'Produto cadastrado com sucesso!';
	ELSE
		SELECT 'Estoque tem que ser entre 0 e 1000, preço tem que ser maior que zero!';
	END IF;
END $$ DELIMITER ;

CALL CadastrarProduto('Coca-Cola', 'Coca-Cola', 10, 6, 50);


DELIMITER $$
CREATE PROCEDURE CadastrarMesa(numero int(11), localizacao varchar(40), estado varchar(25))
BEGIN
	declare testenumero int(11);
    declare testelocalizacao varchar(40);
    
	SELECT numero_mesa INTO testenumero FROM mesa WHERE numero_mesa = numero;
    SELECT local_mesa INTO testelocalizacao FROM mesa WHERE local_mesa = localizacao;
    
    IF (testenumero IS NULL) THEN
		IF (testelocalizacao IS NULL) THEN
			INSERT INTO mesa VALUES(null, numero, localizacao, estado);
            SELECT 'Mesa cadastrada' AS 'Confirmação';
		ELSE
			SELECT 'Local indisponível' AS 'Erro';
		END IF;
	ELSE
		SELECT 'Número indisponível' AS 'Erro';
	END IF;
END $$ DELIMITER ;

CALL CadastrarMesa(1, 'Lado esquerdo da porta', 'Vazio');
CALL CadastrarMesa(2, 'Lado direito da porta', 'Vazio');


DELIMITER $$
CREATE PROCEDURE CadastrarEndereco(rua varchar(100), numero int(11), bairro varchar(100), cidade varchar(50), estado varchar(2))
BEGIN
	declare testerua varchar(100);
	declare testenumero int(11);
	declare testebairro varchar(100);
	declare testecidade varchar(50);
	declare testeestado varchar(2);
    
    SELECT rua_end INTO testerua FROM endereco WHERE rua_end = rua;
    SELECT numero_end INTO testenumero FROM endereco WHERE numero_end = numero;
    SELECT bairro_end INTO testebairro FROM endereco WHERE bairro_end = bairro;
    SELECT cidade_end INTO testecidade FROM endereco WHERE cidade_end = cidade;
    SELECT UF_end INTO testeestado FROM endereco WHERE UF_end = estado;
    
    # Testa se já existe e se tudo está certinho ;)
    IF (testerua IS NOT NULL AND testebairro IS NOT NULL AND testecidade IS NOT NULL AND testeestado IS NOT NULL AND testenumero IS NOT NULL) THEN
        SELECT 'Endereço já existe no sistema' as 'Erro!';
	ELSE
		INSERT INTO endereco VALUES(null, rua, numero, bairro, cidade, estado);
        SELECT 'Endereço cadastrado' as 'Sucesso!';
    END IF;
END $$ DELIMITER ;

SELECT * FROM endereco;
CALL CadastrarEndereco('Daniel Comboni', 1234, 'União', 'Ouro Preto do Oeste', 'RO');
CALL CadastrarEndereco('Daniel Comboni', 1235, 'União', 'Ouro Preto do Oeste', 'RO');


DELIMITER $$
CREATE PROCEDURE CadastrarCliente(nome varchar(100), cpf float, rg int(11), telefone float, email varchar(50), endereco int)
BEGIN
	DECLARE testecpf float;
    DECLARE testerg int(11);
    
    SELECT CPF_cli INTO testecpf FROM cliente WHERE CPF_cli = cpf;
    SELECT RG_cli INTO testerg FROM cliente WHERE RG_cli = rg;
    
    IF (testecpf IS NULL) THEN
		IF (testerg IS NULL) THEN
			INSERT INTO cliente VALUES(null, nome, cpf, rg, telefone, email, endereco);
            SELECT 'Cliente registrado com sucesso' as 'Sucesso!';
		ELSE
			SELECT 'RG está em uso!' as 'Erro';
		END IF;
	ELSE
		SELECT 'CPF está em uso!' as 'Erro';
	END IF;
END $$ DELIMITER ;

CALL cadastrarcliente('Mark', 12345655, 1246578, 1234567891011, 'aeiou123@gmail.com', 1);
CALL cadastrarcliente('Mark', 1234565645, 12346578, 1234567891011, 'aeiou123@gmail.com', 1);

describe funcionario;
DELIMITER $$
CREATE PROCEDURE CadastrarFuncionario(nome varchar(100), cpf float, rg int(11), telefone float, email varchar(50), funcao varchar(20), endereco int(11))
BEGIN
	DECLARE testecpf float;
    DECLARE testerg int(11);
    
    SELECT CPF_func INTO testecpf FROM funcionario WHERE CPF_func = cpf;
    SELECT RG_func INTO testerg FROM funcionario WHERE RG_func = rg;
    
    IF (testecpf IS NULL) THEN
		IF (testerg IS NULL) THEN
			IF (funcao != '') THEN
				INSERT INTO funcionario VALUES(null, nome, cpf, rg, telefone, email, funcao, endereco);
				SELECT 'Funcionario registrado com sucesso' as 'Sucesso!';
			ELSE
				SELECT 'Funcionário precisa de uma função' as 'Erro';
			END IF;
		ELSE
			SELECT 'RG está em uso!' as 'Erro';
		END IF;
	ELSE
		SELECT 'CPF está em uso!' as 'Erro';
	END IF;
END $$ DELIMITER ;

CALL cadastrarfuncionario('John Doe', 12345655, 1246578, 1234567891011, 'aeiou123@gmail.com', 'Estoquista', 1);
CALL cadastrarfuncionario('John Doe', 12355655, 1245578, 1234567891011, 'aeiou123@gmail.com', 'Estoquista', 1);
CALL cadastrarfuncionario('Jane Doe', 52616515, 2245588, 1234567891011, 'aeiou123@gmail.com', 'Caixa', 1);

describe usuario;
DELIMITER $$
CREATE PROCEDURE CadastrarUsuario(nome varchar(30), senha varchar(20), pin varchar(4), funcionario int(11))
BEGIN
	declare testefuncionario int(11);
    SELECT cod_func INTO testefuncionario FROM funcionario WHERE cod_func = funcionario;
    
    IF (testefuncionario IS NOT NULL) THEN
		IF (length(senha) >= 8) THEN
			INSERT INTO usuario VALUES(null, nome, senha, pin, funcionario);
            SELECT 'Usuario registrado com sucesso!' as 'Sucesso!';
        ELSE
			SELECT 'Senha tem que ter mais de 8 digitos!' as 'Erro';
		END IF;
	ELSE
		SELECT 'Funcionário não existe!' as 'Erro';
	END IF;
END $$ DELIMITER ;

CALL CadastrarUsuario('batman123', 'password', '1234', 1);

describe lanche;
DELIMITER $$
CREATE PROCEDURE CadastrarLanche(nome varchar(70), ingredientes varchar(120), preco double)
BEGIN
	declare testenome varchar(70);
    SELECT nome_lan INTO testenome FROM lanche WHERE nome_lan = nome;
    
    IF (testenome IS NULL) THEN
		IF (preco > 0) THEN
			IF (length(nome) >= 3) THEN
				INSERT INTO lanche VALUES(null, nome, ingredientes, preco);
				SELECT 'Lanche registrado com sucesso!' as 'Sucesso!';
			ELSE
				SELECT 'Nome muito curto! (Precisa ter mais de 3 digitos)' as 'Erro';
			END IF;
		ELSE
			SELECT 'Preço tem que ser maior que zero!' as 'Erro';
		END IF;
    ELSE
		SELECT 'Nome de lanche já está registrado' as 'Erro';
	END IF;
END $$ DELIMITER ;

CALL CadastrarLanche('Podrão', 'Queijo, hamburguer, molho especial, tomate e um monte de outras coisas', 20);
CALL CadastrarLanche('X-Bacon', 'Queijo, hamburguer, molho especial, tomate e muito bacon', 15);

describe PEDIDO;
DELIMITER $$
CREATE PROCEDURE CadastrarPedido(cliente int, mesa int, funcionario int)
BEGIN
	declare testecliente int;
	declare testemesa int;
	declare testefuncionario int;
    
    SELECT cod_cli INTO testecliente FROM cliente WHERE cod_cli = cliente;
    SELECT cod_mesa INTO testemesa FROM mesa WHERE cod_mesa = mesa;
    SELECT cod_func INTO testefuncionario FROM funcionario WHERE cod_func = funcionario;
    
    IF (testecliente IS NOT NULL) THEN
		IF (testemesa IS NOT NULL) THEN
			IF (testefuncionario IS NOT NULL) THEN
				INSERT INTO Pedido VALUES(null, 0, curdate(), cliente, mesa, funcionario);
                SELECT 'Pedido registrado' as 'Sucesso!';
			ELSE
				SELECT 'Funcionario não existe!' as 'Erro!';
			END IF;
		ELSE
			SELECT 'Mesa não existe!' as 'Erro!';
		END IF;
    ELSE
		SELECT 'Cliente não existe!' as 'Erro!';
	END IF;
END $$ DELIMITER ;

select * from pedido;
call cadastrarpedido(2, 1, 1);

describe caixa;
DELIMITER $$
CREATE PROCEDURE CadastrarCaixa(numero int)
BEGIN
	declare testedata date;
    declare saldoinicial double;
    declare testenumero int;
    
    SELECT data_cai INTO testedata FROM caixa HAVING curdate();
    SELECT saldo_final_cai INTO saldoinicial FROM caixa HAVING max(cod_cai);
    SELECT numero_cai INTO testenumero FROM caixa WHERE numero_cai = testenumero;
    
    IF (saldoinicial IS NULL) THEN
		SET saldoinicial = 0;
	END IF;
    IF (testedata IS NULL) THEN
		IF (testenumero IS NULL) THEN
			INSERT INTO caixa VALUES(null, saldoinicial, 0, 0 , saldoinicial, curdate(), numero);
            SELECT 'Caixa cadastrado com sucesso' as 'Sucesso';
		ELSE
			SELECT 'Número de caixa já inserido' as 'Erro';
		END IF;
    ELSE
		SELECT 'Caixa de hoje já está registrada!' as 'Erro!';
	END IF;
END $$ DELIMITER ;

CALL CadastrarCaixa(1);


DELIMITER $$
CREATE PROCEDURE RegistrarRecebimento(valor double, forma varchar(20), caixa int, pedido int)
BEGIN
	DECLARE testecaixa int;
	DECLARE testepedido int;
    SELECT cod_cai INTO testecaixa FROM caixa WHERE cod_cai = caixa;
    SELECT cod_ped INTO testepedido FROM pedido WHERE cod_ped = pedido;
    
    IF (testecaixa IS NOT NULL) THEN
		IF (testepedido IS NOT NULL) THEN
			IF (valor IS NOT NULL AND valor != 0) THEN
				INSERT INTO recebimento VALUES(null, valor, forma, caixa, pedido);
                SELECT 'Recebimento registrado com sucesso!' as 'Sucesso';
			ELSE
				SELECT 'Valor Inválido!' as 'Erro';
			END IF;
		ELSE
			SELECT 'Pedido não existe!' as 'Erro';
		END IF;
    ELSE
		SELECT 'Caixa não existe!' as 'Erro';
	END IF;
END $$ DELIMITER ;

CALL registrarRecebimento(24, 'Dinheiro', 1, 1);

describe despesa;
DELIMITER $$
CREATE PROCEDURE RegistrarDespesa(valor double, fornecedor varchar(100), data_venci date)
BEGIN
	IF (valor > 0 AND valor IS NOT NULL) THEN
		IF (length(fornecedor) > 2) THEN
			INSERT INTO despesa VALUES(null, valor, fornecedor, data_venci);
            SELECT 'Despesa registrada com sucesso' as 'Sucesso';
		ELSE
			SELECT 'Nome do fornecedor tem que ter mais de duas letras' as 'Erro';
		END IF;
	ELSE
		SELECT 'Valor tem que ser maior que 0' as 'Erro';
	END IF;
END $$ DELIMITER ;

call registrardespesa(20, 'ABC', curdate());


describe pagamento;
DELIMITER $$
CREATE PROCEDURE RegistrarPagamento(valor double, forma varchar(20), caixa int, despesa int)
BEGIN
	DECLARE testecaixa int;
	DECLARE testedespesa int;
    SELECT cod_cai INTO testecaixa FROM caixa WHERE cod_cai = caixa;
    SELECT cod_des INTO testedespesa FROM despesa WHERE cod_des = despesa;
    
    IF (testecaixa IS NOT NULL) THEN
		IF (testedespesa IS NOT NULL) THEN
			IF (valor IS NOT NULL AND valor != 0) THEN
				INSERT INTO pagamento VALUES(null, valor, forma, caixa, despesa);
                SELECT 'Pagamento registrado com sucesso!' as 'Sucesso';
			ELSE
				SELECT 'Valor Inválido!' as 'Erro';
			END IF;
		ELSE
			SELECT 'Despesa não existe!' as 'Erro';
		END IF;
    ELSE
		SELECT 'Caixa não existe!' as 'Erro';
	END IF;
END $$ DELIMITER ;


CALL registrarpagamento(24, 'dinheiro', 1, 1);


describe pedido_lanche;
DELIMITER $$
CREATE PROCEDURE RegistrarPedidoLanche(quantidade double, lanche int, pedido int)
BEGIN
	DECLARE testelanche int;
	DECLARE testepedido int;
    SELECT cod_lan INTO testelanche FROM lanche WHERE cod_lan = lanche;
    SELECT cod_ped INTO testepedido FROM pedido WHERE cod_ped = pedido;
    
    IF (testelanche IS NOT NULL) THEN
		IF (testepedido IS NOT NULL) THEN
			IF (quantidade IS NOT NULL AND quantidade != 0) THEN
				INSERT INTO Pedido_Lanche VALUES(null, quantidade, lanche, pedido);
                SELECT 'Lanche registrado no pedido com sucesso!' as 'Sucesso';
			ELSE
				SELECT 'Quantidade Inválida!' as 'Erro';
			END IF;
		ELSE
			SELECT 'Pedido não existe!' as 'Erro';
		END IF;
    ELSE
		SELECT 'Lanche não existe!' as 'Erro';
	END IF;
END $$ DELIMITER ;


call registrarpedidolanche(1, 1, 1);


DELIMITER $$
CREATE PROCEDURE RegistrarPedidoProduto(quantidade double, produto int, pedido int)
BEGIN
	DECLARE testeproduto int;
	DECLARE testepedido int;
    SELECT cod_prod INTO testeproduto FROM produto WHERE cod_prod = produto;
    SELECT cod_ped INTO testepedido FROM pedido WHERE cod_ped = pedido;
    
    IF (testeproduto IS NOT NULL) THEN
		IF (testepedido IS NOT NULL) THEN
			IF (quantidade IS NOT NULL AND quantidade != 0) THEN
				INSERT INTO Pedido_produto VALUES(null, quantidade, produto, pedido);
                SELECT 'Produto registrado no pedido com sucesso!' as 'Sucesso';
			ELSE
				SELECT 'Quantidade Inválida!' as 'Erro';
			END IF;
		ELSE
			SELECT 'Pedido não existe!' as 'Erro';
		END IF;
    ELSE
		SELECT 'Produto não existe!' as 'Erro';
	END IF;
END $$ DELIMITER ;


call registrarpedidoproduto(1, 1, 1);