-- Consulta: consulta avanzada


USE MiniMarket;
GO

DECLARE @fecha_inicio DATE = '2026-10-01';
DECLARE @fecha_fin DATE = '2026-10-31';

SELECT
    p.nombre AS producto,
    cat.nombre_categoria AS categoria,
    SUM(d.cantidad) AS unidades_vendidas,
    SUM(d.subtotal) AS total_vendido
FROM DETALLE_DE_COMPRA AS d
INNER JOIN COMPRA AS c
    ON d.id_compra = c.id_compra
INNER JOIN PRODUCTO AS p
    ON d.cod_producto = p.cod_producto
INNER JOIN CATEGORIA AS cat
    ON p.id_categoria = cat.id_categoria
WHERE c.fecha_hora >= @fecha_inicio
  AND c.fecha_hora < DATEADD(DAY, 1, @fecha_fin)
GROUP BY p.nombre, cat.nombre_categoria
HAVING SUM(d.cantidad) > 1
ORDER BY unidades_vendidas DESC, total_vendido DESC;

