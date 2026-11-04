-- Datos de Prueba
IF NOT EXISTS (SELECT 1 FROM CLIENTE WHERE dni = '12345678')
    INSERT INTO CLIENTE (dni, nombre_y_apellido) VALUES ('12345678', 'Nicolas Lopez');

IF NOT EXISTS (SELECT 1 FROM EMPLEADO WHERE nombre_y_apellido = 'Oscar Diaz')
    INSERT INTO EMPLEADO (nombre_y_apellido) VALUES ('Oscar Diaz');

IF NOT EXISTS (SELECT 1 FROM METODO_DE_PAGO WHERE tipo_de_pago = 'Efectivo')
    INSERT INTO METODO_DE_PAGO (tipo_de_pago) VALUES ('Efectivo');

IF NOT EXISTS (SELECT 1 FROM CATEGORIA WHERE nombre_categoria = 'Bebidas')
    INSERT INTO CATEGORIA (nombre_categoria) VALUES ('Bebidas');

IF NOT EXISTS (SELECT 1 FROM PRODUCTO WHERE nombre = 'Coca-Cola 1.5L')
    INSERT INTO PRODUCTO (nombre, descripcion, id_categoria)
    VALUES ('Coca-Cola 1.5L', 'Gaseosa descartable',
            (SELECT id_categoria FROM CATEGORIA WHERE nombre_categoria = 'Bebidas'));


-- Simulacion de Compra
INSERT INTO COMPRA (costo, fecha_hora, cod_cliente, id_metodo, id_empleado)
VALUES (10500, GETDATE(),
        (SELECT cod_cliente FROM CLIENTE WHERE dni = '12345678'),
        (SELECT id_metodo FROM METODO_DE_PAGO WHERE tipo_de_pago = 'Efectivo'),
        (SELECT TOP 1 id_empleado FROM EMPLEADO WHERE nombre_y_apellido = 'Oscar Diaz'));

INSERT INTO DETALLE_DE_COMPRA (id_compra, precio_unitario, sub_total, cantidad, cod_producto)
VALUES ((SELECT MAX(id_compra) FROM COMPRA),
        3500, 10500, 3,
        (SELECT cod_producto FROM PRODUCTO WHERE nombre = 'Coca-Cola 1.5L'));


-- Comprobacion previa  a la actualizacion
SELECT * FROM DETALLE_DE_COMPRA;   
SELECT * FROM AUDITORIA_DETALLE;   


-- Prueba del trigger
UPDATE DETALLE_DE_COMPRA
SET cantidad = 2, precio_unitario = 3000, sub_total = 6000
WHERE id_compra = (SELECT MAX(id_compra) FROM COMPRA);


-- Comprobacion post actualizacion
SELECT * FROM DETALLE_DE_COMPRA;
SELECT * FROM AUDITORIA_DETALLE;