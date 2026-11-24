-- Relatório 3: todos os veterinários, com seus atendimentos e procedimentos
-- e o pet atendido. Quem não tem atividade aparece com as colunas em NULL.
USE medvetdb;

SELECT
  f.nome AS veterinario,
  v.crmv,
  v.especialidade,
  atv.tipo_atividade,
  atv.procedimento,
  atv.data_hora,
  an.nome_animal AS pet
FROM veterinario v
JOIN funcionario f ON f.id_funcionario = v.id_funcionario
LEFT JOIN (
  SELECT
    a.crmv_veterinario,
    'Atendimento' AS tipo_atividade,
    NULL AS procedimento,
    a.data_hora,
    a.id_animal
  FROM atendimento a

  UNION ALL

  -- Quem executa o procedimento pode não ser quem fez o atendimento.
  SELECT
    pr.crmv_veterinario,
    'Procedimento',
    pc.nome,
    pr.data_hora,
    a.id_animal
  FROM procedimento_realizado pr
  JOIN procedimento pc ON pc.id_procedimento = pr.id_procedimento
  JOIN atendimento a ON a.id_atendimento = pr.id_atendimento
) atv ON atv.crmv_veterinario = v.crmv
LEFT JOIN animal an ON an.id_animal = atv.id_animal
ORDER BY veterinario, v.crmv, atv.data_hora, atv.tipo_atividade;
