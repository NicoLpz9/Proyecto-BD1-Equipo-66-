# Informe de ventas
## Descripción

Esta consulta permite analizar las ventas del MiniMarket durante un período determinado, agrupando los resultados según la categoría de los productos vendidos.

## Información obtenida

- Nombre de la categoría.
- Importe total vendido.
- Cantidad de unidades vendidas.
- Cantidad de compras realizadas.

## Tablas utilizadas

- COMPRA
- DETALLE_DE_COMPRA
- PRODUCTO
- CATEGORIA

## Funcionamiento

La consulta relaciona las tablas mediante INNER JOIN y filtra las compras según una fecha de inicio y una fecha de fin.

Utiliza las funciones SUM para calcular el importe total y las unidades vendidas, y COUNT(DISTINCT ...) para contar las compras sin repetir una misma operación dentro de la categoría.

Los resultados se agrupan con GROUP BY por categoría y se ordenan de mayor a menor según el importe vendido.

## Utilidad

Este informe permite comparar el rendimiento de las categorías y conocer cuáles generan mayores ingresos durante el período analizado.
