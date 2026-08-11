-- YT-024: consultas executadas na aula

-- visao executiva
WITH pedidos_pagos AS (
    SELECT
        p.pedido_id,
        p.cliente_id,
        SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)) AS receita_pedido
    FROM vendas.pedidos AS p
    JOIN vendas.itens_pedido AS i USING (pedido_id)
    WHERE p.status = 'pago'
    GROUP BY p.pedido_id, p.cliente_id
)
SELECT
    COUNT(*) AS pedidos_pagos,
    COUNT(DISTINCT cliente_id) AS clientes_ativos,
    ROUND(SUM(receita_pedido), 2) AS receita_total,
    ROUND(AVG(receita_pedido), 2) AS ticket_medio
FROM pedidos_pagos;

-- evolucao mensal
SELECT
    DATE_TRUNC('month', p.pedido_em) AS mes,
    COUNT(DISTINCT p.pedido_id) AS pedidos,
    ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)), 2) AS receita,
    ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)) / COUNT(DISTINCT p.pedido_id), 2) AS ticket_medio
FROM vendas.pedidos AS p
JOIN vendas.itens_pedido AS i USING (pedido_id)
WHERE p.status = 'pago'
GROUP BY mes
ORDER BY mes;

-- desempenho canais
SELECT
    p.canal,
    COUNT(DISTINCT p.pedido_id) AS pedidos,
    COUNT(DISTINCT p.cliente_id) AS clientes,
    ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)), 2) AS receita,
    ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)) / COUNT(DISTINCT p.pedido_id), 2) AS ticket_medio
FROM vendas.pedidos AS p
JOIN vendas.itens_pedido AS i USING (pedido_id)
WHERE p.status <> 'cancelado'
GROUP BY p.canal
ORDER BY receita DESC;

-- clientes prioritarios
WITH valor_por_cliente AS (
    SELECT
        p.cliente_id,
        COUNT(DISTINCT p.pedido_id) AS pedidos,
        ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)), 2) AS receita
    FROM vendas.pedidos AS p
    JOIN vendas.itens_pedido AS i USING (pedido_id)
    WHERE p.status = 'pago'
    GROUP BY p.cliente_id
)
SELECT
    c.nome,
    v.pedidos,
    v.receita,
    RANK() OVER (ORDER BY v.receita DESC) AS posicao
FROM valor_por_cliente AS v
JOIN vendas.clientes AS c USING (cliente_id)
ORDER BY posicao
LIMIT 10;
