# Méthodologie

## Vue d'Ensemble

Cette recherche quantifie la relation entre la **maturité de la transformation digitale** et la **performance boursière** en utilisant l'économétrie de données de panel sur des entreprises cotées à la Bourse de Casablanca.

## 1. Construction d'Indices Composites

### Indice de Maturité Digitale (MD)

Six indicateurs ordinaux (échelle 1-5) sont réduits à un score composite unique via **l'Analyse en Composantes Principales (ACP)** :

| Composante | Signification |
|------------|---------------|
| `engagementDirection` | Engagement de la direction |
| `Competences` | Compétences digitales |
| `Automatisation` | Automatisation des processus |
| `AdoptionTech` | Adoption technologique |
| `CoutsOperationnels` | Efficacité des coûts |
| `InvestissementDigital` | Investissement digital |

La première composante principale est extraite et redimensionnée linéairement vers [0, 100].

### Indice de Performance Boursière (PB)

Huit indicateurs financiers sont similarly réduits via ACP :

- `CapitalSocial`, `CapitauxPropres`, `CA`, `BPA`, `ROE`, `DividendYield`, `PER`, `ROA`

Le nombre de composantes retenues est le minimum nécessaire pour expliquer ≥ 80 % de la variance totale. Les composantes sont pondérées par leur pourcentage de variance expliquée et redimensionnées vers [0, 100].

## 2. Modèles Économétriques

### 2.1 Spécifications de Données de Panel

Quatre estimateurs sont comparés pour chaque hypothèse :

| Modèle | Hypothèse | Cas d'Utilisation |
|--------|-----------|-------------------|
| **MCO Poolés** | Pas d'effets individuels | Référence |
| **Within (Effets Fixes)** | Interceptes spécifiques à chaque entité | Contrôle l'hétérogénéité invariante |
| **Between** | Variation uniquement inter-entités | Capture les effets entre entités |
| **Effets Aléatoires** | Effets individuels aléatoires | GLS, efficace si hypothèses vérifiées |

### 2.2 Tests de Sélection de Modèle

- **Test F de Fisher** : Teste si les effets fixes sont conjointement significatifs (poolés vs. within). Le rejet favorise within.
- **Test de Hausman** : Teste la corrélation entre les effets individuels et les régresseurs (within vs. aléatoires). Le rejet favorise within.

### 2.3 Tests Diagnostiques

- **Shapiro-Wilk** : Normalité des résidus (H₀ : normale)
- **Breusch-Pagan** : Homoscédasticité (H₀ : variance constante)
- **Durbin-Watson** : Autocorrélation d'ordre 1 (H₀ : pas d'autocorrélation)
- **Bera-Godfrey (pbgtest)** : Autocorrélation d'ordre supérieur dans les panels

## 3. Méthodes de Robustesse

### 3.1 Régression Tobit

Gère les données censurées (ex : dividendes ≥ 0). Utilise l'estimation du maximum de vraisemblance avec des bornes de censure.

### 3.2 Modèles Dynamiques

Les variables indépendantes retardées (`L(MD, 1)`) capturent la dépendance temporelle et atténuent la causalité inverse.

### 3.3 Variables Instrumentales (VI)

Le MD retardé est utilisé comme instrument pour le MD courant afin de traiter l'endogénéité. La statistique F de première étape valide la force de l'instrument (règle : F > 10).

### 3.4 Spécification de Mundlak

Teste si les hypothèses d'effets aléatoires sont vérifiées en incluant les moyennes entitaires des régresseurs variants dans le temps comme contrôles additionnels.

### 3.5 Modèles Additifs Généralisés (GAM)

Les fonctions lisses non-paramétriques `s(MD)` détectent les relations non-linéaires que les modèles linéaires peuvent manquer. L'argument `by = Age` teste les surfaces d'interaction.

### 3.6 Validation Croisée

La validation croisée à 10 blocs évalue la performance prédictive hors échantillon et protège contre le surajustement.

### 3.7 Regression Discontinuity Design (RDD)

Teste les effets de seuil au 75e percentile de la distribution du MD.

### 3.8 Analyse de Survie (Modèle de Cox)

Modélise le temps jusqu'à l'événement (adoption technologique élevée) en fonction de la maturité digitale, en contrôlant pour l'âge de l'entreprise.

## 4. Hypothèses

| N° | Hypothèse | Variable Dépendante | Régresseur Clé | Contrôles |
|----|-----------|---------------------|----------------|-----------|
| H1 | MD → PB | Indice PB | MD | — |
| H2 | Investissement digital → PBR | PBR | InvestissementDigital | ROE |
| H3 | MD → Dividendes | log(Dividendes) | MD | collaborateurs |
| H4 | MD × Secteur | PB | MD + Secteur | Âge, collaborateurs |
| H5 | MD × Âge | PB | Interaction MD × Âge | — |
