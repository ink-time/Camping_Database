LOAD DATA
INFILE 'comidaDomReservaLoad.txt'
BADFILE 'errores.bad'
INTO TABLE comidaDomReserva
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idReserva, idComidaDomicilio, dni, fechaInicio DATE "DD-MM-YYYY", horaEntrega DATE "HH24:MI", fechaFinal  DATE "DD-MM-YYYY", frecuenciaEnvio, cantidad, precio DECIMAL EXTERNAL)