#!/usr/bin/env bash

foldername=$1

if [[ ! -d "$foldername" ]]; then
    echo "$foldername not exist"
    exit 1
fi

if ! rm -rf "$foldername"; then
    echo "Failed to remove $foldername"
    exit 1
fi

if ! mkdir -p "$foldername"; then
    echo "Failed to recreate $foldername"
    exit 1
fi

echo "Tout s'est bien passé"