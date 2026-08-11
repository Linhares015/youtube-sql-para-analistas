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


## Índice das aulas

- [`YT-001`](aulas/YT-001/) — SQL para Analistas: o mapa do básico ao avançado
- [`YT-002`](aulas/YT-002/) — Ambiente SQL pronto: PostgreSQL, DBeaver e banco de vendas passo a passo
- [`YT-003`](aulas/YT-003/) — Seu primeiro SELECT no SQL: colunas, aliases, DISTINCT e LIMIT
- [`YT-004`](aulas/YT-004/) — WHERE, IN, BETWEEN e LIKE no SQL: filtros que respondem perguntas
- [`YT-005`](aulas/YT-005/) — NULL, COALESCE e CASE no SQL: evite respostas erradas
- [`YT-006`](aulas/YT-006/) — COUNT, SUM, AVG, MIN e MAX no SQL sem confundir métricas
- [`YT-007`](aulas/YT-007/) — GROUP BY e HAVING no SQL: agregações sem confusão
- [`YT-008`](aulas/YT-008/) — JOIN no SQL sem mistério: INNER e LEFT JOIN na prática
- [`YT-009`](aulas/YT-009/) — JOIN duplicou seus dados? Granularidade e fan-out no SQL
- [`YT-010`](aulas/YT-010/) — Datas no SQL sem erro: mês, semana, intervalos e comparação
- [`YT-011`](aulas/YT-011/) — Limpeza de texto com SQL: strings, categorias e padronização
- [`YT-012`](aulas/YT-012/) — Subqueries: quando usar e quando evitar
- [`YT-013`](aulas/YT-013/) — CTEs com WITH: SQL legível em etapas
- [`YT-014`](aulas/YT-014/) — Window Functions: analisando sem perder o detalhe
- [`YT-015`](aulas/YT-015/) — Ranking e Top N por categoria com ROW_NUMBER e RANK
- [`YT-016`](aulas/YT-016/) — LAG, LEAD e total acumulado: comparações ao longo do tempo
- [`YT-017`](aulas/YT-017/) — UNION, INTERSECT, EXCEPT e deduplicação consciente
- [`YT-018`](aulas/YT-018/) — Qualidade de dados com SQL: nulos, duplicados e regras inválidas
- [`YT-019`](aulas/YT-019/) — KPIs de vendas: receita, ticket médio, clientes e margem
- [`YT-020`](aulas/YT-020/) — Funil de conversão em SQL: visita, carrinho, compra
- [`YT-021`](aulas/YT-021/) — Coortes e retenção: uma análise avançada passo a passo
- [`YT-022`](aulas/YT-022/) — SQL lento? EXPLAIN, índices e consultas mais eficientes
- [`YT-023`](aulas/YT-023/) — Boas práticas de SQL profissional: padrão, revisão e manutenção
- [`YT-024`](aulas/YT-024/) — Projeto final: análise completa de um e-commerce com SQL

## Dados e segurança

Todos os dados são sintéticos e determinísticos. Este repositório não contém credenciais reais, dados pessoais, mídia privada ou arquivos internos da fábrica de vídeos.

## Licença

MIT — veja [LICENSE](LICENSE).
