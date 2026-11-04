-- Datos de Prueba
IF NOT EXISTS (SELECT 1 FROM CLIENTE WHERE dni = '12345678')
    INSERT INTO CLIENTE (dni, nombre_y_apellido) VALUES ('12345678', 'Nicolas Lopez');

IF NOT EXISTS (SELECT 1 FROM EMPLEADO WHERE nombre_y_apellido = 'Oscar Diaz')
    INSERT INTO EMPLEADO (nombre_y_apellido) VALUES ('Oscar Diaz');

IF NOT EXISTS (SELECT 1 FROM CATEGORIA WHERE nombre_categoria = 'Bebidas')
    INSERT INTO CATEGORIA (nombre_categoria) VALUES ('Bebidas');

IF NOT EXISTS (SELECT 1 FROM PRODUCTO WHERE nombre = 'Coca-Cola 1.5L')
    INSERT INTO PRODUCTO (nombre, descripcion, id_empleado, id_categoria)
    VALUES ('Coca-Cola 1.5L', 'Gaseosa descartable',
            (SELECT TOP 1 id_empleado FROM EMPLEADO WHERE nombre_y_apellido = 'Empleado Demo'),
            (SELECT id_categoria FROM CATEGORIA WHERE nombre_categoria = 'Bebidas'));


-- Simulacion de Compra
INSERT INTO COMPRA (costo, fecha_y_hora, cod_cliente)
VALUES (10500, GETDATE(),
        (SELECT cod_cliente FROM CLIENTE WHERE dni = '12345678'));

INSERT INTO DETALLEDECOMPRA (id_compra, precio_unitario, sub_total, cantidad, cod_producto)
VALUES ((SELECT MAX(id_compra) FROM COMPRA),
        3500, 10500, 3,
        (SELECT cod_producto FROM PRODUCTO WHERE nombre = 'Coca-Cola 1.5L'));

-- Comprobacion previa  a la actualizacion
SELECT * FROM DETALLEDECOMPRA;   
SELECT * FROM AUDITORIA_DETALLE;   


-- Prueba del trigger
UPDATE DETALLEDECOMPRA
SET cantidad = 2, precio_unitario = 3000, sub_total = 6000
WHERE id_compra = (SELECT MAX(id_compra) FROM COMPRA);


-- Comprobacion post actualizacion
SELECT * FROM DETALLEDECOMPRA;
SELECT * FROM AUDITORIA_DETALLE;
