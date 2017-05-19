-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido1` VARCHAR(45) NULL,
  `apellido2` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` INT NULL,
  `celular` INT NULL,
  PRIMARY KEY (`nombreUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ciudad` (
  `codigo` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vuelo` (
  `numeroVuelo` INT NOT NULL AUTO_INCREMENT,
  `tiempoVuelo` INT NOT NULL,
  `ciudadOrigen` VARCHAR(45) NOT NULL,
  `ciudadDestino` VARCHAR(45) NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  `precio` INT NOT NULL,
  `duracion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`numeroVuelo`),
  INDEX `ciudadOrigen_idx` (`ciudadOrigen` ASC),
  INDEX `ciudadDestino_idx` (`ciudadDestino` ASC),
  CONSTRAINT `ciudadOrigen`
    FOREIGN KEY (`ciudadOrigen`)
    REFERENCES `mydb`.`Ciudad` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ciudadDestino`
    FOREIGN KEY (`ciudadDestino`)
    REFERENCES `mydb`.`Ciudad` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Avion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Avion` (
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
-- Table `mydb`.`Viaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Viaje` (
  `numeroviaje` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `placa_avion` VARCHAR(45) NOT NULL,
  `numero_vuelo` INT NOT NULL,
  PRIMARY KEY (`numeroviaje`),
  INDEX `placa_avion_idx` (`placa_avion` ASC),
  INDEX `numero_vuelo_idx` (`numero_vuelo` ASC),
  CONSTRAINT `placa_avion`
    FOREIGN KEY (`placa_avion`)
    REFERENCES `mydb`.`Avion` (`placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `numero_vuelo`
    FOREIGN KEY (`numero_vuelo`)
    REFERENCES `mydb`.`Vuelo` (`numeroVuelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asiento` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `numero` INT NULL,
  `estado` TINYINT(1) NULL,
  `numero_viaje` INT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `numero_viaje_idx` (`numero_viaje` ASC),
  CONSTRAINT `numero_viaje`
    FOREIGN KEY (`numero_viaje`)
    REFERENCES `mydb`.`Viaje` (`numeroviaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tiquete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tiquete` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre_usuario` VARCHAR(45) NULL,
  `cedula_pasajero` INT NULL,
  `nombre_pasajero` VARCHAR(45) NULL,
  `pasaporte` INT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `nombre_usuario_idx` (`nombre_usuario` ASC),
  CONSTRAINT `nombre_usuario`
    FOREIGN KEY (`nombre_usuario`)
    REFERENCES `mydb`.`Usuario` (`nombreUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reservacion` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `fechaIda` DATE NULL,
  `fechaRegreso` DATE NULL,
  `numero_viaje1` INT NULL,
  `numero_viaje2` INT NULL,
  `codigo_asiento` INT NULL,
  `codigo_tiquete` INT NULL,
  `numeroAsiento` INT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `numero_viaje1_idx` (`numero_viaje1` ASC),
  INDEX `numero_viaje2_idx` (`numero_viaje2` ASC),
  INDEX `codigo_asiento_idx` (`codigo_asiento` ASC),
  INDEX `codigo_tiquete_idx` (`codigo_tiquete` ASC),
  CONSTRAINT `numero_viaje1`
    FOREIGN KEY (`numero_viaje1`)
    REFERENCES `mydb`.`Viaje` (`numeroviaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `numero_viaje2`
    FOREIGN KEY (`numero_viaje2`)
    REFERENCES `mydb`.`Viaje` (`numeroviaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `codigo_asiento`
    FOREIGN KEY (`codigo_asiento`)
    REFERENCES `mydb`.`Asiento` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `codigo_tiquete`
    FOREIGN KEY (`codigo_tiquete`)
    REFERENCES `mydb`.`Tiquete` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
