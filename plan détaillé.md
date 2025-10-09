# Plan détaillé pour MIE2026 - Short Communication

## 1. Introduction
- Contexte & enjeu : la pertinence du Patient Blood Management (PBM). (Quelques chiffres, recommandations internationales / françaises, bénéfices attendus)
- Le défi de l’implémentation clinique réelle — l’écart entre recommandations et pratique.
- Besoin de **monitoring continu / temps réel** des métriques qualité de PBM.
- Le programme If-PBM en France : financement innovant, objectif, contraintes (article 51, etc.).
- Proposition : développer des tableaux de bord déclenchés depuis un EDS / base graphe pour surveiller l’adhésion aux recommandations PBM dans les hôpitaux.

(Court rappel de la mission : intégrer technologie / système clinique → cadrage dans le « integration of information technology within real health care systems ») [MIE2026](https://mie2026.efmi.org/call-for-papers)


## 2. Matériels et méthodes
- Présentation de l’EDS PREDIMED : architecture, sources de données intégrées (données cliniques, transfusionnelles, prescriptions, labo…), et connexion à une base graphe (entités : patient, transfusion, prescription, événement) => citation article "PREDIMED: Clinical Data Warehouse of Grenoble Alpes University Hospital" (Artemova et al.)
- Stratégie d’extraction / linkage :  
      • quelles données sont nécessaires pour chaque recommandation PBM (ex : Hb préop, taux de fer, quantité de culots, délais entre prescriptions)  
      • comment la base graphe permet de relier culots et patients, de « naviguer » dans les relations entre événements  
      • pipeline de transformation / nettoyage / agrégation
- Automatisation & infogérance : mise en production périodique (trimestrielle pour le moment), déclenchement de génération des tableaux de bord, diffusion (web, intranet, PDF, email)
- Architecture technique succincte (frameworks, langages, sécurité, anonymisation) : orchestrateur Talend, scripts SQL et Python


## 3. Résultats

- Indicateurs de déploiement :  
      • nombre de tableaux de bord générés / périodicité  
      • nombre de services / patients couverts  
      • volumes de données traitées (ex. nombre de transfusions, prescriptions, entités dans le graphe)
- Exemplaires : 1 ou 2 visuels de dashboard (capture réduite) montrant par ex. la proportion de patients respectant une recommandation donnée, des alertes de non-conformité, des tendances temporelles
- Observations initiales : écart identifié entre recommandations et pratique, variations selon les services, alertes fréquentes, etc.
  
## 4. Discussion

- Ce qui fonctionne : l’intégration EDS ↔ base graphe → dashboards comme outil de surveillance continue   
- Limites / défis : latence des données, qualité / complétude des données, automatisation à renforcer, besoin de gouvernance des données, acceptation clinique
- Potentiel futur : mise en place avec nouvelle architecture D2H (entrepôt de données de santé régional, avec data stack modern Dagster/dbt, architecture médaillon et modèle pivot en OMOP-like) ; mesurer impact sur les pratiques ; adaptation généralisée à d’autres indicateurs qualité
- Leçons pour la communauté de l’informatique de santé : retours d’expérience, contraintes réelles d’un système hospitalier, utilisation d'un entrepôt de données sur autre chose que des problèmes de recherche mais aussi d'indicateurs de qualité de soins pour adhésion de la communauté médicale