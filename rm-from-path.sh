#!/usr/bin/env bash

if [[ "$EUID" != 0 ]]; then
  echo "Sudo nécéssaire"
  exit 1

elif [[ ! -n "$SUDO_USER" ]]; then
  echo "Sudo nécéssaire"
  exit 1
fi

Bin_path="/home/$SUDO_USER/.local/bin"

gived_opt=$1
real_path="$Bin_path/$gived_opt"

if [[ -e "$real_path" ]]; then

  if ! sudo rm "$real_path"; then
    echo "rm a échoué"
    exit 1
  fi
  echo "Tout s'est bien passé !"
  exit 0
fi

echo "$gived_opt non existant"
