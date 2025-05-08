LOAD DATA
INFILE 'reservaLoad.txt'
BADFILE 'errores.bad'
INTO TABLE reserva
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idReserva, dni, idPago, fechaReserva DATE "DD-MM-YYYY", fechaEntrada DATE "DD-MM-YYYY", fechaSalida DATE "DD-MM-YYYY")