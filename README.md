# Transformation Digitale et Performance Boursière : Modélisation Économétrique

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![R](https://img.shields.io/badge/R-%E2%89%A54.0-blue.svg)](https://www.r-project.org/)
![PFE](https://img.shields.io/badge/PFE-2025-green.svg)

## Description

Ce dépôt contient le projet de recherche complet examinant la relation entre la **maturité digitale (MD)** et la **performance boursière (PB)** des entreprises cotées à la Bourse de Casablanca. L'étude emploie l'économétrie de données de panel, l'analyse en composantes principales (ACP) et de multiples tests de robustesse pour quantifier l'impact de la transformation digitale sur les résultats financiers des entreprises.

**Auteur :** BOUKHIT KHALID  
**Année :** 2025  
**Langage :** R  
**Contact :** khalid.boukhit01@gmail.com

---

## Questions de Recherche et Hypothèses

| Hypothèse | Description |
|-----------|-------------|
| **H1** | Les entreprises ayant une maturité digitale élevée génèrent de meilleures performances boursières |
| **H2** | Le niveau d'investissement digital influence positivement le ratio Cours/Valeur Comptable (PBR) |
| **H3** | Les entreprises digitalisées versent des dividendes plus élevés |
| **H4** | L'impact de la maturité digitale sur la performance varie selon les secteurs |
| **H5** | Les entreprises anciennes bénéficient moins de la digitalisation que les jeunes |

---

## Méthodologie

1. **Construction d'Indices Composites** — Analyse en Composantes Principales (ACP) pour construire :
   - **MD (Maturité Digitale)** à partir de : `engagementDirection`, `Competences`, `Automatisation`, `AdoptionTech`, `CoutsOperationnels`, `InvestissementDigital`
   - **PB (Performance Boursière)** à partir de : `CapitalSocial`, `CapitauxPropres`, `CA`, `BPA`, `ROE`, `DividendYield`, `PER`, `ROA`

2. **Modèles de Données de Panel** — MCO poolés, Effets Fixes (Within), Between, Effets Aléatoires, validés via :
   - Test F de Fisher (pooling vs. within)
   - Test de Hausman (within vs. random)
   - Test de Breusch-Pagan (hétéroscédasticité)
   - Test de Durbin-Watson (autocorrélation)

3. **Robustesse et Extensions :**
   - Régression Tobit (données censurées)
   - Modèles dynamiques (variable dépendante retardée)
   - Variables Instrumentales (régression IV)
   - Spécification de Mundlak
   - Modèles Additifs Généralisés (GAM)
   - Régression quantile
   - Validation croisée (10-fold)
   - Analyse de survie (modèle de Cox)
   - Regression Discontinuity Design (RDD)

---

## Structure du Dépôt

```
github-repo-fr/
├── README.md                              # Ce fichier
├── LICENSE                                # Licence MIT
├── requirements.R                         # Installation automatique des dépendances R
├── .gitignore                             # Fichiers à ignorer par Git
├── code/
│   └── Transformation_digitale_performance.Rmd   # Analyse principale
│   └── Transformation_digitale_performance.html  # Rendu HTML de l'analyse
├── examples/
│   ├── AnalyseExploratoire.Rmd            # Exploration des données et visualisation
│   ├── AnalyseExploratoire.html           # Rendu HTML
│   ├── TestHypothese.Rmd                  # Guide étape par étape des tests d'hypothèses
│   └── TestHypothese.html                 # Rendu HTML
├── docs/
│   ├── methodologie.md                    # Description détaillée de la méthodologie
│   └── resultats.md                       # Résumé des résultats clés
├── Figures/
│   ├── ACP/                               # Graphiques de l'analyse en composantes principales
│   ├── Regression/                        # Graphiques des régressions et diagnostics
│   └── Statistiques/                      # Statistiques descriptives
└── data/
    ├── TDPBMD.csv                         # Jeu de données
    └── README_donnees.md                  # Dictionnaire complet des variables
```

---

## Installation

### Prérequis

- R >= 4.0
- RStudio (recommandé)
- LaTeX (optionnel, pour la compilation de rapports)

### Installer les Dépendances

Exécuter le script fourni :

```r
source("requirements.R")
```

Ou installer manuellement :

```r
install.packages(c(
  "readr", "FactoMineR", "ggplot2", "dplyr", "tidyr", "explor", "plm", "ggrepel",
  "scales", "car", "plotly", "lme4", "sampleSelection", "lmtest", "sandwich",
  "censReg", "lfe", "stargazer", "quantreg", "dynlm", "ivreg", "caret",
  "AER", "mediation", "nnet", "rdrobust", "mgcv", "survival", "survminer",
  "interactions", "broom", "viridis"
))
```

---

## Utilisation

### Exécuter l'Analyse Principale

Ouvrir et tricoter (Knit) le fichier RMarkdown dans RStudio :

```r
rmarkdown::render("code/Transformation_digitale_performance.Rmd")
```

Ou cliquer sur le bouton **Knit** dans RStudio après avoir ouvert le fichier `.Rmd`.

### Exécuter les Exemples

```r
rmarkdown::render("examples/AnalyseExploratoire.Rmd")
rmarkdown::render("examples/TestHypothese.Rmd")
```

Les fichiers HTML pré-rendus sont inclus pour consultation directe sans exécution.

---

## Jeu de Données

Le fichier `data/TDPBMD.csv` contient des **données de panel** pour des entreprises cotées à la Bourse de Casablanca sur la période 2021-2023.

| Variable | Description |
|----------|-------------|
| `id` | Nom de l'entreprise |
| `year` | Année (2021, 2022, 2023) |
| `Secteur` | Secteur économique |
| `Age` | Âge de l'entreprise |
| `collaborateurs` | Nombre d'employés |
| `engagementDirection` | Engagement de la direction (1-5) |
| `Competences` | Niveau des compétences (1-5) |
| `Automatisation` | Niveau d'automatisation (1-5) |
| `AdoptionTech` | Adoption technologique (1-5) |
| `CoutsOperationnels` | Coûts opérationnels (1-5) |
| `InvestissementDigital` | Investissement digital (1-5) |
| `ResponsableDigitale` | Présence d'un responsable digital (0/1) |
| `CapitalSocial` | Capital social |
| `CapitauxPropres` | Capitaux propres |
| `CA` | Chiffre d'affaires |
| `BPA` | Bénéfice par action |
| `ROE` | Retour sur capitaux propres |
| `ROA` | Retour sur actifs |
| `PER` | Ratio cours/bénéfice |
| `PBR` | Ratio cours/valeur comptable |
| `DividendYield` | Rendement du dividende |
| `Dividendes` | Dividendes distribués |
| `Capitalisation` | Capitalisation boursière |
| `Concurrence` | Niveau de concurrence (1-5) |

Consulter `data/README_donnees.md` pour le dictionnaire complet.

---

## Résultats Principaux

- **H1 confirmée :** La maturité digitale (MD) a un effet positif et statistiquement significatif sur la performance boursière (PB), validé à travers les spécifications poolées, within, between et effets aléatoires.
- **H2 confirmée :** L'investissement digital corrèle positivement avec le PBR, robuste aux spécifications log-linéaires et aux erreurs standards robustes à l'hétéroscédasticité.
- **H3 confirmée :** Une MD plus élevée corrèle avec des dividendes accrus, validé via les modèles Tobit et la discontinuité de régression.
- **H4 confirmée :** L'hétérogénéité sectorielle est significative ; les effets d'interaction avec les variables sectorielles améliorent l'ajustement du modèle.
- **H5 confirmée :** L'âge modère la relation MD-PB ; les jeunes entreprises présentent des bénéfices de digitalisation plus forts, confirmé par les surfaces d'interaction GAM et l'analyse de survie.

---

## Citation

Si vous utilisez ce travail, citer comme suit :

```
BOUKHIT, K. (2025). Transformation digitale et performance boursière :
Modélisation économétriques. [Projet de Fin d'Études]
```

---

## Licence

Licence MIT. Consulter le fichier `LICENSE` pour les détails.
