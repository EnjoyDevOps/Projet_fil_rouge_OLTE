# INSTALLATION Projet_fil_rouge_OLTE

## Installation

- Clonez ce dépôt :
    ```bash
    git clone https://github.com/EnjoyDevOps/Projet_fil_rouge_OLTE.git
    ```

## Table des matières

- [Installation](#installation)
- [Table des matières](#table-des-matières)
- [Construction des images Docker](#construction-des-images-docker)
- [Lancement des Services Kubernetes](#lancement-des-services-kubernetes)
- [Ports des Services](#ports-des-services)
- [Prérequis](#prérequis)
- [Déploiement](#déploiement)

## Construction des images Docker

L'application est composée des images Docker suivantes :

- **react-client** : Interface utilisateur. 
- **react-posts** : Service pour la gestion des posts.
- **react-comments** : Service pour la gestion des commentaires.
- **react-query** : Service pour la gestion des requêtes.
- **react-moderation** : Service pour la modération des commentaires.
- **react-event-bus** : Service pour la gestion des événements entre les services.

Descriptifs des fichiers "dockerfile" :
```bash
##################################################################
#           IMAGE DOCKER  basé sur l'image node:alpine           #
##################################################################
FROM node:alpine
COPY . .
RUN npm install
CMD ["npm", "start"]
```

Pour construire les images Docker, exécuter, à la racine du projet, le script bash ci-dessous :
```bash
$user> ./buildDockerImages
```

### Lancement des Services Kubernetes

Voici les services Kubernetes qui seront lancés :

- **client-srv**: Service pour l'interface utilisateur.
- **posts-clusterip-srv**: Service pour la gestion des posts.
- **query-srv**: Service pour la gestion des requêtes.
- **comments-srv**: Service pour la gestion des commentaires.
- **moderation-srv**: Service pour la modération des commentaires.
- **event-bus-srv**: Service pour la gestion des événements entre les services.

Pour lancer les services Kubernetes, à la racine du projet, exécuter le script bash ci-dessous :
```bash
$user> ./kubeDplServices
```

## Prérequis

- Docker
- Kubernetes