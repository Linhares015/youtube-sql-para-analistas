# YT-002 — Ambiente SQL pronto: PostgreSQL, DBeaver e banco de vendas passo a passo

## Objetivo

Antes do primeiro `SELECT`, vamos deixar um ambiente SQL real funcionando e provar que os dados estão prontos para análise.

Projeto oficial para acompanhar e clonar:

Neste vídeo prático, você vai:
- entender o papel do PostgreSQL, do DBeaver e do dataset;
- iniciar PostgreSQL 17 localmente em um contêiner reproduzível;
- testar se o servidor está aceitando conexões;
- criar e carregar pelo terminal com `psql` as tabelas `clientes`, `produtos`, `pedidos`, `itens_pedido` e `eventos`;
- validar pelo terminal estrutura, volume, amostras e integridade referencial;
- conectar o DBeaver Community e navegar pelo schema `vendas` com as cinco tabelas.

O banco é sintético e acompanha toda a playlist. Isso significa que as próximas consultas — filtros, agregações, JOINs, funil, coortes, retenção e performance — evoluem sobre o mesmo caso de negócio.

Observação de segurança: a demonstração usa um banco local descartável, limitado ao computador do aluno. Em produção, use autenticação forte, segredos protegidos e regras de rede adequadas.

Checkpoint: antes do próximo vídeo, confirme as saídas de validação no terminal e que o DBeaver mostra as cinco tabelas no schema `vendas`.

## Comandos e consultas usados na aula

Execute os arquivos na ordem abaixo no DBeaver. Quando houver `setup.sql`, use-o primeiro para preparar o laboratório local.

- [`00_ambiente.sql`](00_ambiente.sql)
- [`01_tabelas.sql`](01_tabelas.sql)
- [`02_contagens.sql`](02_contagens.sql)
- [`03_amostra_venda.sql`](03_amostra_venda.sql)
- [`04_integridade.sql`](04_integridade.sql)
- [`setup.sql`](setup.sql)

## Como executar

1. Inicie o PostgreSQL conforme o [README principal](../../README.md).
2. Abra uma conexão com o banco `vendas` no DBeaver.
3. Abra cada arquivo SQL desta pasta na ordem indicada.
4. Execute uma consulta por vez e confira o grid de resultados.

## Material da playlist

- [Voltar ao índice das aulas](../../README.md#índice-das-aulas)
- [Ver a grade completa](../../docs/grade.md)
