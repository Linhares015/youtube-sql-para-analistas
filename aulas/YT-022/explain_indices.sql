-- YT-022: consultas executadas na aula

-- plano sem indice
EXPLAIN (ANALYZE, BUFFERS)
SELECT pedido_id, cliente_id, pedido_em, valor
FROM vendas.pedidos_desempenho
WHERE cliente_id = 42
ORDER BY pedido_em DESC
LIMIT 10;

-- indice composto
CREATE INDEX idx_pedidos_cliente_data
ON vendas.pedidos_desempenho (cliente_id, pedido_em DESC);

-- plano com indice
EXPLAIN (ANALYZE, BUFFERS)
SELECT pedido_id, cliente_id, pedido_em, valor
FROM vendas.pedidos_desempenho
WHERE cliente_id = 42
ORDER BY pedido_em DESC
LIMIT 10;

-- filtro eficiente
EXPLAIN (ANALYZE, BUFFERS)
SELECT pedido_id, pedido_em, valor
FROM vendas.pedidos_desempenho
WHERE cliente_id = 42
  AND pedido_em >= DATE '2025-06-01'
ORDER BY pedido_em DESC
LIMIT 10;
