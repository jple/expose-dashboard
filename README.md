# Objectif
Mise en place d'une solution d'exposition de dashboard Dash via containers. 

# Description
La solution consiste en les containers :
- conda: environnement conda avec le dashboard Dash à déployer
- ldap: mode d'authentification d'accès à un dashboard spécifique
- nginx: reverse proxy

Chaque répertoire contient les fichiers à insérer dans les différents containers.

# Installation
## Création des containers
- conda : partir du dockerfile
- nginx : utiliser l'image officiel nginx
- ldap : utiliser l'image bitnami/openldap (?)


# Todo
- créer une image nginx pour copier les fichiers de config...?
- indiquer les ports ouverts dans conda.dockerfile
- mettre en place le ldap
- renseigner comment utiliser docker compose
