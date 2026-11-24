USE medvetdb;

CREATE TABLE IF NOT EXISTS movimentacao_estoque (
  id_movimentacao_estoque INT NOT NULL AUTO_INCREMENT,
  id_estoque INT NOT NULL,
  id_funcionario INT NOT NULL,
  tipo_movimentacao VARCHAR(10) NOT NULL,
  quantidade DECIMAL(10,2) NOT NULL,
  data_hora DATETIME NOT NULL,
  PRIMARY KEY (id_movimentacao_estoque),
  INDEX fk_movimentacao_estoque_idx (id_estoque ASC) VISIBLE,
  INDEX fk_movimentacao_funcionario_idx (id_funcionario ASC) VISIBLE,
  CONSTRAINT fk_movimentacao_estoque
    FOREIGN KEY (id_estoque)
    REFERENCES estoque (id_estoque),
  CONSTRAINT fk_movimentacao_funcionario
    FOREIGN KEY (id_funcionario)
    REFERENCES funcionario (id_funcionario))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
