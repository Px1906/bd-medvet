USE `medvetdb`;

CREATE TABLE IF NOT EXISTS `item_cobranca` (
  `id_item_cobranca` INT NOT NULL AUTO_INCREMENT,
  `id_cobranca` INT NOT NULL,
  `id_procedimento_realizado` INT NULL DEFAULT NULL,
  `id_estoque` INT NULL DEFAULT NULL,
  `tipo_item` VARCHAR(30) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `quantidade` DECIMAL(10,2) NOT NULL,
  `valor_unitario` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_item_cobranca`),
  INDEX `fk_item_cobranca_idx` (`id_cobranca` ASC) VISIBLE,
  INDEX `fk_item_procedimento_idx` (`id_procedimento_realizado` ASC) VISIBLE,
  INDEX `fk_item_estoque_idx` (`id_estoque` ASC) VISIBLE,
  CONSTRAINT `fk_item_cobranca`
    FOREIGN KEY (`id_cobranca`)
    REFERENCES `cobranca` (`id_cobranca`),
  CONSTRAINT `fk_item_estoque`
    FOREIGN KEY (`id_estoque`)
    REFERENCES `estoque` (`id_estoque`),
  CONSTRAINT `fk_item_procedimento`
    FOREIGN KEY (`id_procedimento_realizado`)
    REFERENCES `procedimento_realizado` (`id_procedimento_realizado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
