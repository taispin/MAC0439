/* Tais Pinheiro nusp: 7580421 */
/* Lista de Exercicios 16 */

-- zera tudo.
DROP SCHEMA mac439_exercicio16 cascade;  

CREATE SCHEMA mac439_exercicio16;

SET SEARCH_PATH to 'mac439_exercicio16';

-- Exercício 01

CREATE TABLE Empregados (

	nome VARCHAR(50) PRIMARY KEY,
	dept  VARCHAR(50) NOT NULL,
	salario DECIMAL(10,2) NOT NULL
);

CREATE VIEW NomesDosEmpregados AS
SELECT nome FROM Empregados; 

CREATE VIEW InfosDosDepts(dept,salariomedio) AS
SELECT dept, avg(salario)
FROM Empregados
GROUP BY dept; 

-- teste
insert into Empregados values('Tais','bcc',5000);
insert into Empregados values('Carmeline','lic',3000);
insert into Empregados values('Cassio','estat',4000);
insert into Empregados values('Will','bcc',6000);
insert into Empregados values('Henrique','aplicada',5000);
insert into Empregados values('Andrei','lic',2000);
insert into Empregados values('Mauricio1','Pré-produção',6000);
insert into Empregados values('Mauricio2','Pré-produção',7000);
insert into Empregados values('Mauricio3','Informática',3000);
insert into Empregados values('Mauricio4','Informática',8000);


select * from NomesDosEmpregados;
select * from InfosDosDepts;

-- Exercício 02
/* Quais privilégios devem ser dados a um usuário que precisa saber apenas os salários médios para os departamentos 
“Pré-produção” e “Informática”? Escreva o comando correspondente.*/

-- Primeiro criamos uma nova view com as restrições necessárias
CREATE VIEW InfosDosDepts_preProducao_informatica AS
SELECT * 
FROM InfosDosDepts
WHERE dept = 'Pré-produção' OR dept = 'Informática';

select * from InfosDosDepts_preProducao_informatica;

-- Com a nova visão criada, concedemos os privilégios
GRANT USAGE ON SCHEMA mac439_exercicio16 TO userglobal1;
GRANT SELECT
ON InfosDosDepts_preProducao_informatica
TO userglobal1;


