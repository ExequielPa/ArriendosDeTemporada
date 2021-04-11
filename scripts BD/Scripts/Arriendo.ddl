-- Generado por Oracle SQL Developer Data Modeler 20.4.1.406.0906
--   en:        2021-04-11 16:25:15 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE acompanante (
    id_acompanante      NUMBER(10) NOT NULL,
    rut_acompanante     VARCHAR2(11),
    pasaporte           VARCHAR2(11),
    nombre              VARCHAR2(50) NOT NULL,
    apellido_p          VARCHAR2(50) NOT NULL,
    apellido_m          VARCHAR2(50) NOT NULL,
    cliente_id_cliente  NUMBER(20) NOT NULL
);

ALTER TABLE acompanante ADD CONSTRAINT acompanante_pk PRIMARY KEY ( id_acompanante );

CREATE TABLE checkeo (
    estado_in           CHAR(1) NOT NULL,
    estado_out          CHAR(1),
    fecha_in            DATE NOT NULL,
    fecha_out           DATE,
    inventario_id_inv   NUMBER(10) NOT NULL,
    reserva_id_reserva  NUMBER(10) NOT NULL
);

ALTER TABLE checkeo ADD CONSTRAINT checkeo_pk PRIMARY KEY ( reserva_id_reserva,
                                                            inventario_id_inv );

