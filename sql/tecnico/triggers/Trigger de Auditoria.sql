-- Creacion de la tabla para la auditoria
CREATE TABLE AUDITORIA_DETALLE (
    id_auditoria    INT IDENTITY(1,1) PRIMARY KEY,
    id_compra       INT,
    cod_detalle     INT,
    cantidad_antes  INT,
    cantidad_nueva  INT,
    precio_antes    DECIMAL(10,2),
    precio_nuevo    DECIMAL(10,2),
    fecha           DATETIME DEFAULT GETDATE(),
    usuario         NVARCHAR(128) DEFAULT SYSTEM_USER,
    accion          VARCHAR(10)
);
GO

--- Trigger de Auditoria ante actualizacion
CREATE TRIGGER tr_Auditoria_Detalle_Update
ON DETALLEDECOMPRA
AFTER UPDATE
AS
BEGIN
    INSERT INTO AUDITORIA_DETALLE
        (id_compra, cod_detalle, cantidad_antes, cantidad_nueva,
         precio_antes, precio_nuevo, accion)
    SELECT
        d.id_compra, d.cod_detalle, d.cantidad, i.cantidad,
        d.precio_unitario, i.precio_unitario, 'UPDATE'
    FROM deleted d
    JOIN inserted i ON d.cod_detalle = i.cod_detalle;
END;
GO
