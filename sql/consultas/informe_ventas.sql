-- Consulta: informe de ventas


USE MiniMarket;
GO

DECLARE @fecha_inicio DATE = '2026-10-01';
DECLARE @fecha_fin DATE = '2026-10-31';

SELECT
    cat.nombre_categoria AS categoria,
    SUM(d.subtotal) AS total_vendido,
    SUM(d.cantidad) AS unidades_vendidas,
    COUNT(DISTINCT c.id_compra) AS cantidad_compras
FROM COMPRA AS c
INNER JOIN DETALLE_DE_COMPRA AS d
    ON c.id_compra = d.id_compra
INNER JOIN PRODUCTO AS p
    ON d.cod_producto = p.cod_producto
INNER JOIN CATEGORIA AS cat
    ON p.id_categoria = cat.id_categoria
WHERE c.fecha_hora >= @fecha_inicio
  AND c.fecha_hora < DATEADD(DAY, 1, @fecha_fin)
GROUP BY cat.nombre_categoria
ORDER BY total_vendido DESC;
