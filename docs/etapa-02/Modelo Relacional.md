### Modelo Relacional 

### CLIENTE

CLIENTE(cod_cliente, dni, nombre_y_apellido)

PK: cod_cliente


### EMPLEADO

EMPLEADO(id_empleado, nombre_y_apellido)

PK: id_empleado


### METODO_DE_PAGO

METODO_DE_PAGO(id_metodo, tipo_de_pago)

PK: id_metodo


### COMPRA

COMPRA(id_compra, costo, fecha_hora, cod_cliente, id_metodo)

PK: id_compra
FK: cod_cliente
FK: id_metodo


### PRODUCTO

PRODUCTO(cod_producto, nombre, descripcion, id_empleado, id_categoria, cod_proveedor)

PK: cod_producto
FK: id_empleado
FK: id_categoria
FK: cod_proveedor


### DETALLE_DE_COMPRA

DETALLE_DE_COMPRA(cod_detalle, id_compra, precio_unitario, subtotal, cantidad, cod_producto)

PK: cod_detalle
FK: id_compra
FK: cod_producto


### PROVEEDOR

PROVEEDOR(cod_proveedor, CUIT, razon_social)

PK: cod_proveedor


### CATEGORIA

CATEGORIA(id_categoria, nombre_categoria)

PK: id_categoria
