#######################################################
#####  Primeiramente, vamos fazer o exercício 1   #####
#######################################################
USE exercicio1;

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES ("Mateus Enrique Bezerra Rodrigues", "6910203040", "01221332143");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES ("Lucas Henrique Silva Riberio", "6999876543", "65431189631");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES ("Péricles Ribeiro", "11687123676","65432354871");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES ("Maria Silva", "12368954862", "56987413678");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES ("Joãozinho Ribeiro", "11653264987", "32654987123");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES ("Kayke João", "36654987123", "21365498654");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES ("Alexandre Pires", "65321654834", "03265973512");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES ("Ferrugem Silva", "11235698241", "96503215601");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES ("Clarice Lispector", "56322659833", "02233165987");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES ("Machado de Assis", "55323060598", "12032010654");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES ("Carlos Drummond", "69102305680", "65329841230");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES ("Monteiro Lobato", "55369846520", "65321059841");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES("Adrian Henrique Ferreira", "69998574125", "14578965412");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES("Danilo Saiter da Silva", "5422417521", "47854785478");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES("Adriano Alves ", "92547968534", "12457896321");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES("Claitin Dos Santos", "94789312547", "98745632145");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES("Juarez Madeira", "92547893544", "45698714526");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES("Carlos Pinheiro", "96321547824", "4569871325");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES("Mario Osoria", "96321548524", "69854712358");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES("Julia da Fonseca", "98745622258", "58741235698");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES("Roberto Carlos", "98744456322", "21478596318");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES("Neymar Junior", "9657413548", "57896412589");

INSERT INTO pessoa_fisica (nome, telefone, cpf)
VALUES("Diego Alvez", "96587436478", "78950412357");


##################################################

INSERT INTO carro (preco, modelo)
VALUES (5000, "Ford KA");

INSERT INTO carro (preco, modelo)
VALUES (7000, "Gol 5º Geração");

INSERT INTO carro (preco, modelo)
VALUES (70000, "BMW M3");

INSERT INTO carro (preco, modelo)
VALUES (25000, "Strada Adventure");

INSERT INTO carro (preco, modelo)
VALUES (45000, "Ford RANGER");

INSERT INTO carro (preco, modelo)
VALUES (35000, "Jetta 2020");

INSERT INTO carro (preco, modelo)
VALUES(100000,"Chevrolet Onix");

INSERT INTO carro (preco, modelo)
VALUES(80000,"HB20 2.0 Turbo ");

INSERT INTO carro (preco, modelo)
VALUES(200000,"Chevrolet Camaro");

INSERT INTO carro (preco, modelo)
VALUES(300000,"Range Rovert Evoque ");

INSERT INTO carro (preco, modelo)
VALUES(90000,"Toyota Etios");


##################################

INSERT INTO acessorio (descricao)
VALUES ("Lâmpada super branca");

INSERT INTO acessorio (descricao)
VALUES ("Abafador esportivo");

INSERT INTO acessorio (descricao)
VALUES ("Escapamento esportivo");

INSERT INTO acessorio (descricao)
VALUES ("Rodas de Liga Leve");

INSERT INTO acessorio (descricao)
VALUES ("Alarme imbutido na chave");

INSERT INTO acessorio (descricao)
VALUES("Airbag dublo lateral");

INSERT INTO acessorio (descricao)
VALUES("Carlota Cromada");

INSERT INTO acessorio (descricao)
VALUES("Antena para Radio");

INSERT INTO acessorio (descricao)
VALUES("Airbag dublo lateral");

INSERT INTO acessorio (descricao)
VALUES("Carlota Cromada");

INSERT INTO acessorio (descricao)
VALUES("Antena para Radio");


############################
INSERT INTO concessionaria (razao_social, cnpj, endereco_logradouro,endereco_numero,endereco_bairro,endereco_cep,endereco_cidade,endereco_uf)
VALUES("Cleitin Do Celta CDC", "98542136547895","Avenido Brasil", 5478, "bairro Residencial Alberto", "76921473", " São Paulo", "SP");

