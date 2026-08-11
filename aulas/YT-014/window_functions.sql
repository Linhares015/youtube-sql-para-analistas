-- YT-014: consultas executadas na aula

-- detail with global count
SELECT pedido_id, cliente_id, status,
       COUNT(*) OVER () AS total_pedidos
FROM vendas.pedidos
ORDER BY pedido_id
LIMIT 5;

-- partition by status
SELECT pedido_id, status,
       COUNT(*) OVER (PARTITION BY status) AS pedidos_no_status
FROM vendas.pedidos
ORDER BY status, pedido_id
LIMIT 5;

-- customer date range
SELECT cliente_id, pedido_id, pedido_em,
       MIN(pedido_em) OVER (PARTITION BY cliente_id) AS primeira_compra,
       MAX(pedido_em) OVER (PARTITION BY cliente_id) AS ultima_compra
FROM vendas.pedidos
ORDER BY cliente_id, pedido_em
LIMIT 5;

-- item quantity share
SELECT pedido_id, item_id, quantidade,
       SUM(quantidade) OVER (PARTITION BY pedido_id) AS itens_no_pedido
FROM vendas.itens_pedido
ORDER BY pedido_id, item_id
LIMIT 8;

-- row number by channel
SELECT pedido_id, canal, pedido_em,
       ROW_NUMBER() OVER (PARTITION BY canal ORDER BY pedido_em DESC) AS posicao
FROM vendas.pedidos
ORDER BY canal, posicao
LIMIT 8;

-- named window reuse
SELECT cliente_id, pedido_id, pedido_em,
       COUNT(*) OVER cliente AS total_pedidos,
       MIN(pedido_em) OVER cliente AS primeira_compra
FROM vendas.pedidos
WINDOW cliente AS (PARTITION BY cliente_id)
ORDER BY cliente_id, pedido_em
LIMIT 5;
