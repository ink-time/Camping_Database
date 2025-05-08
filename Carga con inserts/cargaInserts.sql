INSERT INTO rating (idRating, mediaValoraciones, idAlojamiento)
WITH names (idRating, mediaValoraciones, idAlojamiento) AS (
    SELECT 1, 0, 1 FROM dual UNION ALL
    SELECT 2, 0, 2 FROM dual UNION ALL
    SELECT 3, 0, 3 FROM dual UNION ALL
    SELECT 4, 0, 4 FROM dual UNION ALL
    SELECT 5, 0, 5 FROM dual
)
SELECT * from names;


INSERT INTO valoracion (idValoracion, idUsuario, idRating, valoracion, textOpinion, fecha)
WITH names (idValoracion, idUsuario, idRating, valoracion, textOpinion, fecha) AS (
SELECT 1, 1, 1, 5, 'Excelente estancia, repetiría sin duda.', TO_DATE('01-03-2025', 'DD-MM-YYYY') FROM dual UNION ALL
SELECT 2, 2, 2, 4, 'Muy cómodo y buena atención, aunque algo ruidoso.', TO_DATE('15-03-2025', 'DD-MM-YYYY')  FROM dual UNION ALL
SELECT 3, 3, 3, 3, 'Todo correcto, aunque esperaba más.', TO_DATE('21-03-2025', 'DD-MM-YYYY') FROM dual UNION ALL
SELECT 4, 1, 4, 2, 'Ubicación buena, pero limpieza deficiente.', TO_DATE('02-04-2025', 'DD-MM-YYYY') FROM dual UNION ALL
SELECT 5, 2, 5, 5, 'Increíble experiencia, todo perfecto.', TO_DATE('10-04-2025', 'DD-MM-YYYY') FROM dual) 
SELECT * FROM names;


INSERT INTO favorito (idFavorito, idUsuario, idAlojamiento, nombreFavorito) 
WITH names (idFavorito, idUsuario, idAlojamiento, nombreFavorito) AS
(
SELECT 1, 1, 1, 'Aventura en el bosque' FROM dual UNION ALL
SELECT 2, 1, 5, 'Casa en el árbol con desayuno' FROM dual UNION ALL
SELECT 3, 2, 2, 'Villa con terraza y vistas' FROM dual UNION ALL
SELECT 4, 3, 3, 'Frente al lago' FROM dual UNION ALL
SELECT 5, 2, 4, 'Escapada romántica con jacuzzi' FROM dual
)
SELECT * from names;




-- notas:

-- sqlldr adminCamp/123@XEPDB1 control = pago.ctl log = log.txt

-- ALTER table factura modify importeBase DECIMAL(8,2);
-- ALTER table factura modify importesAdicionales DECIMAL(8,2);
-- ALTER table factura modify impuesto DECIMAL(8,2);
-- ALTER table factura modify importeTotal DECIMAL(8,2);
