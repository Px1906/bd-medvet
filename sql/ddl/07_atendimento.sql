USE medvetdb;

CREATE TABLE IF NOT EXISTS atendimento (
  id_atendimento INT NOT NULL AUTO_INCREMENT,
  id_animal INT NOT NULL,
  crmv_veterinario VARCHAR(20) NOT NULL,
  id_agendamento INT NULL DEFAULT NULL,
  data_hora DATETIME NOT NULL,
  anamnese TEXT NULL DEFAULT NULL,
  exame_fisico TEXT NULL DEFAULT NULL,
  PRIMARY KEY (id_atendimento),
  UNIQUE INDEX id_agendamento_UNIQUE (id_agendamento ASC) VISIBLE,
  INDEX fk_crmv_veterinario_idx (crmv_veterinario ASC) VISIBLE,
  INDEX fk_id_agendamento_idx (id_agendamento ASC) VISIBLE,
  INDEX fk_atendimento_animal_idx (id_animal ASC) VISIBLE,
  CONSTRAINT fk_atendimento_agendamento
    FOREIGN KEY (id_agendamento)
    REFERENCES agendamento (id_agendamento),
  CONSTRAINT fk_atendimento_animal
    FOREIGN KEY (id_animal)
    REFERENCES animal (id_animal),
  CONSTRAINT fk_atendimento_veterinario
    FOREIGN KEY (crmv_veterinario)
    REFERENCES veterinario (crmv))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
