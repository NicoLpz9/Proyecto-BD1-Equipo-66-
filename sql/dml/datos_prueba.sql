USE MiniMarket;

-- 1. Tablas independientes
INSERT INTO EMPLEADO (nombre_y_apellido) 
VALUES ('Lionel Messi'); 

INSERT INTO CATEGORIA (nombre_categoria) 
VALUES ('Remeras Oversize'), ('Pantalones Baggy'); 

INSERT INTO CLIENTE (dni, nombre_y_apellido) 
VALUES ('42345678', 'Sofia Martinez'); 


-- Tablas con dependencias 
-- Producto depende de Empleado y Categoria 
INSERT INTO PRODUCTO (nombre, descripcion, id_empleado, id_categoria) 
VALUES ('Remera Lisa Negra', 'Algodón peinado premium, corte oversize', 1, 1);

-- Proveedor depende de Producto 
INSERT INTO PROVEEDOR (CUIT, razon_social, cod_producto) 
VALUES ('30123456789', 'Textil Mayorista SA', 1);

-- Compra depende de Cliente 
INSERT INTO COMPRA (costo, fecha_y_hora, cod_cliente) 
VALUES (25000, '2026-09-30 18:30:00', 1);



-- Metodo de Pago depende de Compra 
INSERT INTO METODO_DE_PAGO (tipo_de_pago, id_compra) 
VALUES ('Transferencia', 1), ('Efectivo', 1);

-- Detalle de Compra depende de Compra (ID 1) y Producto 
INSERT INTO DETALLEDECOMPRA (id_compra, precio_unitario, sub_total, cantidad, cod_producto) 
VALUES (1, 25000, 25000, 1, 1);


-- Mostrar todas las tablas para verificar los datos
SELECT 'CLIENTES' AS Tabla, * FROM CLIENTE;
SELECT 'EMPLEADOS' AS Tabla, * FROM EMPLEADO;
SELECT 'CATEGORIAS' AS Tabla, * FROM CATEGORIA;
SELECT 'PRODUCTOS' AS Tabla, * FROM PRODUCTO;
SELECT 'PROVEEDORES' AS Tabla, * FROM PROVEEDOR;
SELECT 'COMPRAS' AS Tabla, * FROM COMPRA;
SELECT 'DETALLES DE COMPRA' AS Tabla, * FROM DETALLEDECOMPRA;
SELECT 'METODOS DE PAGO' AS Tabla, * FROM METODO_DE_PAGO;
