-- Entradas e saídas do estoque. O saldo é entradas menos saídas:
-- a dipirona termina abaixo da quantidade mínima, como exemplo.
SET NAMES utf8mb4;
USE medvetdb;

SET @hoje = DATE(UTC_TIMESTAMP() - INTERVAL 3 HOUR);

START TRANSACTION;

INSERT INTO movimentacao_estoque (id_movimentacao_estoque, id_estoque, id_funcionario, tipo_movimentacao, quantidade, data_hora) VALUES
  (1,  1, 4, 'ENTRADA', 10.00, @hoje - INTERVAL 40 DAY + INTERVAL '08:30' HOUR_MINUTE),
  (2,  2, 4, 'ENTRADA', 12.00, @hoje - INTERVAL 40 DAY + INTERVAL '08:30' HOUR_MINUTE),
  (3,  3, 4, 'ENTRADA', 20.00, @hoje - INTERVAL 40 DAY + INTERVAL '08:30' HOUR_MINUTE),
  (4,  4, 4, 'ENTRADA', 30.00, @hoje - INTERVAL 40 DAY + INTERVAL '08:30' HOUR_MINUTE),
  (5,  5, 4, 'ENTRADA', 60.00, @hoje - INTERVAL 40 DAY + INTERVAL '08:30' HOUR_MINUTE),
  (6,  6, 4, 'ENTRADA', 12.00, @hoje - INTERVAL 40 DAY + INTERVAL '08:30' HOUR_MINUTE),
  (7,  4, 5, 'SAIDA',    2.00, @hoje - INTERVAL 35 DAY + INTERVAL '17:20' HOUR_MINUTE),
  (8,  2, 5, 'SAIDA',    1.00, @hoje - INTERVAL 12 DAY + INTERVAL '09:25' HOUR_MINUTE),
  (9,  5, 5, 'SAIDA',   10.00, @hoje - INTERVAL 7 DAY  + INTERVAL '09:45' HOUR_MINUTE),
  (10, 3, 5, 'SAIDA',    1.00, @hoje - INTERVAL 3 DAY  + INTERVAL '12:00' HOUR_MINUTE),
  (11, 3, 5, 'SAIDA',    4.00, @hoje - INTERVAL 1 DAY  + INTERVAL '09:00' HOUR_MINUTE),
  (12, 1, 5, 'SAIDA',    3.00, @hoje - INTERVAL 1 DAY  + INTERVAL '09:00' HOUR_MINUTE),
  (13, 4, 5, 'SAIDA',    3.00, @hoje - INTERVAL 1 DAY  + INTERVAL '21:15' HOUR_MINUTE),
  (14, 6, 5, 'SAIDA',    4.00, @hoje - INTERVAL 1 DAY  + INTERVAL '23:00' HOUR_MINUTE);

COMMIT;
