#!/usr/bin/env bash

git_link=$1

if [[ -z "$git_link" ]]; then
  echo "Veuillez spécifier le lien du repo"
  exit 1
fi

if ! git --version >/dev/null 2>&1; then
  echo "Git n'est pas installé"
  exit 1
fi

if ! git init  >/dev/null 2>&1;; then
  echo "git init a échoué"
  exit 1
fi

if ! git add .  >/dev/null 2>&1;; then
  echo "Git add . a échoué"
  exit 1
fi

if ! git commit -m "Initial Commit"  >/dev/null 2>&1;; then
  echo "Initial commit a échoué"
  exit 1
fi

if ! git branch -M main  >/dev/null 2>&1;; then
  echo "Branch -M a échoué"
  exit 1
fi

if ! git remote add origin "$git_link"  >/dev/null 2>&1; then
  echo "Git add a échoué"
  exit 1
fi

if ! git push -u origin main  >/dev/null 2>&1;; then
  echo "Git a échoué"
  exit 1
fi

echo "Tout s'est bien passé !"
