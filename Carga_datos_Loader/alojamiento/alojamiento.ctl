LOAD DATA
INFILE 'alojamientoLoad.txt'
BADFILE 'errores.bad'
INTO TABLE alojamiento
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idAlojamiento, capacidad, ubicacion, especifAdicionales, idTipo, precio DECIMAL EXTERNAL, tipoPrecio)