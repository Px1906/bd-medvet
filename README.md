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

# Modelagem do Banco de Dados

Documentação da modelagem do sistema de gerenciamento
da Clínica Veterinária Vida Animal.

## Entregas

- Diagrama Entidade-Relacionamento (DER)
- Modelo lógico normalizado até a 3FN
- Scripts de criação das tabelas e chaves estrangeiras
- Scripts de carga de dados
- Consultas SQL para os relatórios


## Como executar

Rode os scripts nesta ordem:

1. `sql/ddl/`: cria as tabelas
2. `sql/dml/`: insere os dados de teste
3. `sql/consultas/`: executa as consultas

Numere os arquivos para manter a ordem de execução (ex.: `01_create_tables.sql`, `02_indices.sql`).
