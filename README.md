# Socioeconomic Determinants of Voting in the 2002 Brazilian Elections

Factor analysis on municipal-level data from Southeast Brazil to understand what drove voting behavior in the 2002 presidential election (Lula vs. José Serra).

**Author:** Arthur Gon &nbsp;|&nbsp; **Stack:** R &nbsp;|&nbsp; **Technique:** Exploratory Factor Analysis

---

## Key Findings

- Municipalities with higher socioeconomic development showed significantly higher tendency to vote for the opposition (Lula)
- Two factors explained **79% of total variance** in the data (Factor 1: 61%, Factor 2: 18%)
- Factor 1 captured a clear socioeconomic/educational axis (HDI, literacy rate) — strongly correlated with opposition voting
- Factor 2 captured population size — less predictive of voting outcome
- Results validated through hypothesis testing and boxplot comparison of factor scores by electoral outcome

---

## Methodology

Data covers municipalities from Southeast Brazil with socioeconomic, educational, health, and demographic indicators.

**Pipeline:**
1. Descriptive analysis (means, standard deviations, correlation matrix)
2. KMO adequacy test
3. Factor extraction via Kaiser criterion and Scree Plot
4. Factor loading interpretation
5. Factor score analysis and comparison with electoral outcome

**Variables used:** IDHM, IDHL, IDHE, Alfab00, Medico00, Pop2000, OposicaoGanha

---

## Stack

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

## Project Structure

```
├── DadosS.xlsx
├── analise_eleicao.R
├── Relatorio.pdf
└── README.md
```

---

## Possible Extensions

- Logistic regression using factor scores as predictors
- Cluster analysis to group municipalities by voting profile
- Replication with later elections for temporal comparison
- Expansion to other Brazilian regions
