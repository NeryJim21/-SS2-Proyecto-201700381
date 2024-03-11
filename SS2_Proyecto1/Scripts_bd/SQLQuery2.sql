-- CREANDO DATABASE PARA ARCHIVOS 1
CREATE DATABASE proyecto1;

USE proyecto1;
-- CREANDO LAS TABLAS DEL DATAWAREHOUSE

-- Dimensiones
CREATE TABLE proveedor(
	codigo_proveedor varchar(5) PRIMARY KEY,
	nombre_proveedor varchar(50) not null,
	direccion_proveedor varchar(150) not null,
	numero_proveedor varchar(8) not null,
	web_proveedor varchar(20) not null
);

CREATE TABLE producto(
	codigo_producto varchar(30) PRIMARY KEY,
	nombre_producto varchar(50) not null,
	marca_producto varchar(50) not null,
	tipo_categoria varchar(30) not null
);

CREATE TABLE sucursal(
	codigo_sucursal varchar(30) PRIMARY KEY,
	nombre_sucursal varchar(50) not null,
	direccion_sucursal varchar(150) not null,
	nombre_region varchar(30) not null,
	departamento varchar(30) not null
);

CREATE TABLE pedido(
	codigo_pedido varchar(30) PRIMARY KEY,
	unidades int not null,
	precio_unitario float not null
);

CREATE TABLE cliente(
	codigo_cliente varchar(5) PRIMARY KEY,
	nombre_cliente varchar(50) not null,
	tipo_cliente varchar(20) not null,
	direccion_cliente varchar(150) not null,
	numero_cliente varchar(8) not null
);

CREATE TABLE vendedor(
	codigo_vendedor varchar(30) PRIMARY KEY,
	nombre_vendedor varchar(50) not null,
	vacacionista varchar(1) not null
);

-- Tabla Hechos

CREATE TABLE compra(
	fecha date not null,
	codigo_proveedor varchar(5) not null,
	codigo_producto varchar(30) not null,
	codigo_sucursal varchar(30) not null,
	unidades int not null,
	precio_unitario float not null,
	FOREIGN KEY (codigo_proveedor) REFERENCES proveedor(codigo_proveedor),
	FOREIGN KEY (codigo_producto) REFERENCES producto(codigo_producto),
	FOREIGN KEY (codigo_sucursal) REFERENCES sucursal(codigo_sucursal)
);

CREATE TABLE venta(
	fecha date not null,
	codigo_cliente varchar(5) not null,
	codigo_vendedor varchar(30) not null,
	codigo_producto varchar(30) not null,
	codigo_sucursal varchar(30) not null,
	unidades int not null,
	precio_unitario float not null,
	FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente),
	FOREIGN KEY (codigo_vendedor) REFERENCES vendedor(codigo_vendedor),
	FOREIGN KEY (codigo_producto) REFERENCES producto(codigo_producto),
	FOREIGN KEY (codigo_sucursal) REFERENCES sucursal(codigo_sucursal),
);

-- TABLAS TEMPORALES

CREATE TABLE temporal_compra(
	fecha varchar(10),
	codigo_proveedor varchar(5),
	nombre_proveedor varchar(50),
	direccion_proveedor varchar(150),
	web_proveedor varchar(20),
	codigo_producto varchar(30),
	nombre_producto varchar(50),
	marca_producto varchar(50),
	tipo_categoria varchar(30),
	codigo_sucursal varchar(30),
	nombre_sucursal varchar(50),
	direccion_sucursal varchar(150),
	nombre_region varchar(30),
	departamento varchar(30),
	unidades varchar(10),
	precio_unitario varchar(10) 
);

CREATE TABLE temporal_venta(
	fecha varchar(10),
	codigo_cliente varchar(5),
	nombre_cliente varchar(50),
	tipo_cliente varchar(20),
	direccion_cliente varchar(150),
	numero_cliente varchar(8),
	codigo_vendedor varchar(30),
	nombre_vendedor varchar(50),
	vacacionista varchar(1),
	codigo_producto varchar(30),
	nombre_producto varchar(50),
	marca_producto varchar(50),
	tipo_categoria varchar(30),
	codigo_sucursal varchar(30),
	nombre_sucursal varchar(50),
	direccion_sucursal varchar(150),
	nombre_region varchar(30),
	departamento varchar(30),
	unidades varchar(10),
	precio_unitario varchar(10)
);
