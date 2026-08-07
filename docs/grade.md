# PL-001 — SQL para Analistas de Dados: do Básico ao Avançado

**Versão:** v1
**Status:** playlist aprovada e em produção
**Objetivo:** ensinar SQL pela ótica do trabalho real de análise, combinando fundamentos, prática, raciocínio de negócio e boas práticas.
**Público:** iniciantes, profissionais de Excel/Power BI em transição e analistas que querem avançar além de consultas básicas.
**Transformação prometida:** sair do primeiro `SELECT` e chegar a análises de KPIs, funil, coortes, retenção, qualidade e performance, construindo um projeto final de portfólio.
**Stack:** PostgreSQL + DBeaver + dataset sintético de e-commerce.
**Duração total estimada:** 6h10min.

## Grade

| Ordem | Vídeo ID | Título provisório | Formato | Duração | Resultado do espectador |
|---:|---|---|---|---:|---|
| 1 | YT-001 | SQL para Analistas: o mapa do básico ao avançado | conceitual | 9 min | Entender onde SQL entra no trabalho do analista e conhecer o projeto da série. |
| 2 | YT-002 | Ambiente pronto: PostgreSQL, DBeaver e nosso banco de vendas | pratico | 16 min | Instalar/abrir o ambiente, carregar o dataset e validar as tabelas. |
| 3 | YT-003 | Seu primeiro SELECT: colunas, aliases, DISTINCT e LIMIT | pratico | 13 min | Explorar tabelas sem usar `SELECT *` indiscriminadamente. |
| 4 | YT-004 | Filtros que respondem perguntas: WHERE, IN, BETWEEN e LIKE | pratico | 15 min | Traduzir critérios de negócio em filtros corretos. |
| 5 | YT-005 | NULL, COALESCE e CASE: evitando respostas erradas | hibrido | 15 min | Tratar ausência de dados e criar regras de classificação confiáveis. |
| 6 | YT-006 | Métricas com COUNT, SUM, AVG, MIN e MAX | pratico | 14 min | Calcular métricas básicas e distinguir contagem de linhas, valores e entidades. |
| 7 | YT-007 | GROUP BY e HAVING: agregações sem confusão | pratico | 16 min | Resumir métricas por dimensão e filtrar grupos corretamente. |
| 8 | YT-008 | JOIN sem mistério: como as tabelas se relacionam | hibrido | 18 min | Compreender chaves e usar INNER/LEFT JOIN com intenção. |
| 9 | YT-009 | O perigo dos JOINs: duplicação, granularidade e conferência | pratico | 17 min | Detectar fan-out e validar totais antes e depois de um join. |
| 10 | YT-010 | Datas no SQL: mês, semana, intervalo e comparação | pratico | 16 min | Criar recortes temporais e séries mensais reproduzíveis. |
| 11 | YT-011 | Limpeza de texto com SQL: strings, categorias e padronização | pratico | 14 min | Limpar e padronizar campos textuais para análise. |
| 12 | YT-012 | Subqueries: quando usar e quando evitar | hibrido | 14 min | Resolver consultas em camadas e reconhecer quando uma CTE será mais clara. |
| 13 | YT-013 | CTEs com WITH: SQL legível em etapas | pratico | 16 min | Estruturar uma análise complexa em blocos testáveis. |
| 14 | YT-014 | Window Functions: analisando sem perder o detalhe | hibrido | 17 min | Entender `OVER`, `PARTITION BY` e a diferença para `GROUP BY`. |
| 15 | YT-015 | Ranking e Top N por categoria com ROW_NUMBER e RANK | pratico | 15 min | Encontrar os melhores produtos/clientes dentro de cada grupo. |
| 16 | YT-016 | LAG, LEAD e total acumulado: comparações ao longo do tempo | pratico | 17 min | Calcular variação, valor anterior e acumulados. |
| 17 | YT-017 | UNION, INTERSECT, EXCEPT e deduplicação consciente | hibrido | 14 min | Combinar conjuntos sem esconder duplicidades acidentalmente. |
| 18 | YT-018 | Qualidade de dados com SQL: nulos, duplicados e regras inválidas | pratico | 17 min | Criar checagens de qualidade reutilizáveis antes de analisar. |
| 19 | YT-019 | KPIs de vendas: receita, ticket médio, clientes e margem | pratico | 19 min | Construir uma camada de métricas com definições explícitas. |
| 20 | YT-020 | Funil de conversão em SQL: visita, carrinho, compra | pratico | 19 min | Medir conversão por etapa sem misturar usuários e eventos. |
| 21 | YT-021 | Coortes e retenção: uma análise avançada passo a passo | pratico | 22 min | Criar matriz de retenção por coorte e interpretar o resultado. |
| 22 | YT-022 | SQL lento? EXPLAIN, índices e consultas mais eficientes | hibrido | 18 min | Ler um plano básico e corrigir desperdícios comuns sem otimização prematura. |
| 23 | YT-023 | Boas práticas de SQL profissional: padrão, revisão e manutenção | hibrido | 16 min | Escrever SQL claro, consistente, testável e seguro para o time. |
| 24 | YT-024 | Projeto final: análise completa de um e-commerce com SQL | pratico | 28 min | Entregar uma análise executiva reproduzível e publicável no portfólio. |

## Estratégia da série

- **Hook:** “Você não precisa decorar SQL; precisa aprender a transformar perguntas de negócio em respostas corretas.”
- **Progressão:** fundamentos → agregação → relacionamentos → SQL intermediário → análises avançadas → qualidade/performance → capstone.
- **Projeto contínuo:** o mesmo e-commerce sintético acompanha toda a playlist, evitando exemplos desconectados.
- **GitHub dos alunos:** esta playlist terá um repositório público próprio, `Linhares015/youtube-sql-para-analistas`, com ambiente reproduzível, dataset, scripts, exercícios e materiais por vídeo. Os alunos poderão clonar o projeto e acompanhar a evolução da série.
- **Teoria e prática:** conceitos visuais curtos preparam execuções reais; vídeos marcados como `pratico` usam captura cronológica contínua da tela real do Fedora em pelo menos 80% da parte útil.
- **Boas práticas transversais:** granularidade, validação de totais, nomes claros, consultas em etapas, comentários úteis, ausência de `SELECT *` em entregáveis e definição explícita de métricas.
- **Materiais planejados após aprovação:** dataset/gerador, script de carga, consultas por aula, desafios, soluções, README versionado e projeto final.
- **CTA natural:** convidar o espectador a executar a consulta, comparar o resultado e publicar a solução do projeto final, em vez de pedir engajamento de forma genérica.

## Como acompanhar

Clone este repositório e use os materiais da pasta `aulas/`. Novos exercícios e consultas serão adicionados de forma progressiva conforme os vídeos forem publicados.
