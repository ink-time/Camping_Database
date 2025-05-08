LOAD DATA
INFILE 'dispAlojamientoLoad.txt'
BADFILE 'errores.bad'
INTO TABLE dispAlojamiento
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idAlojamiento, idDispFecha, disponibilidad)