SELECT
    produto_id,
    nome AS produto,
    categoria
FROM vendas.produtos
ORDER BY produto_id
LIMIT 10;
