USE medvetdb;

CREATE TABLE IF NOT EXISTS evolucao_internacao (
  id_evolucao INT NOT NULL AUTO_INCREMENT,
  id_internacao INT NOT NULL,
  crmv_veterinario VARCHAR(20) NOT NULL,
  data_hora DATETIME NOT NULL,
  tratamento_administrado TEXT NULL DEFAULT NULL,
  observacoes TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id_evolucao),
  INDEX fk_evolucao_internacao_idx (id_internacao ASC) VISIBLE,
  INDEX fk_evolucao_crmv_idx (crmv_veterinario ASC) VISIBLE,
  CONSTRAINT fk_evolucao_crmv
    FOREIGN KEY (crmv_veterinario)
    REFERENCES veterinario (crmv),
  CONSTRAINT fk_evolucao_internacao
    FOREIGN KEY (id_internacao)
    REFERENCES internacao (id_internacao))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
