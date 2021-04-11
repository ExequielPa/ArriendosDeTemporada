/* CREATE SEQUENCES */
CREATE SEQUENCE id_dpto
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
    CACHE 20;

CREATE SEQUENCE id_cliente
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
    CACHE 20;
    
CREATE SEQUENCE id_inv
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
    CACHE 20;    


/* CRUD USUARIO */
CREATE OR REPLACE PROCEDURE insert_usuario (rut_usuario in VARCHAR2, contrasenia in VARCHAR2, rol in VARCHAR2, nombre_usuario in VARCHAR2, apellido_p in VARCHAR2, apellido_m in VARCHAR2, estado_usuario in VARCHAR2, email in VARCHAR2) IS
BEGIN
INSERT INTO usuario (rut_usuario, contrasenia, rol, nombre_usuario, apellido_p, apellido_m, estado_usuario, email)
VALUES (rut_usuario, contrasenia, rol, nombre_usuario, apellido_p, apellido_m, estado_usuario, email);
END;


CREATE OR REPLACE PROCEDURE delete_usuario(rut_usuario in varchar2) IS
BEGIN
UPDATE usuario SET estado_usuario='Inhabilitado'
WHERE rut_usuario = rut_usuario;
END;


/* DELETE USUARIO COMENTADO
CREATE OR REPLACE PROCEDURE delete_usuario(rut_usuarioD in NUMBER) IS
BEGIN
DELETE FROM usuario where rut_usuario=rut_usuarioD;
END; */ 

CREATE OR REPLACE PROCEDURE update_usuario(rut_usuarioU in VARCHAR2, rolU in VARCHAR2, nombre_usuarioU in VARCHAR2, apellido_pU in VARCHAR2, apellido_mU in VARCHAR2, estado_usuarioU in VARCHAR2, emailU in VARCHAR2) IS
BEGIN
UPDATE usuario
SET
rol = rolU, nombre_usuario = nombre_usuarioU, apellido_p = apellido_pU, apellido_m = apellido_mU, estado_usuario = estado_usuarioU, email = emailU
WHERE rut_usuario = rut_usuarioU;
END;

commit;

/* CRUD DEPTO */

CREATE OR REPLACE PROCEDURE insert_dpto (num_depto in NUMBER, direccion in VARCHAR2, descripcion in VARCHAR2, region in VARCHAR2, estado in VARCHAR2) IS
BEGIN
INSERT INTO dpto (id_dpto, num_depto, direccion, descripcion, region, estado)
VALUES (id_dpto.nextval, num_depto, direccion, descripcion, region, estado);
END;

CREATE OR REPLACE PROCEDURE delete_dpto (id_dptoD in VARCHAR2) IS
BEGIN
DELETE FROM dpto WHERE id_dpto = id_dptoD;
END;

CREATE OR REPLACE PROCEDURE update_dpto (id_dptoU in NUMBER, num_deptoU in NUMBER, direccionU in VARCHAR2, descripcionU in VARCHAR2, regionU in VARCHAR2, estadoU in VARCHAR2) IS
BEGIN
UPDATE dpto
SET
num_depto = num_deptoU, direccion = direccionU, descripcion = descripcionU, region = regionU, estado = estadoU
WHERE id_dpto = id_dptoU;
END;

/* CRUD CLIENTE */ 

CREATE OR REPLACE PROCEDURE insert_cliente (rut_cliente in VARCHAR2, pasaporte in VARCHAR2, passwrd in VARCHAR2, nombre in VARCHAR2, apellido_p in VARCHAR2, apellido_m in VARCHAR2, num_celular in NUMBER, correo in VARCHAR2, nacionalidad in VARCHAR2, cliente_frecuente in CHAR) IS
BEGIN
INSERT INTO cliente (id_cliente, rut_cliente, pasaporte, passwrd, nombre, apellido_p, apellido_m, num_celular, correo, nacionalidad, cliente_frecuente)
VALUES (id_cliente.nextval, rut_cliente, pasaporte, passwrd, nombre, apellido_p, apellido_m, num_celular, correo, nacionalidad, cliente_frecuente);
END;

CREATE OR REPLACE PROCEDURE delete_cliente (id_clienteD in NUMBER) IS
BEGIN
DELETE FROM cliente WHERE id_cliente = id_clienteD;
END;

CREATE OR REPLACE PROCEDURE desabilitar_cliente(id_cliente in NUMBER) IS
BEGIN
UPDATE cliente SET estado_cliente='Inhabilitado'
WHERE id_cliente = id_cliente;
END;

CREATE OR REPLACE PROCEDURE update_cliente (id_clienteU in NUMBER, rut_clienteU in VARCHAR2, pasaporteU in VARCHAR2, passwrdU in VARCHAR2, nombreU in VARCHAR2, apellido_pU in VARCHAR2, apellido_mU in VARCHAR2, num_celularU in NUMBER, correoU in VARCHAR2, nacionalidadU in VARCHAR2, cliente_frecuenteU in CHAR) IS
BEGIN
UPDATE cliente
SET
rut_cliente = rut_clienteU, pasaporte = pasaporteU, passwrd = passwrdU, nombre = nombreU, apellido_p = apellido_pU, apellido_m = apellido_mU, num_celular = num_celularU, correo = correoU, nacionalidad = nacionalidadU, cliente_frecuente = cliente_frecuenteU
WHERE id_cliente = id_clienteU;
END;


/* CRUD INVENTARIO */ 

CREATE OR REPLACE PROCEDURE insert_inventario (nombre_arti in VARCHAR2, tipo_arti in VARCHAR2, valor_arti in NUMBER, dpto_id_dpto in NUMBER) IS
BEGIN
INSERT INTO inventario (id_inv, nombre_arti, tipo_arti, valor_arti, dpto_id_dpto)
VALUES (id_inv.nextval, nombre_arti, tipo_arti, valor_arti, dpto_id_dpto);
END;

CREATE OR REPLACE PROCEDURE delete_inventario (id_invD in VARCHAR2) IS
BEGIN
DELETE FROM inventario WHERE id_inv = id_invD;
END;

CREATE OR REPLACE PROCEDURE update_inventario (id_invU in VARCHAR2, nombre_artiU in VARCHAR2, tipo_artiU in VARCHAR2, valor_artiU in NUMBER, dpto_id_dptoU in NUMBER) IS
BEGIN
UPDATE inventario
SET
nombre_arti = nombre_artiU, tipo_arti = tipo_artiU, valor_arti = valor_artiU, dpto_id_dpto = dpto_id_dptoU
WHERE id_inv = id_invU;
END;