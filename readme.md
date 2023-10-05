# TRAEFIK DOCKER

Reverse proxy for docker project.
Allows custom local subdomains in the same port (::80) and with local ssl certificates

## Installation

Installer au préalable docker desktop si vous êtes sur Windows 

Sur windows :
- Installer WSL2, une distro Ubuntu (20 ou 22) et autoriser l'intégration de docker desktop dans le distro utilisée (Ubuntu XX.XX) dans Paramètres > Resources > WSL 2 integrations

Installer [mkcert](https://github.com/FiloSottile/mkcert) :
- Windows : utiliser le package manager "**[Choco](https://chocolatey.org/install#individual-method)**"
- Sur Linux (ou WSL2) : utiliser le package manager "**[Brew](https://brew.sh)**"

Installer make pour les commandes makefile :
```bash
sudo apt update
sudo apt install make
```

### Certificats

Dans le dossier `./certs` il faudra générer le certificat pour autoriser les noms de domaine en SSL (https) en local :

```bash
mkcert --install
```

Si vous êtes sur windows, il faudra générer installer le certificat root sur windows et WSL2.
La spécificité pour rendre compatible WSL2 et Windows au niveau des certificats sera de copier le certificat root généré sur WSL2 vers windows :

Chemin du certificat root (clé privée et clé publique)
- WSL2 (Ubuntu) : `/home/{username}/.local/share/mkcert/rootCA.pem` & `/home/user/.local/share/mkcert/rootCA-key.pem`
- Windows : `C:\Users\{username}\AppData\Local`

#### Générer le certificat pour les projets : 

```bash
mkcert -cert-file localhost.cert -key-file localhost.key "localhost" "traefik.localhost" "phpmyadmin.localhost" "vetementpro.localhost" "gds.localhost"
```

Il faudra supprimer le conteneur traefik afin qu'il prenne les certificats à jour une fois générées.
