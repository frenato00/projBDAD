.mode	columns
.headers	on
.nullvalue	NULL

SELECT DISTINCT numeroDeUtente, nome, nomeDeEspecialidade, data
FROM UTENTE 
NATURAL JOIN CONSULTA, ESPECIALIDADE
WHERE UTENTE.numeroDeUtente=CONSULTA.utente 
AND CONSULTA.numeroDeEspecialidade=ESPECIALIDADE.numeroDeEspecialidade
ORDER BY data ASC;