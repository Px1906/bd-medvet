USE medvetdb;

CREATE TABLE IF NOT EXISTS animal (
  id_animal INT NOT NULL AUTO_INCREMENT,
  cpf_tutor CHAR(11) NOT NULL,
  nome_animal VARCHAR(100) NOT NULL,
  raca VARCHAR(50) NULL DEFAULT NULL,
  especie VARCHAR(50) NOT NULL,
  data_de_nascimento DATE NOT NULL,
  sexo CHAR(1) NOT NULL,
  peso DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (id_animal),
  INDEX fk_cpf_tutor_idx (cpf_tutor ASC) VISIBLE,
  CONSTRAINT fk_cpf_tutor
    FOREIGN KEY (cpf_tutor)
    REFERENCES tutor (CPF))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
