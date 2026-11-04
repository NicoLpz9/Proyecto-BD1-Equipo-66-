USE MiniMarket;
GO

-- OPTIMIZACIÓN ESTRUCTURAL: Crear el índice para las fechas
CREATE NONCLUSTERED INDEX IX_Compra_FechaYHora 
ON COMPRA (fecha_y_hora);
GO

-- CÓDIGO OPTIMIZADO: Consulta que aprovecha el índice y trae las columnas justas
SELECT 
    c.id_compra, 
    c.fecha_y_hora, 
    d.cod_producto, 
    d.cantidad, 
    d.sub_total
FROM COMPRA AS c
INNER JOIN DETALLEDECOMPRA AS d ON c.id_compra = d.id_compra
WHERE c.fecha_y_hora >= '2026-09-01 00:00:00' 
  AND c.fecha_y_hora < '2026-10-01 00:00:00';
GO
