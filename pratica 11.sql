--Pratica 11 SQL
--Arthur Resende Santos
--Henrique Alves Braga Pereira
--Nao conseguimos acesso ao banco da universidade, 
--entao nao colocamos os resultados das consultas
set search_path to universidade;

--24)CONSULTAS COM CONDICIONAIS NOS GRUPOS e condições de seleção

--(a)Listar as turmas que possuem mais de 7 alunos.
--Mostrar o código da disciplina, a turma, o ano, o semestre e quantidade de alunos
-- count(estudante) > 7
SELECT count(estudante), turma.turma
FROM estudante INNER JOIN frequenta ON estudante.id = frequenta.id_est
	INNER JOIN turma ON frequenta.id_turma = turma.id 
GROUP BY turma.turma;

--(b)Listar as turmas que possuem média de notas inferior a 60
-- AVG(nota) < 60 ???
SELECT AVG(nota), turma.turma
FROM turma INNER JOIN frequenta ON turma.id = frequenta.id_turma
	INNER JOIN estudante ON estudante.id = frequenta.id_est
GROUP BY turma.turma;

--(c)Listar as turmas de 2017-01 que possuem média de notas inferior a 60
-- AVG(nota) < 60 ???
SELECT AVG(nota), turma.turma
FROM turma INNER JOIN frequenta ON turma.id = frequenta.id_turma
	INNER JOIN estudante ON estudante.id = frequenta.id_est
WHERE turma.ano = 2017
AND turma.semestre = 01
GROUP BY turma.turma;

--(d)Listar os nomes dos estudantes com mais de 6 disciplinas neste semestre
--(mostrar o nome do estudante e a quantidade de disciplinas)
-- > 6
SELECT estudante.nome, count(disciplina)
FROM estudante INNER JOIN frequenta ON estudante.id = frequenta.id_est
	INNER JOIN turma ON frequenta.id_turma = turma.id
	INNER JOIN disciplina ON turma.cod_disc = disciplina.codigo
WHERE turma.ano = 2022
AND turma.semestre = 02
GROUP BY estudante.nome;
	
--(e)Mostrar as faculdades com menos de 3 disciplinas(mostrar a sigla da faculdade e a quantidade de disciplinas).


--(f)Listar os nomes dos estudantes com CRA > 60 e com mais de 6 disciplinas neste semestre
--(mostrar o nome do estudante e a quantidade de disciplinas)

--(g)Mostrar as turmas de disciplinas de 4 créditos que possuem mais de 5 alunos matriculados.
--mostrar o código da disciplina, a turma, semestre, ano e a quantidade de alunos matriculados


--(h)Mostrar as turmas de disciplinas de 4 créditos que possuem mais de 5 alunos matriculados.
--mostrar o *nome* da disciplina, a turma, semestre, ano e a quantidade de alunos matriculados

-----------------------------------------------------------------------------------------------------------------

--25)CONSULTASOPERADORESUNION/EXCEPT/INTERSECT

--(a)Mostrar os nomes de todas as pessoas cadastradas no banco
SELECT e.nome
FROM estudante e
UNION
SELECT p.nome
FROM professor p

--(b)Mostrar os nomes dos professores e dos alunos que não ensinam/frequentam turmas
SELECT p.nome  
FROM professor
UNION
SELECT e.nome
FROM estudante
EXCEPT 
SELECT id_prof
FROM ensina
UNION
SELECT id_est
FROM frequenta 

--(c)Mostrar os IDs das turmas que possuem docentes mas não possuem alunos frequentando

--(e)Mostrar os IDs das turmas que possuem docentes e que possuem alunos frequentando

--(f)Mostrar os IDs das turmas que possuem ou docentes ou alunos frequentando.