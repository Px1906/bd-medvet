WITH itens AS (
  SELECT id_cobranca, SUM(quantidade * valor_unitario) AS total
  FROM item_cobranca
  GROUP BY id_cobranca
),
pagos AS (
  SELECT id_cobranca, SUM(valor_pago) AS total
  FROM pagamento
  GROUP BY id_cobranca
),
saldo AS (
  SELECT
    c.id_internacao,
    SUM(COALESCE(itens.total, 0)) AS cobrado,
    SUM(COALESCE(pagos.total, 0)) AS pago,
    SUM(GREATEST(COALESCE(itens.total, 0) - COALESCE(pagos.total, 0), 0)) AS pendente
  FROM cobranca c
  LEFT JOIN itens ON itens.id_cobranca = c.id_cobranca
  LEFT JOIN pagos ON pagos.id_cobranca = c.id_cobranca
  WHERE c.id_internacao IS NOT NULL
  GROUP BY c.id_internacao
)
SELECT
  an.nome_animal AS pet,
  t.Nome AS tutor,
  t.Telefone AS telefone_tutor,
  i.id_leito AS leito,
  i.data_entrada,
  i.previsao_alta,
  CAST(COALESCE(saldo.cobrado, 0) AS DECIMAL(12,2)) AS valor_cobrado,
  CAST(COALESCE(saldo.pago, 0) AS DECIMAL(12,2)) AS valor_pago,
  CAST(COALESCE(saldo.pendente, 0) AS DECIMAL(12,2)) AS valor_pendente
FROM internacao i
JOIN atendimento a ON a.id_atendimento = i.id_atendimento
JOIN animal an ON an.id_animal = a.id_animal
JOIN tutor t ON t.CPF = an.cpf_tutor
LEFT JOIN saldo ON saldo.id_internacao = i.id_internacao
WHERE i.data_alta IS NULL
ORDER BY pet, i.data_entrada;
