# YT-004 — WHERE, IN, BETWEEN e LIKE no SQL: filtros que respondem perguntas

## Objetivo

Aprenda a transformar critérios de negócio em filtros SQL claros e verificáveis no PostgreSQL e DBeaver.

Projeto oficial para acompanhar e clonar:

Neste vídeo prático, você vai:
- filtrar linhas com `WHERE`;
- combinar condições com `AND`;
- comparar uma coluna com uma lista usando `IN`;
- criar intervalos inclusivos de datas e números com `BETWEEN`;
- buscar padrões textuais com `LIKE` e `%`;
- combinar filtros sem perder a pergunta de negócio.

Execute o desafio em `aulas/YT-004` e explique por que cada linha entrou no resultado.

## Comandos e consultas usados na aula

Execute os arquivos na ordem abaixo no DBeaver. Quando houver `setup.sql`, use-o primeiro para preparar o laboratório local.

- [`00_ambiente.sql`](00_ambiente.sql)
- [`01_tabelas.sql`](01_tabelas.sql)
- [`02_contagens.sql`](02_contagens.sql)
- [`03_amostra_venda.sql`](03_amostra_venda.sql)
- [`04_integridade.sql`](04_integridade.sql)
- [`filters.sql`](filters.sql)
- [`setup.sql`](setup.sql)

## Como executar

1. Inicie o PostgreSQL conforme o [README principal](../../README.md).
2. Abra uma conexão com o banco `vendas` no DBeaver.
3. Abra cada arquivo SQL desta pasta na ordem indicada.
4. Execute uma consulta por vez e confira o grid de resultados.

## Material da playlist

- [Voltar ao índice das aulas](../../README.md#índice-das-aulas)
- [Ver a grade completa](../../docs/grade.md)
