-- Cadastros básicos da clínica (dados fictícios).
SET NAMES utf8mb4;
USE medvetdb;

START TRANSACTION;

INSERT INTO tutor (CPF, Nome, Telefone, Endereco) VALUES
  ('10000000001', 'Mariana Alves',   '(11) 90000-0001', 'Rua das Acácias, 120'),
  ('10000000002', 'Carlos Souza',    '(11) 90000-0002', 'Rua do Bosque, 45'),
  ('10000000003', 'Fernanda Lima',   '(11) 90000-0003', 'Av. Central, 980, apto 32'),
  ('10000000004', 'João Pereira',    '(11) 90000-0004', 'Rua das Flores, 77'),
  ('10000000005', 'Patrícia Rocha',  '(11) 90000-0005', 'Travessa do Sol, 15'),
  ('10000000006', 'Ricardo Gomes',   '(11) 90000-0006', 'Rua Nova, 301');

INSERT INTO animal (id_animal, cpf_tutor, nome_animal, raca, especie, data_de_nascimento, sexo, peso) VALUES
  (1, '10000000001', 'Thor',    'Labrador',       'Cão',    '2020-03-15', 'M', 32.50),
  (2, '10000000001', 'Luna',    'Siamês',         'Gato',   '2021-07-02', 'F',  4.20),
  (3, '10000000002', 'Bidu',    'SRD',            'Cão',    '2018-11-20', 'M', 14.80),
  (4, '10000000003', 'Mel',     'Poodle',         'Cão',    '2022-01-10', 'F',  6.30),
  (5, '10000000004', 'Frajola', 'SRD',            'Gato',   '2019-05-28', 'M',  5.10),
  (6, '10000000005', 'Nina',    'Shih Tzu',       'Cão',    '2017-09-05', 'F',  7.00),
  (7, '10000000005', 'Pipoca',  NULL,             'Coelho', '2023-04-18', 'F',  1.90),
  (8, '10000000006', 'Rex',     'Pastor Alemão',  'Cão',    '2019-12-01', 'M', 35.40);

INSERT INTO funcionario (id_funcionario, nome, cargo, telefone) VALUES
  (1, 'Helena Martins',  'Veterinário',    '(11) 90000-0101'),
  (2, 'Bruno Carvalho',  'Veterinário',    '(11) 90000-0102'),
  (3, 'Camila Ribeiro',  'Veterinário',    '(11) 90000-0103'),
  (4, 'Juliana Santos',  'Recepcionista',  '(11) 90000-0104'),
  (5, 'Marcos Oliveira', 'Auxiliar',       '(11) 90000-0105');

-- Camila acabou de ser contratada e ainda não tem atividades.
INSERT INTO veterinario (crmv, id_funcionario, especialidade) VALUES
  ('CRMV-SP 90001', 1, 'Clínica geral'),
  ('CRMV-SP 90002', 2, 'Cirurgia'),
  ('CRMV-SP 90003', 3, NULL);

INSERT INTO leito (id_leito) VALUES (1), (2), (3), (4);

INSERT INTO procedimento (id_procedimento, nome, descricao, tipo, valor_base) VALUES
  (1, 'Consulta clínica', 'Avaliação geral do animal',            'Consulta',     150.00),
  (2, 'Vacinação V10',    'Aplicação da vacina, com a dose',      'Vacina',        90.00),
  (3, 'Castração',        'Cirurgia de castração',                'Cirurgia',     600.00),
  (4, 'Limpeza dental',   'Remoção de tártaro sob anestesia',     'Odontologia',  400.00),
  (5, 'Curativo',         'Limpeza e curativo de ferimento',      'Ambulatorial',  80.00),
  (6, 'Fluidoterapia',    'Reposição de líquidos, com soro',      'Ambulatorial', 120.00),
  (7, 'Sutura',           'Sutura de ferimento sob sedação',      'Cirurgia',     250.00);

INSERT INTO estoque (id_estoque, nome_item, categoria, descricao, unidade_medida, quantidade_minima, valor_unitario) VALUES
  (1, 'Dipirona injetável', 'Medicamento', 'Ampola de 2 ml',          'ampola',     10.00,  8.00),
  (2, 'Vacina V10',         'Vacina',      'Dose única',              'dose',       10.00, 60.00),
  (3, 'Soro fisiológico',   'Medicamento', 'Frasco de 500 ml',        'frasco',      8.00, 15.00),
  (4, 'Gaze estéril',       'Material',    'Pacote com 10 unidades',  'pacote',     15.00,  6.00),
  (5, 'Amoxicilina',        'Medicamento', 'Comprimido de 250 mg',    'comprimido', 30.00,  4.00),
  (6, 'Ração de recuperação', 'Alimento',  'Lata de 380 g',           'lata',        6.00, 22.00);

COMMIT;
