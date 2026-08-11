SELECT
    p.pedido_id,
    p.pedido_em,
    c.nome AS cliente,
    pr.nome AS produto,
    i.quantidade,
    i.preco_unitario,
    i.desconto,
    round(i.quantidade * i.preco_unitario * (1 - i.desconto), 2) AS valor_item
FROM vendas.pedidos AS p
JOIN vendas.clientes AS c ON c.cliente_id = p.cliente_id
JOIN vendas.itens_pedido AS i ON i.pedido_id = p.pedido_id
JOIN vendas.produtos AS pr ON pr.produto_id = i.produto_id
ORDER BY p.pedido_id, i.item_id
LIMIT 12;
