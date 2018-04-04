﻿set search_path to mac439_aula10;

-- INICIO DAS CONCULTAS

-- A) Encontre a tuplas de Laptop que possuem um preço maior que o seu número de modelo.

SELECT *
FROM Laptop
WHERE preco > modelo;

-- B) Encontre o número do modelo, a velocidade e o preço para todos os PCs cuja velocidade está
--entre 1000 e 1500 MHz. Na resposta, renomeie a coluna de velocidade para processador e a coluna
--de preço para R$.

SELECT modelo, velocidade AS processador, preco AS R$
FROM pc
WHERE  velocidade >= 1000 and velocidade <= 1500;

-- C) Encontre os dados das impressoras do tipo ink-jet ou laser e que custem mais que R$380,00. O
--resultado deve aparecer em ordem crescente de tipo e decrescente de preço.

SELECT *
FROM impressora
WHERE (tipo = 'ink-jet' or tipo = 'laser') and preco > 380
ORDER BY preco DESC, tipo;


-- D) Encontre os modelos dos produtos dos fabricantes cujo nome começa com uma letra que está
--entre as 5 primeiras do alfabeto. O resultado deve aparecer ordenado em ordem crescente de nome
--de fabricante.

SELECT modelo
FROM produto
WHERE (fabricante LIKE 'A%' or fabricante LIKE 'B%' or fabricante LIKE 'C%' or fabricante LIKE 'D%' or fabricante LIKE 'E%')
ORDER BY fabricante;
