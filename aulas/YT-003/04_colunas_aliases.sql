SELECT
    nome AS cliente,
    cidade AS cidade,
    uf AS estado
FROM vendas.clientes
ORDER BY cliente_id
LIMIT 5;
