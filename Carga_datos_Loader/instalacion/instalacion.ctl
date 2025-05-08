LOAD DATA
INFILE 'instalacionLoad.txt'
BADFILE 'errores.bad'
INTO TABLE instalacion
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idInstalacion, tipoInstalacion, localizacion, descripcion, precio DECIMAL EXTERNAL, tipoPrecio)