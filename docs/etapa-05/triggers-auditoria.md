# Triggers de Auditoría

# Definición y objetivo

Un trigger es un procedimiento almacenado especial que se ejecuta automáticamente cuando ocurre un evento sobre una tabla: un INSERT, un UPDATE o un DELETE. A diferencia de un procedimiento común, nadie lo invoca de forma manual: es el propio motor de base de datos el que lo activa.

Dentro de un trigger, SQL Server dispone de dos tablas temporales: deleted, que contiene las filas tal como estaban antes del cambio, e inserted, que contiene las filas tal como quedaron después. En un UPDATE existen las dos, y comparándolas se puede saber qué valor había antes y cuál hay ahora.

Una auditoría es el registro de los cambios que se hacen sobre los datos. El objetivo de un trigger de auditoría es dejar constancia automática de quién modificó un dato, cuándo lo hizo y qué valor tenía antes, para lograr trazabilidad y control de cambios en el sistema.

# Ventajas y aplicaciones

Ventajas

Es automático: el registro se genera siempre, sin depender de que el usuario o la aplicación se acuerden de hacerlo.
Centraliza el control en la base de datos, por lo que funciona sin importar desde qué programa o usuario se modifiquen los datos.
Permite detectar modificaciones indebidas o errores, y reconstruir qué pasó con un dato.
Aporta seguridad y confianza sobre la información del sistema.

Aplicaciones

Registrar cambios de precios o cantidades en ventas ya realizadas.

Controlar modificaciones sobre otros datos sensibles del sistema.

# Implementación y Caso concreto

Implementación en SQL Server: Se utiliza CREATE TABLE para crear la tabla de auditoría (AUDITORIA_DETALLE) y CREATE TRIGGER ... ON ... AFTER UPDATE para definir el disparador, que se ejecuta después de modificar una fila de la tabla controlada. Dentro del trigger se consultan las tablas deleted (valores anteriores) e inserted (valores nuevos) y se guardan en la tabla de auditoría con INSERT ... SELECT. La fecha y el usuario se completan automáticamente con GETDATE() y SYSTEM_USER.

Caso concreto aplicado a nuestro proyecto:

En el sistema del MiniMarket, cada compra tiene un detalle con la cantidad y el precio unitario de cada producto vendido. Si alguien modificara esos datos en una venta ya registrada, el negocio no sabría quién lo hizo ni cuál era el valor original. Se demostrará:

La creación de la tabla AUDITORIA_DETALLE, que guarda la cantidad y el precio anteriores y nuevos, la fecha, el usuario y el tipo de acción.
La creación del trigger tr_Auditoria_Detalle_Update sobre la tabla DETALLEDECOMPRA, que se activa automáticamente ante cada UPDATE.
La modificación del precio de una línea de compra (de 3500 a 3000), sin necesidad de registrar nada manualmente.
La consulta de AUDITORIA_DETALLE, donde se verifica que el cambio quedó registrado con el valor anterior, el valor nuevo, la fecha y el usuario que lo realizó.
