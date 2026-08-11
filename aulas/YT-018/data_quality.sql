-- YT-018: consultas executadas na aula

-- null profile
SELECT COUNT(*) AS total_linhas,
       COUNT(*) FILTER (WHERE pedido_id IS NULL) AS pedido_id_nulo,
       COUNT(*) FILTER (WHERE status IS NULL) AS status_nulo,
       COUNT(*) FILTER (WHERE NULLIF(BTRIM(email), '') IS NULL) AS email_ausente
FROM vendas.pedidos_importacao;

-- missing required rows
SELECT linha_origem, pedido_id, status, email
FROM vendas.pedidos_importacao
WHERE pedido_id IS NULL
   OR status IS NULL
   OR NULLIF(BTRIM(email), '') IS NULL
ORDER BY linha_origem;

-- duplicate keys
SELECT pedido_id, COUNT(*) AS ocorrencias
FROM vendas.pedidos_importacao
WHERE pedido_id IS NOT NULL
GROUP BY pedido_id
HAVING COUNT(*) > 1
ORDER BY pedido_id;

-- invalid status domain
SELECT linha_origem, pedido_id, status
FROM vendas.pedidos_importacao
WHERE status IS NOT NULL
  AND status NOT IN ('pago', 'enviado', 'entregue', 'cancelado')
ORDER BY linha_origem;

-- invalid numeric rules
SELECT linha_origem, quantidade, desconto,
       CASE WHEN quantidade <= 0 THEN 'quantidade nao positiva'
            WHEN desconto < 0 OR desconto > 1 THEN 'desconto fora do intervalo' END AS motivo
FROM vendas.pedidos_importacao
WHERE quantidade <= 0 OR desconto < 0 OR desconto > 1
ORDER BY linha_origem;

-- quality report
SELECT 'pedido_id nulo' AS regra, COUNT(*) AS falhas
FROM vendas.pedidos_importacao WHERE pedido_id IS NULL
UNION ALL
SELECT 'pedido_id duplicado', COUNT(*) FROM (SELECT pedido_id FROM vendas.pedidos_importacao WHERE pedido_id IS NOT NULL GROUP BY pedido_id HAVING COUNT(*) > 1) d
UNION ALL
SELECT 'status invalido', COUNT(*) FROM vendas.pedidos_importacao WHERE status IS NOT NULL AND status NOT IN ('pago', 'enviado', 'entregue', 'cancelado')
UNION ALL
SELECT 'regra numerica invalida', COUNT(*) FROM vendas.pedidos_importacao WHERE quantidade <= 0 OR desconto < 0 OR desconto > 1
ORDER BY regra;
