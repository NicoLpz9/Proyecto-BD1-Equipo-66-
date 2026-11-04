# Manejo de transacciones

## ¿Qué son?

Las transacciones permiten ejecutar varias operaciones SQL como si fueran una sola. Esto significa que, si todas salen bien, los cambios se guardan. Pero si ocurre algún error, se pueden deshacer todas las operaciones realizadas.

Esto ayuda a evitar que la base de datos quede con información incompleta.

Las transacciones tienen cuatro propiedades importantes, conocidas como ACID:

- **Atomicidad:** todas las operaciones se realizan o ninguna.
- **Consistencia:** los datos deben mantener su correcto funcionamiento.
- **Aislamiento:** las operaciones no deben interferir incorrectamente entre sí.
- **Durabilidad:** una vez confirmados los cambios, estos quedan guardados.

## ¿Para qué las utilizamos?

En nuestro sistema MiniMarket, una compra necesita guardar información en más de una tabla. Por ejemplo, primero se registra la compra y después los productos que forman parte de ella.

Si una de estas operaciones falla, no queremos que quede registrada solamente una parte de la compra.

## Aplicación en MiniMarket

Creamos una transacción que permite registrar una compra y su detalle.

Primero se guarda la información de la compra en la tabla `COMPRA` y después se registra el producto correspondiente en `DETALLE_DE_COMPRA`.

Utilizamos `COMMIT` para confirmar los cambios cuando todo funciona correctamente y `ROLLBACK` para deshacerlos si ocurre algún error.

## Pruebas realizadas

Realizamos dos pruebas para comprobar su funcionamiento:

**Prueba correcta:**

Se registró una compra de $15.000 para un cliente, junto con su detalle. Como las dos operaciones se realizaron correctamente, los cambios quedaron guardados mediante `COMMIT`.

**Prueba incorrecta:**

Intentamos registrar una compra utilizando un producto que no existía. SQL Server detectó el error y se ejecutó `ROLLBACK`, deshaciendo también el registro de la compra.

## Conclusión

Con estas pruebas comprobamos que las transacciones ayudan a mantener la información ordenada y evitan que queden operaciones incompletas cuando ocurre algún problema.
