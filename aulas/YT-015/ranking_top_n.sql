-- YT-015: consultas executadas na aula

-- product revenue base
SELECT p.categoria, p.produto_id, p.nome,
       ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)), 2) AS receita
FROM vendas.produtos p
JOIN vendas.itens_pedido i ON i.produto_id = p.produto_id
GROUP BY p.categoria, p.produto_id, p.nome
ORDER BY p.categoria, receita DESC;

-- row number by category
WITH vendas_produto AS (
    SELECT p.categoria, p.produto_id, p.nome,
           ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)), 2) AS receita
    FROM vendas.produtos p
    JOIN vendas.itens_pedido i ON i.produto_id = p.produto_id
    GROUP BY p.categoria, p.produto_id, p.nome
)
SELECT categoria, produto_id, nome, receita,
       ROW_NUMBER() OVER (PARTITION BY categoria ORDER BY receita DESC, produto_id) AS posicao
FROM vendas_produto
ORDER BY categoria, posicao;

-- rank with ties
WITH quantidade_produto AS (
    SELECT p.categoria, p.produto_id, p.nome, SUM(i.quantidade) AS unidades
    FROM vendas.produtos p
    JOIN vendas.itens_pedido i ON i.produto_id = p.produto_id
    GROUP BY p.categoria, p.produto_id, p.nome
)
SELECT categoria, produto_id, nome, unidades,
       RANK() OVER (PARTITION BY categoria ORDER BY unidades DESC) AS ranking
FROM quantidade_produto
ORDER BY categoria, ranking, produto_id;

-- top three per category
WITH produtos_ranqueados AS (
    SELECT p.categoria, p.produto_id, p.nome,
           SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)) AS receita,
           ROW_NUMBER() OVER (PARTITION BY p.categoria ORDER BY SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)) DESC, p.produto_id) AS posicao
    FROM vendas.produtos p
    JOIN vendas.itens_pedido i ON i.produto_id = p.produto_id
    GROUP BY p.categoria, p.produto_id, p.nome
)
SELECT categoria, produto_id, nome, ROUND(receita, 2) AS receita, posicao
FROM produtos_ranqueados
WHERE posicao <= 3
ORDER BY categoria, posicao;

-- top two rank with ties
WITH produtos_ranqueados AS (
    SELECT p.categoria, p.produto_id, p.nome, SUM(i.quantidade) AS unidades,
           RANK() OVER (PARTITION BY p.categoria ORDER BY SUM(i.quantidade) DESC) AS ranking
    FROM vendas.produtos p
    JOIN vendas.itens_pedido i ON i.produto_id = p.produto_id
    GROUP BY p.categoria, p.produto_id, p.nome
)
SELECT categoria, produto_id, nome, unidades, ranking
FROM produtos_ranqueados
WHERE ranking <= 2
ORDER BY categoria, ranking, produto_id;

-- top customers by segment
WITH clientes_ranqueados AS (
    SELECT c.segmento, c.cliente_id, c.nome,
           SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)) AS receita,
           ROW_NUMBER() OVER (PARTITION BY c.segmento ORDER BY SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)) DESC, c.cliente_id) AS posicao
    FROM vendas.clientes c
    JOIN vendas.pedidos pe ON pe.cliente_id = c.cliente_id
    JOIN vendas.itens_pedido i ON i.pedido_id = pe.pedido_id
    GROUP BY c.segmento, c.cliente_id, c.nome
)
SELECT segmento, cliente_id, nome, ROUND(receita, 2) AS receita, posicao
FROM clientes_ranqueados
WHERE posicao <= 2
ORDER BY segmento, posicao;
