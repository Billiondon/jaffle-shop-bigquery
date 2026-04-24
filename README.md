<br />
<div align="center">
  <h3 align="center">Pipeline Analytics : Jaffle Shop (Édition BigQuery)</h3>

  <p align="center">
    Migration et fiabilisation d'un flux décisionnel sur Google Cloud Platform.
    <br />
    <a href="https://github.com/ton-username/jaffle-shop-bigquery"><strong>Explorer la documentation »</strong></a>
    <br />
    <br />
    <a href="#usage">Voir Démo</a>
    ·
    <a href="https://github.com/ton-username/jaffle-shop-bigquery/issues">Signaler un Bug</a>
  </p>
</div>

<details>
  <summary>Table des matières</summary>
  <ol>
    <li>
      <a href="#about-the-project">À propos du projet</a>
      <ul>
        <li><a href="#built-with">Équipement utilisé</a></li>
      </ul>
    </li>
    <li><a href="#problematique">Problématique</a></li>
    <li>
      <a href="#protocole-suivi">Protocole suivi</a>
    </li>
    <li><a href="#resultat-du-test-effort">Résultat du test d'effort</a></li>
    <li><a href="#usage">Usage & Lineage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
  </ol>
</details>

## À propos du projet

Ce projet détaille la mise en place d'une infrastructure de données robuste sur **Google BigQuery**. L'objectif central était de migrer et de stabiliser le pipeline de données "Jaffle Shop" en assurant une intégrité totale entre l'extraction des graines (seeds) et la modélisation SQL finale.

### Built With

* [![BigQuery][BigQuery-shield]][BigQuery-url]
* [![dbt][dbt-shield]][dbt-url]
* [![GCP][GCP-shield]][GCP-url]
* [![GitHub][GitHub-shield]][GitHub-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Problématique

> "Comment garantir une transition fluide entre des sources de données hétérogènes et un entrepôt BigQuery, tout en assurant l'intégrité et la documentation automatique des transformations ?"

Le défi consistait à neutraliser les risques de régression lors de la migration depuis Snowflake et à transformer des sources brutes en actifs informationnels fiables pour le business.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Protocole suivi

L'intervention a été menée selon un protocole strict pour garantir la stabilité du système :

1.  **Configuration des accès :** Initialisation via *Service Account* Google Cloud avec gestion sécurisée des clés JSON.
2.  **Architecture du projet :** Création d'un dépôt GitHub dédié afin d'isoler l'environnement BigQuery et d'éviter toute contamination inter-plateformes.
3.  **Injection de données :** Chargement et typage des sources brutes (`raw_customers`, `raw_orders`, `raw_payments`) via la fonction `dbt seed`.
4.  **Assurance Qualité :** Révision chirurgicale des modèles SQL et correction des anomalies de schéma pour garantir un succès des tests d'intégrité à 100%.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Résultat du test d'effort

Le pipeline est désormais **opérationnel et stable**. 
* **Flux :** Circulation des données sans perte de paquets ni latence critique.
* **Intégrité :** Validation systématique via `dbt test` (contraintes `unique` et `not_null`).
* **Observabilité :** Documentation technique et *Lineage Graph* à jour, offrant une visibilité souveraine sur la généalogie de la donnée.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage

Pour auditer la santé du pipeline :
```sh
dbt seed
dbt run
dbt test
