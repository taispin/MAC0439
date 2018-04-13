/* Nome: taís Pinheiro NUSp: 7580421*/
/* MAC0439 - Laboratorio de Banco de Dados*/
/* Exercicio 7 */

set search_path to mac439_aula12;

/* Exercicio 7.1*/

/*a- Usando apenas as relações Classes e Navios, produza todas as informações disponíveis sobre
navios, incluindo as informações disponíveis na relação Classes. Você deve produzir informações
sobre uma classe mesmo se não existir nenhum navio da classe na relação Navios.*/


select * 
from navios natural full outer join classes;