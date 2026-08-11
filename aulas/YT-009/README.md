# YT-009 — JOIN duplicou seus dados? Granularidade e fan-out no SQL

## Objetivo

Aprenda a detectar quando um JOIN multiplica linhas e como conferir a granularidade antes de confiar em contagens e métricas no PostgreSQL e DBeaver.

Projeto oficial para acompanhar e clonar:

Neste vídeo prático, você vai:
- registrar o total antes de combinar tabelas;
- identificar fan-out em uma relação de um para muitos;
- distinguir linha de item de entidade pedido;
- comparar COUNT(*) com COUNT(DISTINCT chave);
- restaurar uma linha por pedido com agrupamento;
- calcular um fator de fan-out como alerta de conferência.

Execute o desafio em `aulas/YT-009`: compare linhas e pedidos únicos por status e explique o grão antes e depois do JOIN.

## Comandos e consultas usados na aula

Execute os arquivos na ordem abaixo no DBeaver. Quando houver `setup.sql`, use-o primeiro para preparar o laboratório local.

- [`00_ambiente.sql`](00_ambiente.sql)
- [`01_tabelas.sql`](01_tabelas.sql)
- [`02_contagens.sql`](02_contagens.sql)
- [`03_amostra_venda.sql`](03_amostra_venda.sql)
- [`04_integridade.sql`](04_integridade.sql)
- [`perigos_joins.sql`](perigos_joins.sql)
- [`setup.sql`](setup.sql)

## Como executar

1. Inicie o PostgreSQL conforme o [README principal](../../README.md).
2. Abra uma conexão com o banco `vendas` no DBeaver.
3. Abra cada arquivo SQL desta pasta na ordem indicada.
4. Execute uma consulta por vez e confira o grid de resultados.

## Material da playlist

- [Voltar ao índice das aulas](../../README.md#índice-das-aulas)
- [Ver a grade completa](../../docs/grade.md)
