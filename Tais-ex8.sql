*﻿﻿﻿/* Nome: taís Pinheiro NUSp: 7580421*/
/* MAC0439 - Laboratorio de Banco de Dados*/
/* Exercicio 8 */


/*a) Para cada ator, devolva o seu ano de estreia em filmes.*/

MATCH (person:Person)
 -[:ACTED_IN]->(movie:Movie)
RETURN person.name, min((movie.released));

/*b) Para cada pessoa no BD, devolva a sua lista de conhecidos (ou seja, pessoas que trabalharam em
filmes em que ela trabalhou)*/

MATCH (p:Person)-[r1]->(movie:Movie)<-[r2]-(q:Person)
RETURN q.name AS Pessoa,movie.title AS Filme, p.name AS Conhecido
