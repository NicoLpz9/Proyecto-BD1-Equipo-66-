# Seguridad

***Definición***: 

La seguridad en una base de datos permite controlar qué usuarios pueden acceder a la información y qué operaciones específicas pueden realizar. El objetivo principal es aplicar el principio de mínimo privilegio en el sistema MiniMarket, administrando los permisos de manera individual (por usuario) o agrupándolos eficientemente mediante roles para proteger la integridad del negocio.

***Ventajas y aplicaciones***:

* Protege información comercial sensible (como los datos de la tabla CLIENTE o los márgenes en COMPRA).

* Evita modificaciones accidentales o intencionales no autorizadas en el catálogo de la tabla PRODUCTO.

* Permite asignar responsabilidades alineadas al perfil de cada empleado (ej. un cajero vs. un gerente).

* Simplifica la administración de accesos al agrupar permisos repetitivos mediante roles reutilizables.

***Implementación en SQL Server Express***:

Se utilizan instrucciones CREATE LOGIN para dar acceso al servidor, y CREATE USER para vincularlos a la base de datos. Se crean grupos con CREATE ROLE, y se administran los privilegios mediante las cláusulas GRANT (conceder) y DENY (denegar) sobre objetos como tablas o procedimientos almacenados.

***Caso concreto aplicado a MiniMarket***:

En el sistema del MiniMarket, existen dos perfiles: un Administrador y un Cajero.
Se demostrará:
* Permisos directos (el Administrador tiene acceso total).
* La creación del rol rol_vendedor para que el Cajero pueda consultar productos y categorías libremente.   
* La restricción para que el Cajero no pueda insertar ventas directamente en la tabla COMPRA (lo cual estaría denegado), obligándolo a usar un procedimiento almacenado (sp_RegistrarVenta) que encapsula la lógica de negocio segura.   
