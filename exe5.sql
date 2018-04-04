create schema mac439_aula10;
set search_path to mac439_aula10;

-- cria a tabela produto
CREATE TABLE produto
(
  fabricante varchar(30),
  modelo int,
  tipo char(20)
) ;

-- cria a tabela pc
CREATE TABLE pc
(
  modelo int NOT NULL,
  velocidade int,
  ram int,
  hd float,
  cd char(2),
  preco numeric(6,2)
);

-- cria a tabela laptop
CREATE TABLE laptop
(
  modelo int,
  velocidade int,
  ram int,
  hd float,
  tela float,
  preco numeric(6,2)
);

-- cria a tabela impressora
CREATE TABLE impressora
(
  modelo int,
  colorida bool,
  tipo varchar(15),
  preco numeric(6,2)
);

-- popula a tabela produto
insert into produto (fabricante, modelo, tipo) values ('Astro do HW e SW', 1001, 'pc');
insert into produto (fabricante, modelo, tipo) values ('Astro do HW e SW', 1002, 'pc');
insert into produto (fabricante, modelo, tipo) values ('Astro do HW e SW', 1003, 'pc');
insert into produto (fabricante, modelo, tipo) values ('Astro do HW e SW', 2004, 'laptop');
insert into produto (fabricante, modelo, tipo) values ('Astro do HW e SW', 2005, 'laptop');
insert into produto (fabricante, modelo, tipo) values ('Astro do HW e SW', 2006, 'laptop');
insert into produto (fabricante, modelo, tipo) values ('Bom De Preco', 1004, 'pc');
insert into produto (fabricante, modelo, tipo) values ('Bom De Preco', 1005, 'pc');
insert into produto (fabricante, modelo, tipo) values ('Bom De Preco', 1006, 'pc');
insert into produto (fabricante, modelo, tipo) values ('Bom De Preco', 2001, 'laptop');
insert into produto (fabricante, modelo, tipo) values ('Bom De Preco', 2002, 'laptop');
insert into produto (fabricante, modelo, tipo) values ('Bom De Preco', 2003, 'laptop');
insert into produto (fabricante, modelo, tipo) values ('Compra Certa', 1007, 'pc');
insert into produto (fabricante, modelo, tipo) values ('Compra Certa', 1008, 'pc');
insert into produto (fabricante, modelo, tipo) values ('Compra Certa', 2008, 'laptop');
insert into produto (fabricante, modelo, tipo) values ('Compra Certa', 2009, 'laptop');
insert into produto (fabricante, modelo, tipo) values ('Compra Certa', 3002, 'impressora');
insert into produto (fabricante, modelo, tipo) values ('Compra Certa', 3003, 'impressora');
insert into produto (fabricante, modelo, tipo) values ('Compra Certa', 3006, 'impressora');
insert into produto (fabricante, modelo, tipo) values ('Compra Certa', 3008, 'impressora');
insert into produto (fabricante, modelo, tipo) values ('Dinastia HW', 1009, 'pc');
insert into produto (fabricante, modelo, tipo) values ('Dinastia HW', 1010, 'pc');
insert into produto (fabricante, modelo, tipo) values ('Dinastia HW', 1011, 'pc');
insert into produto (fabricante, modelo, tipo) values ('Dinastia HW', 2007, 'laptop');
insert into produto (fabricante, modelo, tipo) values ('Equipa Tudo', 1012, 'pc');
insert into produto (fabricante, modelo, tipo) values ('Equipa Tudo', 1013, 'pc');
insert into produto (fabricante, modelo, tipo) values ('Equipa Tudo', 2010, 'laptop');
insert into produto (fabricante, modelo, tipo) values ('First Class HW', 3001, 'impressora');
insert into produto (fabricante, modelo, tipo) values ('First Class HW', 3004, 'impressora');
insert into produto (fabricante, modelo, tipo) values ('Gambis Pro HWSolutions', 3005, 'impressora');
insert into produto (fabricante, modelo, tipo) values ('HW House', 3007, 'impressora');

