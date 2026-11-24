-- Chave primária com o nome usado no DER.
USE `medvetdb`;

ALTER TABLE `movimentacao_estoque`
  RENAME COLUMN `id_movimentacao_estoque` TO `id_movimentacao`;
