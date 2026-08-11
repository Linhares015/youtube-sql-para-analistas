# YT-003 — Seu primeiro SELECT no SQL: colunas, aliases, DISTINCT e LIMIT

## Objetivo

Aprenda a escrever um primeiro `SELECT` que responde a uma pergunta, em vez de trazer a tabela inteira sem intenção.

Projeto oficial para acompanhar e clonar:

Neste vídeo prático, você vai:
- conhecer as colunas disponíveis em uma tabela PostgreSQL real;
- entender quando `SELECT *` ajuda e quando atrapalha;
- escolher somente as colunas necessárias;
- criar aliases claros com `AS`;
- usar `DISTINCT` em uma coluna e em combinações;
- limitar amostras com `LIMIT`;
- combinar `ORDER BY` e `LIMIT` para uma saída reproduzível.

Execute os exercícios em `aulas/YT-003` e compare a quantidade de produtos com a quantidade de categorias distintas.

## Comandos e consultas usados na aula

Execute os arquivos na ordem abaixo no DBeaver. Quando houver `setup.sql`, use-o primeiro para preparar o laboratório local.

- [`00_ambiente.sql`](00_ambiente.sql)
- [`01_hook.sql`](01_hook.sql)
- [`01_tabelas.sql`](01_tabelas.sql)
- [`02_colunas.sql`](02_colunas.sql)
- [`02_contagens.sql`](02_contagens.sql)
- [`03_amostra_venda.sql`](03_amostra_venda.sql)
- [`03_select_star.sql`](03_select_star.sql)
- [`04_colunas_aliases.sql`](04_colunas_aliases.sql)
- [`04_integridade.sql`](04_integridade.sql)
- [`05_distinct.sql`](05_distinct.sql)
- [`06_limit.sql`](06_limit.sql)
- [`07_desafio.sql`](07_desafio.sql)
- [`first-select.sql`](first-select.sql)
- [`setup.sql`](setup.sql)

## Como executar

1. Inicie o PostgreSQL conforme o [README principal](../../README.md).
2. Abra uma conexão com o banco `vendas` no DBeaver.
3. Abra cada arquivo SQL desta pasta na ordem indicada.
4. Execute uma consulta por vez e confira o grid de resultados.

## Material da playlist

- [Voltar ao índice das aulas](../../README.md#índice-das-aulas)
- [Ver a grade completa](../../docs/grade.md)
