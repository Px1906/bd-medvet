USE `medvetdb`;

CREATE TABLE IF NOT EXISTS `estoque` (
  `id_estoque` INT NOT NULL AUTO_INCREMENT,
  `nome_item` VARCHAR(100) NOT NULL,
  `categoria` VARCHAR(50) NOT NULL,
  `descricao` VARCHAR(255) NULL DEFAULT NULL,
  `unidade_medida` VARCHAR(20) NOT NULL,
  `quantidade` DECIMAL(10,2) NULL DEFAULT NULL,
  `valor_unitario` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_estoque`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
