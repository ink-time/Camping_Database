LOAD DATA
INFILE 'mantenimientoVIPLoad.txt'
BADFILE 'errores.bad'
INTO TABLE mantenimientoVIP
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idMantenimientoVIP, descripcion, precio DECIMAL EXTERNAL, tipoPrecio)