INSERT INTO concessionaria(razao_social, cnpj, endereco_logradouro,endereco_cep, endereco_bairro,endereco_cidade,endereco_uf, endereco_numero)
VALUES ("Concessionaria A & A", "03265413592", "Rua Tiradentes", "12345678", "Bairro Vilela", "Porto Velhor", "RO", "2030");

#####################################
INSERT INTO vendedor (salario, fk_pessoa_fisica_codigo, fk_concessionaria_codigo)
VALUES(3000, 1, 1);

INSERT INTO vendedor (salario, fk_pessoa_fisica_codigo, fk_concessionaria_codigo)
VALUES(2000, 2, 1);

INSERT INTO vendedor (salario, fk_pessoa_fisica_codigo, fk_concessionaria_codigo)
VALUES(10000, 3, 1);

SELECT * FROM vendedor;


##############################
INSERT INTO oficina (cnpj, razao_social)
VALUES ("32659874123", "Juninho Oficina");

INSERT INTO oficina (cnpj, razao_social)
VALUES("54789547478","Tabajara Ofinica");



SELECT * FROM oficina;

##############
SELECT * FROM pessoa_fisica;
SELECT * FROM cliente;
INSERT INTO cliente (fk_pessoa_fisica_codigo)
VALUES(1);

INSERT INTO cliente (fk_pessoa_fisica_codigo)
VALUES(2);

INSERT INTO cliente (fk_pessoa_fisica_codigo)
VALUES(3);

INSERT INTO cliente (fk_pessoa_fisica_codigo)
VALUES(4);

INSERT INTO cliente (fk_pessoa_fisica_codigo)
VALUES(5);

INSERT INTO cliente (fk_pessoa_fisica_codigo)
VALUES(6);

INSERT INTO cliente (fk_pessoa_fisica_codigo)
VALUES(7);

INSERT INTO cliente (fk_pessoa_fisica_codigo)
VALUES(8);

INSERT INTO cliente (fk_pessoa_fisica_codigo)
VALUES(9);

INSERT INTO cliente (fk_pessoa_fisica_codigo)
VALUES(10);



##########################

UPDATE carro
SET fk_cliente_codigo = 10
WHERE codigo = 5;

UPDATE carro
SET fk_vendedor_codigo = 1
WHERE codigo = 1;


UPDATE vendedor
SET fk_concessionaria_codigo = 1
WHERE fk_pessoa_fisica_codigo =1;
UPDATE vendedor
SET fk_concessionaria_codigo = 1
WHERE fk_pessoa_fisica_codigo =10;
UPDATE vendedor
SET fk_concessionaria_codigo = 3
WHERE fk_pessoa_fisica_codigo =12;

#########################

UPDATE cliente
SET fk_concessionaria_codigo = 1
WHERE fk_pessoa_fisica_codigo =2;
UPDATE cliente
SET fk_concessionaria_codigo = 1
WHERE fk_pessoa_fisica_codigo =3;

INSERT INTO assisti (fk_carro_codigo, fk_oficina_codigo) 
VALUES (5,1);
INSERT INTO assisti (fk_carro_codigo, fk_oficina_codigo) 
VALUES (2,1);


INSERT INTO possui (fk_carro_codigo, fk_acessorio_codigo) 
VALUES (3,3);
INSERT INTO possui (fk_carro_codigo, fk_acessorio_codigo) 
VALUES (3,1);



#######################################################
###########          Exercício 2            ###########
#######################################################
USE exercicio2;

INSERT INTO associado (nome, sexo)
VALUES ("José Aparecido", "M");

INSERT INTO associado (nome, sexo)
VALUES ("Maria Silva", "F");

INSERT INTO associado (nome, sexo)
VALUES ("Ana Clarice", "F");

INSERT INTO associado (nome, sexo)
VALUES ("Arthur Augusto", "M");

INSERT INTO associado (nome, sexo)
VALUES ("Lara Ribeiro", "F");

