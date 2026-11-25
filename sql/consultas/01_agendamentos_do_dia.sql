SELECT
  TIME_FORMAT(ag.data_hora, '%H:%i') AS horario,
  an.nome_animal AS pet,
  t.Nome AS tutor,
  t.Telefone AS telefone_tutor,
  ag.motivo
FROM agendamento ag
JOIN animal an ON an.id_animal = ag.id_animal
JOIN tutor t ON t.CPF = an.cpf_tutor
WHERE DATE(ag.data_hora) = DATE('2026-11-24')
ORDER BY ag.data_hora, pet;
