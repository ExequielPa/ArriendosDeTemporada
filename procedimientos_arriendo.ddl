CREATE OR REPLACE PROCEDURE delete_usuario(id_usuarioD in NUMBER) IS
BEGIN
DELETE FROM usuario where id_usuario=id_usuarioD;
END;

CREATE OR REPLACE PROCEDURE update_usuario(id_usuarioU in NUMBER, nombre_usuarioU in VARCHAR2, contraseniaU in VARCHAR2, rolU in NUMBER, nombreU in VARCHAR2, apellido_pU in VARCHAR2,apellido_mU in VARCHAR2, emailU in VARCHAR2) IS
BEGIN
UPDATE usuario
SET
nombre_usuario = nombre_usuarioU, contrasenia = contraseniaU, rol = rolU, nombre = nombreU, apellido_p = apellido_pU, apellido_m = apellido_mU, email = emailU
WHERE id_usuario = id_usuarioU;
END;

/* CRUD DEPTO */

CREATE OR REPLACE PROCEDURE insert_dpto (id_dpto in VARCHAR2, num_depto in NUMBER, direccion in VARCHAR2, descripcion in VARCHAR2, region in VARCHAR2, estado in NUMBER) IS
BEGIN
INSERT INTO dpto (id_dpto, num_depto, direccion, descripcion, region, estado)
VALUES (id_dpto, num_depto, direccion, descripcion, region, estado);
END;

CREATE OR REPLACE PROCEDURE delete_dpto (id_dptoD in VARCHAR2) IS
BEGIN
DELETE FROM dpto WHERE id_dpto = id_dptoD;
END;

CREATE OR REPLACE PROCEDURE update_dpto (id_dptoU in VARCHAR2, num_deptoU in NUMBER, direccionU in VARCHAR2, descripcionU in VARCHAR2, regionU in VARCHAR2, estadoU in NUMBER) IS
BEGIN
UPDATE dpto
SET
num_depto = num_deptoU, direccion = direccionU, descripcion = descripcionU, region = regionU, estado = estadoU
WHERE id_dpto = id_dptoU;
END;

/* CRUD CLIENTE */ 

CREATE OR REPLACE PROCEDURE insert_cliente (id_cliente in NUMBER, rut_cliente in VARCHAR2, pasaporte in VARCHAR2, passwrd in VARCHAR2, nombre in VARCHAR2, apellido_p in VARCHAR2, apellido_m in VARCHAR2, num_celular in NUMBER, correo in VARCHAR2, nacionalidad in VARCHAR2, cliente_frecuente in CHAR) IS
BEGIN
INSERT INTO cliente (id_cliente, rut_cliente, pasaporte, passwrd, nombre, apellido_p, apellido_m, num_celular, correo, nacionalidad, cliente_frecuente)
VALUES (id_cliente, rut_cliente, pasaporte, passwrd, nombre, apellido_p, apellido_m, num_celular, correo, nacionalidad, cliente_frecuente);
END;

CREATE OR REPLACE PROCEDURE delete_cliente (id_clienteD in NUMBER) IS
BEGIN
DELETE FROM cliente WHERE id_cliente = id_clienteD;
END;

CREATE OR REPLACE PROCEDURE update_cliente (id_clienteU in NUMBER, rut_clienteU in VARCHAR2, pasaporteU in VARCHAR2, passwrdU in VARCHAR2, nombreU in VARCHAR2, apellido_pU in VARCHAR2, apellido_mU in VARCHAR2, num_celularU in NUMBER, correoU in VARCHAR2, nacionalidadU in VARCHAR2, cliente_frecuenteU in CHAR) IS
BEGIN
UPDATE cliente
SET
rut_cliente = rut_clienteU, pasaporte = pasaporteU, passwrd = passwrdU, nombre = nombreU, apellido_p = apellido_pU, apellido_m = apellido_mU, num_celular = num_celularU, correo = correoU, nacionalidad = nacionalidadU, cliente_frecuente = cliente_frecuenteU
WHERE id_cliente = id_clienteU;
END;


/* CRUD INVENTARIO */ 

CREATE OR REPLACE PROCEDURE insert_inventario (id_inventario in VARCHAR2, nombre_articulo in VARCHAR2, tipo_articulo in VARCHAR2, valor_articulo in NUMBER, dpto_id_dpto in VARCHAR2) IS
BEGIN
INSERT INTO inventario (id_inventario, nombre_articulo, tipo_articulo, valor_articulo, dpto_id_dpto)
VALUES (id_inventario, nombre_articulo, tipo_articulo, valor_articulo, dpto_id_dpto);
END;

CREATE OR REPLACE PROCEDURE delete_inventario (id_inventarioD in VARCHAR2) IS
BEGIN
DELETE FROM inventario WHERE id_inventario = id_inventarioD;
END;

CREATE OR REPLACE PROCEDURE update_inventario (id_inventarioU in VARCHAR2, nombre_articuloU in VARCHAR2, tipo_articuloU in VARCHAR2, valor_articuloU in NUMBER, dpto_id_dptoU in VARCHAR2) IS
BEGIN
UPDATE inventario
SET
nombre_articulo = nombre_articuloU, tipo_articulo = tipo_articuloU, valor_articulo = valor_articuloU, dpto_id_dpto = dpto_id_dptoU
WHERE id_inventario = id_inventarioU;
END;