-- Cobranças, itens, pagamentos e recibos.
-- Há cobranças quitadas, parceladas, parcialmente pagas e sem pagamento.
SET NAMES utf8mb4;
USE medvetdb;

SET @hoje = DATE(UTC_TIMESTAMP() - INTERVAL 3 HOUR);

START TRANSACTION;

INSERT INTO cobranca (id_cobranca, id_atendimento, id_internacao, data_emissao) VALUES
  (1, 1,    NULL, @hoje - INTERVAL 12 DAY + INTERVAL '09:40' HOUR_MINUTE),
  (2, 2,    NULL, @hoje - INTERVAL 8 DAY  + INTERVAL '12:00' HOUR_MINUTE),
  (3, NULL, 1,    @hoje - INTERVAL 7 DAY  + INTERVAL '10:00' HOUR_MINUTE),
  (4, 3,    NULL, @hoje - INTERVAL 3 DAY  + INTERVAL '12:30' HOUR_MINUTE),
  (5, NULL, 2,    @hoje                   + INTERVAL '08:00' HOUR_MINUTE),
  (6, 4,    NULL, @hoje - INTERVAL 2 DAY  + INTERVAL '17:30' HOUR_MINUTE),
  (7, 5,    NULL, @hoje - INTERVAL 1 DAY  + INTERVAL '21:50' HOUR_MINUTE),
  (8, NULL, 3,    @hoje                   + INTERVAL '08:00' HOUR_MINUTE),
  (9, 6,    NULL, @hoje - INTERVAL 35 DAY + INTERVAL '17:40' HOUR_MINUTE);

INSERT INTO item_cobranca (id_item_cobranca, id_cobranca, id_procedimento_realizado, id_estoque, tipo_item, descricao, quantidade, valor_unitario) VALUES
  (1,  1, 1,    NULL, 'Procedimento', 'Consulta clínica',     1.00,  150.00),
  (2,  1, 2,    NULL, 'Procedimento', 'Vacinação V10',        1.00,   90.00),
  (3,  2, 3,    NULL, 'Procedimento', 'Consulta clínica',     1.00,  150.00),
  (4,  2, 4,    NULL, 'Procedimento', 'Castração',            1.00,  600.00),
  (5,  3, NULL, NULL, 'Diária',       'Diária de internação', 1.00,  180.00),
  (6,  3, NULL, 5,    'Produto',      'Amoxicilina',          10.00,   4.00),
  (7,  4, 5,    NULL, 'Procedimento', 'Consulta clínica',     1.00,  150.00),
  (8,  4, 6,    NULL, 'Procedimento', 'Fluidoterapia',        1.00,  120.00),
  (9,  5, NULL, NULL, 'Diária',       'Diária de internação', 3.00,  180.00),
  (10, 5, NULL, 3,    'Produto',      'Soro fisiológico',     4.00,   15.00),
  (11, 5, NULL, 1,    'Produto',      'Dipirona injetável',   3.00,    8.00),
  (12, 6, 7,    NULL, 'Procedimento', 'Consulta clínica',     1.00,  150.00),
  (13, 6, 8,    NULL, 'Procedimento', 'Limpeza dental',       1.00,  400.00),
  (14, 7, 9,    NULL, 'Procedimento', 'Consulta clínica',     1.00,  150.00),
  (15, 7, 10,   NULL, 'Procedimento', 'Sutura',               1.00,  250.00),
  (16, 7, NULL, 4,    'Produto',      'Gaze estéril',         3.00,    6.00),
  (17, 8, NULL, NULL, 'Diária',       'Diária de internação', 1.00,  180.00),
  (18, 8, NULL, 6,    'Produto',      'Ração de recuperação', 4.00,   22.00),
  (19, 9, 11,   NULL, 'Procedimento', 'Consulta clínica',     1.00,  150.00),
  (20, 9, 12,   NULL, 'Procedimento', 'Curativo',             1.00,   80.00),
  (21, 9, NULL, 4,    'Produto',      'Gaze estéril',         2.00,    6.00);

-- Dois pagamentos são de hoje, para sempre haver receita no mês atual.
INSERT INTO pagamento (id_pagamento, id_cobranca, data_pagamento, valor_pago, forma_pagamento) VALUES
  (1, 1, @hoje - INTERVAL 12 DAY + INTERVAL '09:45' HOUR_MINUTE, 240.00, 'Pix'),
  (2, 2, @hoje - INTERVAL 8 DAY  + INTERVAL '12:10' HOUR_MINUTE, 400.00, 'Cartão de crédito'),
  (3, 2, @hoje - INTERVAL 7 DAY  + INTERVAL '10:10' HOUR_MINUTE, 350.00, 'Cartão de débito'),
  (4, 3, @hoje - INTERVAL 7 DAY  + INTERVAL '10:15' HOUR_MINUTE, 220.00, 'Dinheiro'),
  (5, 4, @hoje - INTERVAL 3 DAY  + INTERVAL '12:40' HOUR_MINUTE, 270.00, 'Pix'),
  (6, 5, @hoje                   + INTERVAL '08:15' HOUR_MINUTE, 300.00, 'Pix'),
  (7, 6, @hoje                   + INTERVAL '08:30' HOUR_MINUTE, 550.00, 'Cartão de crédito'),
  (8, 7, @hoje - INTERVAL 1 DAY  + INTERVAL '22:00' HOUR_MINUTE, 200.00, 'Dinheiro'),
  (9, 9, @hoje - INTERVAL 35 DAY + INTERVAL '17:45' HOUR_MINUTE, 242.00, 'Pix');

INSERT INTO recibo (id_recibo, id_pagamento, data_emissao)
SELECT id_pagamento, id_pagamento, data_pagamento + INTERVAL 5 MINUTE
FROM pagamento
WHERE id_pagamento BETWEEN 1 AND 9;

COMMIT;
