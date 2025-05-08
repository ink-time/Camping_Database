LOAD DATA
INFILE 'temporadaLoad.txt'
BADFILE 'errores.bad'
INTO TABLE temporada
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idTemporada, duracion, cambioPrecio, nomTemporada)