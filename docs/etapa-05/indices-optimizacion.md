# optimización de consultas
# definición
La optimización de consultas es el proceso de analizar y reestructurar el código SQL y el diseño físico de la base de datos para que el motor recupere la información solicitada de la forma más rápida y eficiente posible. El objetivo principal es minimizar el consumo de recursos del servidor (procesador, memoria RAM y lecturas de disco) y reducir drásticamente el tiempo de respuesta, asegurando que el sistema sea escalable y no se congele cuando múltiples usuarios operan al mismo tiempo.
# Ventajas y aplicaciones
* Aceleración de reportes: Permite generar reportes pesados de facturación o cierres de caja en segundos en lugar de minutos.

* Reducción de bloqueos (Deadlocks): Al ejecutar consultas más rápido, se liberan antes las tablas, evitando que el sistema de ventas se trabe cuando un cajero intenta registrar un ticket mientras otro consulta el inventario.

* Menor desgaste del servidor: Evita escaneos completos de tablas (Table Scan), ahorrando recursos críticos en servidores con hardware limitado como suele ocurrir con las versiones gratuitas de SQL Server Express
# Implementación en SQL Server Express.
* Uso de Índices (Clúster y No Clúster): Estructuras adicionales que se le agregan a las tablas para que el motor encuentre las filas sin tener que leer la tabla entera (similar al índice alfabético de un libro).

* Análisis del Plan de Ejecución (Execution Plan): Una herramienta gráfica del Management Studio que muestra exactamente qué camino tomó el motor para resolver la consulta y dónde están los cuellos de botella.

* Refactorización de código SQL: Evitar el uso de SELECT * para traer solo las columnas necesarias, y evitar aplicar funciones sobre las columnas en la cláusula WHERE (lo que anula el uso de índices).

# Caso concreto aplicado al sistema de ventas del equipo

Imaginemos el momento del cierre de turno, donde el sistema de punto de venta necesita cruzar miles de registros diarios para cuadrar la caja y actualizar el inventario. Si corremos una consulta que busca todas las ventas del día cruzando la tabla Ventas con Detalle_Ventas y Productos, el sistema podría volverse lentísimo si hace un escaneo secuencial.

Para optimizar esto, vamos a crear un índice no agrupado (Non-Clustered Index) sobre la fecha de la venta,ambien vamos a corregir una consulta mal diseñada: en lugar de pedir SELECT * y usar funciones como MONTH(fecha), vamos a especificar exactamente las columnas (usando alias como v y dv) y filtrar con un rango de fechas limpio para que el motor pueda aprovechar el índice de forma directa.
# Script de demostración y resultados obtenidos.
para ver el codigo optimizado ve a "tecnico" y a "optimizacion_de_consulta.sql"



