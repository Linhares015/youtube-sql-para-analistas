# Aula YT-002 — Ambiente pronto

## Objetivo

Subir um PostgreSQL 17 real, conectar o DBeaver e validar o banco sintético de vendas.

## Passos

1. Inicie o serviço com `docker compose up -d` ou `podman compose up -d`.
2. Aguarde o healthcheck ficar saudável.
3. Configure o DBeaver com os parâmetros do README principal.
4. Execute, na ordem, os arquivos de `sql/checks/`.
5. Confirme cinco tabelas e ausência de chaves órfãs.

## Resultado esperado

- `clientes`: 120 linhas;
- `produtos`: 30 linhas;
- `pedidos`: 600 linhas;
- `itens_pedido`: 1.500 linhas;
- `eventos`: 4.800 linhas;
- integridade: todos os contadores de órfãos iguais a zero.
