#!/bin/bash
# Changer le shebanng! selon votre shell
# 
# Assurez-vous que le fichier est executable sous votre shell
# Executer : chmod 700 BuildDockerImages.sh
# Puis : ./BuildDockerImages
#
# Script de construction des images docker "react-directory"
directories=("client" "comments" "event-bus" "moderation" "posts" "query")

for directory in "${directories[@]}"; do
    docker build -t "react-$directory" "./$directory"
done
