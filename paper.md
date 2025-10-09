---
title: "Real-time dashboards for monitoring adherence to PBM recommendations via graph-based EDS: a case study from Grenoble University Hospital"
author:
  - Thomas Boulier
  - Paul-Antoine Beaudoin
  - Alexandre Moreau-Gaudry
date: "2025"
bibliography: refs.bib
csl: iospress.csl
link-citations: true
---

## 1. Introduction

Patient Blood Management (PBM) is an evidence-based, multidisciplinary approach to optimize patient care and reduce unnecessary transfusion [@shander2022global]. It relies on three pillars: detection and correction of preoperative anemia, reduction of perioperative blood loss, and optimization of anemia tolerance. Despite strong national [@theissen2024perioperative] and international [@tibi2021sts] guidelines, implementing PBM in routine practice remains challenging [@godonReductionRedBlood2024].

In France, the *If-PBM* program was launched as an innovative funding initiative to promote PBM adoption. Yet, a key missing piece is the ability to monitor adherence in real time to evaluate progress and identify improvement opportunities. This paper presents an approach to integrating PBM quality dashboards from a clinical data warehouse.

## 2. Materials and Methods

### PREDIMED data warehouse
The *PREDIMED* platform (*Plateforme de Recueil et d’Exploitation des Données bIoMédicales*) is the clinical data warehouse of Grenoble Alpes University Hospital [@Artemova2019].  
It combines a Hadoop/ELK stack with the **ArangoDB** multi-model graph database, allowing semantic linkage between entities (patients, transfusions, lab tests, prescriptions, hospital stays, etc.).

### Extraction and linkage strategy
Each PBM indicator requires combining several data sources:
- preoperative hemoglobin and iron status (pillar 1),
- intraoperative blood loss and transfusion timing (pillar 2),
- postoperative anemia tolerance (pillar 3).

The graph model enables flexible traversal of relationships between transfused blood units and corresponding patient records.  
Data pipelines are orchestrated via **Talend** and **Python scripts**, producing aggregated metrics quarterly.

### Automation and visualization
Dashboards are generated automatically using SQL and Python scripts and deployed on a secure intranet portal.  
They display compliance trends, transfusion rates, and adherence to Hb thresholds and preoperative anemia correction.

## 3. Results

- **Dashboards deployed:** ?? dashboards across all surgical units.  
- **Frequency:** quarterly updates since 2024.  
- **Volume:** several million transfusion and lab events processed.  

Example indicators include:
- proportion of transfusions respecting Hb thresholds;
- rate of preoperative anemia correction;
- temporal trends per department.  

Preliminary analyses reveal variations between departments and an overall improvement in compliance over time.


## 4. Discussion

Integrating PBM indicators into a graph-based EDS enables **continuous quality monitoring** at hospital scale.  
Compared to prior PBM feedback systems [@Mehra2015], our approach generalizes automation and data integration within a real hospital information system.  
Remaining challenges include data latency, data completeness, and user adoption.  

Future developments will leverage the **regional D2H platform**, built on a modern data stack (Dagster, dbt, OMOP), to generalize real-time PBM monitoring and support adaptive interventions such as micro-learning and feedback loops.

## References
