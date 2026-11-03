# optimización de consultas
# definición
La optimización de consultas es el proceso de analizar y reestructurar el código SQL y el diseño físico de la base de datos para que el motor recupere la información solicitada de la forma más rápida y eficiente posible. El objetivo principal es minimizar el consumo de recursos del servidor (procesador, memoria RAM y lecturas de disco) y reducir drásticamente el tiempo de respuesta, asegurando que el sistema sea escalable y no se congele cuando múltiples usuarios operan al mismo tiempo.
# Ventajas y aplicaciones
* Aceleración de reportes: Permite generar reportes pesados de facturación o cierres de caja en segundos en lugar de minutos.

* Reducción de bloqueos (Deadlocks): Al ejecutar consultas más rápido, se liberan antes las tablas, evitando que el sistema de ventas se trabe cuando un cajero intenta registrar un ticket mientras otro consulta el inventario.

* Menor desgaste del servidor: Evita escaneos completos de tablas (Table Scan), ahorrando recursos críticos en servidores con hardware limitado como suele ocurrir con las versiones gratuitas de SQL Server Express
