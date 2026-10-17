## Descripción

Esta consulta permite identificar los productos de los que se vendieron más de una unidad durante un período determinado.

## Información obtenida

- Nombre del producto.
- Categoría a la que pertenece.
- Cantidad total de unidades vendidas.
- Importe total vendido.

## Tablas utilizadas

- DETALLE_DE_COMPRA
- COMPRA
- PRODUCTO
- CATEGORIA

## Funcionamiento

La consulta relaciona las tablas mediante INNER JOIN y filtra las compras por fecha.

Utiliza SUM para calcular las unidades vendidas y el importe total por producto. Con GROUP BY agrupa los resultados por producto y categoría.

La cláusula HAVING permite mostrar únicamente los productos cuya cantidad total vendida es mayor que una unidad. Finalmente, los resultados se ordenan por cantidad vendida y por importe total.

## Utilidad

Esta consulta ayuda a identificar los productos con mayor movimiento y proporciona información que puede utilizarse para tomar decisiones sobre la reposición de mercadería y el control del inventario.# Consulta avanzada
