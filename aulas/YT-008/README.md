# YT-008 — JOIN no SQL sem mistério: INNER e LEFT JOIN na prática

## Objetivo

Aprenda como tabelas se relacionam no PostgreSQL e DBeaver usando chaves, INNER JOIN e LEFT JOIN com intenção.

Projeto oficial para acompanhar e clonar:

Neste vídeo híbrido, você vai:
- identificar a chave que conecta pedidos e clientes;
- usar aliases para deixar a origem de cada coluna clara;
- escolher INNER JOIN quando somente correspondências importam;
- usar LEFT JOIN quando o lado principal deve ser preservado;
- conectar pedidos, itens e produtos em uma cadeia de JOINs;
- declarar a granularidade antes de interpretar o resultado.

Execute o desafio em `aulas/YT-008`: acrescente a categoria do produto e a cidade do cliente, explicando o que uma linha representa.

## Comandos e consultas usados na aula

Execute os arquivos na ordem abaixo no DBeaver. Quando houver `setup.sql`, use-o primeiro para preparar o laboratório local.

- [`00_ambiente.sql`](00_ambiente.sql)
- [`01_tabelas.sql`](01_tabelas.sql)
- [`02_contagens.sql`](02_contagens.sql)
- [`03_amostra_venda.sql`](03_amostra_venda.sql)
- [`04_integridade.sql`](04_integridade.sql)
- [`relacionamentos.sql`](relacionamentos.sql)
- [`setup.sql`](setup.sql)

## Como executar

1. Inicie o PostgreSQL conforme o [README principal](../../README.md).
2. Abra uma conexão com o banco `vendas` no DBeaver.
3. Abra cada arquivo SQL desta pasta na ordem indicada.
4. Execute uma consulta por vez e confira o grid de resultados.

## Material da playlist

- [Voltar ao índice das aulas](../../README.md#índice-das-aulas)
- [Ver a grade completa](../../docs/grade.md)
