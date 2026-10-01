# Pruebas y validación

Para comprobar que la base de datos funciona correctamente se realizaron pruebas sobre las tablas y las restricciones definidas.

## Verificación de las tablas

Primero se verificó que las tablas hayan sido creadas correctamente utilizando consultas `SELECT`.

```sql
SELECT * FROM CLIENTE;
SELECT * FROM EMPLEADO;
SELECT * FROM METODO_DE_PAGO;
SELECT * FROM PRODUCTO;
SELECT * FROM PROVEEDOR;
SELECT * FROM CATEGORIA;
SELECT * FROM COMPRA;
SELECT * FROM DETALLEDECOMPRA;
```

## Prueba de clave primaria

Se intentó ingresar un registro utilizando un valor de clave primaria que ya existe.

**Resultado esperado:** SQL Server debe rechazar el registro e indicar que se está intentando ingresar una clave primaria duplicada.

## Prueba de clave foránea

Se intentó ingresar un registro utilizando un código que no existe en la tabla relacionada.

Por ejemplo, ingresar una compra con un `cod_cliente` que no existe.

**Resultado esperado:** SQL Server debe rechazar el registro debido a la restricción de clave foránea.

## Prueba de valores únicos

Se verificó que los campos que poseen `UNIQUE` no permitan valores repetidos.

Se puede realizar la prueba intentando ingresar:

* Un DNI que ya exista.
* Un CUIT que ya exista.
* Un tipo de pago que ya exista.
* Un nombre de categoría que ya exista.

**Resultado esperado:** SQL Server debe rechazar el registro duplicado.

## Prueba de restricciones CHECK

Se probaron valores que no cumplen con las condiciones establecidas mediante `CHECK`.

Por ejemplo, ingresar un DNI que contenga letras o un CUIT que contenga caracteres no numéricos.

**Resultado esperado:** SQL Server debe rechazar los valores que no cumplen con la condición.

## Prueba de campos obligatorios

Se verificó que los campos definidos como `NOT NULL` no puedan quedar vacíos.

**Resultado esperado:** SQL Server debe mostrar un error al intentar insertar un registro sin completar un campo obligatorio.

## Resultado de las pruebas

Las pruebas permiten comprobar que las restricciones definidas en las tablas funcionan correctamente y ayudan a evitar datos duplicados, valores incorrectos y relaciones con registros inexistentes.

