CREATE SCHEMA `tienda`;
USE `tienda`;

CREATE TABLE `cliente` (
`id`  INT PRIMARY KEY UNIQUE AUTO_INCREMENT NOT NULL,
`nombre` VARCHAR(45) NOT NULL,
`apellido` VARCHAR(45) NOT NULL,
`email` VARCHAR(45) NOT NULL UNIQUE,
`createdAt` DATETIME NOT NULL,
`updatedAt` DATETIME
);

CREATE TABLE `venta`(
`id`  INT PRIMARY KEY UNIQUE AUTO_INCREMENT NOT NULL,
`num_venta` VARCHAR(45) NOT NULL UNIQUE,
`metodo_pago` VARCHAR(45) NOT NULL,
`createdAt` DATETIME NOT NULL,
`updateAt` DATETIME,
`cliente_id` INT,
`empleado_id` INT,
`detalle_venta_id` INT,
FOREIGN KEY (cliente_id) REFERENCES cliente(id),
FOREIGN KEY (empleado_id) REFERENCES empleado(id),
FOREIGN KEY (detalle_venta_id) REFERENCES detalle_venta(id)
);

CREATE TABLE `detalle_venta` (
`id`  INT PRIMARY KEY UNIQUE AUTO_INCREMENT NOT NULL,
`cantidad` INT NOT NULL,
`precio_unitario` DOUBLE NOT NULL,
`createdAt` DATETIME NOT NULL,
`updateAT` DATETIME,
`producto_id` INT,
FOREIGN KEY (producto_id) REFERENCES producto(id)
);

CREATE TABLE `producto` (
`id`  INT PRIMARY KEY UNIQUE AUTO_INCREMENT NOT NULL,
`nombre` VARCHAR(45) NOT NULL,
`precio` DOUBLE NOT NULL,
`cantidad` INT NOT NULL,
`createdAt` DATETIME NOT NULL,
`updateAt` DATETIME,
`categoria_id` INT,
FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

CREATE TABLE `empleado` (
`id`  INT PRIMARY KEY UNIQUE AUTO_INCREMENT NOT NULL,
`nombre` VARCHAR(45) NOT NULL,
`apellido` VARCHAR(45) NOT NULL,
`cargo` VARCHAR(45) NOT NULL,
`salario` DOUBLE NOT NULL,
`createdAt` DATETIME NOT NULL,
`updateAt` DATETIME 
);

CREATE TABLE `categoria` (
`id` INT PRIMARY KEY UNIQUE AUTO_INCREMENT NOT NULL,
`nombre` VARCHAR(45) NOT NULL,
`created` DATETIME NOT NULL,
`updateAt` DATETIME
);