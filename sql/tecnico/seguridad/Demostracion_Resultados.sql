
-- PRUEBA A: El cajero intenta consultar los productos 
-- Resultado esperado: Funciona correctamente gracias al GRANT SELECT otorgado por el rol_vendedor.
EXECUTE AS USER = 'cajero_minimarket';
SELECT * FROM PRODUCTO;
REVERT;

-- PRUEBA B: El cajero intenta insertar una compra directamente
-- Resultado esperado: Falla y arroja el Error 229 (The INSERT permission was denied on the object 'COMPRA').
EXECUTE AS USER = 'cajero_minimarket';
INSERT INTO COMPRA (costo, fecha_y_hora, cod_cliente) VALUES (9999, GETDATE(), 1);
REVERT;

-- PRUEBA C: El cajero utiliza el Procedimiento Almacenado autorizado
-- Resultado esperado: Se ejecuta con éxito (1 fila afectada) a través del GRANT EXECUTE, encapsulando la lógica de negocio de forma segura.
EXECUTE AS USER = 'cajero_minimarket';
EXEC sp_RegistrarVenta @cod_cliente = 1, @costo_total = 1500.00;
REVERT;
