# 🏥 Pipeline Analytics : Jaffle Shop (Édition BigQuery)
"Comment garantir une transition fluide entre des sources de données hétérogènes et un entrepôt BigQuery, tout en assurant l'intégrité et la documentation automatique des transformations"

# Résumé de l'intervention
Mise en place d'une infrastructure de données robuste sur **Google BigQuery**. L'objectif était de migrer et de stabiliser le pipeline de données "Jaffle Shop" en assurant une intégrité totale entre l'extraction des graines (seeds) et la modélisation SQL.

# Équipement utilisé
* **Entrepôt :** Google BigQuery (GCP)
* **Traitement :** dbt Cloud (Fusion latest)
* **Contrôle Qualité :** dbt Core Tests (not_null, unique)
* **Archivage :** GitHub (Version Control)

# Protocole suivi
1.  **Configuration des accès :** Initialisation via Service Account Google Cloud avec clé JSON sécurisée.
2.  **Architecture du projet :** Création d'un dépôt dédié pour éviter toute contamination entre les environnements Snowflake et BigQuery.
3.  **Injection de données :** Chargement des sources brutes (`raw_customers`, `raw_orders`, `raw_payments`) via `dbt seed`.
4.  **Assurance Qualité :** Correction des modèles d'exemple pour garantir le passage des tests d'intégrité à 100%.

# Résultat du test d'effort
Le pipeline est désormais **opérationnel et stable**. Les données circulent sans perte de paquets et la documentation technique (Lineage Graph) est à jour, offrant une visibilité complète sur la généalogie de la donnée.
