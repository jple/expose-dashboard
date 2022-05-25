# Objectif
Mise en place d'une solution d'exposition de dashboard Dash via containers. 

# Description
La solution consiste en les containers :
- conda: environnement conda avec le dashboard Dash à déployer
- ldap: mode d'authentification d'accès à un dashboard spécifique
- nginx: reverse proxy

Chaque répertoire contient les fichiers à insérer dans les différents containers.

# Installation
Il faut au préalable créer les images à partir des dockerfile dans `containers/*/`

## Option 1:  avec docker compose
Il suffit de lancer la commande `docker compose up`  
Celle-ci effectue la création des 3 containers dans un réseau spécifique

## Option 2: manuellement
Grosso modo, suivre les étapes décrites dans `build_env.sh`

# Todo
- rebuild image conda (.swp de trop)
- mettre en place le ldap
- renseigner comment utiliser docker compose
