-- Primeira amostra de clientes
SELECT nome, cidade, uf
FROM vendas.clientes
ORDER BY cliente_id
LIMIT 5;

-- Estrutura da tabela de clientes
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'vendas'
  AND table_name = 'clientes'
ORDER BY ordinal_position;

-- Todas as colunas
SELECT *
FROM vendas.clientes
ORDER BY cliente_id
LIMIT 5;

-- Colunas específicas
SELECT nome, cidade, uf
FROM vendas.clientes
ORDER BY cliente_id
LIMIT 5;

-- Apelidos de colunas
SELECT nome AS cliente,
       cidade AS cidade,
       uf AS estado
FROM vendas.clientes
ORDER BY cliente_id
LIMIT 5;

-- Valores únicos de segmento
SELECT DISTINCT segmento
FROM vendas.clientes
ORDER BY segmento;

-- Combinações únicas de cidade e estado
SELECT DISTINCT cidade, uf
FROM vendas.clientes
ORDER BY cidade, uf;

-- Amostra sem ordenação
SELECT nome, cidade, uf
FROM vendas.clientes
LIMIT 5;

-- Amostra ordenada
SELECT cliente_id, nome, cidade, uf
FROM vendas.clientes
ORDER BY cliente_id
LIMIT 5;

-- Desafio final com produtos
SELECT produto_id,
       nome AS produto,
       categoria
FROM vendas.produtos
ORDER BY produto_id
LIMIT 10;