-- popula a tabela pc
insert into pc (modelo, velocidade, ram, hd, cd, preco) values (1001,  700,  64, 10, '8x',  799);
insert into pc (modelo, velocidade, ram, hd, cd, preco) values (1002, 1500, 128, 60, '2x', 2499);
insert into pc (modelo, velocidade, ram, hd, cd, preco) values (1003,  866, 128, 20, '8x', 1999);
insert into pc (modelo, velocidade, ram, hd, cd, preco) values (1004,  866,  64, 10, '2x',  999);
insert into pc (modelo, velocidade, ram, hd, cd, preco) values (1005, 1000, 128, 20, '2x', 1499);
insert into pc (modelo, velocidade, ram, hd, cd, preco) values (1006, 1300, 256, 40, '6x', 2119);
insert into pc (modelo, velocidade, ram, hd, cd, preco) values (1007, 1400, 128, 80, '2x', 2299);
insert into pc (modelo, velocidade, ram, hd, cd, preco) values (1008,  700,  64, 30, '4x',  999);
insert into pc (modelo, velocidade, ram, hd, cd, preco) values (1009, 1200, 128, 80, '6x', 1699);
insert into pc (modelo, velocidade, ram, hd, cd, preco) values (1010,  750,  64, 30, '4x',  699);
insert into pc (modelo, velocidade, ram, hd, cd, preco) values (1011, 1100, 128, 60, '6x', 1299);
insert into pc (modelo, velocidade, ram, hd, cd, preco) values (1012,  350,  64,  7, '8x',  799);
insert into pc (modelo, velocidade, ram, hd, cd, preco) values (1013,  753, 256, 60, '2x', 2499);

-- popula a tabela laptop
insert into laptop (modelo, velocidade, ram, hd, tela, preco) values (2001, 700,  64,  5, 12.1, 1448);
insert into laptop (modelo, velocidade, ram, hd, tela, preco) values (2002, 800,  96, 10, 15.1, 2584);
insert into laptop (modelo, velocidade, ram, hd, tela, preco) values (2003, 850,  64, 10, 15.1, 2738);
insert into laptop (modelo, velocidade, ram, hd, tela, preco) values (2004, 550,  32,  5, 12.1,  999);
insert into laptop (modelo, velocidade, ram, hd, tela, preco) values (2005, 600,  64,  6, 12.1, 2399);
insert into laptop (modelo, velocidade, ram, hd, tela, preco) values (2006, 800,  96, 20, 15.7, 2999);
insert into laptop (modelo, velocidade, ram, hd, tela, preco) values (2007, 850, 128, 20, 15.0, 3099);
insert into laptop (modelo, velocidade, ram, hd, tela, preco) values (2008, 650,  64, 10, 12.1, 1249);
insert into laptop (modelo, velocidade, ram, hd, tela, preco) values (2009, 750, 256, 20, 15.1, 2599);
insert into laptop (modelo, velocidade, ram, hd, tela, preco) values (2010, 366,  64, 10, 12.1, 1499);

-- popula a tabela impressora
insert into impressora (modelo, colorida, tipo, preco) values (3001, true,  'ink-jet',  231);
insert into impressora (modelo, colorida, tipo, preco) values (3002, true,  'ink-jet',  267);
insert into impressora (modelo, colorida, tipo, preco) values (3003, false,   'laser',  390);
insert into impressora (modelo, colorida, tipo, preco) values (3004, true,  'ink-jet',  439);
insert into impressora (modelo, colorida, tipo, preco) values (3005, true,   'bubble',  200);
insert into impressora (modelo, colorida, tipo, preco) values (3006, true,    'laser', 1999);
insert into impressora (modelo, colorida, tipo, preco) values (3007, false,   'laser',  350);
insert into impressora (modelo, colorida, tipo, preco) values (3008, false,   'bubble',  220);


-- INICIO DAS CONCULTAS

--Encontre a tuplas de Laptop que possuem um preço maior que o seu número de modelo.

SELECT *
FROM Laptop
WHERE preco > modelo;

--Encontre o número do modelo, a velocidade e o preço para todos os PCs cuja velocidade está
--entre 1000 e 1500 MHz. Na resposta, renomeie a coluna de velocidade para processador e a coluna
--de preço para R$.

SELECT modelo, velocidade AS processador, preco AS R$
FROM pc
WHERE  velocidade >= 1000 and velocidade <= 1500;

--Encontre os dados das impressoras do tipo ink-jet ou laser e que custem mais que R$380,00. O
--resultado deve aparecer em ordem crescente de tipo e decrescente de preço.

SELECT *
FROM impressora
WHERE  tipo = 'ink-jet'
