-- Ambiente local da playlist SQL para Analistas
-- PostgreSQL 17 em contêiner descartável, exposto somente no loopback.
-- Comando reproduzível (execute no terminal do seu sistema):
-- podman run --name sql-para-analistas --rm \
--   -e POSTGRES_HOST_AUTH_METHOD=trust \
--   -e POSTGRES_USER=analista -e POSTGRES_DB=vendas \
--   -p 127.0.0.1:55432:5432 -d postgres:17-alpine
--
-- Autenticação trust é somente para esta demonstração local isolada.
-- Em produção, use senha forte, cofre de segredos e regras de rede.

SELECT
    version() AS servidor,
    current_database() AS banco,
    current_user AS usuario;
