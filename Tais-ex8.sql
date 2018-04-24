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

/*c) Mostre o nome de cada diretor que já dirigiu dois filmes em sequência sem atuar em nenhum
outro filme lançado entre eles.*/

MATCH (diretor:Person)-[:DIRECTED]->(filme1:Movie),
(diretor)-[:DIRECTED]->(filme2:Movie)
MATCH(filme:Movie)
WHERE filme1.title <> filme2.title
AND filme1.released <= filme2.released
AND filme.released >= filme1.released
AND filme.released <= filme2.released
AND  NOT exists( (diretor)-[:ACTED_IN]->(filme) )
RETURN DISTINCT diretor.name;

/*d) O Tom Hanks está procurando atores para atuar em um novo filme que ele vai dirigir.
Recomende possíveis atores para esse novo filme dele.*/
/*Recomendação: Atores que já atuaram em filmes que ele esteve ligado de alguma forma*/

MATCH (recomendado:Person)-[r]->(filme:Movie)<-[s]-(diretor:Person)
WHERE diretor.name="Tom Hanks"
RETURN DISTINCT recomendado.name;
