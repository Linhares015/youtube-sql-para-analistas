-- YT-009: consultas executadas na aula

-- baseline grain
SELECT
    COUNT(*) AS total_pedidos,
    COUNT(DISTINCT pedido_id) AS pedidos_unicos
FROM vendas.pedidos;

-- join fanout count
SELECT
    COUNT(*) AS linhas_apos_join,
    COUNT(DISTINCT p.pedido_id) AS pedidos_unicos
FROM vendas.pedidos AS p
INNER JOIN vendas.itens_pedido AS i
    ON p.pedido_id = i.pedido_id;

-- fanout detail
SELECT
    p.pedido_id,
    i.item_id,
    i.quantidade
FROM vendas.pedidos AS p
INNER JOIN vendas.itens_pedido AS i
    ON p.pedido_id = i.pedido_id
ORDER BY p.pedido_id, i.item_id
LIMIT 10;

-- grouped inflation
SELECT
    p.status,
    COUNT(*) AS linhas_apos_join,
    COUNT(DISTINCT p.pedido_id) AS pedidos_unicos
FROM vendas.pedidos AS p
INNER JOIN vendas.itens_pedido AS i
    ON p.pedido_id = i.pedido_id
GROUP BY p.status
ORDER BY p.status;

-- order grain check
SELECT
    p.pedido_id,
    COUNT(i.item_id) AS quantidade_itens
FROM vendas.pedidos AS p
INNER JOIN vendas.itens_pedido AS i
    ON p.pedido_id = i.pedido_id
GROUP BY p.pedido_id
ORDER BY p.pedido_id
LIMIT 10;

-- defensive conference
SELECT
    COUNT(*) AS linhas_apos_join,
    COUNT(DISTINCT p.pedido_id) AS pedidos_unicos,
    ROUND(COUNT(*)::numeric / COUNT(DISTINCT p.pedido_id), 2) AS fator_fanout
FROM vendas.pedidos AS p
INNER JOIN vendas.itens_pedido AS i
    ON p.pedido_id = i.pedido_id;
