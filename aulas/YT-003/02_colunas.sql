SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'vendas'
  AND table_name = 'clientes'
ORDER BY ordinal_position;
