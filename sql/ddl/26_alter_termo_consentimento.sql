-- Chave primária no padrão id_(nome da tabela).
USE medvetdb;

ALTER TABLE termo_consentimento
  RENAME COLUMN id_termo TO id_termo_consentimento;
