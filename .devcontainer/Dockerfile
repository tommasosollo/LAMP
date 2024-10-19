# Usa un'immagine di base con PHP e Apache già configurati
FROM mcr.microsoft.com/devcontainers/php:8-apache

# Install MariaDB client
RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y mariadb-client \ 
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
    # in Alternativa - Installazione di MySQL
    # && apt-get install -y mysql-server \
    # && rm -rf /var/lib/apt/lists/*

# Install php-mysql driver
RUN docker-php-ext-install mysqli pdo pdo_mysql

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="lts/*"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi
# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# Copia delle configurazioni personalizzate per Apache e MySQL
COPY ./etc/apache2 /etc/apache2/
COPY ./etc/mysql /etc/mysql/
COPY ./etc/php.ini /etc/php/8.1/apache2/php.ini
#COPY ./etc/my.cnf /etc/mysql/my.cnf
#/etc/mysql/mysql.conf.d/mysqld.cnf
#/var/lib/mysql

# optional: change document root folder. It's relative to your git working copy.
ENV APACHE_DOCROOT_IN_REPO="www"

# Avvio dei servizi all'interno del container
CMD service mysql start && apache2ctl -D FOREGROUND

