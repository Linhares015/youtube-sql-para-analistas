-- YT-011: consultas executadas na aula

-- inspect dirty text
SELECT
    cadastro_id,
    LENGTH(nome_bruto) AS tamanho_bruto,
    LENGTH(BTRIM(nome_bruto)) AS tamanho_aparado
FROM vendas.cadastros_texto
ORDER BY cadastro_id
LIMIT 2;

-- trim and spaces
SELECT
    cadastro_id,
    REGEXP_REPLACE(BTRIM(nome_bruto), ' +', ' ', 'g')
      AS nome_limpo
FROM vendas.cadastros_texto
ORDER BY cadastro_id
LIMIT 3;

-- normalize case
SELECT
    cadastro_id,
    INITCAP(LOWER(REGEXP_REPLACE(BTRIM(nome_bruto), ' +', ' ', 'g')))
      AS nome_padronizado,
    UPPER(BTRIM(uf_bruta)) AS uf
FROM vendas.cadastros_texto
ORDER BY cadastro_id
LIMIT 2;

-- standardize categories
WITH padronizados AS (SELECT CASE WHEN LOWER(BTRIM(categoria_bruta))
    IN ('varejo', 'consumidor', 'pessoa fisica', 'pf')
    THEN 'Consumidor' ELSE 'Corporativo' END AS categoria
FROM vendas.cadastros_texto)
SELECT categoria, COUNT(*) AS cadastros
FROM padronizados
GROUP BY categoria
ORDER BY categoria;

-- empty to null
SELECT
    COUNT(*) AS emails_ausentes
FROM vendas.cadastros_texto
WHERE NULLIF(BTRIM(email_bruto), '') IS NULL;

-- complete profile
WITH limpos AS (SELECT
    INITCAP(LOWER(REGEXP_REPLACE(BTRIM(nome_bruto), ' +', ' ', 'g')))
      AS nome,
    CASE WHEN LOWER(BTRIM(categoria_bruta))
      IN ('varejo', 'consumidor', 'pessoa fisica', 'pf')
      THEN 'Consumidor' ELSE 'Corporativo' END AS categoria,
    UPPER(BTRIM(uf_bruta)) AS uf,
    NULLIF(BTRIM(email_bruto), '') AS email
FROM vendas.cadastros_texto)
SELECT categoria, COUNT(*) AS cadastros
FROM limpos
GROUP BY categoria
ORDER BY categoria;
