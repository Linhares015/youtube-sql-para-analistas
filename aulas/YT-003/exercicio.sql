-- Complete sem usar SELECT *.

-- Desafio 1: sete produtos, com aliases produto, categoria e preco.
SELECT
    -- escreva as colunas aqui
FROM vendas.produtos
-- adicione uma ordenação reproduzível
LIMIT 7;

-- Desafio 2: categorias únicas.
SELECT
    -- use DISTINCT aqui
FROM vendas.produtos;
