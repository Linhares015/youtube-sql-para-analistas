-- YT-013: consultas executadas na aula

-- named delivered orders
WITH pedidos_entregues AS (
    SELECT pedido_id, cliente_id, pedido_em
    FROM vendas.pedidos
    WHERE status = 'entregue'
)
SELECT pedido_id, cliente_id, pedido_em
FROM pedidos_entregues
ORDER BY pedido_id
LIMIT 5;

-- customer order totals
WITH totais_cliente AS (
    SELECT cliente_id, COUNT(*) AS total_pedidos
    FROM vendas.pedidos
    GROUP BY cliente_id
)
SELECT cliente_id, total_pedidos
FROM totais_cliente
ORDER BY cliente_id
LIMIT 5;

-- chained delivered totals
WITH pedidos_entregues AS (
    SELECT cliente_id
    FROM vendas.pedidos
    WHERE status = 'entregue'
),
totais_entregues AS (
    SELECT cliente_id, COUNT(*) AS total_entregues
    FROM pedidos_entregues
    GROUP BY cliente_id
)
SELECT cliente_id, total_entregues
FROM totais_entregues
ORDER BY cliente_id
LIMIT 5;

-- join customer names
WITH totais_cliente AS (
    SELECT cliente_id, COUNT(*) AS total_pedidos
    FROM vendas.pedidos
    GROUP BY cliente_id
)
SELECT c.cliente_id, c.nome, t.total_pedidos
FROM vendas.clientes AS c
JOIN totais_cliente AS t ON t.cliente_id = c.cliente_id
ORDER BY c.cliente_id
LIMIT 5;

-- multiple summary ctes
WITH resumo_pedidos AS (
    SELECT cliente_id, COUNT(*) AS total_pedidos, MAX(pedido_em) AS ultimo_pedido
    FROM vendas.pedidos
    GROUP BY cliente_id
),
resumo_itens AS (
    SELECT p.cliente_id, SUM(i.quantidade) AS itens_comprados
    FROM vendas.pedidos AS p
    JOIN vendas.itens_pedido AS i ON i.pedido_id = p.pedido_id
    GROUP BY p.cliente_id
)
SELECT p.cliente_id, p.total_pedidos, p.ultimo_pedido, i.itens_comprados
FROM resumo_pedidos AS p
JOIN resumo_itens AS i ON i.cliente_id = p.cliente_id
ORDER BY p.cliente_id
LIMIT 5;

-- staged revenue pipeline
WITH itens_calculados AS (
    SELECT pedido_id, quantidade * preco_unitario * (1 - desconto) AS valor_liquido
    FROM vendas.itens_pedido
),
receita_pedido AS (
    SELECT pedido_id, SUM(valor_liquido) AS receita
    FROM itens_calculados
    GROUP BY pedido_id
),
receita_cliente AS (
    SELECT p.cliente_id, SUM(r.receita) AS receita_total
    FROM vendas.pedidos AS p
    JOIN receita_pedido AS r ON r.pedido_id = p.pedido_id
    GROUP BY p.cliente_id
)
SELECT c.cliente_id, c.nome, ROUND(r.receita_total, 2) AS receita_total
FROM receita_cliente AS r
JOIN vendas.clientes AS c ON c.cliente_id = r.cliente_id
ORDER BY receita_total DESC
LIMIT 5;
