# YT-005 — NULL, COALESCE e CASE no SQL: evite respostas erradas

## Objetivo

Aprenda a tratar valores ausentes e criar classificações confiáveis no PostgreSQL e DBeaver, sem perder linhas silenciosamente.

Projeto oficial para acompanhar e clonar:

Neste vídeo híbrido, você vai:
- distinguir `NULL` de zero e texto vazio;
- localizar valores com `IS NULL` e `IS NOT NULL`;
- usar `COALESCE` sem esconder o significado dos dados;
- criar regras com `CASE` simples e pesquisado;
- entender por que `<>` pode excluir nulos;
- validar classificações e contagens antes de confiar na resposta.

Execute o desafio em `aulas/YT-005`: crie uma quarta origem de pedido e confira a contagem de cada categoria.

## Comandos e consultas usados na aula

Execute os arquivos na ordem abaixo no DBeaver. Quando houver `setup.sql`, use-o primeiro para preparar o laboratório local.

- [`00_ambiente.sql`](00_ambiente.sql)
- [`01_tabelas.sql`](01_tabelas.sql)
- [`02_contagens.sql`](02_contagens.sql)
- [`03_amostra_venda.sql`](03_amostra_venda.sql)
- [`04_integridade.sql`](04_integridade.sql)
- [`nulls.sql`](nulls.sql)
- [`setup.sql`](setup.sql)

## Como executar

1. Inicie o PostgreSQL conforme o [README principal](../../README.md).
2. Abra uma conexão com o banco `vendas` no DBeaver.
3. Abra cada arquivo SQL desta pasta na ordem indicada.
4. Execute uma consulta por vez e confira o grid de resultados.

## Material da playlist

- [Voltar ao índice das aulas](../../README.md#índice-das-aulas)
- [Ver a grade completa](../../docs/grade.md)
