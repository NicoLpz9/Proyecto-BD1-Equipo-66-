# Implementación

## Creación de la base de datos

Para la implementación utilizamos **SQL Server** y **SQL Server Management Studio (SSMS)**.

La base de datos utilizada es:

```sql
CREATE DATABASE MiniMarket;
```

Luego se seleccionó la base de datos para trabajar con las tablas:

```sql
USE MiniMarket;
```

## Creación de las tablas

Se crearon las tablas correspondientes al modelo:

* CLIENTE
* EMPLEADO
* METODO_DE_PAGO
* PRODUCTO
* PROVEEDOR
* CATEGORIA
* COMPRA
* DETALLEDECOMPRA

Las tablas fueron creadas teniendo en cuenta las relaciones entre los datos y utilizando claves primarias y claves foráneas.

## Tipos de datos

Se utilizaron diferentes tipos de datos según la información:

* `INT` para identificadores y cantidades.
* `VARCHAR` para DNI, nombres y otros datos de texto.
* `CHAR(11)` para el CUIT de los proveedores.
* `DECIMAL(10,2)` para costos, precios y subtotales.
* `DATETIME` para almacenar la fecha y hora de las compras.

También se utilizaron `NOT NULL` en los campos que son obligatorios.

## Claves primarias y foráneas

Cada tabla cuenta con una clave primaria `PRIMARY KEY` para identificar sus registros.

También se utilizaron claves foráneas `FOREIGN KEY` para relacionar las tablas.

Por ejemplo:

* `COMPRA` se relaciona con `CLIENTE` mediante `cod_cliente`.
* `PRODUCTO` se relaciona con `EMPLEADO` mediante `id_empleado`.
* `PRODUCTO` se relaciona con `CATEGORIA` mediante `id_categoria`.
* `PROVEEDOR` se relaciona con `PRODUCTO` mediante `cod_producto`.
* `METODO_DE_PAGO` se relaciona con `COMPRA` mediante `id_compra`.
* `DETALLEDECOMPRA` se relaciona con `COMPRA` mediante `id_compra`.
* `DETALLEDECOMPRA` se relaciona con `PRODUCTO` mediante `cod_producto`.

## Restricciones

Se agregaron restricciones para mantener la integridad de los datos.

Entre ellas se utilizaron:

* `NOT NULL` para campos obligatorios.
* `UNIQUE` para evitar valores repetidos, como el DNI, CUIT y tipo de pago.
* `CHECK` para controlar determinados valores.
* `PRIMARY KEY` para identificar de forma única los registros.
* `FOREIGN KEY` para mantener las relaciones entre las tablas.

## Carga de datos

Después de crear las tablas se pueden cargar los datos mediante sentencias `INSERT INTO`.

Los datos utilizados corresponden al sistema de gestión de ventas y permiten realizar posteriormente las consultas y pruebas de la base de datos.

