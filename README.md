# 📊 Determinantes Socioeconômicos do Voto nas Eleições de 2002

Projeto acadêmico desenvolvido na disciplina de Estatística Multivariada com o objetivo de investigar a relação entre indicadores socioeconômicos e o padrão de votação no segundo turno das eleições presidenciais brasileiras de 2002.

Autor: **Arthur Pereira Gon**

---

## 🎯 Objetivo

Analisar como variáveis socioeconômicas, educacionais, demográficas e de saúde influenciam a predominância de votos na:

- Oposição (Lula)
- Situação (José Serra)

Para isso, foi utilizada **Análise Fatorial (AF)** como técnica de redução de dimensionalidade.

---

## 🗂️ Base de Dados

O conjunto de dados contém informações dos municípios da região Sudeste do Brasil.

### Variáveis Utilizadas

**Indicadores Socioeconômicos**
- IDHM
- IDHL
- IDHE

**Indicadores Educacionais**
- Alfab00

**Indicadores de Saúde**
- Medico00

**Indicadores Demográficos**
- Pop2000

**Variável Resposta**
- OposicaoGanha (1 = Oposição venceu | 0 = Situação venceu)

---

## 🔎 Metodologia

A análise foi conduzida nas seguintes etapas:

1. Análise descritiva (médias e desvios padrão)
2. Construção da matriz de correlação
3. Verificação da adequação via teste KMO
4. Definição do número de fatores (Critério de Kaiser + Scree Plot)
5. Extração dos fatores principais
6. Interpretação das cargas fatoriais
7. Análise dos escores fatoriais
8. Comparação dos escores com o resultado eleitoral (boxplots)

---

## 📊 Principais Resultados

### 🔹 Fator 1 — Desenvolvimento Socioeconômico

Altas cargas fatoriais para:

- IDHM
- IDHL
- IDHE
- Alfab00

Interpretação:
Representa um índice de desenvolvimento socioeconômico e educacional.

Municípios com maiores escores neste fator apresentaram maior tendência de voto na oposição.

---

### 🔹 Fator 2 — Dimensão Populacional

Maior influência de:

- Pop2000
- Medico00 (contribuição moderada)

Interpretação:
Representa o tamanho populacional dos municípios.

Grandes centros urbanos apresentaram escores mais elevados neste fator.

---

## 📈 Variância Explicada

- Fator 1: 61%
- Fator 2: 18%
- Variância acumulada: 79%

A utilização de dois fatores mostrou-se adequada para representar a estrutura dos dados.

---

## 📦 Pacotes Utilizados (R)

```r
library(psych)
library(dplyr)
library(GPArotation)
library(readxl)
library(corrplot)
library(ggplot2)
library(factoextra)
```

---

## 📌 Conclusão

A análise sugere que:

- Municípios com maior desenvolvimento socioeconômico apresentaram maior probabilidade de voto na oposição.
- A dimensão populacional teve influência menos expressiva quando comparada ao fator socioeconômico.
- A Análise Fatorial foi eficiente na redução da dimensionalidade e interpretação estrutural dos dados.

---

## 🚀 Possíveis Extensões

- Regressão logística utilizando os escores fatoriais
- Aplicação de modelos de cluster
- Comparação com eleições posteriores
- Inclusão de novas variáveis socioeconômicas

---

## 📂 Estrutura do Projeto

```
├── DadosS.xlsx
├── codigo_analise.R
├── Relatorio.pdf
└── README.md
```

---

## 🏫 Contexto Acadêmico

Projeto desenvolvido na disciplina de Estatística Multivariada.
