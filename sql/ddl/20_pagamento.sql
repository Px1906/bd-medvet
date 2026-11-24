USE medvetdb;

CREATE TABLE IF NOT EXISTS pagamento (
  id_pagamento INT NOT NULL AUTO_INCREMENT,
  id_cobranca INT NOT NULL,
  data_pagamento DATETIME NOT NULL,
  valor_pago DECIMAL(10,2) NOT NULL,
  forma_pagamento VARCHAR(30) NOT NULL,
  PRIMARY KEY (id_pagamento),
  INDEX fk_pagamento_cobranca_idx (id_cobranca ASC) VISIBLE,
  CONSTRAINT fk_pagamento_cobranca
    FOREIGN KEY (id_cobranca)
    REFERENCES cobranca (id_cobranca))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
