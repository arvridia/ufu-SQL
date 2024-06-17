
-- ALUNOS: ARTHUR RESENDE SANTOS 12011BCC020 e HENRIQUE BRAGA ALVES PEREIRA - 12011BCC017

  CREATE SCHEMA universidade;
SET search_path to universidade;

CREATE TABLE Faculdade (
sigla VARCHAR(15)NOT NULL,
nome VARCHAR(15)NOT NULL,
predio VARCHAR(15)NOT NULL,
orcamento INT NOT NULL,
CONSTRAINT FACUsigla PRIMARY KEY(sigla)	
);

CREATE TABLE Disciplina (
codigo VARCHAR(15) NOT NULL,
nome VARCHAR(15)NOT NULL,
creditos INT,
fac_disc VARCHAR(15)NOT NULL,
CONSTRAINT DISCcodigo PRIMARY KEY(codigo),
CONSTRAINT fac_disciplina FOREIGN KEY(fac_disc) REFERENCES Faculdade(sigla)
);

CREATE TABLE Pre_requisito (
disciplina VARCHAR(15) NOT NULL,
pre_req VARCHAR(15),
CONSTRAINT PRE_disc_pre PRIMARY KEY (disciplina,pre_req),
CONSTRAINT pre_disciplina FOREIGN KEY(disciplina) REFERENCES Disciplina(codigo),
CONSTRAINT pre_requisito FOREIGN KEY(pre_req)  REFERENCES Disciplina(codigo)
);

CREATE TABLE Professor (
id VARCHAR(15) NOT NULL,
nome VARCHAR(15)NOT NULL,
fac_prof VARCHAR(15)NOT NULL,
salario	INT,
CONSTRAINT PROF_id PRIMARY KEY(id),
CONSTRAINT prof_facu FOREIGN KEY(fac_prof) REFERENCES Faculdade(sigla)
);

CREATE TABLE Estudante (
id INT NOT NULL,
nome VARCHAR(15)NOT NULL,
datanasc DATE NOT NULL,
fac_est VARCHAR(15) NOT NULL,
cra INT,
tutor VARCHAR(15),
CONSTRAINT EST_id PRIMARY KEY(id),
CONSTRAINT Est_facu FOREIGN KEY(fac_est) REFERENCES Faculdade(sigla),
CONSTRAINT Est_prof FOREIGN KEY(tutor) REFERENCES Professor(id)	
);

CREATE TABLE Ensina (
id_prof VARCHAR(15) NOT NULL,
id_turma VARCHAR(15) NOT NULL,
CONSTRAINT ENSINA_id PRIMARY KEY(id_prof,id_turma),
CONSTRAINT ensina_id FOREIGN KEY(id_prof) REFERENCES Professor(id),
CONSTRAINT ensina_id_turma FOREIGN KEY(id_turma) REFERENCES Turma(id)
);

CREATE TABLE Frequenta(
nota INT,
id_est INT NOT NULL,
id_turma INT NOT NULL,
CONSTRAINT FREQ_id PRIMARY KEY(id_est,id_turma),
CONSTRAINT freq_est_id FOREIGN KEY(id_est) REFERENCES Estudante(id),
CONSTRAINT freq_turma_turma FOREIGN KEY(id_turma) REFERENCES Turma(id)  
);

CREATE TABLE Turma(
id INT NOT NULL,
turma VARCHAR(15) NOT NULL,
semestre INT NOT NULL,
ano INT NOT NULL,
cod_disc VARCHAR(15) NOT NULL,
predio_s VARCHAR(15) NOT NULL, 
n_sala VARCHAR(15) NOT NULL,
CONSTRAINT TURMA_id PRIMARY KEY(id),
CONSTRAINT Turma_predio_sala FOREIGN KEY(predio_s,n_sala) REFERENCES Sala(predio,numero),
CONSTRAINT Turma_cod_disc FOREIGN KEY(cod_disc) REFERENCES Disciplina(codigo)  
);

CREATE TABLE Sala(
predio VARCHAR(15) NOT NULL,
numero VARCHAR(15) NOT NULL, 
capacidade INT NOT NULL,  
CONSTRAINT Sala_predio_num PRIMARY KEY(predio,numero),  
);

CREATE TABLE Semana(
id_sem VARCHAR(15) NOT NULL, 
descricao VARCHAR(15),  
CONSTRAINT SEM_id_sem PRIMARY KEY(id_sem)  
);

