LOAD DATA
INFILE 'actividadGuiadaLoad.txt'
BADFILE 'errores.bad'
INTO TABLE actividadGuiada
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(idActividad, descripcion, precio DECIMAL EXTERNAL)