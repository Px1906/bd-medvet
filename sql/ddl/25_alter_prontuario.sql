-- Cada atendimento gera no máximo um prontuário.
-- Falha, sem alterar a tabela, se já houver mais de um por atendimento.
USE `medvetdb`;

ALTER TABLE `prontuario`
  ADD UNIQUE INDEX `id_atendimento_UNIQUE` (`id_atendimento` ASC) VISIBLE,
  DROP INDEX `fk_prontuario_atendimento_idx`;
