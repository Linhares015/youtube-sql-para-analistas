DROP SCHEMA IF EXISTS vendas CASCADE;
CREATE SCHEMA vendas;
SET search_path TO vendas;

CREATE TABLE clientes (
    cliente_id integer PRIMARY KEY,
    nome text NOT NULL,
    segmento text NOT NULL,
    cidade text NOT NULL,
    uf char(2) NOT NULL,
    criado_em date NOT NULL
);

CREATE TABLE produtos (
    produto_id integer PRIMARY KEY,
    nome text NOT NULL,
    categoria text NOT NULL,
    preco numeric(10,2) NOT NULL,
    custo numeric(10,2) NOT NULL
);

CREATE TABLE pedidos (
    pedido_id integer PRIMARY KEY,
    cliente_id integer NOT NULL REFERENCES clientes(cliente_id),
    pedido_em date NOT NULL,
    status text NOT NULL,
    canal text NOT NULL,
    codigo_cupom text
);

CREATE TABLE itens_pedido (
    pedido_id integer NOT NULL REFERENCES pedidos(pedido_id),
    item_id integer NOT NULL,
    produto_id integer NOT NULL REFERENCES produtos(produto_id),
    quantidade integer NOT NULL,
    preco_unitario numeric(10,2) NOT NULL,
    desconto numeric(5,2) NOT NULL DEFAULT 0,
    PRIMARY KEY (pedido_id, item_id)
);

CREATE TABLE eventos (
    evento_id bigint PRIMARY KEY,
    cliente_id integer NOT NULL REFERENCES clientes(cliente_id),
    ocorrido_em timestamp NOT NULL,
    tipo text NOT NULL,
    sessao_id text NOT NULL
);

CREATE TABLE cadastros_texto (
    cadastro_id integer PRIMARY KEY,
    nome_bruto text NOT NULL,
    categoria_bruta text NOT NULL,
    uf_bruta text NOT NULL,
    email_bruto text
);

INSERT INTO clientes
SELECT id, 'Cliente ' || lpad(id::text, 3, '0'),
       (ARRAY['Consumidor', 'Corporativo', 'Pequenas empresas'])[1 + (id % 3)],
       (ARRAY['Sao Paulo', 'Recife', 'Curitiba', 'Belo Horizonte', 'Salvador'])[1 + (id % 5)],
       (ARRAY['SP', 'PE', 'PR', 'MG', 'BA'])[1 + (id % 5)],
       DATE '2024-01-01' + ((id * 7) % 365)
FROM generate_series(1, 120) AS g(id);

INSERT INTO produtos
SELECT id,
       (ARRAY['Notebook', 'Monitor', 'Teclado', 'Mouse', 'Headset', 'Webcam', 'Cadeira', 'Mesa', 'Mochila', 'Hub USB'])[1 + ((id - 1) % 10)] || ' ' || lpad(id::text, 2, '0'),
       (ARRAY['Informatica', 'Acessorios', 'Escritorio'])[1 + (id % 3)],
       round((45 + id * 17.35)::numeric, 2),
       round((25 + id * 10.10)::numeric, 2)
FROM generate_series(1, 30) AS g(id);

INSERT INTO pedidos
SELECT id, 1 + ((id * 11) % 120), DATE '2025-01-01' + ((id * 3) % 365),
       (ARRAY['pago', 'enviado', 'entregue', 'entregue', 'entregue', 'cancelado'])[1 + (id % 6)],
       (ARRAY['site', 'app', 'marketplace'])[1 + (id % 3)],
       CASE WHEN id % 4 <> 0 THEN NULL WHEN id % 8 = 0 THEN 'BEMVINDO' ELSE 'FRETE10' END
FROM generate_series(1, 600) AS g(id);

INSERT INTO itens_pedido
SELECT p.pedido_id, item_no, 1 + ((p.pedido_id * 7 + item_no * 3) % 30),
       1 + ((p.pedido_id + item_no) % 3),
       round((50 + ((p.pedido_id * 7 + item_no * 3) % 30) * 17.35)::numeric, 2),
       (ARRAY[0.00, 0.05, 0.10, 0.15])[1 + ((p.pedido_id + item_no) % 4)]
FROM pedidos AS p
CROSS JOIN LATERAL generate_series(1, 1 + (p.pedido_id % 4)) AS gs(item_no);

