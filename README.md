# rpg-database

# 🎮 RPG Database

Projeto de banco de dados relacional desenvolvido para simular os dados de um jogo RPG, utilizando **PostgreSQL e SQL**.

O objetivo do projeto é praticar **modelagem de dados, relacionamentos entre tabelas, integridade dos dados e consultas SQL de diferentes níveis de complexidade**, além de utilizar o banco para realizar validações relacionadas a cenários de QA.

## 🎯 Objetivos

* Praticar modelagem de banco de dados relacional.
* Criar e relacionar tabelas utilizando chaves primárias e estrangeiras.
* Trabalhar com PostgreSQL e SQL.
* Inserir e manipular dados fictícios.
* Desenvolver consultas SQL básicas, intermediárias e avançadas.
* Praticar `JOIN`, `GROUP BY`, `HAVING`, funções de agregação, subqueries e CTEs.
* Relacionar dados entre diferentes bancos de dados.
* Utilizar consultas para apoiar validações de QA.

## 🗂️ Estrutura do projeto

```text
rpg-database/
│
├── queries/
│   ├── rpg_queries.sql
│   ├── store_queries.sql
│   └── rpg_and_store_queries.sql
│
├── rpg_database/
│   ├── schema.sql
│   └── data.sql
│
├── sql/
│   └── ...
│
└── README.md
```

## 🧙 Banco RPG

O banco principal representa as entidades do jogo:

* **Player** — jogadores cadastrados.
* **Character** — personagens pertencentes aos jogadores.
* **Class** — classes disponíveis no jogo.
* **Item** — itens disponíveis.
* **Inventory** — itens presentes no inventário dos personagens e suas quantidades.
* **Mission** — missões disponíveis no jogo.

### Principais relacionamentos

```text
Player
  │
  └── Character
        │
        ├── Class
        │
        └── Inventory
               │
               └── Item
```

As tabelas utilizam **Primary Keys (PK)** e **Foreign Keys (FK)** para garantir os relacionamentos e a integridade dos dados.

## 🛒 Banco da Loja

Foi criado um segundo banco de dados para representar uma loja de itens do RPG.

Principais entidades:

* **Product** — produtos disponíveis para compra.
* **Category** — categorias dos produtos.
* **Store Order** — pedidos realizados pelos jogadores.
* **Order Item** — produtos e quantidades presentes em cada pedido.

A estrutura permite representar situações como:

```text
Jogador
   ↓
Pedido
   ↓
Itens do pedido
   ↓
Produtos
```

## 🔎 Consultas SQL

As consultas foram organizadas por nível de complexidade.

### Básicas

* Listagem de jogadores.
* Filtros por nível.
* Ordenação de personagens.
* Busca de produtos.

### Intermediárias

* `JOIN` entre jogadores, personagens e classes.
* `COUNT()` para quantidade de personagens.
* `AVG()` para média de nível.
* `SUM()` para valores.
* `GROUP BY`.
* `HAVING`.

### Avançadas

* Subqueries.
* CTEs.
* Consultas agregadas.
* Integração entre os bancos RPG e Loja.


## 🧪 Aplicação em QA

O banco também é utilizado como ferramenta de apoio para testes e validações.

Alguns exemplos de cenários:

* Validar se um jogador possui os personagens esperados.
* Verificar a quantidade de itens no inventário.
* Validar alterações de nível.
* Conferir pedidos realizados por um jogador.
* Validar valores totais de pedidos.
* Identificar jogadores com múltiplos pedidos.
* Comparar informações entre o banco do RPG e o banco da loja.

## 🛠️ Tecnologias

* **PostgreSQL**
* **SQL**
* **pgAdmin**
* **VS Code**
* **DBML / dbdiagram.io**
* **Git / GitHub**

## 🚀 Como executar

### 1. Criar os bancos

Crie os bancos PostgreSQL utilizados pelo projeto:

```text
rpg_database
store_database
```

### 2. Criar as tabelas

Execute os arquivos `schema.sql` de cada banco no PostgreSQL.

### 3. Inserir os dados

Execute os arquivos `data.sql` para popular as tabelas com dados fictícios.

### 4. Executar as consultas

As consultas estão organizadas na pasta `queries/`.

Abra o banco correspondente no **pgAdmin → Query Tool** e execute os comandos SQL.

## 📚 Aprendizados

Durante o desenvolvimento deste projeto foram praticados:

* Modelagem de banco de dados relacional.
* Criação de tabelas e relacionamentos.
* Primary Keys e Foreign Keys.
* Constraints e integridade referencial.
* Inserção e manipulação de dados.
* Consultas SQL de diferentes níveis.
* `JOIN`, `GROUP BY` e `HAVING`.
* Funções de agregação.
* Subqueries e CTEs.
* Integração entre bancos PostgreSQL.
* Utilização de banco de dados para validações de QA.

## 📌 Status

🚧 Projeto desenvolvido para fins de estudo e prática de **PostgreSQL, SQL, modelagem de dados e QA**.
