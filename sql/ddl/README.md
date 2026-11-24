# DDL

Scripts de definição da estrutura: `CREATE TABLE`, `ALTER TABLE`, `CREATE INDEX` e constraints.

## Ordem de execução

Execute os arquivos em ordem numérica. Cada tabela é criada depois das tabelas que referencia.

| Ordem | Arquivo | Depende de |
| --- | --- | --- |
| 01 | `01_schema.sql` | - |
| 02 | `02_tutor.sql` | - |
| 03 | `03_animal.sql` | `tutor` |
| 04 | `04_veterinario.sql` | - |
| 05 | `05_funcionario.sql` | - |
| 06 | `06_agendamento.sql` | `animal` |
| 07 | `07_atendimento.sql` | `agendamento`, `animal`, `veterinario` |
| 08 | `08_prontuario.sql` | `atendimento` |
| 09 | `09_exame.sql` | `atendimento` |
| 10 | `10_procedimento.sql` | - |
| 11 | `11_procedimento_realizado.sql` | `atendimento`, `veterinario`, `procedimento` |
| 12 | `12_termo_consentimento.sql` | `tutor`, `procedimento_realizado` |
| 13 | `13_leito.sql` | - |
| 14 | `14_internacao.sql` | `atendimento`, `leito` |
| 15 | `15_evolucao_internacao.sql` | `veterinario`, `internacao` |
| 16 | `16_estoque.sql` | - |
| 17 | `17_movimentacao_estoque.sql` | `estoque`, `funcionario` |
| 18 | `18_cobranca.sql` | `atendimento`, `internacao` |
| 19 | `19_item_cobranca.sql` | `cobranca`, `estoque`, `procedimento_realizado` |
| 20 | `20_pagamento.sql` | `cobranca` |
| 21 | `21_recibo.sql` | `pagamento` |
