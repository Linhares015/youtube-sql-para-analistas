-- YT-016: consultas executadas na aula

-- monthly revenue
WITH vendas_mes AS (
    SELECT DATE_TRUNC('month', pe.pedido_em)::date AS mes,
           ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)), 2) AS receita
    FROM vendas.pedidos pe
    JOIN vendas.itens_pedido i ON i.pedido_id = pe.pedido_id
    WHERE pe.status <> 'cancelado'
    GROUP BY 1
)
SELECT mes, receita
FROM vendas_mes
ORDER BY mes;

-- lag previous month
WITH vendas_mes AS (
    SELECT DATE_TRUNC('month', pe.pedido_em)::date AS mes,
           ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)), 2) AS receita
    FROM vendas.pedidos pe
    JOIN vendas.itens_pedido i ON i.pedido_id = pe.pedido_id
    WHERE pe.status <> 'cancelado'
    GROUP BY 1
)
SELECT mes, receita,
       LAG(receita) OVER (ORDER BY mes) AS receita_anterior
FROM vendas_mes
ORDER BY mes;

-- month over month change
WITH vendas_mes AS (
    SELECT DATE_TRUNC('month', pe.pedido_em)::date AS mes,
           ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)), 2) AS receita
    FROM vendas.pedidos pe
    JOIN vendas.itens_pedido i ON i.pedido_id = pe.pedido_id
    WHERE pe.status <> 'cancelado'
    GROUP BY 1
)
SELECT mes, receita,
       receita - LAG(receita) OVER (ORDER BY mes) AS variacao_valor
FROM vendas_mes
ORDER BY mes;

-- cumulative revenue
WITH vendas_mes AS (
    SELECT DATE_TRUNC('month', pe.pedido_em)::date AS mes,
           ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)), 2) AS receita
    FROM vendas.pedidos pe
    JOIN vendas.itens_pedido i ON i.pedido_id = pe.pedido_id
    WHERE pe.status <> 'cancelado'
    GROUP BY 1
)
SELECT mes, receita,
       SUM(receita) OVER (ORDER BY mes ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS receita_acumulada
FROM vendas_mes
ORDER BY mes;

-- lead next month
WITH vendas_mes AS (
    SELECT DATE_TRUNC('month', pe.pedido_em)::date AS mes,
           ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)), 2) AS receita
    FROM vendas.pedidos pe
    JOIN vendas.itens_pedido i ON i.pedido_id = pe.pedido_id
    WHERE pe.status <> 'cancelado'
    GROUP BY 1
)
SELECT mes, receita,
       LEAD(receita) OVER (ORDER BY mes) AS receita_seguinte
FROM vendas_mes
ORDER BY mes;

-- channel cumulative
WITH vendas_canal_mes AS (
    SELECT pe.canal, DATE_TRUNC('month', pe.pedido_em)::date AS mes,
           ROUND(SUM(i.quantidade * i.preco_unitario * (1 - i.desconto)), 2) AS receita
    FROM vendas.pedidos pe
    JOIN vendas.itens_pedido i ON i.pedido_id = pe.pedido_id
    WHERE pe.status <> 'cancelado'
    GROUP BY pe.canal, 2
)
SELECT canal, mes, receita,
       SUM(receita) OVER (PARTITION BY canal ORDER BY mes) AS acumulado_canal
FROM vendas_canal_mes
ORDER BY canal, mes;
