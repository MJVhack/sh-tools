# sh-tools
Juste, moi je suis un flemmard. Donc au lieu de refaire plein de fois un truc de con pour différent projet, je code des .sh pour le faire a ma place en 1 commande (tout bon dev fait ca btw)

JUSTE: Bah enfaite j'ai du modifier mon visudo genre add .local/bin au secure path du sudo
Ca reviens a ```sudo EDITOR=<n'importe quelle editor> visudo```, chercher ```Defaults secure path``` et ajoutez ```/home/<USERNAME>/.local/bin``` (a notez que la facon de rajouter
et comme ca ```Defaults_secure_path="/usr/local/sbin:/usr/local/bin:<d'autre path>:/home/<USERNAME>/.local/bin``` ajoutez bien le : oubliez pas)

L'etape au dessus est **OBLIGATOIRE**

Pour add-to-path:

```sudo add-to-path file``` 
utilisation normale

opt:
| -sh : ajoute au path avec une configuration pour les .sh

```sudo add-to-path.sh -sh add-to-path.sh```

Bah genre la ca va chmod, sa va cut l'extension et tout

Pour rm-from-path:

```sudo rm-from-path file```
utilisation normal


Pour create-project:

```create-project -<opt>```

opt:
| -c : Créer un template de projet C
| -cpp : Créer un template de projet C++

Pour fast-make:

Juste: il fontionne uniquement sur les bases de fichier de create-project, il est un peu inutile car create-project fourni déja un make.sh. Mais lui c'est un make.sh++ il a plus de vérif et tout. C'est pour les tarés de securité celui la

```fast-make -<opt>```

opt:
| -c: Auto-compile rapidement des fichiers C
| -cpp: Auto-compile rapidement des fichier C++

Pour git-setup:

```git-setup <link>```


