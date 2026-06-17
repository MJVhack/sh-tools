#!/usr/bin/env bash

# On vérifie d'abord si on a des privilèges
if [[ "$EUID" != 0 ]]; then
  echo "Sudo nécéssaire"
  exit 1
fi
#On vérifie si c'est nien sudo ou non
if [[ ! -n "$SUDO_USER" ]]; then
  echo "Lancé avec root, sudo seulement"
  exit 1
fi
# Tout est bon
Bin_path="/home/$SUDO_USER/.bin"

# Les tableaux
options=("-sh")
gived_options=($1 $2 $3)

#Main if

# Cas 1: Le add to path normale
if [[ -e ${gived_options[0]} ]]; then
  echo "Copy ${gived_options[0]} vers le Bin"

  if [[ ! -e ${gived_options[0]} ]]; then
    echo "Fichier non existant"
    exit 1
  fi

  if ! cp ${gived_options[0]} $Bin_path; then
    echo "cp a échoué, exit"
    exit 1
  fi
  echo "Tout s'est bien passé"
  exit 0

  # Cas 2: add to path d'un .sh
elif [[ ${gived_options[0]} = ${options[0]} ]]; then
  if [[ ! -e ${gived_options[1]} ]]; then
    echo "Fichier non existant"
    exit 1
  fi

  if ! sudo chmod 755 "${gived_options[1]}"; then
    echo "Chmod a échoué (sudo uniquement)"
    exit 1
  fi

  if ! cp "${gived_options[1]}" "$Bin_path/${gived_options[1]%.*}" >/dev/null 2>&1; then
    echo "Copy a échoué"
    exit 1
  fi

  echo "Tout s'est bien passé !"

else
  echo "--------Add to Path--------"
  echo "-sh: Ajoute au path avec la config .sh"