INSERT INTO eventos
SELECT ((cliente_id - 1) * 40 + evento_no)::bigint,
       cliente_id,
       TIMESTAMP '2025-01-01 08:00:00'
           + (((cliente_id - 1) * 40 + evento_no) * INTERVAL '15 minutes'),
       CASE
           WHEN evento_no <= 20 THEN 'visita'
           WHEN cliente_id <= 90 AND evento_no <= 32 THEN 'carrinho'
           WHEN cliente_id <= 60 THEN 'compra'
           ELSE 'produto'
       END,
       'sessao-' || lpad(cliente_id::text, 3, '0') || '-' || lpad(((evento_no - 1) / 4 + 1)::text, 2, '0')
FROM generate_series(1, 120) AS clientes(cliente_id)
CROSS JOIN generate_series(1, 40) AS eventos(evento_no);

INSERT INTO cadastros_texto VALUES
(1, '  ANA SILVA  ', ' varejo ', ' sp ', ' ana@exemplo.com '),
(2, 'joao souza ', 'CONSUMIDOR', 'rj', ''),
(3, ' MARIA OLIVEIRA', ' pessoa fisica ', ' mg ', 'maria@exemplo.com'),
(4, 'carlos   lima  ', 'PF', 'SP', '  '),
(5, '  LUANA costa', ' corp ', ' ba', 'luana@exemplo.com '),
(6, 'PEDRO  ALVES ', 'Corporativo', 'pe ', NULL),
(7, ' bianca   rocha ', 'empresa', 'pr', ' bianca@exemplo.com'),
(8, 'Rafael Nunes', 'pj ', 'sc', 'rafael@exemplo.com');

ANALYZE vendas.clientes;
ANALYZE vendas.produtos;
ANALYZE vendas.pedidos;
ANALYZE vendas.itens_pedido;
ANALYZE vendas.eventos;
ANALYZE vendas.cadastros_texto;

CREATE TABLE atividade_retencao (
    cliente_id integer NOT NULL REFERENCES clientes(cliente_id),
    mes_atividade date NOT NULL,
    PRIMARY KEY (cliente_id, mes_atividade)
);

-- Mês zero: quatro coortes de 30 clientes, de janeiro a abril.
INSERT INTO atividade_retencao
SELECT cliente_id,
       DATE '2025-01-01' + (((cliente_id - 1) / 30) * INTERVAL '1 month')
FROM generate_series(1, 120) AS g(cliente_id);

-- Retornos observados: 24/21/18 clientes no mês um.
INSERT INTO atividade_retencao
SELECT cliente_id,
       DATE '2025-02-01' + (((cliente_id - 1) / 30) * INTERVAL '1 month')
FROM generate_series(1, 90) AS g(cliente_id)
WHERE (cliente_id <= 24)
   OR (cliente_id BETWEEN 31 AND 51)
   OR (cliente_id BETWEEN 61 AND 78);

-- Retornos observados: 18/15 clientes no mês dois.
INSERT INTO atividade_retencao
SELECT cliente_id,
       DATE '2025-03-01' + (((cliente_id - 1) / 30) * INTERVAL '1 month')
FROM generate_series(1, 60) AS g(cliente_id)
WHERE cliente_id <= 18 OR cliente_id BETWEEN 31 AND 45;

-- Retorno observado: 12 clientes da coorte de janeiro no mês três.
INSERT INTO atividade_retencao
SELECT cliente_id, DATE '2025-04-01'
FROM generate_series(1, 12) AS g(cliente_id);

ANALYZE vendas.atividade_retencao;

CREATE TABLE pedidos_importacao (
    linha_origem integer PRIMARY KEY,
    pedido_id integer,
    status text,
    quantidade integer NOT NULL,
    desconto numeric(5,2) NOT NULL,
    email text
);

INSERT INTO pedidos_importacao VALUES
(1, 1001, 'pago', 1, 0.10, 'ana@exemplo.com'),
(2, 1002, 'enviado', 2, 0.00, 'bia@exemplo.com'),
(3, 1002, 'enviado', 2, 0.00, 'bia@exemplo.com'),
(4, NULL, 'pago', 1, 0.00, 'caio@exemplo.com'),
(5, 1003, NULL, 1, 0.00, 'dani@exemplo.com'),
(6, 1004, 'erro', 1, 0.00, 'eli@exemplo.com'),
(7, 1005, 'entregue', 0, 0.00, 'fabi@exemplo.com'),
(8, 1005, 'entregue', 1, 1.25, '   '),
(9, 1006, 'aguardando', 1, 0.00, NULL),
(10, 1007, 'cancelado', 1, -0.10, 'gabi@exemplo.com'),
(11, 1008, 'pago', 3, 0.05, 'heitor@exemplo.com'),
(12, 1009, 'entregue', 1, 0.00, 'iris@exemplo.com');

ANALYZE vendas.pedidos_importacao;
