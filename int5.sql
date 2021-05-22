.mode	columns
.headers	on
.nullvalue	NULL

SELECT id 
FROM INTERNAMENTO 
WHERE JULIANDAY(dataPrevistaDeAlta)-JULIANDAY(dataDeEntrada) > 15;