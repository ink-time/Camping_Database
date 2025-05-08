LOAD DATA
INFILE 'comidaDomicilioLoad.txt'
BADFILE 'errores.bad'
INTO TABLE comidaDomicilio
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idComidaDomicilio, productoEnvio, descripcion, precio DECIMAL EXTERNAL)