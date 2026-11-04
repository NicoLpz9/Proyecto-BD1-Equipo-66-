-- Funcion para calcular el total gastado por un cliente

USE MiniMarket;
GO

CREATE FUNCTION dbo.fn_TotalGastadoCliente
(
    @cod_cliente INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @total DECIMAL(10,2);

    SELECT @total = ISNULL(SUM(costo), 0)
    FROM COMPRA
    WHERE cod_cliente = @cod_cliente;

    RETURN @total;
END;
GO
