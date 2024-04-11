# PHP

Template per creare un Server LAMP con GitPod

Esercitazioni collegate:
https://fb-labs.blogspot.com/p/informatica.html

Dopo aver clonato questo repository (https://github.com/filippo-bilardo/LAMP), avviare GitPod.
Per collegarsi a mysql digitare il comando: mysql -u root
Esempi di pagine php nella cartella www
Nella cartella etc sono presenti i file di configurazione utilizzati da GitPod per la creazione del server.

Installazione di Tomcat per lo sviluppo di pagine JSP
Downolad di Tomcat(https://downloads.apache.org/tomcat/)

sudo apt update
sudo apt upgrade
sudo apt install default-jdk
java -version

sudo useradd -r -m -U -d /workspace/LAMP/tomcat -s /bin/false tomcat 
wget -c https://downloads.apache.org/tomcat/tomcat-10/v10.1.20/bin/apache-tomcat-10.1.20.tar.gz
sudo tar xf apache-tomcat-10.1.20.tar.gz -C tomcat
sudo ln -s /workspace/LAMP/tomcat/apache-tomcat-10.1.20 /workspace/LAMP/tomcat/updated
sudo chown -R tomcat: /workspace/LAMP/tomcat/
#sudo sh -c 'chmod +x /workspace/LAMP/tomcat/updated/bin/*.sh'
chmod +x /workspace/LAMP/tomcat/updated/bin/*.sh


https://docs.github.com/en/codespaces/setting-up-your-project-for-codespaces/adding-a-dev-container-configuration/setting-up-your-java-project-for-codespaces

export JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64