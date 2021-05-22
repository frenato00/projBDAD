.mode	columns
.headers	on
.nullvalue	NULL

SELECT FUNCIONARIO.nome, 100.0 * count(INTERNAMENTO.id) / (SELECT count(INTERNAMENTO.id) FROM INTERNAMENTO) 
AS percentage
FROM INTERNAMENTO, CONSULTA, MEDICO, FUNCIONARIO
WHERE INTERNAMENTO.consulta = CONSULTA.id 
AND CONSULTA.medico=MEDICO.numeroDeFuncionario 
AND MEDICO.numeroDeFuncionario=FUNCIONARIO.numeroDeFuncionario
GROUP BY medico;