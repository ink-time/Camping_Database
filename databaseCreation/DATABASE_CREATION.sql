CREATE TABLE cliente (
dni VARCHAR2 (9),
nombre VARCHAR2 (24) NOT NULL,
apellido1 VARCHAR2 (24) NOT NULL,
apellido2 VARCHAR2 (24), 
email VARCHAR2 (40) NOT NULL, 
telefono NUMBER (15) NOT NULL,
comentarios VARCHAR2 (70),
constraint pk_cliente PRIMARY KEY (dni));


CREATE TABLE pago (
    idPago NUMBER (11), 
    total DECIMAL (10, 2) NOT NULL, 
    fechaPago DATE NOT NULL,
    metodoPago VARCHAR2 (20) NOT NULL,
    estadoPago varchar2 (20) NOT NULL,
    dni VARCHAR2 (9) NOT NULL,
    constraint pk_pago PRIMARY KEY (idPago),
    constraint fk_cliente1 FOREIGN KEY (dni) REFERENCES cliente(dni));
    

--Do we domething with the dates? Like using them as PK or smthn?
CREATE TABLE reserva (
    idReserva NUMBER (11) NOT NULL, 
    dni VARCHAR2 (9) NOT NULL,
    idPago NUMBER (11) NOT NULL,
    fechaReserva DATE NOT NULL,
    fechaEntrada DATE NOT NULL,
    fechaSalida DATE NOT NULL,
    constraint pk_reserva PRIMARY KEY (dni, idReserva),
    constraint fk_cliente2 FOREIGN KEY (dni) REFERENCES cliente(dni));


CREATE TABLE factura ( 
    idFactura NUMBER (11), 
    emisor VARCHAR2 (50) NOT NULL, 
    fechaFacturacion DATE NOT NULL,
    importeBase NUMBER (20) NOT NULL,
    importesAdicionales NUMBER (20) NOT NULL,
    impuesto NUMBER (9) NOT NULL,
    importeTotal NUMBER (20) NOT NULL,
    direccion VARCHAR2 (60) NOT NULL, 
    idReserva NUMBER (11) NOT NULL,
    idPago NUMBER (11) NOT NULL,
    dni VARCHAR2 (9) NOT NULL,
    constraint pk_factura PRIMARY KEY (idFactura),
    constraint fk_cliente3 FOREIGN KEY (dni) REFERENCES cliente(dni),
    constraint fk_reserva1 FOREIGN KEY (idReserva, dni) REFERENCES reserva(idReserva, dni),
    constraint fk_pago1 FOREIGN KEY (idPago) REFERENCES pago(idPago));


CREATE TABLE temporada (
    idTemporada NUMBER (11) NOT NULL,
    duracion VARCHAR (40) NOT NULL,
    cambioPrecio DECIMAL (8, 2) NOT NULL, --This would be like a percentage? So 0.4, 0.2 or something, can be negative or positive?
    nomTemporada VARCHAR2 (20) NOT NULL,
    constraint pk_Temporada PRIMARY KEY (idTemporada));

CREATE TABLE temporadaReserva (
    idTemporada NUMBER (11) NOT NULL,
    idReserva NUMBER (11) NOT NULL,
    dni VARCHAR2 (9) NOT NULL,
    constraint pk_temporadaReserva PRIMARY KEY (idTemporada, idReserva),
    constraint fk_reserva2 FOREIGN KEY (idReserva, dni) REFERENCES reserva(idReserva, dni),
    constraint fk_temporada1 FOREIGN KEY (idTemporada) REFERENCES temporada(idTemporada));


CREATE TABLE tipoAlojamiento(
    idTipo NUMBER (11) NOT NULL,
    tipo VARCHAR2(30) NOT NULL,
    precioBase DECIMAL (10,2) NOT NULL,
    constraint pk_tipo PRIMARY KEY (idTipo));



