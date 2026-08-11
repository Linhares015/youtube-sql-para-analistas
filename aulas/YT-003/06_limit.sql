SELECT nome, cidade, uf
FROM vendas.clientes
LIMIT 5;

SELECT cliente_id, nome, cidade, uf
FROM vendas.clientes
ORDER BY cliente_id
LIMIT 5;
