# Alcance del sistema
**Gestión de Catálogo y Categorías**.

- Registro y mantenimiento de productos de consumo masivo (código, nombre, descripción).

- Clasificación obligatoria de cada producto en una única categoría o rubro comercial.

**Gestión de Proveedores**.

- Alta y administración de proveedores con datos formales (código de proveedor, CUIT y razón social).

- Registro del abastecimiento de artículos, permitiendo que un producto sea provisto por uno o varios proveedores y viceversa.

**Control de Inventario y Stock**.

- Monitoreo y consulta de existencias en tiempo real.

- Registro de ajustes manuales de stock por parte de empleados autorizados para conciliar las discrepancias entre el inventario físico y el del sistema.

**Administración de Personal (Empleados)**.

- Registro y control de empleados (código identificador, nombre y apellido).

- Asignación de cajeros a transacciones de venta individuales.

- Trazabilidad de los empleados responsables de las modificaciones o controles sobre los productos.

**Gestión de Clientes y Facturación**.

- Registro nominativo de clientes con identificación tributaria/personal (DNI, nombre y apellido).

- Emisión de tickets y comprobantes asociados de forma unívoca a un único cliente.

**Procesamiento de Transacciones en Caja (Ventas)**.

- Registro de encabezado de ventas (número de ticket/compra, fecha, hora, monto total, cajero y cliente).

- Registro de detalle de compra desglosado por ítem (cantidad, subtotal y producto).

- Congelamiento histórico de precios: Almacenamiento persistente del precio unitario al momento exacto de la compra, evitando alteraciones retroactivas ante futuros cambios en el catálogo o inflación.

- Obligatoriedad y validación del método de pago (efectivo, débito, crédito, transferencia) como requisito indispensable para dar por finalizada la venta.
