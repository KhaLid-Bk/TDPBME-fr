# Dictionnaire des Données

## Jeu de Données : `TDPBMD.csv`

Données de panel pour les entreprises cotées à la Bourse de Casablanca (2021-2023).

### Variables d'Identification

| Variable | Type | Description |
|----------|------|-------------|
| `id` | Caractère | Identifiant de l'entreprise (nom) |
| `year` | Entier | Année d'observation (2021, 2022, 2023) |
| `Secteur` | Facteur | Classification sectorielle |

### Caractéristiques de l'Entreprise

| Variable | Type | Description |
|----------|------|-------------|
| `collaborateurs` | Entier | Nombre d'employés |
| `constitution` | Date | Date de création de l'entreprise (JJ/MM/AAAA) |
| `Age` | Entier | Âge de l'entreprise en années |
| `IPO` | Date | Date d'introduction en bourse (JJ/MM/AAAA) |
| `ResponsableDigitale` | Binaire (0/1) | Présence d'un responsable digital dédié |

### Variables Financières

| Variable | Type | Description |
|----------|------|-------------|
| `CapitalSocial` | Numérique | Capital social (MAD) |
| `CapitauxPropres` | Numérique | Total des capitaux propres (MAD) |
| `NombreTitres` | Entier | Nombre de titres en circulation |
| `ValeurNominale` | Numérique | Valeur nominale par titre |
| `CA` | Numérique | Chiffre d'affaires (MAD) |
| `ResultatExploitation` | Numérique | Résultat d'exploitation (MAD) |
| `ResultatNet` | Numérique | Résultat net (MAD) |
| `BPA` | Numérique | Bénéfice par action |
| `ROE` | Numérique | Retour sur capitaux propres (%) |
| `ROA` | Numérique | Retour sur actifs (%) |
| `Payout` | Numérique | Taux de distribution (%) |
| `DividendYield` | Numérique | Rendement du dividende (%) |
| `PER` | Numérique | Ratio cours/bénéfice |
| `PBR` | Numérique | Ratio cours/valeur comptable |
| `Dividendes` | Numérique | Total des dividendes distribués (MAD) |
| `Capitalisation` | Numérique | Capitalisation boursière (MAD) |

### Indicateurs de Maturité Digitale (Ordinal, échelle 1-5)

| Variable | Description |
|----------|-------------|
| `engagementDirection` | Engagement de la direction envers la transformation digitale |
| `Competences` | Niveau des compétences digitales |
| `Automatisation` | Degré d'automatisation des processus |
| `AdoptionTech` | Taux d'adoption technologique |
| `CoutsOperationnels` | Efficacité des coûts opérationnels issue de la digitalisation |
| `InvestissementDigital` | Niveau d'investissement digital |
| `Concurrence` | Pression concurrentielle dans le secteur |

### Indices Composites (Calculés, non présents dans les données brutes)

| Variable | Description | Construction |
|----------|-------------|--------------|
| `MD` | Indice de Maturité Digitale | Première composante ACP, redimensionnée à [0, 100] |
| `PB` | Indice de Performance Boursière | Composite pondéré par la variance ACP, redimensionné à [0, 100] |

### Notes

- Les valeurs monétaires sont en Dirhams marocains (MAD)
- Les variables ordinales utilisent une échelle de Likert 1-5
- Certaines cellules peuvent contenir `NA` pour les observations manquantes
- Le panel est déséquilibré (toutes les entreprises n'ont pas d'observations pour toutes les années)
