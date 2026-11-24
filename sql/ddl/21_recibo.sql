USE `medvetdb`;

CREATE TABLE IF NOT EXISTS `recibo` (
  `id_recibo` INT NOT NULL AUTO_INCREMENT,
  `id_pagamento` INT NOT NULL,
  `data_emissao` DATETIME NOT NULL,
  PRIMARY KEY (`id_recibo`),
  UNIQUE INDEX `id_pagamento_UNIQUE` (`id_pagamento` ASC) VISIBLE,
  CONSTRAINT `id_recibo_pagamento`
    FOREIGN KEY (`id_pagamento`)
    REFERENCES `pagamento` (`id_pagamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
