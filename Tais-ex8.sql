﻿﻿/* Nome: taís Pinheiro NUSp: 7580421*/
/* MAC0439 - Laboratorio de Banco de Dados*/
/* Exercicio 8 */


/*a) Para cada ator, devolva o seu ano de estreia em filmes.*/

MATCH (person:Person)
 -[:ACTED_IN]->(movie:Movie)
RETURN person.name, min((movie.released));
