# Procedimientos y funciones almacenadas

## ¿Qué son?

Los procedimientos almacenados sirven para guardar instrucciones SQL y ejecutarlas cuando las necesitemos, sin tener que escribirlas nuevamente.

Las funciones almacenadas permiten realizar cálculos y devolver un resultado.

## Aplicación en MiniMarket

En nuestro sistema utilizamos una función para calcular cuánto dinero gastó un cliente sumando todas sus compras.

También creamos un procedimiento almacenado para registrar una compra, ingresando su costo, fecha, cliente y método de pago.

## Implementación

Se crearon los siguientes componentes:

- `fn_TotalGastadoCliente`: calcula el total gastado por un cliente.
- `sp_RegistrarCompra`: permite registrar una nueva compra.

## Pruebas realizadas

Se probó la función con los clientes registrados y se comprobó que sumaba correctamente sus compras.

También se ejecutó el procedimiento para registrar una compra de $12.000 para Sofia Martinez.

El total anterior de la cliente era de $57.000 y, después de registrar la compra, pasó a ser de $69.000.

Los resultados permitieron comprobar que ambos componentes funcionan correctamente.
