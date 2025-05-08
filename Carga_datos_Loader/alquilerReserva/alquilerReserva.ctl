LOAD DATA
INFILE 'alquilerReservaLoad.txt'
BADFILE 'errores.bad'
INTO TABLE alquilerReserva
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idAlquiler, idReserva, dni, fechaInicio DATE "DD-MM-YYYY", horaInicio DATE "HH24:MI", fechaFinal DATE "DD-MM-YYYY", horaFinal DATE "HH24:MI", cantidad, precio DECIMAL EXTERNAL)