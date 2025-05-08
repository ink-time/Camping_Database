LOAD DATA
INFILE 'acompagnanteLoad.txt'
BADFILE 'errores.bad'
INTO TABLE acompagnante
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(dniAcompagnante, dni, nombre, edad, idReserva)