INSERT INTO associado (nome, sexo)
VALUES ("Maria Clara", "F");

INSERT INTO associado (nome, sexo)
VALUES ("Enzo Rodrigues", "M");

INSERT INTO associado (nome, sexo)
VALUES ("Heitor Camargo", "M");

INSERT INTO associado (nome, sexo)
VALUES ("Joana Silva", "F");

SELECT * FROM associado;

INSERT INTO assunto (assunto)
VALUES ("Programação C#");

INSERT INTO assunto (assunto)
VALUES ("Banco de Dados");

INSERT INTO assunto (assunto)
VALUES ("Análise de Sistemas");

INSERT INTO assunto (assunto)
VALUES ("Análise de Dados");

INSERT INTO assunto (assunto)
VALUES ("Drama");

INSERT INTO assunto (assunto)
VALUES ("Comédia");

SELECT * FROM assunto;

INSERT INTO livro (isbn, titulo)
VALUES ("02365412369852", "Livro1");

INSERT INTO livro (isbn, titulo)
VALUES ("6325412396231", "Livro2");

INSERT INTO livro (isbn, titulo)
VALUES ("532649813521", "Livro3");

INSERT INTO livro (isbn, titulo)
VALUES ("4563120650940", "Livro4");

INSERT INTO livro (isbn, titulo)
VALUES ("6325491356429", "Livro5");

####################################

INSERT INTO autor (nome)
VALUES ("Aristóteles");

INSERT INTO autor (nome)
VALUES ("Danilo Escudero");

INSERT INTO autor (nome)
VALUES ("Jackson");

INSERT INTO autor (nome)
VALUES ("Ariano Suassuna");

INSERT INTO autor (nome)
VALUES ("J.K. Rowling");

INSERT INTO reserva (data_reserva, fk_associado_matricula, fk_livro_codigo)
VALUES ("2020/04/05", 1,1); 

INSERT INTO reserva (data_reserva, fk_associado_matricula, fk_livro_codigo)
VALUES ("2020/04/05", 2,1); 


########################################################

INSERT INTO associado (nome, sexo) VALUES ("Wester Jesuíno", "M");
INSERT INTO associado (nome, sexo) VALUES ("Felipe Hoffmann", "M");
INSERT INTO associado (nome, sexo) VALUES ("Caian Henrique", "M");
INSERT INTO associado (nome, sexo) VALUES ("Alyne Pereira", "F");
INSERT INTO associado (nome, sexo) VALUES ("Hêmilly Priscila", "F");
INSERT INTO associado (nome, sexo) VALUES ("Gabriella Gomes", "F");
INSERT INTO associado (nome, sexo) VALUES ("Júlia Cardoso", "F");
INSERT INTO associado (nome, sexo) VALUES ("Milêna Lucas", "F");

INSERT INTO assunto (assunto)
VALUES("Drama");
INSERT INTO assunto (assunto)
VALUES("Romance");
INSERT INTO assunto (assunto)
VALUES("Comédia");
INSERT INTO assunto (assunto)
VALUES("Aventura");
INSERT INTO assunto (assunto)
VALUES("Poesia");

INSERT INTO autor (nome)
VALUES("Clarisse Lispector");
INSERT INTO autor (nome)
VALUES("Machado de Assis");
INSERT INTO autor (nome)
VALUES("Chico Xavier");
INSERT INTO autor (nome)
VALUES("Monteiro Lobato");
INSERT INTO autor (nome)
VALUES("José de Alencar");

INSERT INTO biblioteca (descricao, endereco_logradouro, endereco_numero, endereco_bairro, endereco_cep, endereco_cidade, endereco_uf)
VALUES(" perto do shopping", "Maringá", "5000", "Liberdade", "76921000", "Nova União", "SP");
INSERT INTO biblioteca (descricao, endereco_logradouro, endereco_numero, endereco_bairro, endereco_cep, endereco_cidade, endereco_uf)
VALUES(" ", "Olinda", "70", "Novo Estado", "76922000", "Texeirópolis", "RN");

