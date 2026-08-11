-- YT-012: consultas executadas na aula

-- scalar average
SELECT
    produto_id,
    nome,
    preco
FROM vendas.produtos
WHERE preco > (SELECT AVG(preco) FROM vendas.produtos)
ORDER BY produto_id
LIMIT 5;

-- in delivered customers
SELECT
    cliente_id,
    nome
FROM vendas.clientes
WHERE cliente_id IN (
    SELECT cliente_id
    FROM vendas.pedidos
    WHERE status = 'entregue'
)
ORDER BY cliente_id
LIMIT 5;

-- exists delivered customers
SELECT
    c.cliente_id,
    c.nome
FROM vendas.clientes AS c
WHERE EXISTS (
    SELECT 1
    FROM vendas.pedidos AS p
    WHERE p.cliente_id = c.cliente_id
      AND p.status = 'entregue'
)
ORDER BY c.cliente_id
LIMIT 5;

-- correlated order count
SELECT
    c.cliente_id,
    c.nome,
    (SELECT COUNT(*)
     FROM vendas.pedidos AS p
     WHERE p.cliente_id = c.cliente_id) AS total_pedidos
FROM vendas.clientes AS c
ORDER BY c.cliente_id
LIMIT 5;

-- repeated correlated metrics
SELECT
    c.cliente_id,
    (SELECT COUNT(*) FROM vendas.pedidos AS p
     WHERE p.cliente_id = c.cliente_id) AS total_pedidos,
    (SELECT MAX(pedido_em) FROM vendas.pedidos AS p
     WHERE p.cliente_id = c.cliente_id) AS ultimo_pedido
FROM vendas.clientes AS c
ORDER BY c.cliente_id
LIMIT 5;

-- join aggregated metrics
SELECT
    c.cliente_id,
    m.total_pedidos,
    m.ultimo_pedido
FROM vendas.clientes AS c
JOIN (
    SELECT cliente_id, COUNT(*) AS total_pedidos,
           MAX(pedido_em) AS ultimo_pedido
    FROM vendas.pedidos
    GROUP BY cliente_id
) AS m ON m.cliente_id = c.cliente_id
ORDER BY c.cliente_id
LIMIT 5;
