# DML

Scripts de manipulação de dados: `INSERT` com dados de teste, `UPDATE` e `DELETE`.

## Carga de exemplo

Dados fictícios de uma clínica pequena. Execute em ordem numérica, uma única vez, depois de todos os scripts de `sql/ddl/` e com as tabelas vazias.

| Arquivo | Tabelas |
| --- | --- |
| `01_cadastros.sql` | `tutor`, `animal`, `funcionario`, `veterinario`, `leito`, `procedimento`, `estoque` |
| `02_atendimentos.sql` | `agendamento`, `atendimento`, `prontuario`, `exame`, `procedimento_realizado`, `termo_consentimento` |
| `03_internacoes.sql` | `internacao`, `evolucao_internacao` |
| `04_movimentacoes_estoque.sql` | `movimentacao_estoque` |
| `05_financeiro.sql` | `cobranca`, `item_cobranca`, `pagamento`, `recibo` |

As datas são relativas ao dia da execução. O relatório de agendamentos do dia só traz resultado na data da carga; para ver os mesmos dados depois, troque a data no `WHERE` da consulta.
