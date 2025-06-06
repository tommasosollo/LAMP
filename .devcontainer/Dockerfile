# Usa un'immagine di base con PHP, Apache
# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.195.0/containers/php/.devcontainer/base.Dockerfile
# [Choice] PHP version (use -bullseye variants on local arm64/Apple Silicon): 8, 8.0, 7, 7.4, 7.3, 8-bullseye, 8.0-bullseye, 7-bullseye, 7.4-bullseye, 7.3-bullseye, 8-buster, 8.0-buster, 7-buster, 7.4-buster, 7.3-buster
ARG VARIANT=8-bullseye
FROM mcr.microsoft.com/vscode/devcontainers/php:0-${VARIANT}

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="lts/*"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# Installazione di MariaDB client
RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y mariadb-client \ 
    # in Alternativa - Installazione di MySQL
    # && apt-get install -y mysql-server \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Install php-mysql driver
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Variabili d'ambiente
ENV GITPOD_REPO_ROOT="/workspaces/LAMP"
ENV APACHE_DOCROOT="/workspaces/LAMP/www"
ENV APACHE_RUN_USER="www-data"
ENV APACHE_RUN_GROUP="www-data"
ENV APACHE_SERVER_NAME="FBLAMP"
#ENV APACHE_LOG_DIR="/var/log/apache2"
#ENV APACHE_PID_FILE="/var/run/apache2/apache2.pid"

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1

# Copia delle configurazioni personalizzate per Apache e MySQL
COPY ./etc/apache2 /etc/apache2/
COPY ./etc/php/php.ini /usr/local/etc/php/php.ini
#COPY ./etc/mysql /etc/mysql/
#COPY ../etc/my.cnf /etc/mysql/my.cnf
#/etc/mysql/mysql.conf.d/mysqld.cnf
#/var/lib/mysql

# Avvio dei servizi all'interno del container
#CMD service apache2 start
#CMD service mysql start && apache2ctl -D FOREGROUND
#apache2ctl -D FOREGROUND
#mariadb -h localhost -P 3306  --protocol=tcp -u root --password=mariadb -D mariadb