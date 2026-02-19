📊 Determinantes Socioeconômicos do Voto nas Eleições de 2002

Projeto acadêmico desenvolvido na Universidade Federal de São Carlos (UFSCar), no Departamento de Estatística, com o objetivo de investigar a relação entre indicadores socioeconômicos e o padrão de votação no segundo turno das eleições presidenciais brasileiras de 2002.

Autor: Arthur Pereira Gon

🎯 Objetivo

Analisar como variáveis socioeconômicas, educacionais, demográficas e de saúde influenciam a predominância de votos na:

Oposição (Lula)

Situação (José Serra)

Para isso, foi utilizada Análise Fatorial (AF) como técnica de redução de dimensionalidade, permitindo identificar fatores latentes que explicam o comportamento conjunto das variáveis.

🗂️ Base de Dados

O conjunto de dados contém informações dos municípios da região Sudeste do Brasil, incluindo:

🗳️ Variáveis Eleitorais

Oposicao

Situacao

OposicaoGanha

📈 Indicadores Socioeconômicos

IDHM

IDHL

IDHE

🎓 Indicadores Educacionais

Alfab00

🏥 Indicadores de Saúde

Medico00

👥 Indicadores Demográficos

Pop2000

🔎 Metodologia

A análise seguiu as seguintes etapas:

Análise Descritiva

Cálculo de médias e desvios padrão

Identificação da necessidade de uso da matriz de correlação

Matriz de Correlação

Identificação de alta correlação entre IDHM, IDHL, IDHE e Alfab00

Baixa correlação da variável Pop2000 com as demais

Definição do Número de Fatores

Critério de autovalores maiores que 1

Scree Plot

Escolha de 2 fatores principais

Teste KMO

KMO Geral = 0.69

Adequação considerada razoável para aplicação da Análise Fatorial

Extração e Interpretação dos Fatores

📊 Principais Resultados
🔹 Fator 1 — Desenvolvimento Socioeconômico

Altas cargas fatoriais para:

IDHM

IDHL

IDHE

Alfab00

Interpretação:
Representa um índice de desenvolvimento socioeconômico e educacional.

Municípios com maiores valores nesse fator tendem a:

Ter maior IDH

Maior taxa de alfabetização

Maior infraestrutura

Maior probabilidade de vitória da oposição

🔹 Fator 2 — Dimensão Populacional

Altas cargas fatoriais para:

Pop2000

Medico00 (contribuição moderada)

Interpretação:
Representa uma dimensão associada ao tamanho populacional dos municípios.

Exemplos de municípios com altos escores nesse fator:

São Paulo

Rio de Janeiro

Belo Horizonte

📌 Conclusões

O desenvolvimento socioeconômico mostrou-se um fator importante na diferenciação do padrão de voto.

Municípios mais desenvolvidos apresentaram tendência maior de voto na oposição.

A dimensão populacional também influencia o comportamento eleitoral, especialmente nas capitais e grandes centros urbanos.

A Análise Fatorial permitiu reduzir a complexidade dos dados mantendo aproximadamente 79% da variância explicada.

🛠️ Técnicas Estatísticas Utilizadas

Estatística Descritiva

Matriz de Correlação

Critério de Kaiser (autovalores > 1)

Scree Plot

Teste KMO

Análise Fatorial por Componentes Principais

📚 Contexto Acadêmico

Projeto desenvolvido na disciplina de Estatística Multivariada, com foco em interpretação estatística e aplicação prática de métodos de redução de dimensionalidade.

🚀 Possíveis Extensões

Aplicação de modelos de regressão logística

Comparação com eleições posteriores

Uso de modelos de cluster para segmentação de municípios

Inclusão de variáveis adicionais como renda per capita e desigualdade
