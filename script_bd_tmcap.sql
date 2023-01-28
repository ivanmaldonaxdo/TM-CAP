-- Generado por Oracle SQL Developer Data Modeler 18.3.0.268.1156
--   en:        2022-01-05 14:36:49 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE categoria CASCADE CONSTRAINTS;

DROP TABLE compra CASCADE CONSTRAINTS;

DROP TABLE detalle_compra CASCADE CONSTRAINTS;

DROP TABLE producto CASCADE CONSTRAINTS;

DROP TABLE rol CASCADE CONSTRAINTS;

DROP TABLE solicitud CASCADE CONSTRAINTS;

DROP TABLE usuario CASCADE CONSTRAINTS;

CREATE TABLE categoria (
    id_categoria   INTEGER NOT NULL,
    nombre         VARCHAR2(50) NOT NULL,
    estado         CHAR(1) NOT NULL
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( id_categoria );

CREATE TABLE compra (
    id_compra            INTEGER NOT NULL,
    fecha_compra         DATE NOT NULL,
    usuario_id_usuario   INTEGER NOT NULL,
    tipo_comprobante     VARCHAR2(20) NOT NULL,
    serie_comprobante    VARCHAR2(7),
    num_comprobante      VARCHAR2(10) NOT NULL,
    impuesto             NUMBER(11, 2) NOT NULL,
    total                INTEGER NOT NULL,
    estado               VARCHAR2(20) NOT NULL
);

ALTER TABLE compra ADD CONSTRAINT compra_pk PRIMARY KEY ( id_compra );

CREATE TABLE detalle_compra (
    id_detalle             INTEGER NOT NULL,
    cantidad               INTEGER NOT NULL,
    precio                 INTEGER NOT NULL,
    compra_id_compra       INTEGER NOT NULL,
    producto_id_producto   INTEGER NOT NULL,
    descuento              INTEGER NOT NULL
);

ALTER TABLE detalle_compra ADD CONSTRAINT detalle_compra_pk PRIMARY KEY ( id_detalle,
                                                                          compra_id_compra );

CREATE TABLE producto (
    id_producto              INTEGER NOT NULL,
    nombre                   VARCHAR2(256) NOT NULL,
    descripcion              VARCHAR2(256),
    precio                   INTEGER NOT NULL,
    categoria_id_categoria   INTEGER NOT NULL,
    codigo                   VARCHAR2(50) NOT NULL,
    stock                    INTEGER NOT NULL,
    estado                   CHAR(1) NOT NULL,
    imagen                   BLOB
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id_producto );

CREATE TABLE rol (
    id_rol       INTEGER NOT NULL,
    nombre_rol   VARCHAR2(20) NOT NULL,
    estado       CHAR(1) NOT NULL
);

ALTER TABLE rol ADD CONSTRAINT rol_pk PRIMARY KEY ( id_rol );

CREATE TABLE solicitud (
    id_solicitud   INTEGER NOT NULL,
    mensaje        VARCHAR2(150) NOT NULL,
    telefono       INTEGER NOT NULL,
    mail           VARCHAR2(25) NOT NULL,
    fecha          DATE NOT NULL
);

ALTER TABLE solicitud ADD CONSTRAINT solicitud_pk PRIMARY KEY ( id_solicitud );

CREATE TABLE usuario (
    id_usuario   INTEGER NOT NULL,
    nombre       VARCHAR2(20) NOT NULL,
    apellidos    VARCHAR2(40) NOT NULL,
    fecha_nac    DATE NOT NULL,
    email        VARCHAR2(30) NOT NULL,
    clave        VARCHAR2(15) NOT NULL,
    rut          VARCHAR2(12) NOT NULL,
    rol_id_rol   INTEGER NOT NULL,
    direccion    VARCHAR2(70) NOT NULL,
    telefono     INTEGER NOT NULL,
    estado       VARCHAR2(15) NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE compra
    ADD CONSTRAINT compra_usuario_fk FOREIGN KEY ( usuario_id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE detalle_compra
    ADD CONSTRAINT detalle_compra_compra_fk FOREIGN KEY ( compra_id_compra )
        REFERENCES compra ( id_compra );

ALTER TABLE detalle_compra
    ADD CONSTRAINT detalle_compra_producto_fk FOREIGN KEY ( producto_id_producto )
        REFERENCES producto ( id_producto );

ALTER TABLE producto
    ADD CONSTRAINT producto_categoria_fk FOREIGN KEY ( categoria_id_categoria )
        REFERENCES categoria ( id_categoria );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_rol_fk FOREIGN KEY ( rol_id_rol )
        REFERENCES rol ( id_rol );

ALTER TABLE compra
    ADD CONSTRAINT compra_usuario_fk FOREIGN KEY ( usuario_id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE detalle_compra
    ADD CONSTRAINT detalle_compra_compra_fk FOREIGN KEY ( compra_id_compra )
        REFERENCES compra ( id_compra );

ALTER TABLE detalle_compra
    ADD CONSTRAINT detalle_compra_producto_fk FOREIGN KEY ( producto_id_producto )
        REFERENCES producto ( id_producto );

ALTER TABLE producto
    ADD CONSTRAINT producto_categoria_fk FOREIGN KEY ( categoria_id_categoria )
        REFERENCES categoria ( id_categoria );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_rol_fk FOREIGN KEY ( rol_id_rol )
        REFERENCES rol ( id_rol );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             17
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
