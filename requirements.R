# Dépendances R - Installation automatique
# Exécuter : source("requirements.R") pour installer tous les paquets requis

packages <- c(
  "readr", "FactoMineR", "ggplot2", "dplyr", "tidyr", "explor", "plm", "ggrepel",
  "scales", "car", "plotly", "lme4", "sampleSelection", "lmtest", "sandwich",
  "censReg", "lfe", "stargazer", "quantreg", "dynlm", "ivreg", "caret",
  "AER", "mediation", "nnet", "rdrobust", "mgcv", "survival", "survminer",
  "interactions", "broom", "viridis", "knitr", "rmarkdown"
)

new_packages <- packages[!(packages %in% installed.packages()[, "Package"])]

if (length(new_packages) > 0) {
  message("Installation des paquets manquants : ", paste(new_packages, collapse = ", "))
  install.packages(new_packages, dependencies = TRUE)
} else {
  message("Tous les paquets requis sont déjà installés.")
}
