﻿﻿/* Nome: taís Pinheiro NUSp: 7580421*/
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
				IF (str LIKE (padrao || linha.nome || padrao)) THEN
					result = result || linha.nome;
				END IF;
			ELSE
				IF (str LIKE (padrao || linha.navio || padrao)) THEN
					result = result || linha.navio;
				END IF;
			END IF;
		END LOOP;
	RETURN result;
END;
$$ LANGUAGE plpgsql;

SELECT encontra_navios('oiCaliforniaoi');

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
