﻿/* Nome: taís Pinheiro NUSP: 7580421*/
/* MAC0439 - Laboratorio de Banco de Dados*/
/* Exercicio 9 */


set search_path to mac439_aula14;


/*a- Garanta, em todas as circunstâncias que podem causar uma violação, que o preço de uma
impressora seja limitado a R$250,00 (ou seja, na tentativa de atribuição de um preço superior a
R$250,00, substitua-o por R$250,00). */

CREATE OR REPLACE FUNCTION CorrigeImpressora250()
RETURNS TRIGGER AS $$
BEGIN
	NEW.preco = 250;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER Impressora250
BEFORE INSERT OR UPDATE OF preco ON impressora
FOR EACH ROW
WHEN (NEW.preco > 250)
EXECUTE PROCEDURE CorrigeImpressora250();


/* teste */
DROP TRIGGER Impressora250 ON impressora;
DELETE FROM impressora WHERE modelo = 4444;
insert into produto (fabricante, modelo, tipo) values ('Z', 4444, 'impressora');
insert into impressora (modelo, colorida, tipo, preco) values (4444, true,  'ink-jet',  260);
select * from impressora;


/*b- Na inserção ou alteração de um laptop, só permita que a operação seja realizada se o tamanho de
HD informado para ele existir como um tamanho de HD na relação de PC (caso o tamanho de HD
seja informado).*/

CREATE OR REPLACE FUNCTION CorrigeLaptop()
RETURNS TRIGGER AS $$
BEGIN
	IF(NEW.hd IN ( SELECT hd FROM pc))
	THEN 
	RETURN NEW;
	ELSE
	RETURN NULL;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER LaptopHD
BEFORE INSERT OR UPDATE OF hd ON laptop
FOR EACH ROW
WHEN (NEW.hd IS NOT NULL)
EXECUTE PROCEDURE CorrigeLaptop();

/* teste */
DELETE FROM laptop WHERE modelo = 5555;
insert into produto (fabricante, modelo, tipo) values ('Z', 5555, 'laptop');
insert into laptop (modelo, velocidade, ram, hd, tela, preco) values (5555, 700,  64,  500, 12.1, 1448);
select * from pc;
select * from laptop;


/*c- Na inserção de um novo PC, caso ele não esteja cadastrado ainda na tabela de Produtos, inclua-o
em Produto, usando 'H' como fabricante.*/

CREATE OR REPLACE FUNCTION IncluiPCProduto()
RETURNS TRIGGER AS $$
BEGIN
	IF(NEW.modelo IN ( SELECT modelo FROM produto))
	THEN 
	RETURN NEW;
	ELSE
	insert into produto (fabricante, modelo, tipo) values ('H', NEW.modelo, 'pc');
	RETURN NEW;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER IncluiPC
BEFORE INSERT ON pc
FOR EACH ROW
WHEN (NEW.modelo IS NOT NULL)
EXECUTE PROCEDURE IncluiPCProduto();

/* teste */
DELETE FROM pc WHERE modelo = 6666;
DELETE FROM produto WHERE modelo = 6666;
insert into produto (fabricante, modelo, tipo) values ('Z',6666 , 'pc');
insert into pc (modelo, velocidade, ram, hd, cd, preco) values (6666,  753, 256, 60, '2x', 2499);
select * from pc;
select * from produto;

/*d- Garanta, em todas as circunstâncias que podem causar uma violação, que cada fabricante venda
no máximo 7 equipamentos.*/
CREATE OR REPLACE FUNCTION VerificaFabricante7()
RETURNS TRIGGER AS $$
BEGIN
	IF((SELECT COUNT(fabricante) FROM produto WHERE fabricante = NEW.fabricante) >= 7)
	THEN 
	RETURN NULL;
	ELSE
	RETURN NEW;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER VerificaFabricante
BEFORE INSERT OR UPDATE OF fabricante ON produto
FOR EACH ROW
WHEN (NEW.modelo IS NOT NULL)
EXECUTE PROCEDURE VerificaFabricante7();

/* teste */
SELECT COUNT(fabricante) FROM produto WHERE fabricante = 'A';
DROP TRIGGER VerificaFabricante ON produto;
insert into produto (fabricante, modelo, tipo) values ('A', 9999, 'laptop');
select * from produto;

/*e- Na remoção de qualquer equipamento das relações PC, laptop ou impressora, remova o registro
correspondente na relação Produto. */

CREATE OR REPLACE FUNCTION Remove()
RETURNS TRIGGER AS $$
BEGIN
	DELETE FROM produto WHERE modelo = OLD.modelo;
	RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER RemocaoImpressora
AFTER DELETE ON impressora
FOR EACH ROW
WHEN (OLD.modelo IS NOT NULL)
EXECUTE PROCEDURE Remove();

CREATE TRIGGER RemocaoPC
AFTER DELETE ON pc
FOR EACH ROW
WHEN (OLD.modelo IS NOT NULL)
EXECUTE PROCEDURE Remove();

CREATE TRIGGER RemocaoLaptop
AFTER DELETE ON laptop
FOR EACH ROW
WHEN (OLD.modelo IS NOT NULL)
EXECUTE PROCEDURE Remove();

/* teste */
SELECT COUNT(fabricante) FROM produto WHERE fabricante = 'A';
DROP TRIGGER RemocaoLaptop ON laptop;
DROP TRIGGER RemocaoPC ON pc;
DROP TRIGGER RemocaoImpressora ON impressora;
insert into produto (fabricante, modelo, tipo) values ('X', 99990, 'pc');
insert into pc (modelo, velocidade, ram, hd, cd, preco) values (99990,  753, 256, 60, '2x', 2499);
insert into impressora (modelo, colorida, tipo, preco) values (3007, false,   'laser',  350);
insert into laptop (modelo, velocidade, ram, hd, tela, preco) values (9999, 366,  64, 10, 12.1, 1499);
DELETE FROM pc WHERE modelo = 99990;
select * from produto;
select * from laptop;
select * from pc;