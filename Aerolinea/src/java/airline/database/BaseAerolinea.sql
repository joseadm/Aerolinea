-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema BaseAerolinea
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BaseAerolinea
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BaseAerolinea` DEFAULT CHARACTER SET utf8 ;
USE `BaseAerolinea` ;

-- -----------------------------------------------------
-- Table `BaseAerolinea`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseAerolinea`.`Usuario` (
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `fechaNacimiento` DATETIME(6) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  `celular` INT NOT NULL,
  `tipo` INT NOT NULL,
  PRIMARY KEY (`nombreUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseAerolinea`.`Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseAerolinea`.`Ciudad` (
  `codigo` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseAerolinea`.`Vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseAerolinea`.`Vuelo` (
  `numeroVuelo` INT NOT NULL AUTO_INCREMENT,
  `ciudadOrigen` VARCHAR(45) NOT NULL,
  `ciudadDestino` VARCHAR(45) NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  `precio` INT NOT NULL,
  `duracion` VARCHAR(45) NOT NULL,
  `hora` VARCHAR(45) NOT NULL,
  `oferta` TINYINT(1) NOT NULL,
  `imagen` TEXT NULL,
  `dia` VARCHAR(45) NOT NULL,
  `descuento` INT NOT NULL,
  PRIMARY KEY (`numeroVuelo`),
  INDEX `ciudadOrigen_idx` (`ciudadOrigen` ASC),
  INDEX `ciudadDestino_idx` (`ciudadDestino` ASC),
  CONSTRAINT `ciudadOrigen`
    FOREIGN KEY (`ciudadOrigen`)
    REFERENCES `BaseAerolinea`.`Ciudad` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ciudadDestino`
    FOREIGN KEY (`ciudadDestino`)
    REFERENCES `BaseAerolinea`.`Ciudad` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseAerolinea`.`Avion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseAerolinea`.`Avion` (
  `placa` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `annio` VARCHAR(45) NOT NULL,
  `cant_pasajeros` INT NOT NULL,
  `cant_filas` INT NOT NULL,
  `cant_asientos_por_fila` INT NOT NULL,
  PRIMARY KEY (`placa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseAerolinea`.`Viaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseAerolinea`.`Viaje` (
  `numeroviaje` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `placa_avion` VARCHAR(45) NOT NULL,
  `numero_vuelo` INT NOT NULL,
  PRIMARY KEY (`numeroviaje`),
  INDEX `placa_avion_idx` (`placa_avion` ASC),
  INDEX `numero_vuelo_idx` (`numero_vuelo` ASC),
  CONSTRAINT `placa_avion`
    FOREIGN KEY (`placa_avion`)
    REFERENCES `BaseAerolinea`.`Avion` (`placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `numero_vuelo`
    FOREIGN KEY (`numero_vuelo`)
    REFERENCES `BaseAerolinea`.`Vuelo` (`numeroVuelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseAerolinea`.`Asiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseAerolinea`.`Asiento` (
  `numero` VARCHAR(5) NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  `numero_viaje` INT NOT NULL,
  PRIMARY KEY (`numero`),
  INDEX `numero_viaje_idx` (`numero_viaje` ASC),
  CONSTRAINT `numero_viaje`
    FOREIGN KEY (`numero_viaje`)
    REFERENCES `BaseAerolinea`.`Viaje` (`numeroviaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseAerolinea`.`Reservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseAerolinea`.`Reservacion` (
  `codigo` VARCHAR(45) NOT NULL,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `numero_viaje1` INT NOT NULL,
  `numero_viaje2` INT NULL,
  `fecha_reserva` DATE NOT NULL,
  `precioTotal` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `numero_viaje1_idx` (`numero_viaje1` ASC),
  INDEX `numero_viaje2_idx` (`numero_viaje2` ASC),
  INDEX `nombre_usuario_idx` (`nombre_usuario` ASC),
  CONSTRAINT `numero_viaje1`
    FOREIGN KEY (`numero_viaje1`)
    REFERENCES `BaseAerolinea`.`Viaje` (`numeroviaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `numero_viaje2`
    FOREIGN KEY (`numero_viaje2`)
    REFERENCES `BaseAerolinea`.`Viaje` (`numeroviaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `nombre_usuario`
    FOREIGN KEY (`nombre_usuario`)
    REFERENCES `BaseAerolinea`.`Usuario` (`nombreUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseAerolinea`.`Tiquete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseAerolinea`.`Tiquete` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `codigo_reservacion` VARCHAR(45) NOT NULL,
  `codigo_asiento` VARCHAR(5) NOT NULL,
  `nombre_pasajero` VARCHAR(45) NOT NULL,
  `apellidosPasajero` VARCHAR(45) NOT NULL,
  `pasaporte` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `codigo_reservacion_idx` (`codigo_reservacion` ASC),
  INDEX `codigo_asietno_idx` (`codigo_asiento` ASC),
  CONSTRAINT `codigo_reservacion`
    FOREIGN KEY (`codigo_reservacion`)
    REFERENCES `BaseAerolinea`.`Reservacion` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `codigo_asiento`
    FOREIGN KEY (`codigo_asiento`)
    REFERENCES `BaseAerolinea`.`Asiento` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


/*INSERT DE CIUDADES------------------------------*/
insert into ciudad values("SJO","Costa Rica","San Jose");
insert into ciudad values("MIA","USA","Miami");
insert into ciudad values("CAN","Mexico","Cancun");
insert into ciudad values("MAD","Espana","Madrid");
insert into ciudad values("VIE","Austria","Viena");
insert into ciudad values("ROM","Italia","Roma");

/*INSERT DE VUELOS--------------------------------*/
insert into vuelo (ciudadOrigen, ciudadDestino,estado, precio, duracion,hora,oferta,imagen,dia,descuento)
values ("SJO","MIA", true, 300,"02:30","08:00",true,"NADA YET","Monday",0);
insert into vuelo (ciudadOrigen, ciudadDestino,estado, precio, duracion,hora,oferta,imagen,dia,descuento)
values ("MIA","CAN", true, 200,"01:20","09:30",true,"NADA YET","Tuesday",0);
insert into vuelo (ciudadOrigen, ciudadDestino,estado, precio, duracion,hora,oferta,imagen,dia,descuento)
values ("MAD","ROM", true, 500,"08:00","12:00",true,"NADA YET","Wednesday",0);
insert into vuelo (ciudadOrigen, ciudadDestino,estado, precio, duracion,hora,oferta,imagen,dia,descuento)
values ("SJO","MAD", true, 450,"10:00","04:20",true,"NADA YET","Saturday",20);
insert into vuelo (ciudadOrigen, ciudadDestino,estado, precio, duracion,hora,oferta,imagen,dia,descuento)
values ("MIA","SJO", true, 200,"02:20","14:50",true,"NADA YET","Friday",10);
insert into vuelo (ciudadOrigen, ciudadDestino,estado, precio, duracion,hora,oferta,imagen,dia,descuento)
values ("VIE","MAD", true, 100,"06:00","12:00",true,"NADA YET","Thursday",0);

insert into vuelo (ciudadOrigen, ciudadDestino,estado, precio, duracion,hora,oferta,imagen,dia,descuento)
values ("SJO","MIA", true, 200,"01:20","08:20",false,"NADA YET","Wednesday",0);
insert into vuelo (ciudadOrigen, ciudadDestino,estado, precio, duracion,hora,oferta,imagen,dia,descuento)
values ("MIA","SJO", true, 500,"03:00","15:00",false,"NADA YET","Saturday",0);






/*INSERTS DE AVIONES-------------------------*/
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("TI-BGV","737-300","Boeing","2002",144,24,6);
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("NV506","737-400","Boeing","2001",168,28,6);
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("N527VL","737-500","Boeing","2000",132,22,6);
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("TI-CRLA","737-900","Boeing","2008",186,31,6);
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("NV123","747-400","Boeing","2010",315,35,9);
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("TI-BGV57","767-300","Boeing","2006",270,30,9);
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("TI-BGV98","318-100","Airbus","2002",120,20,6);
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("NV654","319-200","Airbus","2001",144,24,6);
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("NV888","330-200","Airbus","2004",270,30,9);
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("NVCR0314","380-800","Airbus","2012",450,50,9);
/*INSERTS DE VIAJES-------------------------*/


insert into Viaje (fecha, placa_avion, numero_vuelo)
values('2017-06-12',"TI-BGV98",1);
insert into Viaje (fecha, placa_avion, numero_vuelo)
values('2017-06-16',"NV888",5);



insert into Usuario(nombreUsuario,contrasena,nombre,apellidos,correo,fechaNacimiento,
direccion,telefono,celular,tipo) values ("p001","123","andrey","chaverri","andrey5757@hotmail.com",'1996-11-14',
"alajuela",8888888,88888888,1);
insert into Usuario(nombreUsuario,contrasena,nombre,apellidos,correo,fechaNacimiento,
direccion,telefono,celular,tipo) values ("p002","000","andrey","chaverri","andrey5757@hotmail.com",'1996-11-14',
"alajuela",8888888,88888888,2);

