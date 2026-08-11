# YT-007 — GROUP BY e HAVING no SQL: agregações sem confusão

## Objetivo

Aprenda a resumir métricas por dimensão no PostgreSQL e DBeaver, entendendo a diferença entre WHERE e HAVING.

Projeto oficial para acompanhar e clonar:

Neste vídeo prático, você vai:
- transformar um total geral em métricas por status ou canal;
- agrupar por uma e por duas dimensões;
- declarar corretamente a granularidade do resultado;
- usar HAVING para filtrar métricas agregadas;
- combinar WHERE e HAVING sem trocar a ordem lógica;
- tratar nulos antes do agrupamento com COALESCE.

Execute o desafio em `aulas/YT-007`: altere o limite de cupons para mais de 75 pedidos e explique por que apenas um grupo permanece.

## Comandos e consultas usados na aula

Execute os arquivos na ordem abaixo no DBeaver. Quando houver `setup.sql`, use-o primeiro para preparar o laboratório local.

- [`00_ambiente.sql`](00_ambiente.sql)
- [`01_tabelas.sql`](01_tabelas.sql)
- [`02_contagens.sql`](02_contagens.sql)
- [`03_amostra_venda.sql`](03_amostra_venda.sql)
- [`04_integridade.sql`](04_integridade.sql)
- [`agrupamentos.sql`](agrupamentos.sql)
- [`setup.sql`](setup.sql)

## Como executar

1. Inicie o PostgreSQL conforme o [README principal](../../README.md).
2. Abra uma conexão com o banco `vendas` no DBeaver.
3. Abra cada arquivo SQL desta pasta na ordem indicada.
4. Execute uma consulta por vez e confira o grid de resultados.

## Material da playlist

- [Voltar ao índice das aulas](../../README.md#índice-das-aulas)
- [Ver a grade completa](../../docs/grade.md)
