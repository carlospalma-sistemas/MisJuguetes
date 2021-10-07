-- CREACIÓN DE LA BASE DE DATOS
-- ----------------------------
CREATE DATABASE IF NOT EXISTS `c3s2formador`;


-- CREACIÓN DE LA TABLA ESTADOS_JUGUETES Y ADICIÓN DE DATOS
-- --------------------------------------------------------
CREATE TABLE `c3s2formador`.`estados_juguetes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

INSERT INTO `c3s2formador`.`estados_juguetes` (estado) VALUES ('Bueno');
INSERT INTO `c3s2formador`.`estados_juguetes` (estado) VALUES ('Modificado');
INSERT INTO `c3s2formador`.`estados_juguetes` (estado) VALUES ('Dañado');


-- CREACIÓN DE LA TABLA TIPOS_JUGUETES Y ADICIÓN DE DATOS
-- ------------------------------------------------------
CREATE TABLE `c3s2formador`.`tipos_juguetes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

INSERT INTO `c3s2formador`.`tipos_juguetes` (tipo) VALUES ('Videojuego');
INSERT INTO `c3s2formador`.`tipos_juguetes` (tipo) VALUES ('Electrónico');
INSERT INTO `c3s2formador`.`tipos_juguetes` (tipo) VALUES ('Peluche');
INSERT INTO `c3s2formador`.`tipos_juguetes` (tipo) VALUES ('Otro');


-- CREACIÓN DE LA TABLA JUGUETES Y ADICIÓN DE DATOS
-- ------------------------------------------------
CREATE TABLE `c3s2formador`.`juguetes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `fechacompra` date DEFAULT NULL,
  `disponibilidad` varchar(30) NOT NULL,
  `tipojuguete_id` int DEFAULT NULL,
  `estadojuguete_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipos_idx` (`tipojuguete_id`),
  KEY `fk_estados_idx` (`estadojuguete_id`),
  CONSTRAINT `fk_estados` FOREIGN KEY (`estadojuguete_id`) REFERENCES `estados_juguetes` (`id`),
  CONSTRAINT `fk_tipos` FOREIGN KEY (`tipojuguete_id`) REFERENCES `tipos_juguetes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

INSERT INTO `c3s2formador`.`juguetes` (nombre, tipojuguete_id, fechacompra, estadojuguete_id, disponibilidad) 
VALUES ('Juguete de prueba', 1, '2018-01-01', 1, 'Disponible');


-- CREACIÓN DE LA TABLA USUARIOS Y ADICIÓN DE DATOS
-- ------------------------------------------------
CREATE TABLE `c3s2formador`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombrecompleto` VARCHAR(100) NOT NULL,
  `usuario` VARCHAR(20) NOT NULL,
  `passw` VARCHAR(20) NOT NULL,
  `fechanacimiento` DATE NULL,
  `parentesco` VARCHAR(30) NULL,
  `rol` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`));

INSERT INTO `c3s2formador`.`usuarios` (nombrecompleto, usuario, passw, fechanacimiento, parentesco, rol)
VALUES ('Administrador del Sistema', 'admin', 'admin', '1977-08-17', 'Padre', 'Administrador');
