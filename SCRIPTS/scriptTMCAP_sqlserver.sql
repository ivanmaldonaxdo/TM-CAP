drop table if exists solicitud;
drop table if exists detalle_compra;
drop table if exists compra;
drop table if exists producto;
drop table if exists categoria;
drop table if exists usuario;
drop table if exists rol;

CREATE TABLE usuario (
    -- MYSQL: id_usuario   INTEGER NOT NULL AUTO_INCREMENT,
    id_usuario   INTEGER IDENTITY NOT NULL,
    nombre       VARCHAR(20) NOT NULL,
    apellidos    VARCHAR(40) NOT NULL,
    fecha_nac    DATE NOT NULL,
    email        VARCHAR(30) NOT NULL,
    clave        VARCHAR(15) NOT NULL,
    rut          VARCHAR(12) NOT NULL,
    id_rol       INTEGER NOT NULL,
    direccion    VARCHAR(70) NOT NULL,
    telefono     INTEGER NOT NULL,
    estado       VARCHAR(15) NOT NULL,
	PRIMARY KEY (id_usuario)
)

CREATE TABLE rol (
   -- MYSQL: id_rol   INTEGER NOT NULL AUTO_INCREMENT,
    id_rol       INTEGER IDENTITY NOT NULL,
    nombre_rol   VARCHAR(20) NOT NULL,
    estado       bit NOT NULL,
	PRIMARY KEY (id_rol)
)

CREATE TABLE producto (
    -- MYSQL: id_producto  INTEGER NOT NULL AUTO_INCREMENT,
    id_producto              INTEGER IDENTITY NOT NULL,
    nombre                   VARCHAR(256) NOT NULL,
    descripcion              VARCHAR(256),
    precio                   INTEGER NOT NULL,
    id_categoria             INTEGER NOT NULL,
    codigo                   VARCHAR(50) NOT NULL,
    stock                    INTEGER NOT NULL,
    estado                   bit NOT NULL,
    imagen                   image,
	PRIMARY KEY (id_producto)
)

CREATE TABLE categoria (
    -- MYSQL: id_categoria   INTEGER NOT NULL AUTO_INCREMENT,
    id_categoria   INTEGER IDENTITY NOT NULL,
    nombre         VARCHAR(50) NOT NULL,
    estado         bit NOT NULL,
	PRIMARY KEY (id_categoria)
)

CREATE TABLE compra (
    -- MYSQL: id_compra   INTEGER NOT NULL AUTO_INCREMENT,
    id_compra            INTEGER IDENTITY NOT NULL,
    fecha_compra         DATE NOT NULL,
    id_usuario           INTEGER NOT NULL,
    tipo_comprobante     VARCHAR(20) NOT NULL,
    serie_comprobante    VARCHAR(7),
    num_comprobante      VARCHAR(10) NOT NULL,
    impuesto             DECIMAL(11, 2) NOT NULL,
    total                INTEGER NOT NULL,
    estado               VARCHAR(20) NOT NULL,
	PRIMARY KEY (id_compra)
)

CREATE TABLE detalle_compra (
    -- MYSQL: id_detalle   INTEGER NOT NULL AUTO_INCREMENT,
    id_detalle             INTEGER IDENTITY NOT NULL,
    cantidad               INTEGER NOT NULL,
    precio                 INTEGER NOT NULL,
    id_compra              INTEGER NOT NULL,
    id_producto            INTEGER NOT NULL,
    descuento              INTEGER NOT NULL,
	PRIMARY KEY (id_detalle)
)

CREATE TABLE solicitud (
    -- MYSQL: id_solicitud   INTEGER NOT NULL AUTO_INCREMENT,
    id_solicitud   INTEGER IDENTITY NOT NULL,
    mensaje        VARCHAR(150) NOT NULL,
    telefono       INTEGER NOT NULL,
    mail           VARCHAR(25) NOT NULL,
    fecha          DATE NOT NULL,
	PRIMARY KEY (id_solicitud)
)

ALTER TABLE USUARIO
    ADD CONSTRAINT usuario_rol_fk FOREIGN KEY ( id_rol )
        REFERENCES rol ( id_rol )

ALTER TABLE COMPRA
    ADD CONSTRAINT compra_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario )

ALTER TABLE DETALLE_COMPRA
    ADD CONSTRAINT detalle_compra_compra_fk FOREIGN KEY ( id_compra )
        REFERENCES compra ( id_compra )

ALTER TABLE DETALLE_COMPRA
    ADD CONSTRAINT detalle_compra_producto_fk FOREIGN KEY ( id_producto )
        REFERENCES producto ( id_producto )

ALTER TABLE PRODUCTO
    ADD CONSTRAINT producto_categoria_fk FOREIGN KEY ( id_categoria )
        REFERENCES categoria ( id_categoria )
