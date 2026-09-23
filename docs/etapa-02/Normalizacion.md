## Modelo Relacional NORMALIZADO

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

PRODUCTO(cod_producto, nombre, descripcion)

PK: cod_producto


### DETALLE_DE_COMPRA

DETALLE_DE_COMPRA(id_compra, cod_detalle, precio_unitario, cantidad, cod_producto)

PK: (id_compra, cod_detalle)
FK: id_compra
FK: cod_producto


### PROVEEDOR

PROVEEDOR(cod_proveedor, CUIT, razon_social)

PK: cod_proveedor


### CATEGORIA

CATEGORIA(id_categoria, nombre_categoria)

PK: id_categoria


### CONTROLA

CONTROLA(id_empleado, cod_producto)

PK: (id_empleado, cod_producto)
FK: id_empleado
FK: cod_producto


### SUMINISTRA

SUMINISTRA(cod_producto, cod_proveedor)

PK: (cod_producto, cod_proveedor)
FK: cod_producto
FK: cod_proveedor


### CLASIFICA

CLASIFICA(cod_producto, id_categoria)

PK: (cod_producto, id_categoria)
FK: cod_producto
FK: id_categoria
