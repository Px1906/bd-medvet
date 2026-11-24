USE medvetdb;

CREATE TABLE IF NOT EXISTS termo_consentimento (
  id_termo INT NOT NULL AUTO_INCREMENT,
  id_procedimento_realizado INT NOT NULL,
  cpf_tutor CHAR(11) NOT NULL,
  data_assinatura DATETIME NOT NULL,
  documento_assinado VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_termo),
  UNIQUE INDEX id_procedimento_realizado_UNIQUE (id_procedimento_realizado ASC) VISIBLE,
  INDEX fk_termo_cpf_idx (cpf_tutor ASC) VISIBLE,
  CONSTRAINT fk_termo_cpf
    FOREIGN KEY (cpf_tutor)
    REFERENCES tutor (CPF),
  CONSTRAINT fk_termo_procedimento_realizado
    FOREIGN KEY (id_procedimento_realizado)
    REFERENCES procedimento_realizado (id_procedimento_realizado))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
