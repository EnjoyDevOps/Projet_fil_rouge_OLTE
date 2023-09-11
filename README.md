# INSTALLATION Projet_fil_rouge_OLTE

## Prérequis

- Docker
- Kubernetes
- Votre navigateur préféré

## Installation

  Clonez ce dépôt :
  ```bash
    git clone https://github.com/EnjoyDevOps/Projet_fil_rouge_OLTE.git
  ```

## Table des matières

- [Prérequis](#prérequis)
- [Installation](#installation)
- [Table des matières](#table-des-matières)
- [Construction des images Docker](#construction-des-images-docker)
- [Lancement des Services Kubernetes](#lancement-des-services-kubernetes)
- [Lancement de l'application](#lancement-de-lapplication)


## Construction des images Docker

### L'application est composée des images Docker suivantes :

- **react-client**
- **react-posts**
- **react-comments**
- **react-query**
- **react-moderation**
- **react-event-bus**

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
Pour lister les images Docker construites, executer la commande suivante :
```bash
$user> docker images
```

## Lancement des Services Kubernetes

### L'application est composée des services Kubernetes suivantes :

- **client-srv**: Service pour l'interface utilisateur.
- **posts-clusterip-srv**: Service pour la gestion des posts.
- **query-srv**: Service pour la gestion des requêtes.
- **comments-srv**: Service pour la gestion des commentaires.
- **moderation-srv**: Service pour la modération des commentaires.
- **event-bus-srv**: Service pour la gestion des événements entre les services.
- **ingress**: Accès aux services et aiguillage du traffic hhtp.

Pour lancer les services Kubernetes, à la racine du projet, exécuter le script bash ci-dessous :

```bash
$user> ./kubeDplServices
```

Pour lister les services Kubernetes, executer la commande suivante :
```bash
$user> kubectl get services
```

## Lancement de l'application

### Cliquez sur le lien ci-après ==> [LOCALHOST](http://localhost/)