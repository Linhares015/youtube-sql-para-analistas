SET search_path TO vendas;
SELECT nome, cidade, uf
FROM clientes
ORDER BY cliente_id
LIMIT 5;
