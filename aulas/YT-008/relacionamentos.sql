-- YT-008: consultas executadas na aula

-- inner order customer
SELECT p.pedido_id, p.cliente_id, c.nome
FROM vendas.pedidos p
INNER JOIN vendas.clientes c ON p.cliente_id = c.cliente_id
ORDER BY p.pedido_id
LIMIT 10;

-- aliases customer segment
SELECT
    p.pedido_id,
    c.nome,
    c.segmento,
    p.canal
FROM vendas.pedidos AS p
INNER JOIN vendas.clientes AS c
    ON p.cliente_id = c.cliente_id
ORDER BY p.pedido_id
LIMIT 10;

-- left future orders
SELECT
    c.cliente_id,
    c.nome,
    p.pedido_id,
    p.pedido_em
FROM vendas.clientes AS c
LEFT JOIN vendas.pedidos AS p
    ON c.cliente_id = p.cliente_id
    AND p.pedido_em >= DATE '2026-01-01'
ORDER BY c.cliente_id
LIMIT 10;

-- inner future orders
SELECT
    c.cliente_id,
    c.nome,
    p.pedido_id,
    p.pedido_em
FROM vendas.clientes AS c
INNER JOIN vendas.pedidos AS p
    ON c.cliente_id = p.cliente_id
    AND p.pedido_em >= DATE '2025-12-01'
ORDER BY c.cliente_id, p.pedido_id
LIMIT 10;

-- order item product
SELECT
    p.pedido_id,
    i.item_id,
    pr.nome AS produto,
    i.quantidade,
    i.preco_unitario
FROM vendas.pedidos AS p
INNER JOIN vendas.itens_pedido AS i
    ON p.pedido_id = i.pedido_id
INNER JOIN vendas.produtos AS pr
    ON i.produto_id = pr.produto_id
ORDER BY p.pedido_id, i.item_id
LIMIT 12;

-- customer product challenge
SELECT
    p.pedido_id,
    c.nome AS cliente,
    pr.nome AS produto,
    i.quantidade
FROM vendas.pedidos AS p
INNER JOIN vendas.clientes AS c
    ON p.cliente_id = c.cliente_id
INNER JOIN vendas.itens_pedido AS i
    ON p.pedido_id = i.pedido_id
INNER JOIN vendas.produtos AS pr
    ON i.produto_id = pr.produto_id
ORDER BY p.pedido_id, i.item_id
LIMIT 12;