CREATE TABLE Horario_aula(
id_sem VARCHAR(15) NOT NULL,
id_hora INT NOT NULL,
id_turma INT NOT NULL,
CONSTRAINT HOR_ID_sem_hora_turma PRIMARY KEY(id_sem,id_hora,id_turma),  
CONSTRAINT TURM_HOR_sem FOREIGN KEY(id_sem) REFERENCES Turma(id),
CONSTRAINT HOR_HOR_hora FOREIGN KEY(id_hora) REFERENCES Horario(id_hora),
CONSTRAINT SEM_HOR_sem FOREIGN KEY(id_sem) REFERENCES Semana(id_sem)  
);

CREATE TABLE Horario(
id_hora INT NOT NULL,
hora_inicio INT NOT NULL,
hora_fim INT NOT NULL,
CONSTRAINT HORA_hora PRIMARY KEY(id_hora)  
);  
  
    
-- e) TIRAR RESTRIÇÕES

DROP FACUsigla constraint_name[ RESTRICT | CASCADE ]

DROP CONSTRAINT DISCcodigo [ RESTRICT | CASCADE ]
DROP CONSTRAINT fac_disciplina [ RESTRICT | CASCADE ]

DROP CONSTRAINT PRE_disc_pre [ RESTRICT | CASCADE ]
DROP CONSTRAINT pre_disciplina [ RESTRICT | CASCADE ]
DROP CONSTRAINT pre_requisito [ RESTRICT | CASCADE ]

DROP CONSTRAINT PROF_id [ RESTRICT | CASCADE ]
DROP CONSTRAINT prof_facu [ RESTRICT | CASCADE ]

DROP CONSTRAINT EST_id [ RESTRICT | CASCADE ]
DROP CONSTRAINT Est_facu [ RESTRICT | CASCADE ]
DROP CONSTRAINT Est_prof [ RESTRICT | CASCADE ]

DROP CONSTRAINT ENSINA_id [ RESTRICT | CASCADE ]
DROP CONSTRAINT ensina_id [ RESTRICT | CASCADE ]
DROP CONSTRAINT ensina_id_turma [ RESTRICT | CASCADE ]

DROP CONSTRAINT FREQ_id [ RESTRICT | CASCADE ]
DROP CONSTRAINT freq_est_id [ RESTRICT | CASCADE ]
DROP CONSTRAINT freq_turma_turma [ RESTRICT | CASCADE ]

DROP CONSTRAINT TURMA_id [ RESTRICT | CASCADE ]
DROP CONSTRAINT Turma_predio_sala [ RESTRICT | CASCADE ]
DROP CONSTRAINT Turma_cod_disc [ RESTRICT | CASCADE ]

DROP CONSTRAINT Sala_predio_num [ RESTRICT | CASCADE ]

DROP CONSTRAINT SEM_id_sem [ RESTRICT | CASCADE ]

DROP CONSTRAINT HOR_ID_sem_hora_turma [ RESTRICT | CASCADE ]
DROP CONSTRAINT TURM_HOR_sem [ RESTRICT | CASCADE ]
DROP CONSTRAINT HOR_HOR_hora [ RESTRICT | CASCADE ]
DROP CONSTRAINT SEM_HOR_sem [ RESTRICT | CASCADE ]

DROP CONSTRAINT HORA_hora [ RESTRICT | CASCADE ]

-- f) COLOCANDO RESTRIÇÕES

ADD Faculdade_PRIMARY KEY

ADD Disciplina_PRIMARY KEY
ADD Disciplina_FOREIGN KEY

ADD Pre_requisito_PRIMARY KEY
ADD Pre_requisito_FOREIGN KEY

ADD Professor_PRIMARY KEY
ADD Professor_FOREIGN KEY

ADD Estudante_PRIMARY KEY
ADD Estudante_FOREIGN KEY

ADD Ensina_PRIMARY KEY
ADD Ensina_FOREIGN KEY

ADD Frequenta_PRIMARY KEY
ADD Frequenta_FOREIGN KEY

ADD Turma_PRIMARY KEY
ADD Turma_FOREIGN KEY

ADD Sala_PRIMARY KEY
ADD Sala_FOREIGN KEY

ADD Semana_PRIMARY KEY
ADD Semana_FOREIGN KEY

ADD Horario_aula_PRIMARY KEY
ADD Horario_aula_FOREIGN KEY

ADD Horario_PRIMARY KEY
ADD Horario_FOREIGN KEY

-- g) Resultado

-- O programa apresentou erros.


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    