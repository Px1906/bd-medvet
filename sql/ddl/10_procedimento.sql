USE `medvetdb`;

CREATE TABLE IF NOT EXISTS `procedimento` (
  `id_procedimento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  `tipo` VARCHAR(30) NOT NULL,
  `valor_base` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_procedimento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