CREATE TABLE alojamiento(
    idAlojamiento NUMBER (11) NOT NULL,
    capacidad NUMBER (2) NOT NULL,
    ubicacion VARCHAR2 (50) NOT NULL,
    especifAdicionales VARCHAR2 (60), 
    idTipo NUMBER (11) NOT NULL,
    precio DECIMAL (10, 2) NOT NULL,
    tipoPrecio VARCHAR2 (32) NOT NULL, -- Va a ser siemrpe por día though, creo yo.
    constraint pk_alojamiento PRIMARY KEY (idAlojamiento),
    constraint fk_tipo_alojamiento FOREIGN KEY (idTipo) REFERENCES tipoAlojamiento(idTipo));

CREATE TABLE alojamientoReserva(
    idAlojamiento NUMBER (11) NOT NULL,
    idReserva NUMBER (11) NOT NULL,
    dni VARCHAR2 (9) NOT NULL,
    constraint pk_alojamientoReserva PRIMARY KEY (idAlojamiento, idReserva),
    constraint fk_reserva3 FOREIGN KEY (idReserva, dni) REFERENCES reserva(idReserva, dni),
    constraint fk_alojamiento1 FOREIGN KEY (idAlojamiento) REFERENCES alojamiento(idAlojamiento));

CREATE TABLE dispFecha(
    idDispFecha NUMBER (11) NOT NULL,
    fecha DATE NOT NULL,
    constraint pk_dispFecha PRIMARY KEY (idDispFecha));

CREATE TABLE dispAlojamiento (
    idAlojamiento NUMBER (11) NOT NULL,
    idDispFecha NUMBER (11) NOT NULL,
    disponibilidad VARCHAR2 (20) NOT NULL, -- Possible types: disponible, no disponible.
    -- tipoDisponibilidad VARCHAR2 (50),   -- It could also havce a new column thats specifies:  mantenimiento, limpieza, reformas, etc. 
                                           -- This would be interesting if I wanna be more specific about the reason of the disponibility being negative
    dispRazon VARCHAR (30),
    constraint pk_dispAlojamiento PRIMARY KEY (idAlojamiento, idDispFecha),
    constraint fk_alojamiento2 FOREIGN KEY (idAlojamiento) REFERENCES alojamiento(idAlojamiento),
    constraint fk_dispFecha FOREIGN KEY (idDispFecha) REFERENCES dispFecha(idDispFecha));

-- ALTER table dispFecha DROP COLUMN disponibilidad;
-- ALTER table dispAlojamiento ADD COLUMN disponibilidad VARCHAR2(20) NOT NULL;


CREATE TABLE acompagnante (
    dniAcompagnante VARCHAR2 (9) NOT NULL,
    dni VARCHAR2 (9) NOT NULL,
    nombre VARCHAR2 (30) NOT NULL,
    edad NUMBER (3) NOT NULL,
    idReserva NUMBER (11) NOT NULL,
    constraint pk_acompagnante PRIMARY KEY (dniAcompagnante, idReserva),
    constraint fk_reserva4 FOREIGN KEY (idReserva, dni) REFERENCES reserva(idReserva, dni));


CREATE TABLE guia (
    idGuia NUMBER (11) NOT NULL,
    nombreGuia VARCHAR2 (30) NOT NULL,
    constraint pk_guia PRIMARY KEY (idGuia));

CREATE TABLE actividadGuiada (
    idActividad NUMBER (11) NOT NULL,
    descripcion VARCHAR2 (200) NOT NULL,
    precio DECIMAL (8, 2) NOT NULL, 
    constraint pk_actividadGuiada PRIMARY KEY (idActividad));


