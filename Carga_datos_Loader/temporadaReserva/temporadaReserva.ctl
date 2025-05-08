LOAD DATA
INFILE 'temporadaReservaLoad.txt'
BADFILE 'errores.bad'
INTO TABLE temporadaReserva
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idTemporada, idReserva, dni)