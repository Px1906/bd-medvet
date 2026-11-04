# BD MedVet

Banco de dados para uma clínica veterinária, desenvolvido como trabalho da faculdade.

## Estrutura do repositório

```
bd-medvet/
├── docs/
│   └── modelagem/
│       ├── conceitual/      # Modelo conceitual (DER / MER)
│       └── logico/          # Modelo lógico (tabelas, chaves, normalização)
└── sql/
    ├── ddl/                 # Criação da estrutura (CREATE TABLE, ALTER, índices)
    ├── dml/                 # Carga de dados (INSERT, UPDATE, DELETE)
    └── consultas/           # Consultas (SELECT) para relatórios e testes
```

## Como executar

Rode os scripts nesta ordem:

1. `sql/ddl/`: cria as tabelas
2. `sql/dml/`: insere os dados de teste
3. `sql/consultas/`: executa as consultas

Numere os arquivos para manter a ordem de execução (ex.: `01_create_tables.sql`, `02_indices.sql`).
