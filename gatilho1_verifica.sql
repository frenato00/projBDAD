PRAGMA foreign_keys = ON;
.mode columns
.nullvalue NULL

INSERT INTO "FUNCIONARIO" VALUES (1, 'Maria', '2001-04-01', '2016-02-03');
INSERT INTO "MEDICO" VALUES (1);
INSERT INTO "ESPECIALIDADE" VALUES (1, 'Cardiologia', 1, 'Esquerda', 10, 1);
INSERT INTO "EQUIPAMENTO" VALUES (1, 'Oxigénio', '480000', '2022-01-10');
INSERT INTO "SALA_DE_EXAME" VALUES (1, 10, 1);
INSERT INTO "SALA_DE_EXAME" VALUES (2, 10, 1);

INSERT INTO "R_ESPECIALIDADE_EQUIPAMENTO" VALUES (1, 1, 50);

.headers off
SELECT "";
SELECT "Initial equipment value:";
.headers on
SELECT * FROM R_ESPECIALIDADE_EQUIPAMENTO WHERE equipamento = 1;


INSERT INTO "R_EQUIPAMENTO_SALA_DE_EXAME" VALUES (1, 1, 30);

.headers off
SELECT "";
SELECT "After inserting a valid value (30):";
.headers on
SELECT * FROM R_ESPECIALIDADE_EQUIPAMENTO WHERE equipamento = 1;
SELECT * FROM R_EQUIPAMENTO_SALA_DE_EXAME WHERE equipamento = 1;


INSERT INTO "R_EQUIPAMENTO_SALA_DE_EXAME" VALUES (1, 2, 30);

.headers off
SELECT "";
SELECT "After inserting an invalid value (30):";
.headers on
SELECT * FROM R_ESPECIALIDADE_EQUIPAMENTO WHERE equipamento = 1;
SELECT * FROM R_EQUIPAMENTO_SALA_DE_EXAME WHERE equipamento = 1;
