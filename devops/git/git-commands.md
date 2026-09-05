# Git commands

| Command | Description     |
| :------------- | :------------- |
| git init |  |
| git clone URL |  |
| git add FILE_NAME | Afegir els canvis del FILE_NAME|
| git add . | Afegir `tots` els canvis |
| git checkout FILE_NAME | Descargar canvis (fins a l'últim commit) |
| git status |  |
| git log | llistar tots els commits |
| git commit |  |
| git commit -m "MESSAGE" |  |
| git revert |  |

## <b> 🚫 PERILL </b>

| Command | Description     |
| :------------- | :------------- |
| git reset HEAD^ --hard | Eliminar l'últim commit local! |
| git reset HEAD^ --hard; git push origin -f | Eliminar ultim commit origin! |

| Command | Description     |
| :------------- | :------------- |
| git push | |
| git pull | |
| git diff FILE_NAME | Veure els canvis |
| git diff FILE_1~FILE_2 | -- |

## ⏭️ JUGANT AMB BRANQUES:

| Command | Description     |
| :------------- | :------------- |
| git branch | Llistar les branques |
| git branch BRANCH_NAME | Crear una nova branca (1) |
| git checkout BRANCH_NAME | Canviar de branca (2) |
| <b>git checkout -b BRANCH_NAME</b> | Crear+Canviar de branca (1+2) |
| git branch -m OLD_BRANCH_NAME <b>NEW_BRANCH_NAME</b> | Canviar el nom de la branca |
| git branch -d BRANCH_NAME | Eliminar la branca |

## Git merge / Git rebase
```
TODO: DOCUMENTAR git merge / git rebase
```

```
# Conta personal
git config --global user.name username1
git config --global user.email "username1@gmail.com"

# Conta
git config --global user.name username2
git config --global user.email "username2@gmail.com"

# Editat les credencials per poder fer login
# Descomentar ...

subl ~/.git-credentials

```
