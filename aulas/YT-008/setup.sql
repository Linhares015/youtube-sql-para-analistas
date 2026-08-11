DROP SCHEMA IF EXISTS vendas CASCADE;
CREATE SCHEMA vendas;
SET search_path TO vendas;

CREATE TABLE clientes (
    cliente_id integer PRIMARY KEY,
    nome text NOT NULL,
    segmento text NOT NULL CHECK (segmento IN ('Consumidor', 'Corporativo', 'Pequenas empresas')),
    cidade text NOT NULL,
    uf char(2) NOT NULL,
    criado_em date NOT NULL
);

CREATE TABLE produtos (
    produto_id integer PRIMARY KEY,
    nome text NOT NULL,
    categoria text NOT NULL,
    preco numeric(10,2) NOT NULL CHECK (preco > 0),
    custo numeric(10,2) NOT NULL CHECK (custo >= 0)
);

CREATE TABLE pedidos (
    pedido_id integer PRIMARY KEY,
    cliente_id integer NOT NULL REFERENCES clientes(cliente_id),
    pedido_em date NOT NULL,
    status text NOT NULL CHECK (status IN ('pago', 'enviado', 'entregue', 'cancelado')),
    canal text NOT NULL CHECK (canal IN ('site', 'app', 'marketplace')),
    codigo_cupom text
);

CREATE TABLE itens_pedido (
    pedido_id integer NOT NULL REFERENCES pedidos(pedido_id),
    item_id integer NOT NULL,
    produto_id integer NOT NULL REFERENCES produtos(produto_id),
    quantidade integer NOT NULL CHECK (quantidade > 0),
    preco_unitario numeric(10,2) NOT NULL CHECK (preco_unitario > 0),
    desconto numeric(5,2) NOT NULL DEFAULT 0 CHECK (desconto BETWEEN 0 AND 0.35),
    PRIMARY KEY (pedido_id, item_id)
);

CREATE TABLE eventos (
    evento_id bigint PRIMARY KEY,
    cliente_id integer NOT NULL REFERENCES clientes(cliente_id),
    ocorrido_em timestamp NOT NULL,
    tipo text NOT NULL CHECK (tipo IN ('visita', 'produto', 'carrinho', 'compra')),
    sessao_id text NOT NULL
);

INSERT INTO clientes
SELECT
    id,
    'Cliente ' || lpad(id::text, 3, '0'),
    (ARRAY['Consumidor', 'Corporativo', 'Pequenas empresas'])[1 + (id % 3)],
    (ARRAY['São Paulo', 'Recife', 'Curitiba', 'Belo Horizonte', 'Salvador'])[1 + (id % 5)],
    (ARRAY['SP', 'PE', 'PR', 'MG', 'BA'])[1 + (id % 5)],
    DATE '2024-01-01' + ((id * 7) % 365)
FROM generate_series(1, 120) AS g(id);

INSERT INTO produtos
SELECT
    id,
    (ARRAY['Notebook', 'Monitor', 'Teclado', 'Mouse', 'Headset', 'Webcam', 'Cadeira', 'Mesa', 'Mochila', 'Hub USB'])[1 + ((id - 1) % 10)] || ' ' || lpad(id::text, 2, '0'),
    (ARRAY['Informática', 'Acessórios', 'Escritório'])[1 + (id % 3)],
    round((45 + id * 17.35)::numeric, 2),
    round((25 + id * 10.10)::numeric, 2)
FROM generate_series(1, 30) AS g(id);

INSERT INTO pedidos
SELECT
    id,
    1 + ((id * 11) % 120),
    DATE '2025-01-01' + ((id * 3) % 365),
    (ARRAY['pago', 'enviado', 'entregue', 'entregue', 'entregue', 'cancelado'])[1 + (id % 6)],
    (ARRAY['site', 'app', 'marketplace'])[1 + (id % 3)],
    CASE
        WHEN id % 4 <> 0 THEN NULL
        WHEN id % 8 = 0 THEN 'BEMVINDO'
        ELSE 'FRETE10'
    END
FROM generate_series(1, 600) AS g(id);

INSERT INTO itens_pedido (
    pedido_id,
    item_id,
    produto_id,
    quantidade,
    preco_unitario,
    desconto
)
SELECT
    p.pedido_id,
    item_no,
    1 + ((p.pedido_id * 7 + item_no * 3) % 30),
    1 + ((p.pedido_id + item_no) % 3),
    round((50 + ((p.pedido_id * 7 + item_no * 3) % 30) * 17.35)::numeric, 2),
    (ARRAY[0.00, 0.05, 0.10, 0.15])[1 + ((p.pedido_id + item_no) % 4)]
FROM pedidos AS p
CROSS JOIN LATERAL generate_series(1, 1 + (p.pedido_id % 4)) AS gs(item_no);

INSERT INTO eventos
SELECT
    id,
    1 + ((id * 13) % 120),
    TIMESTAMP '2025-01-01 08:00:00' + (id * INTERVAL '95 minutes'),
    (ARRAY['visita', 'produto', 'carrinho', 'compra'])[1 + (id % 4)],
    'sessao-' || lpad((1 + ((id - 1) / 4))::text, 5, '0')
FROM generate_series(1, 4800) AS g(id);

ANALYZE vendas.clientes;
ANALYZE vendas.produtos;
ANALYZE vendas.pedidos;
ANALYZE vendas.itens_pedido;
ANALYZE vendas.eventos;
