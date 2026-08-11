-- YT-006: consultas executadas na aula

-- count rows values
SELECT
    COUNT(*) AS total_pedidos,
    COUNT(codigo_cupom) AS cupons_informados
FROM vendas.pedidos;

-- count distinct customers
SELECT
    COUNT(*) AS total_pedidos,
    COUNT(DISTINCT cliente_id) AS clientes_distintos
FROM vendas.pedidos;

-- sum volume revenue
SELECT
    SUM(quantidade) AS unidades_vendidas,
    SUM(quantidade * preco_unitario) AS receita_bruta
FROM vendas.itens_pedido;

-- average metrics
SELECT
    ROUND(AVG(quantidade), 2) AS quantidade_media,
    ROUND(AVG(preco_unitario), 2) AS preco_unitario_medio
FROM vendas.itens_pedido;

-- min max prices
SELECT
    MIN(preco_unitario) AS menor_preco,
    MAX(preco_unitario) AS maior_preco
FROM vendas.itens_pedido;

-- metric panel
SELECT
    COUNT(*) AS total_itens,
    COUNT(DISTINCT pedido_id) AS pedidos_distintos,
    SUM(quantidade) AS unidades,
    ROUND(SUM(quantidade * preco_unitario * (1 - desconto)), 2) AS receita_liquida,
    ROUND(AVG(quantidade), 2) AS quantidade_media,
    MIN(preco_unitario) AS menor_preco,
    MAX(preco_unitario) AS maior_preco
FROM vendas.itens_pedido;
