# INSTALLATION Projet fil rouge

## Introduction

Accédez au repository GITHUB https://github.com/EnjoyDevOps/Projet_fil_rouge_OLTE.git Cloner le sur votre disque en local avec la commande !
  - git clone https://github.com/EnjoyDevOps/Projet_fil_rouge_OLTE.git

## Table des matières

- [Introduction](#introduction)
- [Table des matières](#table-des-matières)
- [Construction des images Docker](#architecture)
- [Chemins d'Ingress](#chemins-dingress)
- [Noms de Services Kubernetes](#noms-de-services-kubernetes)
- [Ports des Services](#ports-des-services)
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Déploiement](#déploiement)

## Construction des images Docker

L'application est composée des images Docker suivantes :

- **react-client** : Image de l'interface utilisateur construite avec React. **cd ~/Projet_fil_rouge_OLTE/client/**
- **react-posts** : Service pour la gestion des posts.
- **react-comments** : Service pour la gestion des commentaires.
- **react-query** : Service pour la gestion des requêtes.
- **react-moderation** : Service pour la modération des commentaires.
- **react-event-bus** : Service pour la gestion des événements entre les services.
créer le fichier dockerfile suivant :
```
##################################################################
#           IMAGE DOCKER  basé sur l'image node:alpine           #
#                 Pour construire l'image docker                 #
#  - Ouvrir une fenêtre Terminal                                 #
#  Se rendre sur le répertoire de l'image à construire           #
#  exemple saisir : " cd ~/Projet_fil_rouge_OLTE/client/"        #
#  Construire l'image docker avec la commande:                   #
#  exemple saisir : " docker image build -t react-client . "     #
##################################################################
FROM node:alpine
COPY . .
RUN npm install
CMD ["npm", "start"]
```



### Chemins d'Ingress

- `/posts/create` : Dirigé vers le service `posts-clusterip-srv` sur le port 4000.
  - Utilisé pour créer de nouveaux posts.
  
- `/posts` : Dirigé vers le service `query-srv` sur le port 4002.
  - Utilisé pour récupérer la liste des posts existants.
  
- `/posts/?(.*)/comments` : Dirigé vers le service `comments-srv` sur le port 4001.
  - Utilisé pour créer ou récupérer les commentaires associés à un post spécifique.
  
- `/?(.*)` : Dirigé vers le service `client-srv` sur le port 3000.
  - Utilisé pour accéder à l'interface utilisateur.
 


### Noms de Services Kubernetes

Assurez-vous que les noms de services dans vos fichiers de déploiement Kubernetes correspondent aux noms de services utilisés dans le code de l'application. Voici les noms de services attendus :

- **client-srv**: Service pour l'interface utilisateur.
- **posts-clusterip-srv**: Service pour la gestion des posts.
- **query-srv**: Service pour la gestion des requêtes.
- **comments-srv**: Service pour la gestion des commentaires.
- **moderation-srv**: Service pour la modération des commentaires.
- **event-bus-srv**: Service pour la gestion des événements entre les services.

Si vous modifiez ces noms, assurez-vous également de mettre à jour les références correspondantes dans le code de l'application.


### Ports des Services

Chaque service écoute sur un port spécifique. Assurez-vous que ces ports sont correctement configurés dans vos fichiers de déploiement Kubernetes et dans tout autre outil de gestion des conteneurs que vous pourriez utiliser. Voici les ports attendus pour chaque service :

- **client-srv**: Écoute sur le port 3000.
- **posts-clusterip-srv**: Écoute sur le port 4000.
- **query-srv**: Écoute sur le port 4002.
- **comments-srv**: Écoute sur le port 4001.
- **moderation-srv**: Écoute sur le port 4003.
- **event-bus-srv**: Écoute sur le port 4005.

Si vous modifiez ces ports, assurez-vous également de mettre à jour les références correspondantes dans le code de l'application et les fichiers de configuration Kubernetes.


## Prérequis

- Node.js
- Docker
- Kubernetes

## Installation

1. Clonez ce dépôt :
    ```bash
    git clone https://github.com/Mossbaddi/Pojet_fil_rouge.git
    ```

2. Installez les dépendances pour chaque service :
    ```bash
    cd client && npm install
    cd ../posts && npm install
    # Répétez pour tous les services
    ```

## Déploiement

1. Construisez les images Docker pour chaque service :
    ```bash
    docker build -t client ./client
    docker build -t posts ./posts
    # Répétez pour tous les services
    ```
    Le projet est basé sur l'image **node:alpine**

2. Déployez les services sur Kubernetes :
    ```bash
    kubectl apply -f k8s/
    ```
