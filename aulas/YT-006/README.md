# YT-006 — COUNT, SUM, AVG, MIN e MAX no SQL sem confundir métricas

## Objetivo

Aprenda a calcular métricas no PostgreSQL e DBeaver distinguindo linhas, valores, entidades e granularidade.

Projeto oficial para acompanhar e clonar:

Neste vídeo prático, você vai:
- comparar `COUNT(*)`, `COUNT(coluna)` e `COUNT(DISTINCT chave)`;
- somar volume e receita com `SUM`;
- interpretar `AVG` na granularidade correta;
- usar `MIN` e `MAX` como controles de sanidade;
- construir um painel de métricas com nomes e fórmulas auditáveis.

Execute o desafio em `aulas/YT-006`: acrescente a contagem de produtos distintos ao painel final e confira a granularidade.

## Comandos e consultas usados na aula

Execute os arquivos na ordem abaixo no DBeaver. Quando houver `setup.sql`, use-o primeiro para preparar o laboratório local.

- [`00_ambiente.sql`](00_ambiente.sql)
- [`01_tabelas.sql`](01_tabelas.sql)
- [`02_contagens.sql`](02_contagens.sql)
- [`03_amostra_venda.sql`](03_amostra_venda.sql)
- [`04_integridade.sql`](04_integridade.sql)
- [`metricas.sql`](metricas.sql)
- [`setup.sql`](setup.sql)

## Como executar

1. Inicie o PostgreSQL conforme o [README principal](../../README.md).
2. Abra uma conexão com o banco `vendas` no DBeaver.
3. Abra cada arquivo SQL desta pasta na ordem indicada.
4. Execute uma consulta por vez e confira o grid de resultados.

## Material da playlist

- [Voltar ao índice das aulas](../../README.md#índice-das-aulas)
- [Ver a grade completa](../../docs/grade.md)
