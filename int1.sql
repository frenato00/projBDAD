.mode	columns
.headers	on
.nullvalue	NULL

SELECT nome, nomeDeEspecialidade 
FROM FUNCIONARIO, ESPECIALIDADE 
WHERE FUNCIONARIO.numeroDeFuncionario = ESPECIALIDADE.lider;