CREATE TABLE cliente (
    id_cliente         NUMBER(20) NOT NULL,
    rut_cliente        VARCHAR2(11),
    pasaporte          VARCHAR2(11),
    passwrd            VARCHAR2(25) NOT NULL,
    nombre             VARCHAR2(50) NOT NULL,
    apellido_p         VARCHAR2(50) NOT NULL,
    apellido_m         VARCHAR2(50) NOT NULL,
    num_celular        NUMBER(9) NOT NULL,
    correo             VARCHAR2(50) NOT NULL,
    nacionalidad       VARCHAR2(20) NOT NULL,
    cliente_frecuente  CHAR(1) NOT NULL,
    estado_cliente     VARCHAR2(50) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE det_serv_extra (
    descripcion               VARCHAR2(50) NOT NULL,
    cant_serv                 VARCHAR2(50) NOT NULL,
    tour_id_tour              NUMBER(10) NOT NULL,
    transporte_id_transporte  NUMBER NOT NULL,
    reserva_id_reserva        NUMBER(10) NOT NULL
);

ALTER TABLE det_serv_extra ADD CONSTRAINT det_serv_extra_pk PRIMARY KEY ( tour_id_tour,
                                                                          transporte_id_transporte );

CREATE TABLE dpto (
    id_dpto      NUMBER(10) NOT NULL,
    num_depto    NUMBER(6) NOT NULL,
    direccion    VARCHAR2(200) NOT NULL,
    descripcion  VARCHAR2(1000) NOT NULL,
    region       VARCHAR2(20) NOT NULL,
    estado       NUMBER(3) NOT NULL
);

ALTER TABLE dpto ADD CONSTRAINT dpto_pk PRIMARY KEY ( id_dpto );

CREATE TABLE inventario (
    id_inv        NUMBER(10) NOT NULL,
    nombre_arti   VARCHAR2(150) NOT NULL,
    tipo_arti     VARCHAR2(150) NOT NULL,
    valor_arti    NUMBER(6) NOT NULL,
    dpto_id_dpto  NUMBER(10) NOT NULL
);

ALTER TABLE inventario ADD CONSTRAINT inventario_pk PRIMARY KEY ( id_inv );

CREATE TABLE mantencion (
    id_mantecion  NUMBER(10) NOT NULL,
    descripcion   VARCHAR2(50) NOT NULL,
    valor         NUMBER NOT NULL,
    fecha_ini     DATE NOT NULL,
    fecha_term    DATE NOT NULL,
    dpto_id_dpto  NUMBER(10) NOT NULL
);

ALTER TABLE mantencion ADD CONSTRAINT mantencion_pk PRIMARY KEY ( id_mantecion );

CREATE TABLE multa (
    id_multa                    VARCHAR2(10) NOT NULL,
    descripcion                 VARCHAR2(30) NOT NULL,
    monto                       NUMBER(10) NOT NULL,
    checkeo_reserva_id_reserva  NUMBER(10) NOT NULL,
    checkeo_inventario_id_inv   NUMBER(10) NOT NULL
);

ALTER TABLE multa ADD CONSTRAINT multa_pk PRIMARY KEY ( id_multa );

CREATE TABLE pago (
    id_pago              VARCHAR2(10) NOT NULL,
    monto                NUMBER(10) NOT NULL,
    fecha_pago           DATE NOT NULL,
    reserva_id_reserva   NUMBER(10),
    metodo_pago          NUMBER(1) NOT NULL,
    usuario_rut_usuario  VARCHAR2(12) NOT NULL
);

ALTER TABLE pago ADD CONSTRAINT pago_pk PRIMARY KEY ( id_pago );

CREATE TABLE reserva (
    id_reserva          NUMBER(10) NOT NULL,
    fecha_inicio        DATE NOT NULL,
    fecha_fin           DATE NOT NULL,
    estado              NUMBER(1) NOT NULL,
    cliente_id_cliente  NUMBER(20),
    dpto_id_dpto        NUMBER(10) NOT NULL
);

ALTER TABLE reserva ADD CONSTRAINT reserva_pk PRIMARY KEY ( id_reserva );

CREATE TABLE tour (
    id_tour          NUMBER(10) NOT NULL,
    recorrido        VARCHAR2(50) NOT NULL,
    duracion         NUMBER(10) NOT NULL,
    punto_reunion    VARCHAR2(20) NOT NULL,
    horario_salida   DATE NOT NULL,
    horario_llegada  DATE NOT NULL,
    valor            NUMBER(10) NOT NULL
);

ALTER TABLE tour ADD CONSTRAINT tour_pk PRIMARY KEY ( id_tour );

CREATE TABLE transporte (
    id_transporte   NUMBER NOT NULL,
    chofer          VARCHAR2(50) NOT NULL,
    vehiculo        VARCHAR2(25) NOT NULL,
    punto_reunion   VARCHAR2(50) NOT NULL,
    horario_inicio  DATE NOT NULL,
    horario_fin     DATE NOT NULL,
    valor           NUMBER(10) NOT NULL
);

ALTER TABLE transporte ADD CONSTRAINT transporte_pk PRIMARY KEY ( id_transporte );

CREATE TABLE usuario (
    rut_usuario     VARCHAR2(12) NOT NULL,
    contrasenia     VARCHAR2(200) NOT NULL,
    rol             VARCHAR2(50) NOT NULL,
    nombre_usuario  VARCHAR2(20) NOT NULL,
    apellido_p      VARCHAR2(50) NOT NULL,
    apellido_m      VARCHAR2(50) NOT NULL,
    estado_usuario  VARCHAR2(30) NOT NULL,
    email           VARCHAR2(100) NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( rut_usuario );

ALTER TABLE acompanante
    ADD CONSTRAINT acompanante_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE checkeo
    ADD CONSTRAINT checkeo_inventario_fk FOREIGN KEY ( inventario_id_inv )
        REFERENCES inventario ( id_inv );

ALTER TABLE checkeo
    ADD CONSTRAINT checkeo_reserva_fk FOREIGN KEY ( reserva_id_reserva )
        REFERENCES reserva ( id_reserva );

ALTER TABLE det_serv_extra
    ADD CONSTRAINT det_serv_extra_reserva_fk FOREIGN KEY ( reserva_id_reserva )
        REFERENCES reserva ( id_reserva );

ALTER TABLE det_serv_extra
    ADD CONSTRAINT det_serv_extra_tour_fk FOREIGN KEY ( tour_id_tour )
        REFERENCES tour ( id_tour );

ALTER TABLE det_serv_extra
    ADD CONSTRAINT det_serv_extra_transporte_fk FOREIGN KEY ( transporte_id_transporte )
        REFERENCES transporte ( id_transporte );

ALTER TABLE inventario
    ADD CONSTRAINT inventario_dpto_fk FOREIGN KEY ( dpto_id_dpto )
        REFERENCES dpto ( id_dpto );

ALTER TABLE mantencion
    ADD CONSTRAINT mantencion_dpto_fk FOREIGN KEY ( dpto_id_dpto )
        REFERENCES dpto ( id_dpto );

ALTER TABLE multa
    ADD CONSTRAINT multa_checkeo_fk FOREIGN KEY ( checkeo_reserva_id_reserva,
                                                  checkeo_inventario_id_inv )
        REFERENCES checkeo ( reserva_id_reserva,
                             inventario_id_inv );

ALTER TABLE pago
    ADD CONSTRAINT pago_reserva_fk FOREIGN KEY ( reserva_id_reserva )
        REFERENCES reserva ( id_reserva );

ALTER TABLE pago
    ADD CONSTRAINT pago_usuario_fk FOREIGN KEY ( usuario_rut_usuario )
        REFERENCES usuario ( rut_usuario );

ALTER TABLE reserva
    ADD CONSTRAINT reserva_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE reserva
    ADD CONSTRAINT reserva_dpto_fk FOREIGN KEY ( dpto_id_dpto )
        REFERENCES dpto ( id_dpto );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             0
-- ALTER TABLE                             26
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
