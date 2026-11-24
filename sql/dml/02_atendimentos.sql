-- Agendamentos, atendimentos, prontuários, exames e procedimentos.
SET NAMES utf8mb4;
USE medvetdb;

-- Datas relativas ao dia da execução (horário de Brasília).
SET @hoje = DATE(UTC_TIMESTAMP() - INTERVAL 3 HOUR);

START TRANSACTION;

INSERT INTO agendamento (id_agendamento, id_animal, data_hora, motivo) VALUES
  (1,  1, @hoje - INTERVAL 12 DAY + INTERVAL '09:00' HOUR_MINUTE, 'Vacinação anual'),
  (2,  4, @hoje - INTERVAL 8 DAY  + INTERVAL '08:00' HOUR_MINUTE, 'Castração'),
  (3,  3, @hoje - INTERVAL 3 DAY  + INTERVAL '10:00' HOUR_MINUTE, 'Vômito e falta de apetite'),
  (4,  6, @hoje - INTERVAL 2 DAY  + INTERVAL '15:00' HOUR_MINUTE, 'Limpeza dental'),
  (5,  2, @hoje                   + INTERVAL '09:00' HOUR_MINUTE, 'Consulta de rotina'),
  (6,  5, @hoje                   + INTERVAL '10:30' HOUR_MINUTE, 'Retorno do curativo'),
  (7,  7, @hoje                   + INTERVAL '14:00' HOUR_MINUTE, 'Corte de unhas e avaliação'),
  (8,  6, @hoje                   + INTERVAL '16:30' HOUR_MINUTE, 'Retorno da limpeza dental'),
  (9,  1, @hoje + INTERVAL 3 DAY  + INTERVAL '11:00' HOUR_MINUTE, 'Exame de rotina'),
  (10, 4, @hoje + INTERVAL 7 DAY  + INTERVAL '09:30' HOUR_MINUTE, 'Retirada de pontos');

-- Os atendimentos 5 e 6 foram sem agendamento.
INSERT INTO atendimento (id_atendimento, id_animal, crmv_veterinario, id_agendamento, data_hora, anamnese, exame_fisico) VALUES
  (1, 1, 'CRMV-SP 90001', 1,    @hoje - INTERVAL 12 DAY + INTERVAL '09:10' HOUR_MINUTE, 'Sem queixas, veio para vacina',        'Parâmetros normais'),
  (2, 4, 'CRMV-SP 90002', 2,    @hoje - INTERVAL 8 DAY  + INTERVAL '08:10' HOUR_MINUTE, 'Em jejum de 8 horas',                  'Apta para cirurgia'),
  (3, 3, 'CRMV-SP 90001', 3,    @hoje - INTERVAL 3 DAY  + INTERVAL '10:05' HOUR_MINUTE, 'Vômitos há dois dias',                 'Desidratação moderada, dor abdominal'),
  (4, 6, 'CRMV-SP 90001', 4,    @hoje - INTERVAL 2 DAY  + INTERVAL '15:00' HOUR_MINUTE, 'Mau hálito e dificuldade de mastigar', 'Tártaro acentuado'),
  (5, 8, 'CRMV-SP 90002', NULL, @hoje - INTERVAL 1 DAY  + INTERVAL '20:15' HOUR_MINUTE, 'Atropelado na rua de casa',            'Ferimento na pata traseira, dor à palpação'),
  (6, 5, 'CRMV-SP 90002', NULL, @hoje - INTERVAL 35 DAY + INTERVAL '17:00' HOUR_MINUTE, 'Brigou com outro gato',                'Ferimento superficial na orelha');

INSERT INTO prontuario (id_prontuario, id_atendimento, sintomas, diagnostico, tratamento_prescrito) VALUES
  (1, 1, NULL,                           'Animal saudável',           'Reforço da vacina em 12 meses'),
  (2, 2, NULL,                           'Animal saudável',           'Amoxicilina e repouso por 10 dias'),
  (3, 3, 'Vômito, apatia e desidratação', 'Gastroenterite',           'Internação com fluidoterapia'),
  (4, 4, 'Mau hálito',                   'Doença periodontal',        'Limpeza dental e escovação semanal'),
  (5, 5, 'Dor e ferimento na pata',      'Laceração, sem fratura',    'Sutura, analgesia e internação'),
  (6, 6, 'Ferimento na orelha',          'Ferimento por mordedura',   'Curativo diário');

