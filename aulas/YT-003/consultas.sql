-- 1. Conhecer as colunas disponíveis
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'vendas'
  AND table_name = 'clientes'
ORDER BY ordinal_position;

-- 2. Selecionar somente o necessário
SELECT nome, cidade, uf
FROM vendas.clientes
ORDER BY cliente_id
LIMIT 5;

-- 3. Criar aliases legíveis
SELECT
    nome AS cliente,
    cidade AS cidade,
    uf AS estado
FROM vendas.clientes
ORDER BY cliente_id
LIMIT 5;

-- 4. Descobrir valores únicos
SELECT DISTINCT segmento
FROM vendas.clientes
ORDER BY segmento;

-- 5. DISTINCT considera a combinação inteira
SELECT DISTINCT cidade, uf
FROM vendas.clientes
ORDER BY cidade, uf;

-- 6. Amostra reproduzível
SELECT cliente_id, nome, cidade, uf
FROM vendas.clientes
ORDER BY cliente_id
LIMIT 5;
