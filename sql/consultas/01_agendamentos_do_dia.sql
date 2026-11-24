-- Relatório 1: agendamentos do dia, com pet, tutor e telefone do tutor.
USE medvetdb;

-- Data atual no horário de Brasília (o servidor pode estar em UTC).
-- Para outro dia: SET @dia = CAST('2026-11-24' AS DATE);
SET @dia = DATE(UTC_TIMESTAMP() - INTERVAL 3 HOUR);

SELECT
  TIME_FORMAT(ag.data_hora, '%H:%i') AS horario,
  an.nome_animal AS pet,
  t.Nome AS tutor,
  t.Telefone AS telefone_tutor,
  ag.motivo
FROM agendamento ag
JOIN animal an ON an.id_animal = ag.id_animal
JOIN tutor t ON t.CPF = an.cpf_tutor
WHERE ag.data_hora >= @dia
  AND ag.data_hora < @dia + INTERVAL 1 DAY
ORDER BY ag.data_hora, pet;
