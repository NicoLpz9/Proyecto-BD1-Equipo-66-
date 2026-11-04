-- Transacción para registrar una compra y su detalle

USE MiniMarket;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE @id_compra INT;

    -- Registrar la compra
    INSERT INTO COMPRA (costo, fecha_hora, cod_cliente, id_metodo)
    VALUES (15000.00, GETDATE(), 2, 1);

    SET @id_compra = SCOPE_IDENTITY();

    -- Registrar el detalle de la compra
    INSERT INTO DETALLE_DE_COMPRA
        (id_compra, precio_unitario, subtotal, cantidad, cod_producto)
    VALUES
        (@id_compra, 15000.00, 15000.00, 1, 1);

    -- Confirmar las operaciones
    COMMIT TRANSACTION;

    PRINT 'Compra registrada correctamente.';

END TRY
BEGIN CATCH

    -- Deshacer las operaciones si ocurre un error
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    PRINT 'Error: la compra no pudo registrarse.';
    PRINT ERROR_MESSAGE();

END CATCH;
GO
