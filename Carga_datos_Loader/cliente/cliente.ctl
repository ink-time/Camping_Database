LOAD DATA
INFILE 'clienteLoad.txt'
BADFILE 'errores.bad'
INTO TABLE cliente
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(dni, nombre, apellido1, apellido2, email, telefono, comentarios)