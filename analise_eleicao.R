# ============================================================
# Determinantes Socioeconômicos do Voto nas Eleições de 2002
# Autor: Arthur Pereira Gon
# UFSCar - Departamento de Estatística
# ============================================================
# NOTA: Para rodar este script, você precisa do arquivo DadosS.xlsx
# com os dados dos municípios da região Sudeste do Brasil.
# ============================================================

# Pacotes necessários
library(psych)
library(dplyr)
library(GPArotation)
library(readxl)
library(corrplot)
library(ggplot2)
library(factoextra)

# ── 1. CARREGANDO OS DADOS ───────────────────────────────────
# Altere o caminho abaixo para o local do arquivo no seu computador
DadosS <- read_excel("DadosS.xlsx")

# Selecionando as variáveis quantitativas de interesse
Dados1 <- DadosS[, 8:16]
d1 <- Dados1[, 3]
d2 <- Dados1[, 5:9]
dados2 <- cbind(d1, d2)
dados2 <- na.omit(dados2)

# ── 2. ANÁLISE DESCRITIVA ────────────────────────────────────
# Médias
media <- cbind(
  mean(dados2$IDHM),
  mean(dados2$IDHL),
  mean(dados2$IDHE),
  mean(dados2$Alfab00),
  mean(dados2$Medico00),
  mean(dados2$Pop2000)
)
round(media[1, ], 2)

# Desvios-padrão
cov1 <- cov(dados2)
desvio <- sqrt(diag(cov1))
round(desvio, 2)

# ── 3. MATRIZ DE CORRELAÇÃO ──────────────────────────────────
corr1 <- cor(dados2)
round(corr1, 3)

# Gráfico das correlações
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(corr1,
  method = "circle", col = col(200),
  type = "upper",
  addCoef.col = "black",
  tl.col = "black", tl.srt = 45
)

# ── 4. AUTOVALORES E SCREE PLOT ──────────────────────────────
eigen_result <- eigen(corr1)
eigen_result

plot(eigen_result$values,
  type = "b",
  ylab = "Autovalores",
  main = "Scree Plot - Correlação Pearson"
)

# ── 5. TESTE KMO ─────────────────────────────────────────────
KMO(dados2)

# ── 6. ANÁLISE FATORIAL — 2 FATORES (SEM ROTAÇÃO) ───────────
Fa2 <- principal(dados2,
  nfactors = 2,
  n.obs = 1668,
  rotate = "none",
  scores = TRUE
)

Fa2

# Cargas fatoriais e comunalidades
round(Fa2$loadings, 3)
round(Fa2$communality, 3)

# ── 7. GRÁFICO DAS CARGAS FATORIAIS ─────────────────────────
correlations <- data.frame(
  Variable = c("IDHM", "IDHL", "IDHE", "Alfab00", "Medico00", "Pop2000"),
  PC1 = c(0.98, 0.77, 0.94, 0.94, 0.54, 0.21),
  PC2 = c(-0.10, -0.30, -0.04, -0.09, 0.50, 0.86)
)

theta <- seq(0, 2 * pi, length.out = 100)
circle <- data.frame(x = cos(theta), y = sin(theta))

ggplot() +
  geom_path(data = circle, aes(x, y), color = "black", linetype = "dashed") +
  geom_segment(data = correlations,
    aes(x = 0, y = 0, xend = PC1, yend = PC2),
    arrow = arrow(length = unit(0.2, "cm")), color = "blue"
  ) +
  geom_text(data = correlations,
    aes(x = PC1, y = PC2, label = Variable),
    vjust = 1, hjust = 1, color = "black"
  ) +
  coord_fixed() +
  labs(title = "Correlação dos Componentes Principais", x = "PC1", y = "PC2") +
  theme_minimal()

# ── 8. DIAGRAMA DE CAMINHOS ──────────────────────────────────
fa.diagram(Fa2, cut = 0.5)

