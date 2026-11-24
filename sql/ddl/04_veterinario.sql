USE `medvetdb`;

CREATE TABLE IF NOT EXISTS `veterinario` (
  `crmv` VARCHAR(20) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `especialidade` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`crmv`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
