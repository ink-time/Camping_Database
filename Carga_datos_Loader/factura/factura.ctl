LOAD DATA
INFILE 'facturaLoad.txt'
BADFILE 'errores.bad'
INTO TABLE factura
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idFactura, emisor, fechaFacturacion DATE "DD-MM-YYYY", importeBase DECIMAL EXTERNAL, importesAdicionales DECIMAL EXTERNAL, impuesto DECIMAL EXTERNAL, importeTotal DECIMAL EXTERNAL, direccion, idReserva, idPago, dni)