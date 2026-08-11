SELECT
    count(*) FILTER (WHERE c.cliente_id IS NULL) AS pedidos_sem_cliente,
    count(*) FILTER (WHERE pr.produto_id IS NULL) AS itens_sem_produto,
    count(*) FILTER (WHERE p.pedido_id IS NULL) AS itens_sem_pedido
FROM vendas.itens_pedido AS i
LEFT JOIN vendas.pedidos AS p ON p.pedido_id = i.pedido_id
LEFT JOIN vendas.clientes AS c ON c.cliente_id = p.cliente_id
LEFT JOIN vendas.produtos AS pr ON pr.produto_id = i.produto_id;
