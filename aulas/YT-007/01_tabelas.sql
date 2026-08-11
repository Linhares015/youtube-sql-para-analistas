SELECT
    table_name AS tabela
FROM information_schema.tables
WHERE table_schema = 'vendas'
ORDER BY table_name;
