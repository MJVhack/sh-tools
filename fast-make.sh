#!/usr/bin/env bash

options=(
  "-c"
  "-cpp"
)

gived_opt=$1

if [[ "$gived_opt" = "${options[0]}" ]]; then

  Raport_Name="Rapport_GCC_$(date +'%Y_%m_%d_%H_%M_%S').txt"

  if ! gcc -v >/dev/null 2>&1; then
    echo "gcc n'est pas installé"
    exit 1
  fi

  if [[ ! -d "src" ]]; then
    echo "Le dossier src n'existe pas"
    exit 1
  fi

  if [[ ! -d "includes" ]]; then
    echo "Le dossier includes n'existe pas"
    exit 1
  fi

  if [[ ! -d "build" ]]; then
    echo "le dossier build n'existe pas, création..."
    if ! mkdir -p build; then
      echo "mkdir a échoué"
      exit 1
    fi
    echo "Création réussi"
  fi

  if ! gcc -Wall -Wextra -Werror src/*.c -o "build/main" >>"$Raport_Name" 2>&1; then
    echo "gcc a échoué, le rapport est dans $Raport_Name"
    exit 1
  fi

  echo "Tout s'est bien passé !"

elif [[ "$gived_opt" = "${options[1]}" ]]; then

  Raport_Name="Rapport_G++_$(date +'%Y_%m_%d_%H_%M_%S').txt"

  if ! g++ -v >/dev/null 2>&1; then
    echo "g++ n'est pas installé"
    exit 1
  fi

  if [[ ! -d "src" ]]; then
    echo "Le dossier src n'existe pas"
    exit 1
  fi

  if [[ ! -d "includes" ]]; then
    echo "Le dossier includes n'existe pas"
    exit 1
  fi

  if [[ ! -d "build" ]]; then
    echo "le dossier build n'existe pas, création..."
    if ! mkdir -p build; then
      echo "mkdir a échoué"
      exit 1
    fi
    echo "Création réussi"
  fi

  if ! g++ -Wall -Wextra -Werror src/*.cpp -o "build/main" >>"$Raport_Name" 2>&1; then
    echo "g++ a échoué, le rapport est dans $Raport_Name"
    exit 1
  fi

  echo "Tout s'est bien passé !"

else
  echo "---------fast-make-------"
  echo "-c : Compile rapidement tout les fichiers C"
  echo "-cpp : Compile rapidement tout les fichiers C++"
  echo "----------------------------"
fi
