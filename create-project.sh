#!/usr/bin/env bash

langages_opt=(
  "-c"
  "-cpp"
)

langages_asked=$1

# Project C
if [[ "$langages_asked" = "${langages_opt[0]}" ]]; then
  if ! mkdir -p src includes build; then
    echo "Make Directory a échoué"
    exit 1
  fi

  if ! touch src/main.c includes/header.h make.sh README.md; then
    echo "Touch a échoué"
    exit 1
  fi

  makesh='
#!/usr/bin/env bash

gcc -Wall -Wextra -Werror src/*.c -o build/main'

  if ! echo "$makesh" >>make.sh; then
    echo "Echo a échoué"
    exit 1
  fi

  helloworld='#include <stdio.h>
int main(int argc, char* argv[]){
  printf("Hello, World !\n");
  printf("%d argument passed, first: %s\n", argc, argv[0]);
  return 0;
}'

  if ! echo "$helloworld" >>src/main.c; then
    echo "Modèle Hello World a échoué"
    exit 1
  fi

  echo "Tout s'est bien passé !"

# Project C++
elif [[ "$langages_asked" = "${langages_opt[1]}" ]]; then
  if ! mkdir -p src includes build; then
    echo "Make Directory a échoué"
    exit 1
  fi

  if ! touch src/main.cpp includes/header.hpp make.sh README.md; then
    echo "Touch a échoué"
    exit 1
  fi

  makesh='
#!/usr/bin/env bash

g++ -Wall -Wextra -Werror src/*.cpp -o build/main'

  if ! echo "$makesh" >>make.sh; then
    echo "Echo a échoué"
    exit 1
  fi

  helloworld='#include <iostream>
int main(int argc, char* argv[]){
  std::cout << "Hello, World !" << "\n";
  std::cout << argc << " argument passed, first: " << argv[0] << "\n";
  return 0;
}'

  if ! echo "$helloworld" >>src/main.cpp; then
    echo "Modèle Hello World a échoué"
    exit 1
  fi

  echo "Tout s'est bien passé !"

else
  echo "----create project-------"
  echo "-c : Créer un modèle de projet C"
  echo "-cpp : Créer un modèle de projet Cpp"
  echo "------------------------------------"
fi
