USE `medvetdb`;

CREATE TABLE IF NOT EXISTS `exame` (
  `id_exame` INT NOT NULL AUTO_INCREMENT,
  `id_atendimento` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `tipo` VARCHAR(30) NOT NULL,
  `data_solicitacao` DATETIME NOT NULL,
  `resultado` TEXT NULL DEFAULT NULL,
  `data_resultado` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_exame`),
  INDEX `fk_exame_atendimento_idx` (`id_atendimento` ASC) VISIBLE,
  CONSTRAINT `fk_exame_atendimento`
    FOREIGN KEY (`id_atendimento`)
    REFERENCES `atendimento` (`id_atendimento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
