# SQL para Analistas de Dados

Projeto oficial da playlist **SQL para Analistas de Dados: do Básico ao Avançado**, do canal de Tiago Linhares.

O mesmo e-commerce sintético acompanha toda a série. Você poderá reproduzir as consultas, resolver os exercícios e evoluir o projeto do primeiro `SELECT` até KPIs, funil, coortes, retenção e performance.

## Pré-requisitos

- Docker ou Podman;
- DBeaver Community ou outro cliente PostgreSQL;
- Git.

## Clonar

```bash
git clone https://github.com/Linhares015/youtube-sql-para-analistas.git
cd youtube-sql-para-analistas
```

## Iniciar o PostgreSQL

Com Docker:

```bash
docker compose up -d
```

Com Podman:

```bash
podman compose up -d
```

O script `sql/setup.sql` é executado automaticamente na primeira criação do volume.

## Conexão no DBeaver

| Campo | Valor |
|---|---|
| Host | `127.0.0.1` |
| Porta | `55432` |
| Banco | `vendas` |
| Usuário | `analista` |
| Senha | vazia — ambiente local descartável |

> A autenticação `trust` é usada somente no loopback para este laboratório local. Não use essa configuração em produção.

## Validar o ambiente

```bash
docker compose exec postgres psql -U analista -d vendas -f /project/sql/checks/01_tabelas.sql
```

Troque `docker` por `podman` se necessário.

## Estrutura

```text
sql/setup.sql       cria e popula o e-commerce sintético
sql/checks/         consultas de validação usadas na aula 2
aulas/              contexto, exercícios e materiais por vídeo
docs/grade.md       mapa completo da playlist
```

## Progresso da playlist

- `YT-001`: mapa do básico ao avançado;
- `YT-002`: PostgreSQL, DBeaver e banco de vendas;
- demais aulas: publicadas progressivamente conforme os vídeos forem liberados.

## Dados e segurança

Todos os dados são sintéticos e determinísticos. Este repositório não contém credenciais reais, dados pessoais, mídia privada ou arquivos internos da fábrica de vídeos.

## Licença

MIT — veja [LICENSE](LICENSE).
