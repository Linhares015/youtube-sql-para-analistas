-- YT-005: consultas executadas na aula

-- is null
SELECT pedido_id, codigo_cupom
FROM vendas.pedidos
WHERE codigo_cupom IS NULL
ORDER BY pedido_id
LIMIT 10;

-- is not null
SELECT pedido_id, codigo_cupom
FROM vendas.pedidos
WHERE codigo_cupom IS NOT NULL
ORDER BY pedido_id
LIMIT 10;

-- coalesce label
SELECT pedido_id, codigo_cupom,
       COALESCE(codigo_cupom, 'sem cupom') AS cupom_exibido
FROM vendas.pedidos
ORDER BY pedido_id
LIMIT 12;

-- case simple
SELECT pedido_id, status,
       CASE status
           WHEN 'pago' THEN 'em preparacao'
           WHEN 'enviado' THEN 'em transporte'
           WHEN 'entregue' THEN 'concluido'
           ELSE 'revisar'
       END AS etapa
FROM vendas.pedidos
ORDER BY pedido_id
LIMIT 12;

-- case searched
SELECT pedido_id, item_id, desconto,
       CASE WHEN desconto = 0 THEN 'sem desconto'
           WHEN desconto <= 0.10 THEN 'desconto leve'
           ELSE 'desconto alto'
       END AS faixa_desconto
FROM vendas.itens_pedido
ORDER BY pedido_id, item_id
LIMIT 12;

-- null comparison trap
SELECT
    count(*) AS total_pedidos,
    count(*) FILTER (WHERE codigo_cupom <> 'BEMVINDO') AS comparacao_comum,
    count(*) FILTER (WHERE codigo_cupom IS DISTINCT FROM 'BEMVINDO') AS comparacao_segura
FROM vendas.pedidos;

-- combined challenge
SELECT pedido_id,
       COALESCE(codigo_cupom, 'sem cupom') AS cupom,
       CASE WHEN codigo_cupom IS NULL THEN 'organico'
           WHEN codigo_cupom = 'BEMVINDO' THEN 'aquisicao'
           ELSE 'promocao'
       END AS origem
FROM vendas.pedidos
ORDER BY pedido_id
LIMIT 12;
