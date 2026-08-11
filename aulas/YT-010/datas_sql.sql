-- YT-010: consultas executadas na aula

-- date range
SELECT
    MIN(pedido_em) AS primeira_data,
    MAX(pedido_em) AS ultima_data,
    COUNT(*) AS total_pedidos
FROM vendas.pedidos;

-- monthly series
SELECT
    DATE_TRUNC('month', pedido_em)::date AS mes,
    COUNT(*) AS pedidos
FROM vendas.pedidos
GROUP BY 1
ORDER BY 1;

-- weekly series
SELECT
    DATE_TRUNC('week', pedido_em)::date AS semana,
    COUNT(*) AS pedidos
FROM vendas.pedidos
GROUP BY 1
ORDER BY 1
LIMIT 5;

-- half open interval
SELECT
    COUNT(*) AS pedidos_junho
FROM vendas.pedidos
WHERE pedido_em >= DATE '2025-06-01'
  AND pedido_em < DATE '2025-07-01';

-- date addition
SELECT
    pedido_id,
    pedido_em,
    (pedido_em + INTERVAL '7 days')::date AS prazo_exemplo
FROM vendas.pedidos
ORDER BY pedido_em, pedido_id
LIMIT 5;

-- period comparison
WITH limites AS (SELECT DATE '2025-06-01' AS jun,
                         DATE '2025-07-01' AS jul,
                         DATE '2025-08-01' AS ago)
SELECT
    COUNT(*) FILTER (WHERE pedido_em >= jun AND pedido_em < jul)
      AS pedidos_junho,
    COUNT(*) FILTER (WHERE pedido_em >= jul AND pedido_em < ago)
      AS pedidos_julho,
    COUNT(*) FILTER (WHERE pedido_em >= jul AND pedido_em < ago)
    - COUNT(*) FILTER (WHERE pedido_em >= jun AND pedido_em < jul)
      AS diferenca
FROM vendas.pedidos
CROSS JOIN limites;
