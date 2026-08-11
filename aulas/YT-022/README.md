# YT-022 — SQL lento? EXPLAIN, índices e consultas mais eficientes

## Objetivo

Aprenda a investigar SQL lento no PostgreSQL sem otimização no palpite. No DBeaver, vamos ler um plano com EXPLAIN ANALYZE, criar um índice composto alinhado ao filtro e à ordenação, comparar o novo plano e aplicar um filtro de data mais seletivo.

## Comandos e consultas usados na aula

Execute os arquivos na ordem abaixo no DBeaver. Quando houver `setup.sql`, use-o primeiro para preparar o laboratório local.

- [`explain_indices.sql`](explain_indices.sql)
- [`setup.sql`](setup.sql)

## Como executar

1. Inicie o PostgreSQL conforme o [README principal](../../README.md).
2. Abra uma conexão com o banco `vendas` no DBeaver.
3. Abra cada arquivo SQL desta pasta na ordem indicada.
4. Execute uma consulta por vez e confira o grid de resultados.

## Material da playlist

- [Voltar ao índice das aulas](../../README.md#índice-das-aulas)
- [Ver a grade completa](../../docs/grade.md)
