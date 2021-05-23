PRAGMA foreign_keys = ON;
.mode columns
.nullvalue NULL

INSERT INTO "FUNCIONARIO" VALUES (1, 'Maria', '2001-04-01', '2016-02-03');
INSERT INTO "MEDICO" VALUES (1);
INSERT INTO "ESPECIALIDADE" VALUES (1, 'Cardiologia', 1, 'Esquerda', 10, 1);
INSERT INTO "SALA_DE_EXAME" VALUES (1, 10, 1);
INSERT INTO "UTENTE" VALUES (1, 'Ana', '1960-07-30');

INSERT INTO "CONSULTA" VALUES (1, '2021-05-23', 'Queda das escadas.', 'normal', 1, 1, 1, 1);

.headers off
SELECT "";
SELECT "Consulta:";
.headers on
SELECT * FROM CONSULTA WHERE id = 1;


INSERT INTO "INTERNAMENTO" VALUES (1, '2021-06-23', '2021-07-23', 'Descanso.', 1, 1);

.headers off
SELECT "";
SELECT "With a valid date, it stays as is:";
.headers on
SELECT * FROM INTERNAMENTO WHERE id = 1;


DELETE FROM INTERNAMENTO WHERE id = 1;
INSERT INTO "INTERNAMENTO" VALUES (1, '2020-06-23', '2021-07-23', 'Descanso.', 1, 1);

.headers off
SELECT "";
SELECT "After inserting an invalid date (2020-06-23, which is previous to the appointment):";
.headers on
SELECT * FROM INTERNAMENTO WHERE id = 1;
