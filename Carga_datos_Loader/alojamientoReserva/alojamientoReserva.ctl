LOAD DATA
INFILE 'alojamientoReservaLoad.txt'
BADFILE 'errores.bad'
INTO TABLE alojamientoReserva
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idAlojamiento, idReserva, dni)