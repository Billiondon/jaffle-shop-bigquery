#  Pipeline Analytics : Flux Critique CathLab (BigQuery)

La question de départ : Au bloc de cardio, une donnée qui arrive en retard ou qui est fausse, c'est un risque pour le patient. 
Comment être sûr que le cardiologue voit la bonne info, sur le bon patient, au moment précis où il doit décider ?

 Le projet en bref:
J'ai construit une infrastructure sur BigQuery pour nettoyer et stabiliser les données qui sortent d'un labo de cathétérisme (CathLab). 
L'idée est simple : transformer des relevés bruts (pressions, horaires, infos patients) en un tableau de bord fiable, où chaque chiffre est vérifié automatiquement.

Ma méthode :
Accès verrouillés : J'ai configuré les accès via Google Cloud (Service Account) pour que les données restent privées et sécurisées.
Nettoyage SQL : J'utilise dbt pour transformer les données. On trie ce qui est utile, on normalise les formats et on vire le "bruit" (les erreurs de capteurs).
Tests de sécurité : J'ai mis des gardes-fous numériques. Si un ID patient manque ou s'il y a un doublon, le système m'alerte immédiatement.
Traçabilité totale : Avec le "Lineage Graph", on peut remonter à la source de n'importe quel chiffre. C'est indispensable pour l'audit médical.

Mon setup:
Stockage : Google BigQuery (Robuste et rapide).
Transformation : dbt Cloud (Pour garder un code propre et documenté).
Contrôle : dbt Tests (Vérification de l'intégrité en continu).
Versionnage : GitHub (Pour l'historique des changements).

Résultat final:
Le pipeline est propre et stable. Les données circulent sans accroc. On a une vue claire sur tout le parcours de l'info, de la salle d'op' jusqu'au rapport final.

Commandes rapides:
dbt seed : Charger les données sources.
dbt run : Lancer les calculs.
dbt test : Vérifier que tout est correct.
