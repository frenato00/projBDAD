.mode	columns
.headers	on
.nullvalue	NULL

SELECT utente 
FROM CONSULTA, INTERNAMENTO 
WHERE CONSULTA.id = INTERNAMENTO.consulta 
INTERSECT 
SELECT utente 
FROM CONSULTA 
WHERE numeroDeEspecialidade=1;