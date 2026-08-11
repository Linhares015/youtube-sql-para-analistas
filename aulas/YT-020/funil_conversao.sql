-- YT-020: consultas executadas na aula

-- eventos usuarios
SELECT tipo AS etapa,
       COUNT(*) AS eventos,
       COUNT(DISTINCT cliente_id) AS usuarios
FROM vendas.eventos
WHERE tipo IN ('visita', 'carrinho', 'compra')
GROUP BY tipo
ORDER BY CASE tipo WHEN 'visita' THEN 1 WHEN 'carrinho' THEN 2 ELSE 3 END;

-- flags usuario
WITH etapas_por_usuario AS (
    SELECT cliente_id,
           MAX((tipo = 'visita')::int) AS visitou,
           MAX((tipo = 'carrinho')::int) AS adicionou_carrinho,
           MAX((tipo = 'compra')::int) AS comprou
    FROM vendas.eventos
    GROUP BY cliente_id
)
SELECT cliente_id, visitou, adicionou_carrinho, comprou
FROM etapas_por_usuario
ORDER BY cliente_id
LIMIT 10;

-- totais funil
WITH etapas_por_usuario AS (
    SELECT cliente_id,
           MAX((tipo = 'visita')::int) AS visitou,
           MAX((tipo = 'carrinho')::int) AS adicionou_carrinho,
           MAX((tipo = 'compra')::int) AS comprou
    FROM vendas.eventos
    GROUP BY cliente_id
)
SELECT SUM(visitou) AS visitantes,
       SUM(adicionou_carrinho) AS carrinhos,
       SUM(comprou) AS compradores
FROM etapas_por_usuario;

-- taxas conversao
WITH etapas_por_usuario AS (
    SELECT cliente_id,
           MAX((tipo = 'visita')::int) AS visitou,
           MAX((tipo = 'carrinho')::int) AS adicionou_carrinho,
           MAX((tipo = 'compra')::int) AS comprou
    FROM vendas.eventos
    GROUP BY cliente_id
),
totais AS (
    SELECT SUM(visitou) AS visitantes,
           SUM(adicionou_carrinho) AS carrinhos,
           SUM(comprou) AS compradores
    FROM etapas_por_usuario
)
SELECT ROUND(100.0 * carrinhos / NULLIF(visitantes, 0), 2) AS visita_para_carrinho,
       ROUND(100.0 * compradores / NULLIF(carrinhos, 0), 2) AS carrinho_para_compra,
       ROUND(100.0 * compradores / NULLIF(visitantes, 0), 2) AS conversao_total
FROM totais;
