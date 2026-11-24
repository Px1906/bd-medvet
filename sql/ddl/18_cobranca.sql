USE medvetdb;

CREATE TABLE IF NOT EXISTS cobranca (
  id_cobranca INT NOT NULL AUTO_INCREMENT,
  id_atendimento INT NULL DEFAULT NULL,
  id_internacao INT NULL DEFAULT NULL,
  data_emissao DATETIME NOT NULL,
  PRIMARY KEY (id_cobranca),
  INDEX fk_cobranca_atendimento_idx (id_atendimento ASC) VISIBLE,
  INDEX fk_cobranca_internacao_idx (id_internacao ASC) VISIBLE,
  CONSTRAINT fk_cobranca_atendimento
    FOREIGN KEY (id_atendimento)
    REFERENCES atendimento (id_atendimento),
  CONSTRAINT fk_cobranca_internacao
    FOREIGN KEY (id_internacao)
    REFERENCES internacao (id_internacao))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
