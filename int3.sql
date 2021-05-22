.mode	columns
.headers	on
.nullvalue	NULL

SELECT id 
FROM EQUIPAMENTO 
WHERE proximaDataAExpirar<DATE('now');