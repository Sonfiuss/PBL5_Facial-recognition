-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pbl5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pbl5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pbl5` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pbl5` ;

-- -----------------------------------------------------
-- Table `pbl5`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl5`.`account` (
  `Mail` VARCHAR(100) NOT NULL,
  `PassWord` VARCHAR(100) NOT NULL,
  `Descipt` INT NOT NULL,
  PRIMARY KEY (`Mail`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pbl5`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl5`.`faculty` (
  `ID_Faculty` VARCHAR(10) NOT NULL,
  `Title` VARCHAR(100) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`ID_Faculty`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pbl5`.`activity_class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl5`.`activity_class` (
  `ID_ActivityClass` VARCHAR(10) NOT NULL,
  `NameClass` VARCHAR(50) NOT NULL,
  `ID_Faculty` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ID_ActivityClass`),
  INDEX `FK_Fac_idx` (`ID_Faculty` ASC) VISIBLE,
  CONSTRAINT `FK_Fac`
    FOREIGN KEY (`ID_Faculty`)
    REFERENCES `pbl5`.`faculty` (`ID_Faculty`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pbl5`.`subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl5`.`subjects` (
  `ID_Subject` VARCHAR(10) NOT NULL,
  `Title` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Credits` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Subject`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pbl5`.`classsection`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl5`.`classsection` (
  `ID_Class` VARCHAR(10) NOT NULL,
  `NameClass` VARCHAR(50) NOT NULL,
  `ID_Subject` VARCHAR(10) NOT NULL,
  `LessonStart` INT NOT NULL,
  `LessonEnd` INT NOT NULL,
  `DayofWeek` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ID_Class`),
  INDEX `FK_Sub_idx` (`ID_Subject` ASC) VISIBLE,
  CONSTRAINT `FK_Sub`
    FOREIGN KEY (`ID_Subject`)
    REFERENCES `pbl5`.`subjects` (`ID_Subject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pbl5`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl5`.`image` (
  `ID_Avatar` VARCHAR(10) NOT NULL,
  `Path_Ava` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`ID_Avatar`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pbl5`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl5`.`student` (
  `Id_student` VARCHAR(10) NOT NULL,
  `name` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `Birth` VARCHAR(50) NOT NULL,
  `Mail` VARCHAR(100) NOT NULL,
  `Phone` VARCHAR(10) NOT NULL,
  `ID_Image` VARCHAR(10) NOT NULL,
  `ID_Class` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Id_student`),
  INDEX `Fk_Mail_Acc_idx` (`Mail` ASC) VISIBLE,
  INDEX `FK_Class_idx` (`ID_Class` ASC) VISIBLE,
  INDEX `FK_Image_idx` (`ID_Image` ASC) VISIBLE,
  CONSTRAINT `Fk_Mail_Acc`
    FOREIGN KEY (`Mail`)
    REFERENCES `pbl5`.`account` (`Mail`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Class`
    FOREIGN KEY (`ID_Class`)
    REFERENCES `pbl5`.`activity_class` (`ID_ActivityClass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Image`
    FOREIGN KEY (`ID_Image`)
    REFERENCES `pbl5`.`image` (`ID_Avatar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pbl5`.`detail_secteion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl5`.`detail_secteion` (
  `ID_student` VARCHAR(10) NOT NULL,
  `ID_ClassSection` VARCHAR(10) NOT NULL,
  `TimeIn` DATETIME NULL DEFAULT NULL,
  `TimeOut` DATETIME NULL DEFAULT NULL,
  INDEX `FK_student_idx` (`ID_student` ASC) VISIBLE,
  INDEX `FK_Section_idx` (`ID_ClassSection` ASC) VISIBLE,
  CONSTRAINT `FK_student`
    FOREIGN KEY (`ID_student`)
    REFERENCES `pbl5`.`student` (`Id_student`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Section`
    FOREIGN KEY (`ID_ClassSection`)
    REFERENCES `pbl5`.`classsection` (`ID_Class`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pbl5`.`lecturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pbl5`.`lecturer` (
  `ID_Lecturer` VARCHAR(10) NOT NULL,
  `Name` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Phone` VARCHAR(10) NOT NULL,
  `Mail` VARCHAR(50) NOT NULL,
  `ID_Faculty` VARCHAR(10) NOT NULL,
  `Id_Avatar` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ID_Lecturer`),
  INDEX `ID_Fac_idx` (`ID_Faculty` ASC) VISIBLE,
  INDEX `Mail_idx` (`Mail` ASC) VISIBLE,
  INDEX `ID_Ava_idx` (`Id_Avatar` ASC) VISIBLE,
  CONSTRAINT `ID_Fac`
    FOREIGN KEY (`ID_Faculty`)
    REFERENCES `pbl5`.`faculty` (`ID_Faculty`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Mail`
    FOREIGN KEY (`Mail`)
    REFERENCES `pbl5`.`account` (`Mail`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ID_Ava`
    FOREIGN KEY (`Id_Avatar`)
    REFERENCES `pbl5`.`image` (`ID_Avatar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
