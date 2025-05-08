LOAD DATA
INFILE 'alquilerLoad.txt'
BADFILE 'errores.bad'
INTO TABLE alquiler
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idAlquiler, tipoAlquiler, descripcion, precio DECIMAL EXTERNAL, tipoPrecio)