-- O exame 4 ainda aguarda resultado.
INSERT INTO exame (id_exame, id_atendimento, nome, tipo, data_solicitacao, resultado, data_resultado) VALUES
  (1, 3, 'Hemograma',              'Laboratorial', @hoje - INTERVAL 3 DAY + INTERVAL '10:30' HOUR_MINUTE, 'Leucocitose leve',            @hoje - INTERVAL 3 DAY + INTERVAL '16:00' HOUR_MINUTE),
  (2, 3, 'Ultrassom abdominal',    'Imagem',       @hoje - INTERVAL 3 DAY + INTERVAL '10:30' HOUR_MINUTE, 'Sem sinal de obstrução',      @hoje - INTERVAL 3 DAY + INTERVAL '11:30' HOUR_MINUTE),
  (3, 5, 'Raio-X da pata',         'Imagem',       @hoje - INTERVAL 1 DAY + INTERVAL '20:30' HOUR_MINUTE, 'Sem fratura',                 @hoje - INTERVAL 1 DAY + INTERVAL '21:00' HOUR_MINUTE),
  (4, 5, 'Hemograma',              'Laboratorial', @hoje - INTERVAL 1 DAY + INTERVAL '20:30' HOUR_MINUTE, NULL,                          NULL),
  (5, 2, 'Exame pré-operatório',   'Laboratorial', @hoje - INTERVAL 8 DAY + INTERVAL '08:20' HOUR_MINUTE, 'Dentro da normalidade',       @hoje - INTERVAL 8 DAY + INTERVAL '09:00' HOUR_MINUTE);

INSERT INTO procedimento_realizado (id_procedimento_realizado, id_procedimento, id_atendimento, crmv_veterinario, data_hora, observacoes) VALUES
  (1,  1, 1, 'CRMV-SP 90001', @hoje - INTERVAL 12 DAY + INTERVAL '09:10' HOUR_MINUTE, NULL),
  (2,  2, 1, 'CRMV-SP 90001', @hoje - INTERVAL 12 DAY + INTERVAL '09:30' HOUR_MINUTE, 'Sem reação'),
  (3,  1, 2, 'CRMV-SP 90002', @hoje - INTERVAL 8 DAY  + INTERVAL '08:10' HOUR_MINUTE, NULL),
  (4,  3, 2, 'CRMV-SP 90002', @hoje - INTERVAL 8 DAY  + INTERVAL '10:00' HOUR_MINUTE, 'Sem intercorrências'),
  (5,  1, 3, 'CRMV-SP 90001', @hoje - INTERVAL 3 DAY  + INTERVAL '10:05' HOUR_MINUTE, NULL),
  (6,  6, 3, 'CRMV-SP 90001', @hoje - INTERVAL 3 DAY  + INTERVAL '12:00' HOUR_MINUTE, NULL),
  (7,  1, 4, 'CRMV-SP 90001', @hoje - INTERVAL 2 DAY  + INTERVAL '15:00' HOUR_MINUTE, NULL),
  (8,  4, 4, 'CRMV-SP 90002', @hoje - INTERVAL 2 DAY  + INTERVAL '16:00' HOUR_MINUTE, 'Executado pelo cirurgião'),
  (9,  1, 5, 'CRMV-SP 90002', @hoje - INTERVAL 1 DAY  + INTERVAL '20:15' HOUR_MINUTE, 'Emergência'),
  (10, 7, 5, 'CRMV-SP 90002', @hoje - INTERVAL 1 DAY  + INTERVAL '21:15' HOUR_MINUTE, 'Oito pontos'),
  (11, 1, 6, 'CRMV-SP 90002', @hoje - INTERVAL 35 DAY + INTERVAL '17:00' HOUR_MINUTE, NULL),
  (12, 5, 6, 'CRMV-SP 90002', @hoje - INTERVAL 35 DAY + INTERVAL '17:20' HOUR_MINUTE, NULL);

INSERT INTO termo_consentimento (id_termo_consentimento, id_procedimento_realizado, cpf_tutor, data_assinatura, documento_assinado) VALUES
  (1, 4,  '10000000003', @hoje - INTERVAL 8 DAY + INTERVAL '08:30' HOUR_MINUTE, 'termos/termo_0001.pdf'),
  (2, 8,  '10000000005', @hoje - INTERVAL 2 DAY + INTERVAL '15:30' HOUR_MINUTE, 'termos/termo_0002.pdf'),
  (3, 10, '10000000006', @hoje - INTERVAL 1 DAY + INTERVAL '21:05' HOUR_MINUTE, 'termos/termo_0003.pdf');

COMMIT;
