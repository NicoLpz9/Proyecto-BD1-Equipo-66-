INSERT INTO EMPLEADO(id_empleado , nombre_y_apellido)
VALUES (999,'lionel messi');

INSERT INTO METODODEPAGO (id_metodo, tipo_de_pago) 
VALUES (1, 'Transferencia'), (2, 'Efectivo');

INSERT INTO CLIENTE (dni, nombre_y_apellido, cod_cliente) 
VALUES (42345678, 'Sofia Martinez', 100);

INSERT INTO PROVEEDORES (CUIT, razon_social, cod_Proveedor) 
VALUES ('30-12345678-9', 'Textil Mayorista SA', 10);

INSERT INTO CATEGORIA (id_categoria, nombre_categoria) 
VALUES (1, 'Remeras Oversize'), (2, 'Pantalones Baggy');


-- Tablas intermedias (Dependen de que las de arriba ya existan)
INSERT INTO PRODUCTO (Cod_Producto, nombre, descripcion, id_empleado, id_categoria, cod_Proveedor) 
VALUES (1001, 'Remera Lisa Negra', 'Algodón peinado premium, corte oversize',999, 1, 10);

INSERT INTO COMPRA (id_compra, costo, fecha_y_hora, cod_cliente, id_metodo) 
VALUES (5000, 25000, '2026-09-30 18:30:00', 100, 1);


-- Tablas finales (Dependen de Compra y Producto)
INSERT INTO DETALLEDECOMPRA (precio_unitario, cod_detalle, sub_total, cantidad, id_compra, Cod_Producto) 
VALUES (25000, 1, 25000, 1, 5000, 1001);
--para probar los datos agregados
SELECT * FROM EMPLEADO;
SELECT * FROM METODODEPAGO;
SELECT * FROM CLIENTE;
SELECT * FROM PROVEEDORES;
SELECT * FROM CATEGORIA;
SELECT * FROM PRODUCTO;
SELECT * FROM COMPRA;
SELECT * FROM DETALLEDECOMPRA;

