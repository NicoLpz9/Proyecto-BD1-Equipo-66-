# Restricciones e integridad

En las tablas se utilizaron diferentes restricciones para mantener la integridad de los datos y evitar registros incorrectos.

## PRIMARY KEY

Cada tabla tiene una clave primaria que permite identificar de forma única cada registro.

Por ejemplo:

```sql
CONSTRAINT PK_CLIENTE PRIMARY KEY (cod_cliente)
```

También se utilizan claves primarias en las demás tablas, como `EMPLEADO`, `PRODUCTO`, `PROVEEDOR`, `CATEGORIA` y `COMPRA`.

## FOREIGN KEY

Las claves foráneas permiten relacionar las tablas entre sí.

Por ejemplo, en `COMPRA`:

```sql
CONSTRAINT FK_COMPRA_CLIENTE 
FOREIGN KEY (cod_cliente) REFERENCES CLIENTE(cod_cliente)
```

De esta forma, una compra debe estar asociada a un cliente existente.

También se utilizan claves foráneas en `PRODUCTO`, `PROVEEDOR`, `METODO_DE_PAGO` y `DETALLEDECOMPRA`.

## NOT NULL

Se utilizó `NOT NULL` en los campos que son obligatorios.

Por ejemplo:

```sql
nombre_y_apellido VARCHAR(100) NOT NULL
```

Esto evita que se puedan insertar registros sin completar esos datos.

## UNIQUE

Se utilizó `UNIQUE` para evitar valores repetidos en determinados campos.

Se aplica, por ejemplo, al:

* DNI de los clientes.
* CUIT de los proveedores.
* Tipo de pago.
* Nombre de categoría.

Ejemplo:

```sql
CONSTRAINT UQ_CLIENTE_DNI UNIQUE (dni)
```

## CHECK

Se utilizaron restricciones `CHECK` para controlar que determinados valores cumplan con una condición.

En `CLIENTE` se controla que el DNI contenga solamente números:

```sql
CONSTRAINT CK_CLIENTE_DNI 
CHECK (dni NOT LIKE '%[^0-9]%' AND LEN(dni) >= 1)
```

En `PROVEEDOR` se realiza un control similar sobre el CUIT:

```sql
CONSTRAINT CK_PROVEEDOR_CUIT 
CHECK (CUIT NOT LIKE '%[^0-9]%')
```

Estas restricciones ayudan a evitar el ingreso de datos con formatos incorrectos.

