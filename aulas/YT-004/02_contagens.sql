SELECT 'clientes' AS tabela, count(*) AS linhas FROM vendas.clientes
UNION ALL SELECT 'produtos', count(*) FROM vendas.produtos
UNION ALL SELECT 'pedidos', count(*) FROM vendas.pedidos
UNION ALL SELECT 'itens_pedido', count(*) FROM vendas.itens_pedido
UNION ALL SELECT 'eventos', count(*) FROM vendas.eventos
ORDER BY tabela;
