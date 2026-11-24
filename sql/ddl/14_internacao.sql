USE medvetdb;

CREATE TABLE IF NOT EXISTS internacao (
  id_internacao INT NOT NULL AUTO_INCREMENT,
  id_leito INT NOT NULL,
  id_atendimento INT NOT NULL,
  data_entrada DATETIME NOT NULL,
  previsao_alta DATETIME NOT NULL,
  data_alta DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (id_internacao),
  INDEX fk_internacao_leito_idx (id_leito ASC) VISIBLE,
  INDEX fk_internacao_atendimento_idx (id_atendimento ASC) VISIBLE,
  CONSTRAINT fk_internacao_atendimento
    FOREIGN KEY (id_atendimento)
    REFERENCES atendimento (id_atendimento),
  CONSTRAINT fk_internacao_leito
    FOREIGN KEY (id_leito)
    REFERENCES leito (id_leito))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