CREATE TABLE actividadGuiadaReserva (
    idReserva NUMBER (11) NOT NULL,
    idActividad NUMBER (11) NOT NULL,
    dni VARCHAR2 (9) NOT NULL,
    fechaInicio DATE NOT NULL,
    horaInicio DATE NOT NULL,
    fechaFinal DATE NOT NULL,
    horaFinal DATE NOT NULL,
    idGuia NUMBER (11) NOT NULL,
    constraint pk_actividadGuiadaReserva PRIMARY KEY (idReserva, idActividad, fechaInicio, horaInicio),
    constraint fk_reserva5 FOREIGN KEY (idReserva, dni) REFERENCES reserva(idReserva, dni),
    constraint fk_actividadGuiada FOREIGN KEY (idActividad) REFERENCES actividadGuiada(idActividad),
    constraint fk_guia FOREIGN KEY (idGuia) REFERENCES guia(idGuia));


CREATE TABLE instalacion (
    idInstalacion NUMBER (11) NOT NULL,
    tipoInstalacion VARCHAR2 (60) NOT NULL,
    localizacion VARCHAR2 (80) NOT NULL,
    descripcion VARCHAR2 (200) NOT NULL, 
    precio DECIMAL (8, 2) NOT NULL,
    tipoPrecio VARCHAR2 (30) NOT NULL,
    constraint pk_instalacion PRIMARY KEY (idInstalacion));

CREATE TABLE instalacionReserva (
    idReserva NUMBER (11) NOT NULL,
    idInstalacion NUMBER (11) NOT NULL,
    dni VARCHAR2 (9) NOT NULL,
    fechaInicio DATE NOT NULL,
    horaInicio DATE NOT NULL,
    fechaFinal DATE NOT NULL,
    horaFinal DATE NOT NULL,
    precio DECIMAL (8, 2) NOT NULL,
    constraint pk_instalacionReserva PRIMARY KEY (idReserva, idInstalacion, fechaInicio, horaInicio),
    constraint fk_reserva6 FOREIGN KEY (idReserva, dni) REFERENCES reserva(idReserva, dni),
    constraint fk_instalacion1 FOREIGN KEY (idInstalacion) REFERENCES instalacion(idInstalacion));


CREATE TABLE alquiler (
    idAlquiler NUMBER (11) NOT NULL,
    tipoAlquiler VARCHAR2 (60) NOT NULL,
    descripcion VARCHAR2 (300) NOT NULL,
    precio DECIMAL (8, 2) NOT NULL,
    tipoPrecio VARCHAR2 (30) NOT NULL,
    constraint pk_alquiler PRIMARY KEY (idAlquiler));

CREATE TABLE alquilerReserva(
    idAlquiler NUMBER (11) NOT NULL,
    idReserva NUMBER (11) NOT NULL,
    dni VARCHAR2 (9) NOT NULL,
    fechaInicio DATE NOT NULL,
    horaInicio DATE NOT NULL,
    fechaFinal DATE NOT NULL,
    horaFinal DATE NOT NULL,
    cantidad NUMBER (3) NOT NULL,
    precio DECIMAL (8, 2) NOT NULL,
    constraint pk_alquilerReserva PRIMARY KEY (idAlquiler, idReserva, fechaInicio, horaInicio),
    constraint fk_reserva7 FOREIGN KEY (idReserva, dni) REFERENCES reserva(idReserva, dni),
    constraint fk_alquiler1 FOREIGN KEY (idAlquiler) REFERENCES alquiler(idAlquiler));

CREATE TABLE comidaDomicilio (
idComidaDomicilio NUMBER (11) NOT NULL,
productoEnvio VARCHAR2 (300) NOT NULL,
descripcion VARCHAR2 (300) NOT NULL,
precio DECIMAL (8, 2) NOT NULL,
constraint pk_comida_domicilio PRIMARY KEY (idComidaDomicilio));

