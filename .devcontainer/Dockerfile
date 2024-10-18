# Install php-mysql driver
RUN docker-php-ext-install mysqli pdo pdo_mysql

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1

# Usa un'immagine di base con PHP e Apache già configurati
FROM mcr.microsoft.com/devcontainers/php:8.0-apache

# Install MariaDB client
RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y mariadb-client \ 
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Installazione di MySQL
#RUN apt-get update \
#    && apt-get install -y mysql-server \
#    && rm -rf /var/lib/apt/lists/*

# Copia delle configurazioni personalizzate per Apache e MySQL
COPY ./etc/apache2 /etc/apache2/
COPY ./etc/mysql /etc/mysql/

# Copia del database e delle pagine web
COPY ./mysql /var/lib/mysql/
COPY ./www /var/www/html/

# Avvio dei servizi all'interno del container
CMD service mysql start && apache2ctl -D FOREGROUND
