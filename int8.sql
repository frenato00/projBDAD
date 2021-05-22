.mode	columns
.headers	on
.nullvalue	NULL

SELECT avg(Date('now')-dataDeNascimento) 
FROM FUNCIONARIO; 