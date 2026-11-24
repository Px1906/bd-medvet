-- O DER tem quantidade_minima e não tem quantidade.
-- O saldo atual passa a ser calculado a partir de movimentacao_estoque.
-- ATENÇÃO: remove os valores gravados em estoque.quantidade.
USE `medvetdb`;

ALTER TABLE `estoque`
  ADD COLUMN `quantidade_minima` DECIMAL(10,2) NOT NULL DEFAULT 0 AFTER `unidade_medida`,
  DROP COLUMN `quantidade`;
