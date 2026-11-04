-- PRUEBA A: El cajero intenta consultar los productos (Funciona por GRANT SELECT)
EXECUTE AS USER = 'cajero_minimarket';
SELECT * FROM PRODUCTO;
REVERT;

-- PRUEBA B: El cajero intenta insertar una compra directamente (Falla por DENY INSERT)
EXECUTE AS USER = 'cajero_minimarket';
INSERT INTO COMPRA (costo, fecha_y_hora, cod_cliente) VALUES (9999, GETDATE(), 1);
REVERT;

-- PRUEBA C: El cajero utiliza el Procedimiento Almacenado autorizado (Funciona por GRANT EXECUTE)
EXECUTE AS USER = 'cajero_minimarket';
EXEC sp_RegistrarVenta @cod_cliente = 1, @costo_total = 1500.00;
REVERT;
