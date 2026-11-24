USE `medvetdb`;

CREATE TABLE IF NOT EXISTS `procedimento_realizado` (
  `id_procedimento_realizado` INT NOT NULL AUTO_INCREMENT,
  `id_procedimento` INT NOT NULL,
  `id_atendimento` INT NOT NULL,
  `crmv_veterinario` VARCHAR(20) NOT NULL,
  `data_hora` DATETIME NOT NULL,
  `observacoes` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_procedimento_realizado`),
  INDEX `fk_realizado_crmv_idx` (`crmv_veterinario` ASC) VISIBLE,
  INDEX `fk_realizado_atendimento_idx` (`id_atendimento` ASC) VISIBLE,
  INDEX `fk_realizado_procedimento_idx` (`id_procedimento` ASC) VISIBLE,
  CONSTRAINT `fk_realizado_atendimento`
    FOREIGN KEY (`id_atendimento`)
    REFERENCES `atendimento` (`id_atendimento`),
  CONSTRAINT `fk_realizado_crmv`
    FOREIGN KEY (`crmv_veterinario`)
    REFERENCES `veterinario` (`crmv`),
  CONSTRAINT `fk_realizado_procedimento`
    FOREIGN KEY (`id_procedimento`)
    REFERENCES `procedimento` (`id_procedimento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
