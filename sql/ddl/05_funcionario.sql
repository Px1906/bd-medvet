USE medvetdb;

CREATE TABLE IF NOT EXISTS funcionario (
  id_funcionario INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  cargo VARCHAR(50) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  PRIMARY KEY (id_funcionario))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
