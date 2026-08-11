-- YT-021: consultas executadas na aula

-- mes coorte
SELECT cliente_id,
       MIN(mes_atividade) AS mes_coorte,
       COUNT(*) AS meses_ativos
FROM vendas.atividade_retencao
GROUP BY cliente_id
ORDER BY cliente_id
LIMIT 10;

-- mes relativo
WITH base AS (
    SELECT cliente_id,
           mes_atividade,
           MIN(mes_atividade) OVER (PARTITION BY cliente_id) AS mes_coorte
    FROM vendas.atividade_retencao
)
SELECT cliente_id, mes_coorte, mes_atividade,
       12 * (EXTRACT(YEAR FROM mes_atividade) - EXTRACT(YEAR FROM mes_coorte))
       + EXTRACT(MONTH FROM mes_atividade) - EXTRACT(MONTH FROM mes_coorte) AS mes_indice
FROM base
ORDER BY cliente_id, mes_atividade
LIMIT 12;

-- matriz clientes
WITH base AS (
    SELECT cliente_id, mes_atividade,
           MIN(mes_atividade) OVER (PARTITION BY cliente_id) AS mes_coorte
    FROM vendas.atividade_retencao
),
indices AS (
    SELECT *, (EXTRACT(YEAR FROM age(mes_atividade, mes_coorte)) * 12
              + EXTRACT(MONTH FROM age(mes_atividade, mes_coorte)))::int AS mes_indice
    FROM base
)
SELECT mes_coorte,
       COUNT(DISTINCT cliente_id) FILTER (WHERE mes_indice = 0) AS mes_0,
       COUNT(DISTINCT cliente_id) FILTER (WHERE mes_indice = 1) AS mes_1,
       COUNT(DISTINCT cliente_id) FILTER (WHERE mes_indice = 2) AS mes_2,
       COUNT(DISTINCT cliente_id) FILTER (WHERE mes_indice = 3) AS mes_3
FROM indices
GROUP BY mes_coorte
ORDER BY mes_coorte;

-- taxa retencao
WITH base AS (
    SELECT cliente_id, mes_atividade,
           MIN(mes_atividade) OVER (PARTITION BY cliente_id) AS mes_coorte
    FROM vendas.atividade_retencao
),
matriz AS (
    SELECT mes_coorte,
           (EXTRACT(YEAR FROM age(mes_atividade, mes_coorte)) * 12
            + EXTRACT(MONTH FROM age(mes_atividade, mes_coorte)))::int AS mes_indice,
           COUNT(DISTINCT cliente_id) AS clientes_ativos
    FROM base
    GROUP BY mes_coorte, mes_indice
),
tamanhos AS (
    SELECT mes_coorte, clientes_ativos AS tamanho_coorte
    FROM matriz WHERE mes_indice = 0
)
SELECT m.mes_coorte, m.mes_indice, m.clientes_ativos,
       ROUND(100.0 * m.clientes_ativos / t.tamanho_coorte, 1) AS retencao_pct
FROM matriz m
JOIN tamanhos t USING (mes_coorte)
ORDER BY m.mes_coorte, m.mes_indice;
