set search_path to mac439_aula10;

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
ORDER BY tipo, preco DESC;


-- D) Encontre os modelos dos produtos dos fabricantes cujo nome começa com uma letra que está
--entre as 5 primeiras do alfabeto. O resultado deve aparecer ordenado em ordem crescente de nome
--de fabricante.

SELECT modelo
FROM produto
WHERE (fabricante LIKE 'A%' or fabricante LIKE 'B%' or fabricante LIKE 'C%' or fabricante LIKE 'D%' or fabricante LIKE 'E%')
ORDER BY fabricante;

--E) Encontre os tipos de produtos vendidos pelos fabricantes que possuem 3 ou mais palavras em seu
--nome, sendo que uma dessas palavras é HW.

SELECT tipo
FROM produto
WHERE (fabricante LIKE 'HW % %' or fabricante LIKE '% HW %' or fabricante LIKE '% % HW');

--F) Encontre os tipos de produtos vendidos pelos fabricantes que possuem exatamente 2 palavras em
--seu nome.

SELECT tipo
FROM produto
WHERE (fabricante LIKE '% %' and fabricante NOT LIKE '% % %');


--G) Encontre os fabricantes e modelos das impressoras coloridas que não são do tipo ink-jet.
SELECT produto.fabricante, produto.modelo
FROM produto, impressora
WHERE (produto.tipo = 'impressora' and impressora.colorida = 'true' and impressora.tipo != 'ink-jet' and produto.modelo = impressora.modelo);

--H) Encontre os fabricantes que vendem tanto impressoras quanto PCs. 
SELECT DISTINCT p1.fabricante
FROM produto p1, produto p2
WHERE (p1.tipo = 'impressora' and p2.tipo = 'pc' and p1.fabricante = p2.fabricante);

-- I) Encontre as velocidades que aparecem em mais de um PC. 
SELECT DISTINCT p.velocidade
FROM pc p, pc q
WHERE (p.modelo != q.modelo and p.velocidade = q.velocidade);


-- J) Encontre os pares de modelos de Laptop (i,j) tais que i e j possuem a mesma velocidade e a
--diferença entre os seus preços é menor que R$500,00. Mas atenção: se um par de modelos (i,j) for
--listado, então o par (j,i) não deve ser listado.

SELECT i.modelo, j.modelo
FROM laptop i, laptop j
WHERE (i.velocidade = j.velocidade and ((i.preco >= j.preco and i.preco - j.preco < 500) or (i.preco < j.preco and j.preco - i.preco < 500)) and
 i.modelo != j.modelo and i.modelo < j.modelo);

-- K) Liste o fabricante, o modelo e o preço de todos os produtos que aparecem no BD.

(SELECT fabricante, produto.modelo, preco 
	FROM produto, pc
	WHERE produto.modelo = pc.modelo)
 UNION 
 (SELECT fabricante, produto.modelo, preco
	FROM produto, impressora
	WHERE produto.modelo = impressora.modelo)
 UNION 
 (SELECT fabricante, produto.modelo, preco 
	FROM produto, laptop
	WHERE produto.modelo = laptop.modelo);