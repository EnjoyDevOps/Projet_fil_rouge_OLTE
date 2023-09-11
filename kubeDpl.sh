#!/bin/bash
# Changer le shebang! selon votre shell
# 
# Assurez-vous que le fichier est executable sous votre shell
# Executer : chmod 700 KubeDpl.sh
# Puis : ./KubeDpl
#
# Script de deployement des services Kubernetes
kubeServices=("client" "comments" "event-bus" "moderation" "posts" "query" "ingress")

for service in "${kubeServices[@]}"; do
    kubectl apply -f "k8s/$service.yml"
done