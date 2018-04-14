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

/* Essa pergunta parace Confusa!*/
/* Mandei pergunta no paca*/
/*b- Liste todos os dados disponíveis (i.e., nome e data) de todas as batalhas que aparecem no BD.
Uma batalha deve aparecer na resposta mesmo quando não é possível saber em que data ela
ocorreu.*/

select nome, data 
from batalhas left outer join resultados on (nome = batalha);

/*c- Forneça informações sobre todos os produtos do BD (PCs, laptops e impressoras), incluindo o
seu fabricante se disponível, e quaisquer outras informações sobre o produto que sejam relevantes
(ou seja, as informações encontradas na relação para o tipo de produto em questão).*/

select fabricante,produto.modelo, produto.tipo as tipo_produto, velocidade,ram,hd,preco,cd,colorida,todos.tipo,tela
from produto,(pc natural full outer join (impressora natural full outer join laptop)) AS todos
where todos.modelo = produto.modelo;