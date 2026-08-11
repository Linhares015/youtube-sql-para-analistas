-- YT-023: consultas executadas na aula

-- padrao legivel
SELECT
    p.pedido_id,
    p.pedido_em,
    p.status,
    p.canal
FROM vendas.pedidos AS p
WHERE p.status = 'pago'
ORDER BY p.pedido_em DESC
LIMIT 10;

-- etapas testaveis
WITH vendas_por_cliente AS (
    SELECT
        p.cliente_id,
        COUNT(DISTINCT p.pedido_id) AS quantidade_pedidos,
        ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)), 2) AS receita_total
    FROM vendas.pedidos AS p
    JOIN vendas.itens_pedido AS i USING (pedido_id)
    WHERE p.status = 'pago'
    GROUP BY p.cliente_id
)
SELECT
    cliente_id,
    quantidade_pedidos,
    receita_total
FROM vendas_por_cliente
ORDER BY receita_total DESC
LIMIT 10;

-- revisao validacao
SELECT
    COUNT(DISTINCT p.pedido_id) AS total_pedidos,
    COUNT(DISTINCT p.cliente_id) AS clientes_ativos,
    ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)), 2) AS receita_total
FROM vendas.pedidos AS p
JOIN vendas.itens_pedido AS i USING (pedido_id)
WHERE p.status = 'pago';

-- manutencao parametros
WITH parametros AS (
    SELECT
        DATE '2025-01-01' AS data_inicial,
        DATE '2026-01-01' AS data_final
)
SELECT
    DATE_TRUNC('month', p.pedido_em) AS mes,
    COUNT(DISTINCT p.pedido_id) AS pedidos,
    ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)), 2) AS receita
FROM vendas.pedidos AS p
JOIN vendas.itens_pedido AS i USING (pedido_id)
CROSS JOIN parametros AS prm
WHERE p.pedido_em >= prm.data_inicial
  AND p.pedido_em < prm.data_final
GROUP BY mes
ORDER BY mes;