UPDATE biblioteca 
SET descricao="Banca do seu zé" 
WHERE codigo=2;
UPDATE biblioteca 
SET descricao="Perto do shopping" 
WHERE codigo=1;

describe livro;
INSERT INTO livro (isbn, titulo)
VALUES("aa11", "O Caçador de Pipas");
INSERT INTO livro (isbn, titulo)
VALUES("bb22", "Fahrenheit 451");
INSERT INTO livro (isbn, titulo)
VALUES("cc33", "Orgulho e Preconceito");
INSERT INTO livro (isbn, titulo)
VALUES("dd44", "A Culpa é das Estrelas");
INSERT INTO livro (isbn, titulo)
VALUES("ee55", "Divina Comédia");
INSERT INTO livro (isbn, titulo)
VALUES("ff66", "Comédias para se ler na Escola");
INSERT INTO livro (isbn, titulo)
VALUES("gg77", "Alice no País das Maravilhas");
INSERT INTO livro (isbn, titulo)
VALUES("hh88", "Robinson Crusoe");
INSERT INTO livro (isbn, titulo)
VALUES("ii99", "Outros Jeitos de Usar a Boca");
INSERT INTO livro (isbn, titulo)
VALUES("jj1010", "Tudo Nela Brilha e Queima");

SELECT * FROM livro;

UPDATE livro 
SET fk_biblioteca_codigo=1 
WHERE codigo=1;
UPDATE livro 
SET fk_biblioteca_codigo=1 
WHERE codigo=2;
UPDATE livro 
SET fk_biblioteca_codigo=1 
WHERE codigo=3;
UPDATE livro 
SET fk_biblioteca_codigo=1 
WHERE codigo=4;
UPDATE livro 
SET fk_biblioteca_codigo=1 
WHERE codigo=5;
UPDATE livro 
SET fk_biblioteca_codigo=2 
WHERE codigo=6;
UPDATE livro 
SET fk_biblioteca_codigo=2 
WHERE codigo=7;
UPDATE livro 
SET fk_biblioteca_codigo=2 
WHERE codigo=8;
UPDATE livro 
SET fk_biblioteca_codigo=2 
WHERE codigo=9;
UPDATE livro 
SET fk_biblioteca_codigo=2 
WHERE codigo=10;

describe aborda;
INSERT INTO aborda (fk_Assunto_codigo, fk_Livro_codigo)
VALUES(1, 1);
INSERT INTO aborda (fk_Assunto_codigo, fk_Livro_codigo)
VALUES(1, 2);
INSERT INTO aborda (fk_Assunto_codigo, fk_Livro_codigo)
VALUES(2, 3);
INSERT INTO aborda (fk_Assunto_codigo, fk_Livro_codigo)
VALUES(2, 4);
INSERT INTO aborda (fk_Assunto_codigo, fk_Livro_codigo)
VALUES(3, 5);
INSERT INTO aborda (fk_Assunto_codigo, fk_Livro_codigo)
VALUES(3, 6);
INSERT INTO aborda (fk_Assunto_codigo, fk_Livro_codigo)
VALUES(4, 7);
INSERT INTO aborda (fk_Assunto_codigo, fk_Livro_codigo)
VALUES(4, 8);
INSERT INTO aborda (fk_Assunto_codigo, fk_Livro_codigo)
VALUES(5, 9);
INSERT INTO aborda (fk_Assunto_codigo, fk_Livro_codigo)
VALUES(5, 10);

SELECT * FROM aborda;

DELETE FROM aborda WHERE fk_Livro_codigo = 10;

