# Résumé des Résultats

## Jeu de Données

- **Couverture** : Entreprises cotées à la Bourse de Casablanca
- **Période** : 2021–2023
- **Structure** : Panel déséquilibré
- **Secteurs** : Agroalimentaire, Banques, Assurances, Mines, Télécommunications, Santé, Distribution, et autres

## Résultats Principaux

### H1 : Maturité Digitale → Performance Boursière

- **Résultat** : Confirmée
- **Preuve** : Le coefficient MD est positif et statistiquement significatif à travers les estimateurs MCO poolés, effets fixes, effets aléatoires et between.
- **Robustesse** : Confirmée via régression Tobit, modèle dynamique avec retard, régression VI (la statistique F de première étape valide l'instrument), spécification de Mundlak et GAM.
- **Validation croisée** : La VC à 10 blocs confirme le pouvoir prédictif hors échantillon.

### H2 : Investissement Digital → Ratio Cours/Valeur Comptable

- **Résultat** : Confirmée
- **Preuve** : `InvestissementDigital` prédit positivement et significativement le PBR, en contrôlant pour le ROE.
- **Robustesse** : Les résultats persistent sous la spécification log-log et avec les erreurs standards robustes HC3 groupées.

### H3 : Digitalisation → Dividendes Plus Élevés

- **Résultat** : Confirmée
- **Preuve** : Le MD prédit positivement le log(dividendes) dans les modèles poolés et within. Le test de Fisher rejette le pooling, confirmant les effets entitaires.
- **Robustesse** : Le modèle Tobit confirme les résultats en tenant compte de la censure à zéro. Le RDD identifie un effet de seuil au 75e percentile du MD.

### H4 : L'Effet du MD Varie selon le Secteur

- **Résultat** : Confirmée
- **Preuve** : Les interactions avec les variables sectorielles améliorent significativement l'ajustement du modèle. Le modèle dynamique avec contrôles sectoriels confirme la stabilité temporelle.
- **Interprétation** : Les rendements de la maturité digitale ne sont pas uniformes ; des politiques spécifiques par secteur sont nécessaires.

### H5 : L'Âge Modère la Relation MD-PB

- **Résultat** : Confirmée
- **Preuve** : Le terme d'interaction MD × Âge est significatif. Les surfaces d'interaction GAM montrent des pentes MD-PB plus abruptes pour les jeunes entreprises.
- **Analyse de survie** : Le modèle de Cox montre que le MD accélère le temps jusqu'à l'adoption technologique élevée, plus prononcé pour les jeunes entreprises.
- **Interprétation** : Les jeunes entreprises capturent les bénéfices de la digitalisation plus rapidement ; les anciennes font face à une inertie structurelle.

### Bonus : Présence d'un Responsable Digital

- **Résultat** : Les entreprises avec un responsable digital dédié affichent des scores PB moyens plus élevés et des distributions PB plus resserrées.
- **Visualisation** : Le diagramme en boîte et les nuages de points confirment l'association.

## Figures Générées

| Fichier | Contenu |
|---------|---------|
| `Figures/MD_distribution.png` | Histogramme de l'indice de maturité digitale |
| `Figures/PB_distribution.png` | Histogramme de l'indice de performance |
| `Figures/scale_location.png` | Graphique diagnostique Scale-Location |
| `Figures/MD_Age_interaction.png` | Surface d'interaction GAM : MD × Âge → PB |
| `Figures/responsable_digitale_boxplot.png` | PB selon la présence d'un responsable digital |
| `Figures/RDD_dividends.png` | Discontinuité de régression au seuil MD |
| `Figures/ACP/` | Graphiques de l'analyse en composantes principales |
| `Figures/Regression/` | Graphiques des régressions et diagnostics |
| `Figures/Statistiques/` | Statistiques descriptives |