# ── 9. ESCORES FATORIAIS ─────────────────────────────────────
escores <- Fa2$scores
escores_df <- as.data.frame(escores)
escores_df$Observacao <- rownames(escores_df)

# Gráfico dos escores
ggplot(escores_df, aes(x = PC1, y = PC2, label = Observacao)) +
  geom_point(color = "blue") +
  geom_text(vjust = -0.5, size = 3) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
  geom_vline(xintercept = 0, linetype = "dashed", color = "black") +
  labs(title = "Gráfico dos Escores Fatoriais", x = "Fator 1", y = "Fator 2") +
  theme_minimal()

# ── 10. ANÁLISE FATORIAL COM ROTAÇÃO VARIMAX ─────────────────
pca_varimax <- principal(dados2, nfactors = 2, rotate = "varimax")
print(pca_varimax, cutoff = 0.3)

varimax_df <- data.frame(
  var = c("IDHM", "IDHL", "IDHE", "Alfab00", "Medico00", "Pop2000"),
  RC1 = c(0.97, 0.82, 0.91, 0.92, 0.36, -0.05),
  RC2 = c(0.19, -0.06, 0.24, 0.19, 0.64, 0.88)
)

ggplot() +
  geom_path(data = circle, aes(x, y), color = "black", linetype = "dashed") +
  geom_segment(data = varimax_df,
    aes(x = 0, y = 0, xend = RC1, yend = RC2),
    arrow = arrow(length = unit(0.2, "cm")), color = "blue"
  ) +
  geom_text(data = varimax_df,
    aes(x = RC1, y = RC2, label = var),
    vjust = 1, hjust = 1, color = "black"
  ) +
  coord_fixed() +
  labs(x = "PC1", y = "PC2") +
  theme_minimal()

# ── 11. ESCORES + RESULTADO ELEITORAL ────────────────────────
escores_df$OposicaGanha <- DadosS$OposicaGanha

# Scatterplot dos escores por resultado eleitoral
ggplot(escores_df, aes(x = PC1, y = PC2, color = as.factor(OposicaGanha))) +
  geom_point(alpha = 0.7, size = 3) +
  geom_text(aes(label = DadosS$Nome), vjust = -0.5, hjust = 0.5, size = 3) +
  scale_color_manual(
    values = c("blue", "red"),
    labels = c("Situação Ganhou", "Oposição Ganhou")
  ) +
  labs(
    title = "Distribuição dos Escores Fatoriais",
    x = "Fator 1", y = "Fator 2"
  ) +
  theme_minimal() +
  theme(legend.title = element_blank())

# Boxplot Fator 1 por resultado eleitoral
ggplot(escores_df, aes(x = as.factor(OposicaGanha), y = PC1,
                        fill = as.factor(OposicaGanha))) +
  geom_boxplot(alpha = 0.6) +
  scale_fill_manual(
    values = c("blue", "red"),
    labels = c("Situação Ganhou", "Oposição Ganhou")
  ) +
  labs(
    title = "Distribuição do Fator 1 por Resultado Eleitoral",
    x = "Resultado Eleitoral", y = "Fator 1"
  ) +
  theme_minimal() +
  theme(legend.title = element_blank())

# Boxplot Fator 2 por resultado eleitoral
ggplot(escores_df, aes(x = as.factor(OposicaGanha), y = PC2,
                        fill = as.factor(OposicaGanha))) +
  geom_boxplot(alpha = 0.6) +
  scale_fill_manual(
    values = c("blue", "red"),
    labels = c("Situação Ganhou", "Oposição Ganhou")
  ) +
  labs(
    title = "Distribuição do Fator 2 por Resultado Eleitoral",
    x = "Resultado Eleitoral", y = "Fator 2"
  ) +
  theme_minimal()

# ── 12. ESTATÍSTICAS DESCRITIVAS POR GRUPO ───────────────────
escores_grupo0 <- subset(escores_df, OposicaGanha == 0)
escores_grupo1 <- subset(escores_df, OposicaGanha == 1)

summary(escores_grupo0)
summary(escores_grupo1)
