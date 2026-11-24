-- Relatório 2: valores recebidos no mês atual, um pagamento por linha.
-- A descrição lista os itens da cobrança à qual o pagamento se refere.

-- O mês atual é calculado no horário de Brasília (o servidor pode estar em UTC).
-- Para outro mês, troque a expressão à direita no WHERE por um mês, como '2026-11'.
-- O SET_VAR evita que descrições longas sejam cortadas.
SELECT /*+ SET_VAR(group_concat_max_len = 10000) */
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
FROM medvetdb.pagamento p
JOIN medvetdb.cobranca c ON c.id_cobranca = p.id_cobranca
LEFT JOIN (
  SELECT
    id_cobranca,
    GROUP_CONCAT(
      CONCAT(descricao, ' (', quantidade, ' x R$ ', valor_unitario, ')')
      ORDER BY id_item_cobranca SEPARATOR '; '
    ) AS descricao
  FROM medvetdb.item_cobranca
  GROUP BY id_cobranca
) it ON it.id_cobranca = c.id_cobranca
LEFT JOIN medvetdb.internacao i ON i.id_internacao = c.id_internacao
LEFT JOIN medvetdb.atendimento a ON a.id_atendimento = COALESCE(i.id_atendimento, c.id_atendimento)
LEFT JOIN medvetdb.animal an ON an.id_animal = a.id_animal
LEFT JOIN medvetdb.tutor t ON t.CPF = an.cpf_tutor
WHERE DATE_FORMAT(p.data_pagamento, '%Y-%m') = DATE_FORMAT(UTC_TIMESTAMP() - INTERVAL 3 HOUR, '%Y-%m')
ORDER BY p.data_pagamento, p.id_pagamento;
