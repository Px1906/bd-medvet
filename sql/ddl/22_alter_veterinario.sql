-- VETERINARIO passa a ser especialização de FUNCIONARIO (conforme o DER).
USE `medvetdb`;

ALTER TABLE `veterinario`
  ADD COLUMN `id_funcionario` INT NULL AFTER `crmv`;

-- Cadastra como funcionário os veterinários que ainda não são.
INSERT INTO `funcionario` (`nome`, `cargo`, `telefone`)
SELECT v.`nome`, 'Veterinário', v.`telefone`
FROM `veterinario` v
WHERE NOT EXISTS (
  SELECT 1 FROM `funcionario` f
  WHERE f.`nome` = v.`nome` AND f.`telefone` = v.`telefone`
);

-- Vincula cada veterinário ao seu funcionário (nome + telefone).
UPDATE `veterinario` v
SET v.`id_funcionario` = (
  SELECT MIN(f.`id_funcionario`) FROM `funcionario` f
  WHERE f.`nome` = v.`nome` AND f.`telefone` = v.`telefone`
)
WHERE v.`crmv` <> '';

-- Em um único ALTER: se o vínculo for inválido, nome e telefone não são removidos.
ALTER TABLE `veterinario`
  MODIFY COLUMN `id_funcionario` INT NOT NULL,
  ADD UNIQUE INDEX `id_funcionario_UNIQUE` (`id_funcionario` ASC) VISIBLE,
  ADD CONSTRAINT `fk_veterinario_funcionario`
    FOREIGN KEY (`id_funcionario`)
    REFERENCES `funcionario` (`id_funcionario`),
  DROP COLUMN `nome`,
  DROP COLUMN `telefone`;
