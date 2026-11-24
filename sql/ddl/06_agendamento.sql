USE `medvetdb`;

CREATE TABLE IF NOT EXISTS `agendamento` (
  `id_agendamento` INT NOT NULL AUTO_INCREMENT,
  `id_animal` INT NOT NULL,
  `data_hora` DATETIME NOT NULL,
  `motivo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_agendamento`),
  INDEX `fk_agendamento_animal_idx` (`id_animal` ASC) VISIBLE,
  CONSTRAINT `fk_agendamento_animal`
    FOREIGN KEY (`id_animal`)
    REFERENCES `animal` (`id_animal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
