LOAD DATA
INFILE 'tipoAlojamientoLoad.txt'
BADFILE 'errores.bad'
INTO TABLE tipoAlojamiento
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idTipo, tipo, precioBase DECIMAL EXTERNAL)