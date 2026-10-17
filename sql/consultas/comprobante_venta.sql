-- Consulta: comprobante de venta


USE MiniMarket;
GO

DECLARE @id_compra INT = 1;

SELECT
    c.id_compra,
    c.fecha_hora,
    cl.nombre_y_apellido AS cliente,
    cl.dni,
    mp.tipo_de_pago AS metodo_pago,
    p.nombre AS producto,
    d.cantidad,
    d.precio_unitario,
    d.subtotal,
    c.costo AS total_compra
FROM COMPRA AS c
INNER JOIN CLIENTE AS cl
    ON c.cod_cliente = cl.cod_cliente
INNER JOIN METODO_DE_PAGO AS mp
    ON c.id_metodo = mp.id_metodo
INNER JOIN DETALLE_DE_COMPRA AS d
    ON c.id_compra = d.id_compra
INNER JOIN PRODUCTO AS p
    ON d.cod_producto = p.cod_producto
WHERE c.id_compra = @id_compra
ORDER BY d.cod_detalle;
