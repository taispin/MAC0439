/* Nome: taís Pinheiro NUSP: 7580421*/
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
DROP TRIGGER Impressora250 ON impressora;
DELETE FROM laptop WHERE modelo = 5555;
insert into produto (fabricante, modelo, tipo) values ('Z', 5555, 'laptop');
insert into laptop (modelo, velocidade, ram, hd, tela, preco) values (5555, 700,  64,  500, 12.1, 1448);
select * from pc;
select * from laptop;