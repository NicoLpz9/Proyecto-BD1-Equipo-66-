-- Creacion de la base de datos
CREATE DATABASE MiniMarket;
USE MiniMarket;

-- Tablas independientes sin claves foraneas
CREATE TABLE CLIENTE (
  cod_cliente       INT IDENTITY(1,1) NOT NULL,
  dni               VARCHAR(8)        NOT NULL,
  nombre_y_apellido VARCHAR(100)      NOT NULL,
  CONSTRAINT PK_CLIENTE     PRIMARY KEY (cod_cliente),
  CONSTRAINT UQ_CLIENTE_DNI UNIQUE (dni),
  CONSTRAINT CK_CLIENTE_DNI CHECK (dni NOT LIKE '%[^0-9]%' AND LEN(dni) >= 1)
);

CREATE TABLE EMPLEADO (
  id_empleado       INT IDENTITY(1,1) NOT NULL,
  nombre_y_apellido VARCHAR(100)      NOT NULL,
  CONSTRAINT PK_EMPLEADO PRIMARY KEY (id_empleado)
);

CREATE TABLE METODO_DE_PAGO (
  id_metodo    INT IDENTITY(1,1) NOT NULL,
  tipo_de_pago VARCHAR(50)       NOT NULL,
  CONSTRAINT PK_METODO_DE_PAGO      PRIMARY KEY (id_metodo),
  CONSTRAINT UQ_METODO_DE_PAGO_TIPO UNIQUE (tipo_de_pago)
);

CREATE TABLE PRODUCTO (
    cod_producto INT IDENTITY(1,1) NOT NULL,
    nombre       VARCHAR(100)      NOT NULL,
    descripcion  VARCHAR(255)      NULL,
    CONSTRAINT PK_PRODUCTO PRIMARY KEY (cod_producto)
);

CREATE TABLE PROVEEDOR (
  cod_proveedor INT IDENTITY(1,1) NOT NULL,
  CUIT          CHAR(11)          NOT NULL,
  razon_social  VARCHAR(100)      NOT NULL,
  CONSTRAINT PK_PROVEEDOR      PRIMARY KEY (cod_proveedor),
  CONSTRAINT UQ_PROVEEDOR_CUIT UNIQUE (CUIT),
  CONSTRAINT CK_PROVEEDOR_CUIT CHECK (CUIT NOT LIKE '%[^0-9]%')
);

CREATE TABLE CATEGORIA (
  id_categoria     INT IDENTITY(1,1) NOT NULL,
  nombre_categoria VARCHAR(50)       NOT NULL,
  CONSTRAINT PK_CATEGORIA        PRIMARY KEY (id_categoria),
  CONSTRAINT UQ_CATEGORIA_NOMBRE UNIQUE (nombre_categoria)
);
