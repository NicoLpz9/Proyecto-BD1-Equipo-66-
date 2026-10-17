# Comprobante de venta
## Descripción

Esta consulta permite obtener el detalle de una compra realizada en el MiniMarket. Incluye los datos del cliente, la fecha de la operación, el método de pago y los productos comprados.

## Datos que muestra

- Número de compra.
- Fecha y hora.
- Nombre y DNI del cliente.
- Método de pago.
- Nombre del producto.
- Cantidad comprada.
- Precio unitario.
- Subtotal por producto.
- Total de la compra.

## Tablas utilizadas

- COMPRA
- CLIENTE
- METODO_DE_PAGO
- DETALLE_DE_COMPRA
- PRODUCTO

## Funcionamiento

La consulta relaciona las tablas mediante INNER JOIN y filtra por el identificador de la compra. El identificador se define mediante la variable @id_compra, que permite consultar diferentes compras cambiando su valor.

## Resultado esperado

Se obtiene una fila por cada producto incluido en la compra seleccionada, junto con los datos generales de la operación.
