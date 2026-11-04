-- Procedimiento para registrar una nueva compra

USE MiniMarket;
GO

CREATE PROCEDURE dbo.sp_RegistrarCompra
    @costo DECIMAL(10,2),
    @fecha_hora DATETIME,
    @cod_cliente INT,
    @id_metodo INT
AS
BEGIN
    INSERT INTO COMPRA (costo, fecha_hora, cod_cliente, id_metodo)
    VALUES (@costo, @fecha_hora, @cod_cliente, @id_metodo);
END;
GO
