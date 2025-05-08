LOAD DATA
INFILE 'usuarioLoad.txt'
BADFILE 'errores.bad'
INTO TABLE usuario
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idUsuario, email, nombreUsuario)