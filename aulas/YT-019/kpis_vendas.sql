-- YT-019: consultas executadas na aula

-- receita liquida
SELECT ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)), 2) AS receita_liquida
FROM vendas.pedidos AS p
JOIN vendas.itens_pedido AS i USING (pedido_id)
WHERE p.status <> 'cancelado';

-- ticket medio
WITH totais_por_pedido AS (
    SELECT p.pedido_id,
           SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)) AS receita_pedido
    FROM vendas.pedidos AS p
    JOIN vendas.itens_pedido AS i USING (pedido_id)
    WHERE p.status <> 'cancelado'
    GROUP BY p.pedido_id
)
SELECT ROUND(AVG(receita_pedido), 2) AS ticket_medio
FROM totais_por_pedido;

-- clientes compradores
SELECT COUNT(DISTINCT p.cliente_id) AS clientes_compradores
FROM vendas.pedidos AS p
WHERE p.status <> 'cancelado';

-- margem mercadoria
SELECT ROUND(SUM(i.quantidade * (i.preco_unitario * (1 - i.desconto) - pr.custo)), 2) AS margem_mercadoria,
       ROUND(100 * SUM(i.quantidade * (i.preco_unitario * (1 - i.desconto) - pr.custo))
             / NULLIF(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)), 0), 2) AS margem_percentual
FROM vendas.pedidos AS p
JOIN vendas.itens_pedido AS i USING (pedido_id)
JOIN vendas.produtos AS pr USING (produto_id)
WHERE p.status <> 'cancelado';

-- camada kpis
SELECT ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)), 2) AS receita_liquida,
       ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto))
             / NULLIF(COUNT(DISTINCT p.pedido_id), 0), 2) AS ticket_medio,
       COUNT(DISTINCT p.cliente_id) AS clientes_compradores,
       ROUND(SUM(i.quantidade * (i.preco_unitario * (1 - i.desconto) - pr.custo)), 2) AS margem_mercadoria,
       ROUND(100 * SUM(i.quantidade * (i.preco_unitario * (1 - i.desconto) - pr.custo))
             / NULLIF(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)), 0), 2) AS margem_percentual
FROM vendas.pedidos AS p
JOIN vendas.itens_pedido AS i USING (pedido_id)
JOIN vendas.produtos AS pr USING (produto_id)
WHERE p.status <> 'cancelado';
