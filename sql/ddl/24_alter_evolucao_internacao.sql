-- Chave primária no padrão id_(nome da tabela).
USE medvetdb;

ALTER TABLE evolucao_internacao
  RENAME COLUMN id_evolucao TO id_evolucao_internacao;
