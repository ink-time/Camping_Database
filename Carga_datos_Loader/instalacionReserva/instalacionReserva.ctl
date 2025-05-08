LOAD DATA
INFILE 'instalacionReservaLoad.txt'
BADFILE 'errores.bad'
INTO TABLE instalacionReserva
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idReserva, idInstalacion, dni, fechaInicio DATE "DD-MM-YYYY", horaInicio DATE "HH24:MI", fechaFinal DATE "DD-MM-YYYY", horaFinal DATE "HH24:MI", precio)