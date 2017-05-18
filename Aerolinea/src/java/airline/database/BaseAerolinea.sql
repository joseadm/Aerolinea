-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Aerolinea
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Aerolinea
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Aerolinea` DEFAULT CHARACTER SET utf8 ;
USE `Aerolinea` ;

-- -----------------------------------------------------
-- Table `Aerolinea`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Usuario` (
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
-- Table `Aerolinea`.`Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Ciudad` (
  `pais` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Vuelo` (
  `tiempoVuelo` INT NOT NULL,
  `numeroVuelo` INT NOT NULL,
  `nombre_ciudad1` VARCHAR(45) NOT NULL,
  `nombre_ciudad2` VARCHAR(45) NOT NULL,
  INDEX `nombre_ciudad2_idx` (`nombre_ciudad2` ASC),
  PRIMARY KEY (`numeroVuelo`),
  CONSTRAINT `nombre_ciudad1`
    FOREIGN KEY (`nombre_ciudad1`)
    REFERENCES `Aerolinea`.`Ciudad` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `nombre_ciudad2`
    FOREIGN KEY (`nombre_ciudad2`)
    REFERENCES `Aerolinea`.`Ciudad` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Avion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Avion` (
  `placa` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NULL,
  `marca` VARCHAR(45) NULL,
  `anno` INT NULL,
  `numeroAsiento` INT NULL,
  `asientosPorFilas` INT NULL,
  `numeroFilas` INT NULL,
  PRIMARY KEY (`placa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Viaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Viaje` (
  `numeroviaje` INT NOT NULL,
  `placa_avion` VARCHAR(45) NULL,
  `numero_vuelo` INT NULL,
  PRIMARY KEY (`numeroviaje`),
  INDEX `placa_avion_idx` (`placa_avion` ASC),
  INDEX `numero_vuelo_idx` (`numero_vuelo` ASC),
  CONSTRAINT `placa_avion`
    FOREIGN KEY (`placa_avion`)
    REFERENCES `Aerolinea`.`Avion` (`placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `numero_vuelo`
    FOREIGN KEY (`numero_vuelo`)
    REFERENCES `Aerolinea`.`Vuelo` (`numeroVuelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Asiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Asiento` (
  `codigo` INT NOT NULL,
  `numero` INT NULL,
  `estado` TINYINT(1) NULL,
  `numero_viaje` INT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `numero_viaje_idx` (`numero_viaje` ASC),
  CONSTRAINT `numero_viaje`
    FOREIGN KEY (`numero_viaje`)
    REFERENCES `Aerolinea`.`Viaje` (`numeroviaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Tiquete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Tiquete` (
  `codigo` INT NOT NULL,
  `nombre_usuario` VARCHAR(45) NULL,
  `cedula_pasajero` INT NULL,
  `nombre_pasajero` VARCHAR(45) NULL,
  `pasaporte` INT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `nombre_usuario_idx` (`nombre_usuario` ASC),
  CONSTRAINT `nombre_usuario`
    FOREIGN KEY (`nombre_usuario`)
    REFERENCES `Aerolinea`.`Usuario` (`nombreUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Reservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Reservacion` (
  `codigo` INT NOT NULL,
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
    REFERENCES `Aerolinea`.`Viaje` (`numeroviaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `numero_viaje2`
    FOREIGN KEY (`numero_viaje2`)
    REFERENCES `Aerolinea`.`Viaje` (`numeroviaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `codigo_asiento`
    FOREIGN KEY (`codigo_asiento`)
    REFERENCES `Aerolinea`.`Asiento` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `codigo_tiquete`
    FOREIGN KEY (`codigo_tiquete`)
    REFERENCES `Aerolinea`.`Tiquete` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
