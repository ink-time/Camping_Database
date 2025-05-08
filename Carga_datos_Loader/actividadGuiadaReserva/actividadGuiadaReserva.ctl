LOAD DATA
INFILE 'actividadGuiadaReservaLoad.txt'
BADFILE 'errores.bad'
INTO TABLE actividadGuiadaReserva
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
( idReserva, idActividad, dni, fechaInicio DATE "DD-MM-YYYY", horaInicio DATE "HH24:MI", fechaFinal DATE "DD-MM-YYYY", horaFinal DATE "HH24:MI", idGuia)