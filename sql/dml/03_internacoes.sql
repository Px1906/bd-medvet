-- Internações: Mel já teve alta; Bidu e Rex continuam internados.
SET NAMES utf8mb4;
USE medvetdb;

SET @hoje = DATE(UTC_TIMESTAMP() - INTERVAL 3 HOUR);

START TRANSACTION;

INSERT INTO internacao (id_internacao, id_leito, id_atendimento, data_entrada, previsao_alta, data_alta) VALUES
  (1, 1, 2, @hoje - INTERVAL 8 DAY + INTERVAL '13:00' HOUR_MINUTE, @hoje - INTERVAL 7 DAY + INTERVAL '10:00' HOUR_MINUTE, @hoje - INTERVAL 7 DAY + INTERVAL '10:00' HOUR_MINUTE),
  (2, 1, 3, @hoje - INTERVAL 3 DAY + INTERVAL '13:00' HOUR_MINUTE, @hoje + INTERVAL 1 DAY + INTERVAL '10:00' HOUR_MINUTE, NULL),
  (3, 2, 5, @hoje - INTERVAL 1 DAY + INTERVAL '22:00' HOUR_MINUTE, @hoje + INTERVAL 4 DAY + INTERVAL '10:00' HOUR_MINUTE, NULL);

INSERT INTO evolucao_internacao (id_evolucao_internacao, id_internacao, crmv_veterinario, data_hora, tratamento_administrado, observacoes) VALUES
  (1, 1, 'CRMV-SP 90002', @hoje - INTERVAL 8 DAY + INTERVAL '18:00' HOUR_MINUTE, 'Amoxicilina',                 'Recuperação da anestesia normal'),
  (2, 1, 'CRMV-SP 90001', @hoje - INTERVAL 7 DAY + INTERVAL '09:00' HOUR_MINUTE, 'Amoxicilina',                 'Alimentando-se bem, alta liberada'),
  (3, 2, 'CRMV-SP 90001', @hoje - INTERVAL 3 DAY + INTERVAL '18:00' HOUR_MINUTE, 'Soro e dipirona',             'Ainda apático'),
  (4, 2, 'CRMV-SP 90002', @hoje - INTERVAL 2 DAY + INTERVAL '09:00' HOUR_MINUTE, 'Soro e dipirona',             'Sem vômitos desde a noite'),
  (5, 2, 'CRMV-SP 90001', @hoje - INTERVAL 1 DAY + INTERVAL '09:00' HOUR_MINUTE, 'Soro e dipirona',             'Voltou a se alimentar'),
  (6, 3, 'CRMV-SP 90002', @hoje - INTERVAL 1 DAY + INTERVAL '23:00' HOUR_MINUTE, 'Ração de recuperação',        'Estável após a sutura');

COMMIT;
