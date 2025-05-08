LOAD DATA
INFILE 'pagoLoad.txt'
BADFILE 'errores.bad'
INTO TABLE pago
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idPago, total DECIMAL EXTERNAL, fechaPago DATE "DD-MM-YYYY", metodoPago, estadoPago, dni)