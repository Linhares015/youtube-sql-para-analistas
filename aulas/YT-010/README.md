# YT-010 — Datas no SQL sem erro: mês, semana, intervalos e comparação

## Objetivo

Aprenda a criar recortes temporais confiáveis no PostgreSQL e DBeaver: cobertura dos dados, séries mensais e semanais, intervalos semiabertos, cálculo com dias e comparação entre períodos.

Projeto oficial para acompanhar e clonar:

Neste vídeo prático, você vai:
- confirmar a primeira e a última data disponíveis;
- agrupar pedidos por mês sem misturar anos;
- entender como o PostgreSQL define o início da semana;
- filtrar períodos sem sobreposição;
- somar dias usando `INTERVAL`;
- comparar junho e julho com limites consistentes.

Execute o desafio em `aulas/YT-010`: compare outros dois meses com intervalos semiabertos e valide os totais antes de interpretar a diferença.

## Comandos e consultas usados na aula

Execute os arquivos na ordem abaixo no DBeaver. Quando houver `setup.sql`, use-o primeiro para preparar o laboratório local.

- [`datas_sql.sql`](datas_sql.sql)
- [`setup.sql`](setup.sql)

## Como executar

1. Inicie o PostgreSQL conforme o [README principal](../../README.md).
2. Abra uma conexão com o banco `vendas` no DBeaver.
3. Abra cada arquivo SQL desta pasta na ordem indicada.
4. Execute uma consulta por vez e confira o grid de resultados.

## Material da playlist

- [Voltar ao índice das aulas](../../README.md#índice-das-aulas)
- [Ver a grade completa](../../docs/grade.md)
