# Git config and authentication

### :arrow_right: How to configure git (basic)
```bash
git config --global user.name "username"
```
```bash
git config --global user.email "email"
```
Varifications:
```bash
git config --global user.name
git config --global user.email
git config -l
```

#### Verificar les claus ssh

```
ls -al ~/.ssh
```

#### Generar un clau nova

Font ([click](https://docs.github.com/es/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
)).

:bulb: Remember: en el path ~/ssh, generar dos claus una privada i una publica (.pub)
```bash
ssh-keygen -t ed25519 -C "email"
```

#### Github configure

- Copy the file `.epub`
- Go to `https://github.com/settings/keys`.
- Add `key`.

#### Configurar el .ssh/config (create if not exist)
Configure two accounts.

```bash
# username_1 account

Host github.com
   HostName github.com
   User git
   IdentityFile ~/.ssh/github_username_1
   IdentitiesOnly yes

# username_2 account
Host github.com-username_2
   HostName github.com
   User git
   IdentityFile ~/.ssh/github_username_2
   IdentitiesOnly yes
```

Exemple de git clon via ssh:

```bash
# example username_1:
git clone git@github.com:username_1/username_1.git

# example username_2:
git clone git@github.com-username_2:username_2/username_2.git
```

:warning: Vaig tenir alguns problemes que ara no recordo. Alternativa:

- Go to: `https://github.com/settings/tokens`.
- Generate a token and use like a password.
   - From your GitHub account, go to:
      - `Settings` 
      - `Developer Settings` 
      - `Personal Access Token` 
      - `Generate New Token (Give your password)` 
      - `Fillup the form` 
      - `click Generate token` 
      - `Copy the generated Token, it will be something like`
- For `persist` (15m): 
   ```bash
   git config --global credential.helper cache
   git config --global credential.helper store
   ```
- For `persist` (forever):
   ```bash
   git config --global credential.helper osxkeychain
   ```

:warning: Crec que el problema es no entendre el ssh / https. A més, confondre el token personal de la conta (substitut de la password) amb els tokens ssh.

:rocket: Fonts:
- `Stackoverflow` - Is there a way to cache https credentials for pushing commits ([click](https://stackoverflow.com/questions/5343068/is-there-a-way-to-cache-https-credentials-for-pushing-commits
)).
- `Stackoverflow` - Support for password authentication was removed please use a personal access to ([click]( https://stackoverflow.com/questions/68775869/support-for-password-authentication-was-removed-please-use-a-personal-access-to
)).
- `Stackoverflow` - Multiple github accounts ssh config ([click](https://stackoverflow.com/questions/3225862/multiple-github-accounts-ssh-config)).
- The science of code ([click](https://thescienceofcode.azurewebsites.net/Articles/Show/5e71a2076dc6a240f8dbe934)).
