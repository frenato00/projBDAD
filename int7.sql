.mode	columns
.headers	on
.nullvalue	NULL

SELECT ESPECIALIDADE.nomeDeEspecialidade, count(CONSULTA.numeroDeEspecialidade)
FROM CONSULTA, ESPECIALIDADE
WHERE CONSULTA.numeroDeEspecialidade=ESPECIALIDADE.numeroDeEspecialidade
GROUP BY CONSULTA.numeroDeEspecialidade
ORDER BY count(CONSULTA.numeroDeEspecialidade) DESC
limit 1;