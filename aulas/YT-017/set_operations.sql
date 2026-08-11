-- YT-017: consultas executadas na aula

-- cohort sets
WITH publicos AS (
    SELECT 'SP ou PE' AS publico, cliente_id
    FROM vendas.clientes
    WHERE uf IN ('SP', 'PE')
    UNION ALL
    SELECT 'Corporativo', cliente_id
    FROM vendas.clientes
    WHERE segmento = 'Corporativo'
)
SELECT publico, COUNT(*) AS clientes
FROM publicos
GROUP BY publico
ORDER BY publico;

-- union all memberships
SELECT cliente_id, nome
FROM vendas.clientes
WHERE uf IN ('SP', 'PE')
UNION ALL
SELECT cliente_id, nome
FROM vendas.clientes
WHERE segmento = 'Corporativo'
ORDER BY cliente_id;

-- union distinct clients
SELECT cliente_id, nome
FROM vendas.clientes
WHERE uf IN ('SP', 'PE')
UNION
SELECT cliente_id, nome
FROM vendas.clientes
WHERE segmento = 'Corporativo'
ORDER BY cliente_id;

-- intersect overlap
SELECT cliente_id, nome
FROM vendas.clientes
WHERE uf IN ('SP', 'PE')
INTERSECT
SELECT cliente_id, nome
FROM vendas.clientes
WHERE segmento = 'Corporativo'
ORDER BY cliente_id;

-- except difference
SELECT cliente_id, nome
FROM vendas.clientes
WHERE uf IN ('SP', 'PE')
EXCEPT
SELECT cliente_id, nome
FROM vendas.clientes
WHERE segmento = 'Corporativo'
ORDER BY cliente_id;

-- deduplication audit
WITH participacoes AS (
    SELECT cliente_id, nome, 'SP ou PE' AS origem
    FROM vendas.clientes
    WHERE uf IN ('SP', 'PE')
    UNION ALL
    SELECT cliente_id, nome, 'Corporativo' AS origem
    FROM vendas.clientes
    WHERE segmento = 'Corporativo'
)
SELECT cliente_id, nome, COUNT(*) AS participacoes
FROM participacoes
GROUP BY cliente_id, nome
HAVING COUNT(*) > 1
ORDER BY cliente_id;