CREATE TABLE comidaDomReserva(
idReserva NUMBER (11) NOT NULL,
idComidaDomicilio NUMBER (11) NOT NULL,
dni VARCHAR2 (9) NOT NULL,
fechaInicio DATE NOT NULL,
horaEntrega DATE NOT NULL,
fechaFinal DATE NOT NULL,
frecuenciaEnvio VARCHAR2 (200) NOT NULL,
cantidad NUMBER (3) NOT NULL,
precio DECIMAL (8, 2) NOT NULL,
constraint pk_comidaDomReserva PRIMARY KEY (idReserva, idComidaDomicilio, fechaInicio, horaEntrega),
constraint fk_reserva8 FOREIGN KEY (idReserva, dni) REFERENCES reserva(idReserva, dni),
constraint fk_comidaDomicilio1 FOREIGN KEY (idComidaDomicilio) REFERENCES comidaDomicilio(idComidaDomicilio));

CREATE TABLE mantenimientoVIP(
idMantenimientoVIP NUMBER (11) NOT NULL,
descripcion VARCHAR2 (300) NOT NULL,
precio DECIMAL (8, 2) NOT NULL,
tipoPrecio VARCHAR2 (30) NOT NULL, 
constraint pk_mantenimientoVIP PRIMARY KEY (idMantenimientoVIP));

CREATE TABLE mantenimVIPReserva (
    idReserva NUMBER (11) NOT NULL,
    idMantenimientoVIP NUMBER (11) NOT NULL,
    dni VARCHAR2 (9) NOT NULL,
    fechaInicio DATE NOT NULL,
    hora DATE NOT NULL,
    fechaFinal DATE NOT NULL,
    frecuencia VARCHAR2 (200) NOT NULL,
    precio DECIMAL (8, 2) NOT NULL,
    constraint pk_mantenimVIPReserva PRIMARY KEY (idReserva, idMantenimientoVIP, fechaInicio, hora),
    constraint fk_reserva9 FOREIGN KEY (idReserva, dni) REFERENCES reserva(idReserva, dni),
    constraint fk_mantenimientoVIP1 FOREIGN KEY (idMantenimientoVIP) REFERENCES mantenimientoVIP(idMantenimientoVIP));

CREATE TABLE usuario(
    idUsuario NUMBER (11) NOT NULL,
    email VARCHAR2 (100) NOT NULL UNIQUE, 
    nombreUsuario VARCHAR2 (50) NOT NULL,
    constraint pk_usuario PRIMARY KEY (idUsuario));

CREATE TABLE rating (
    idRating NUMBER (11) NOT NULL,
    mediaValoraciones DECIMAL (3,2) NOT NULL, --Derivativa de valoraciones
    idAlojamiento NUMBER (11) NOT NULL,
    constraint pk_rating PRIMARY KEY (idRating),
    constraint fk_alojamiento3 FOREIGN KEY (idAlojamiento) REFERENCES alojamiento(idAlojamiento));

CREATE TABLE valoracion(
    idValoracion NUMBER (11) NOT NULL,
    idUsuario NUMBER (11) NOT NULL,
    idRating NUMBER (11) NOT NULL,
    valoracion NUMBER (1) NOT NULL,
    textOpinion VARCHAR (400),
    fecha DATE NOT NULL,
    constraint pk_valoracion PRIMARY KEY (idValoracion),
    constraint fk_usuario1 FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario),
    constraint fk_rating FOREIGN KEY (idRating) REFERENCES rating(idRating));

CREATE TABLE favorito (
    idFavorito NUMBER (11) NOT NULL,
    idUsuario NUMBER (11) NOT NULL,
    idAlojamiento NUMBER (11) NOT NULL,
    nombreFavorito VARCHAR2 (70) NOT NULL,
    constraint pk_favorito PRIMARY KEY (idFavorito),
    constraint fk_alojamiento4 FOREIGN KEY (idAlojamiento) REFERENCES alojamiento(idAlojamiento),
    constraint fk_usuario FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario));





-- This works!!

INSERT INTO alquiler (idAlquiler, tipoAlquiler, descripcion, precio)
     WITH names AS (
      SELECT 4, 'patatas', 'lavida', 4.20 FROM dual UNION ALL
     SELECT 5, 'patatas2', 'lavida2', 5.20 FROM dual)
     SELECT * from names;