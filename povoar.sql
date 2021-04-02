PRAGMA foreign_keys = ON;

DELETE FROM R_ENFERMEIRO_INTERNAMENTO;
DELETE FROM R_MANUTENCAO;
DELETE FROM R_EQUIPAMENTO_SALA_DE_EXAME;
DELETE FROM R_ESPECIALIDADE_EQUIPAMENTO;
DELETE FROM R_MEDICO_ESPECIALIDADE;
DELETE FROM INTERNAMENTO;
DELETE FROM EQUIPAMENTO;
DELETE FROM CONSULTA;
DELETE FROM SALA_DE_EXAME;
DELETE FROM UTENTE;
DELETE FROM ESPECIALIDADE;
DELETE FROM TECNICO;
DELETE FROM ENFERMEIRO;
DELETE FROM MEDICO;
DELETE FROM FUNCIONARIO;

INSERT INTO "FUNCIONARIO" VALUES (1, 'Mario', '20010501', '20150203');
INSERT INTO "TECNICO" VALUES (1);
INSERT INTO "FUNCIONARIO" VALUES (2, 'Maria', '20010401', '20160203');
INSERT INTO "MEDICO" VALUES (2);
INSERT INTO "FUNCIONARIO" VALUES (3, 'Joao', '19990101', '20200303');
INSERT INTO "ENFERMEIRO" VALUES (3);

INSERT INTO "ESPECIALIDADE" VALUES (1,'Esquerda', 5, 2);
INSERT INTO "UTENTE" VALUES (0, 'Zeca', '20180202');
INSERT INTO "SALA_DE_EXAME" VALUES (1, 10, 1, 'Esquerda');
INSERT INTO "CONSULTA" VALUES (0, '20210328', 'caiu das escadas', 'normal', 2, 1, 'Esquerda', 0, 1);
INSERT INTO "EQUIPAMENTO" VALUES (1,'vacina do covid', '22:22:22', '2021-04-01');
INSERT INTO "INTERNAMENTO" VALUES (0, '20210328', '20210331', 'umas chapadas', 255, 0, 0);
INSERT INTO "R_MEDICO_ESPECIALIDADE" VALUES (2, 1, 'Esquerda');
INSERT INTO "R_ESPECIALIDADE_EQUIPAMENTO" VALUES (1, 'Esquerda', 1, 50);
INSERT INTO "R_EQUIPAMENTO_SALA_DE_EXAME" VALUES (1,1,10);
INSERT INTO "R_MANUTENCAO" VALUES (1, 1);
INSERT INTO "R_ENFERMEIRO_INTERNAMENTO" VALUES (3,0);
