USE `medvetdb`;

CREATE TABLE IF NOT EXISTS `prontuario` (
  `id_prontuario` INT NOT NULL AUTO_INCREMENT,
  `id_atendimento` INT NOT NULL,
  `sintomas` TEXT NULL DEFAULT NULL,
  `diagnostico` TEXT NULL DEFAULT NULL,
  `tratamento_prescrito` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_prontuario`),
  INDEX `fk_prontuario_atendimento_idx` (`id_atendimento` ASC) VISIBLE,
  CONSTRAINT `fk_prontuario_atendimento`
    FOREIGN KEY (`id_atendimento`)
    REFERENCES `atendimento` (`id_atendimento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
