# YT-003 — Seu primeiro SELECT

Neste episódio, você aprende a escolher colunas, criar aliases legíveis, usar `DISTINCT` e controlar amostras com `LIMIT`.

## Preparação

Suba o PostgreSQL e carregue o dataset seguindo o README principal. Confirme que `vendas.clientes` possui 120 linhas e `vendas.produtos` possui 30 linhas.

## Consultas da aula

O arquivo [`consultas.sql`](consultas.sql) contém as consultas executadas no vídeo, na mesma ordem.

## Desafio

1. Consulte `vendas.produtos` e mostre `nome`, `categoria` e `preco` dos primeiros sete produtos por `produto_id`.
2. Use os aliases `produto`, `categoria` e `preco`.
3. Em uma segunda consulta, liste somente as categorias únicas.
4. Explique por que as duas consultas retornam quantidades diferentes.

Evite `SELECT *` no resultado final. A solução será publicada junto da evolução da playlist.
