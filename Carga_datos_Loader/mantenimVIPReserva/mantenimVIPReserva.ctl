LOAD DATA
INFILE 'mantenimVIPReservaLoad.txt'
BADFILE 'errores.bad'
INTO TABLE mantenimVIPReserva
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idReserva, idMantenimientoVIP, dni, fechaInicio DATE "DD-MM-YYYY",
  hora DATE "HH24:MI", fechaFinal DATE "DD-MM-YYYY", frecuencia, precio DECIMAL EXTERNAL)