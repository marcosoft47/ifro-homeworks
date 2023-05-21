## QUESTÕES PARA A BASE DE DADOS "exercicio1" ##
################################################

USE exercicio1;
# 1. Faça uma consulta para mostrar todos os modelos de carros cadastrados com seus respectivos preços.

SELECT modelo, preco FROM carro;

# 2. Qual é o modelo de carro mais caro?

SELECT modelo, preco FROM carro
ORDER BY preco DESC
LIMIT 1;

# 3. Faça uma consulta que mostre apenas o nome de todos os clientes. O nome dos vendedores não deve aparecer.

SELECT nome FROM pessoa_fisica,
(SELECT fk_pessoa_fisica_codigo FROM cliente) AS nome_cliente
WHERE pessoa_fisica.codigo=nome_cliente.fk_pessoa_fisica_codigo;

# 4. Qual o nome da pessoa física que tem o CPF 96503215601? Imprima apenas o nome da pessoa.

SELECT nome FROM pessoa_fisica
WHERE cpf LIKE "96503215601";

# 5. Há quantos carros cadastrados no banco de dados?

SELECT count(codigo) FROM carro;

# 6. Construa uma consulta que mostre quantos acessorio o carro com codigo=1 possui.

SELECT fk_acessorio_codigo FROM possui
WHERE fk_carro_codigo = 1; 

## QUESTÕES PARA A BASE DE DADOS "exercicio2" ##
################################################

USE exercicio2;
# 1. Qual o nome do livro com codigo=1?

SELECT titulo FROM livro
WHERE codigo=1;

# 2. Qual o nome do autor que menos escreveu livros?

SELECT nome FROM autor,
(SELECT fk_autor_codigo, count(fk_autor_codigo) AS contagem FROM escreve
GROUP BY fk_autor_codigo
ORDER BY contagem
LIMIT 1) AS autor_nome
WHERE autor.codigo=autor_nome.fk_autor_codigo;

# 3. Faça uma consulta que apresente o nome de todos os associados em ordem alfabética.

SELECT nome FROM associado
ORDER BY nome ASC;

# 4. Faça uma consulta que apresente todas as reservas de livros ordenada por ordem da data.
#		A data mais antiga deve aparecer primeiro.

SELECT data_reserva FROM reserva
ORDER BY data_reserva ASC;

# 5. Faça uma consulta na tabela "aborda" que agrupe o fk_assunto_codigo e apresente a contagem de 
#		quantos livros que há em cada código de assunto.

SELECT fk_assunto_codigo, count(fk_assunto_codigo) AS contagem FROM  aborda
GROUP BY fk_assunto_codigo;

# 6. Apresente o nome dos 4 livros com o maior número de reservas.

DESCRIBE reserva;
DESCRIBE livro;
SELECT titulo FROM livro,
(SELECT fk_livro_codigo, count(fk_livro_codigo) AS contagem FROM reserva 
GROUP BY fk_livro_codigo
ORDER BY contagem DESC
LIMIT 4) AS mais_reserva
WHERE livro.codigo=mais_reserva.fk_livro_codigo;