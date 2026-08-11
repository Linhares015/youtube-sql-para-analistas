-- YT-007: consultas executadas na aula

-- group status
SELECT
    status,
    COUNT(*) AS total_pedidos
FROM vendas.pedidos
GROUP BY status
ORDER BY total_pedidos DESC, status;

-- group channel
SELECT
    canal,
    COUNT(*) AS total_pedidos
FROM vendas.pedidos
GROUP BY canal
ORDER BY total_pedidos DESC, canal;

-- group status channel
SELECT
    status,
    canal,
    COUNT(*) AS total_pedidos
FROM vendas.pedidos
GROUP BY status, canal
ORDER BY status, canal;

-- having status
SELECT
    status,
    COUNT(*) AS total_pedidos
FROM vendas.pedidos
GROUP BY status
HAVING COUNT(*) > 100
ORDER BY total_pedidos DESC;

-- where and having
SELECT
    canal,
    COUNT(*) AS pedidos_validos
FROM vendas.pedidos
WHERE status <> 'cancelado'
GROUP BY canal
HAVING COUNT(*) >= 150
ORDER BY pedidos_validos DESC, canal;

-- coupon challenge
SELECT
    COALESCE(codigo_cupom, 'Sem cupom') AS categoria_cupom,
    COUNT(*) AS total_pedidos
FROM vendas.pedidos
GROUP BY COALESCE(codigo_cupom, 'Sem cupom')
HAVING COUNT(*) >= 75
ORDER BY total_pedidos DESC, categoria_cupom;
