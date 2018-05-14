﻿﻿﻿﻿/* Nome: taís Pinheiro NUSp: 7580421*/
/* MAC0439 - Laboratorio de Banco de Dados*/
/* Exercicio 11 */


SET SEARCH_PATH to 'mac439_aula16';

/* Ainda falta ajustar esse like*/

/* a- Faça uma função que receba como entrada uma string e que devolva os nomes de navios que
contêm essa string. Você deve considerar também os nomes de navios que aparecem na relação
Resultados, além dos que aparecem em Navios. (Dica: o operador || concatena duas strings.)*/

CREATE OR REPLACE FUNCTION encontra_navios(str TEXT) RETURNS TEXT AS $$

-- cursor
DECLARE
linha RECORD;
result TEXT;
padrao TEXT;

BEGIN
	result = ' ';
	padrao = '%';
	FOR linha IN
	(SELECT * 
	FROM navios full outer join resultados on (nome = navio))
		LOOP
			IF linha.nome <> ' ' THEN
				IF (linha.nome LIKE (padrao || str || padrao)) THEN
					result = result || linha.nome;
				END IF;
			ELSE
				IF (linha.navio LIKE (padrao || str || padrao)) THEN
					result = result || linha.navio;
				END IF;
			END IF;
		END LOOP;
	RETURN result;
END;
$$ LANGUAGE plpgsql;

SELECT encontra_navios('California');

SELECT * 
FROM navios full outer join resultados on (nome = navio);

SELECT * 
FROM navios;


/*b- Faça uma função que receba uma data como entrada e que devolva o nome da batalha que
ocorreu mais perto dessa data. (Dica: a função abs(n) devolve o valor absoluto de um número n.)*/

CREATE OR REPLACE FUNCTION encontra_batalha(d DATE) RETURNS TEXT AS $$

-- cursor
DECLARE
linha batalhas%ROWTYPE;
result TEXT;
min INT;
ver INT;

BEGIN
	result = ' ';
	min = -1;
	ver = 0;
	FOR linha IN
	(SELECT * FROM batalhas)
		LOOP
			IF (min = -1) THEN
				min = abs(d - linha.data);
				result = linha.nome;

			ELSE
				ver = abs(d - linha.data);
				IF (ver < min) THEN
					min = ver;
					result = linha.nome;
				END IF;

			END IF;
		END LOOP;
	RETURN result;
END;
$$ LANGUAGE plpgsql;

-- teste
SELECT encontra_batalha('1941-4-24');

/* c- Faça um procedimento que receba um nome de uma batalha como parâmetro de entrada e, para
cada navio que participou da batalha e que não está cadastrado na tabela Navios, insira o navio em
Navios, usando como ano de lançamento do navio o ano em que a batalha ocorreu. Insira como
classe para o “novo” navio uma classe com o mesmo nome do navio e com demais atributos iguais
ao da classe ‘Revenge’. Dica: a função extract(year from d) do PostgreSQL devolve o ano de uma
data.*/

CREATE OR REPLACE FUNCTION inclui_navio(nomeBatalha TEXT) RETURNS VOID AS $$

-- cursor
DECLARE
linha resultados%ROWTYPE;
aux classes%ROWTYPE;
ano INT;

BEGIN
	ano = extract(year from (SELECT data FROM batalhas WHERE nome = nomeBatalha));
	SELECT * INTO aux FROM classes WHERE classe = 'Revenge';

	FOR linha IN
	(SELECT * FROM resultados WHERE batalha = nomeBatalha)
		LOOP
			IF NOT EXISTS (SELECT * FROM navios WHERE nome = linha.navio) THEN
				INSERT INTO navios VALUES (linha.navio,linha.navio,ano);
				INSERT INTO classes VALUES (linha.navio, aux.tipo, aux.pais, aux.numarmas, aux.calibre, aux.deslocamento);
				
			END IF;
		END LOOP;
END;
$$ LANGUAGE plpgsql;

--teste

SELECT inclui_navio('Y1');
SELECT * FROM navios;
SELECT * FROM classes;
SELECT * FROM resultados where batalha = 'North Atlantic';
INSERT INTO resultados VALUES ('X1','Y1','ok');
INSERT INTO resultados VALUES ('X1','North Atlantic','ok');


