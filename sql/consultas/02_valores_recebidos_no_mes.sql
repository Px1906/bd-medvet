SELECT
  p.id_pagamento,
  p.data_pagamento,
  t.Nome AS tutor,
  an.nome_animal AS pet,
  CASE
    WHEN c.id_internacao IS NOT NULL THEN 'Internação'
    WHEN c.id_atendimento IS NOT NULL THEN 'Atendimento'
  END AS origem,
  it.descricao,
  p.forma_pagamento,
  p.valor_pago,
  SUM(p.valor_pago) OVER () AS total_recebido_no_mes
FROM pagamento p
JOIN cobranca c ON c.id_cobranca = p.id_cobranca
LEFT JOIN (
  SELECT
    id_cobranca,
    GROUP_CONCAT(
      CONCAT(descricao, ' (', quantidade, ' x R$ ', valor_unitario, ')')
      ORDER BY id_item_cobranca SEPARATOR '; '
    ) AS descricao
  FROM item_cobranca
  GROUP BY id_cobranca
) it ON it.id_cobranca = c.id_cobranca
LEFT JOIN internacao i ON i.id_internacao = c.id_internacao
LEFT JOIN atendimento a ON a.id_atendimento = COALESCE(i.id_atendimento, c.id_atendimento)
LEFT JOIN animal an ON an.id_animal = a.id_animal
LEFT JOIN tutor t ON t.CPF = an.cpf_tutor
WHERE DATE_FORMAT(p.data_pagamento, '%Y-%m') = DATE_FORMAT(UTC_TIMESTAMP() - INTERVAL 3 HOUR, '%Y-%m')
ORDER BY p.data_pagamento, p.id_pagamento;
