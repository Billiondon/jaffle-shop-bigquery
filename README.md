# Flux Critique CathLab : Fiabilité des données pour la décision en cardiologie interventionnelle

**Problème clinique**  
Au bloc de cathétérisme (CathLab), une donnée erronée ou retardée (pression artérielle, saturation, horaires d’ischémie) peut altérer la décision du cardiologue. Pourtant, les flux bruts issus des capteurs contiennent souvent du bruit, des doublons ou des formats hétérogènes.

**Objectif du projet**  
Construire un pipeline de données robuste (BigQuery + dbt) qui :
1. Nettoie et normalise les signaux physiologiques (pression, débit, temps de procédure).
2. Vérifie automatiquement l’intégrité des données (unicité patient, plages physiologiques, absence de valeurs aberrantes).
3. Fournit une traçabilité complète (lineage graph) pour l’audit et la reproductibilité.

**Stack technique**

| Outil | Rôle |
|-------|------|
| Google BigQuery | Stockage et calcul distribué |
| dbt Cloud | Transformations SQL, documentation, tests |
| GitHub | Versionnage, CI simple |
| dbt‑lineage | Visualisation du tracé des données (audit) |

**Résultats et contrôles mis en place**

- **Sécurité des accès** : Service account Google Cloud + authentification à clé.
- **Tests d’intégrité** (dbt) :
  - `unique` : pas d’identifiant patient duplicate.
  - `not_null` : valeurs critiques (pression, ID) toujours présentes.
  - `accepted_values` : plages physiologiques (ex : pression systolique 60‑200 mmHg).
- **Lineage graph** : chaque tableau de bord peut retracer l’origine de toute mesure jusqu’au capteur.
- **Alerting** : tout test échoue → notification (à paramétrer selon environnement).

**Commande d’exécution**

```bash
dbt seed     # chargement des données sources
dbt run      # exécution des transformations
dbt test     # validation des tests d’intégrité
