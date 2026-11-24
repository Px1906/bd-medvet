-- Relatório 1: agendamentos do dia, com pet, tutor e telefone do tutor.

-- "Hoje" é calculado no horário de Brasília (o servidor pode estar em UTC).
-- Para outro dia, troque a expressão do WHERE por uma data, como '2026-11-24'.

SELECT
  TIME_FORMAT(ag.data_hora, '%H:%i') AS horario,
  an.nome_animal AS pet,
  t.Nome AS tutor,
  t.Telefone AS telefone_tutor,
  ag.motivo
FROM medvetdb.agendamento ag
JOIN medvetdb.animal an ON an.id_animal = ag.id_animal
JOIN medvetdb.tutor t ON t.CPF = an.cpf_tutor
WHERE DATE(ag.data_hora) = DATE(UTC_TIMESTAMP() - INTERVAL 3 HOUR)
ORDER BY ag.data_hora, pet;