describe cadastra;
INSERT INTO cadastra (fk_Biblioteca_codigo, fk_Associado_matricula)
VALUES(1, 1);
INSERT INTO cadastra (fk_Biblioteca_codigo, fk_Associado_matricula)
VALUES(1, 2);
INSERT INTO cadastra (fk_Biblioteca_codigo, fk_Associado_matricula)
VALUES(1, 3);
INSERT INTO cadastra (fk_Biblioteca_codigo, fk_Associado_matricula)
VALUES(1, 4);
INSERT INTO cadastra (fk_Biblioteca_codigo, fk_Associado_matricula)
VALUES(1, 5);
INSERT INTO cadastra (fk_Biblioteca_codigo, fk_Associado_matricula)
VALUES(2, 6);
INSERT INTO cadastra (fk_Biblioteca_codigo, fk_Associado_matricula)
VALUES(2, 7);
INSERT INTO cadastra (fk_Biblioteca_codigo, fk_Associado_matricula)
VALUES(2, 8);
INSERT INTO cadastra (fk_Biblioteca_codigo, fk_Associado_matricula)
VALUES(2, 9);
INSERT INTO cadastra (fk_Biblioteca_codigo, fk_Associado_matricula)
VALUES(2, 10);

DELETE FROM cadastra WHERE fk_Associado_matricula = 10;

INSERT INTO escreve (fk_Autor_codigo, fk_Livro_codigo)
VALUES(1, 1);
INSERT INTO escreve (fk_Autor_codigo, fk_Livro_codigo)
VALUES(1, 2);
INSERT INTO escreve (fk_Autor_codigo, fk_Livro_codigo)
VALUES(2, 3);
INSERT INTO escreve (fk_Autor_codigo, fk_Livro_codigo)
VALUES(2, 4);
INSERT INTO escreve (fk_Autor_codigo, fk_Livro_codigo)
VALUES(3, 5);
INSERT INTO escreve (fk_Autor_codigo, fk_Livro_codigo)
VALUES(3, 6);
INSERT INTO escreve (fk_Autor_codigo, fk_Livro_codigo)
VALUES(4, 7);
INSERT INTO escreve (fk_Autor_codigo, fk_Livro_codigo)
VALUES(5, 8);
INSERT INTO escreve (fk_Autor_codigo, fk_Livro_codigo)
VALUES(5, 9);
INSERT INTO escreve (fk_Autor_codigo, fk_Livro_codigo)
VALUES(5, 10);

DELETE FROM escreve WHERE fk_Livro_codigo = 10;

INSERT INTO reserva (fk_Livro_codigo, fk_Associado_matricula, data_reserva)
VALUES(1, 1, "2020/1/1");
INSERT INTO reserva (fk_Livro_codigo, fk_Associado_matricula, data_reserva)
VALUES(2, 2, "2020/1/2");
INSERT INTO reserva (fk_Livro_codigo, fk_Associado_matricula, data_reserva)
VALUES(3, 3, "2020/1/3");
INSERT INTO reserva (fk_Livro_codigo, fk_Associado_matricula, data_reserva)
VALUES(4, 4, "2020/1/4");
INSERT INTO reserva (fk_Livro_codigo, fk_Associado_matricula, data_reserva)
VALUES(5, 5, "2020/1/5");
INSERT INTO reserva (fk_Livro_codigo, fk_Associado_matricula, data_reserva)
VALUES(6, 6, "2020/1/6");
INSERT INTO reserva (fk_Livro_codigo, fk_Associado_matricula, data_reserva)
VALUES(7, 7, "2020/1/7");
INSERT INTO reserva (fk_Livro_codigo, fk_Associado_matricula, data_reserva)
VALUES(8, 8, "2020/1/8");
INSERT INTO reserva (fk_Livro_codigo, fk_Associado_matricula, data_reserva)
VALUES(9, 9, "2020/1/9");
INSERT INTO reserva (fk_Livro_codigo, fk_Associado_matricula, data_reserva)
VALUES(10, 1, "2020/1/10");
INSERT INTO reserva (fk_Livro_codigo, fk_Associado_matricula, data_reserva)
VALUES(1, 5, "2020/2/10");
INSERT INTO reserva (fk_Livro_codigo, fk_Associado_matricula, data_reserva)
VALUES(5, 1, "2020/2/10");

DELETE FROM reserva WHERE fk_Livro_codigo = 10;

SELECT * FROM associado;