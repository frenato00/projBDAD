.mode	columns
.headers	on
.nullvalue	NULL

SELECT UTENTE.numeroDeUtente, UTENTE.nome, count(CONSULTA.utente)
FROM CONSULTA, UTENTE
WHERE CONSULTA.utente=UTENTE.numeroDeUtente 
GROUP BY CONSULTA.utente
ORDER BY count(CONSULTA.utente) DESC;