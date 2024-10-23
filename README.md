## **Creazione di un Ambiente LAMP con GitPod/Codespace**

### **Introduzione**

Questo documento fornisce una guida passo-passo per la configurazione di un ambiente di sviluppo LAMP (Linux, Apache, MySQL, PHP) utilizzando GitPod o Codespace. L'ambiente sarà pronto per lo sviluppo e il testing di applicazioni web.

**Esercitazioni correlate:**
* [https://fb-labs.blogspot.com/p/informatica.html](https://fb-labs.blogspot.com/p/informatica.html)

### **Clona il Repository**

1. Clona il repository da GitHub:
   ```bash
   git clone https://github.com/filippo-bilardo/LAMP
   ```
2. Apri il progetto in GitPod o Codespace.

### **Avvio del Server Web**

* **Apache:**
   ```bash
   apache2ctl start
   ```

### **Connessione al Database**

* **GitPod:**
   ```bash
   mysql -u root
   ```
* **Codespace:**
   ```bash
   mariadb -h localhost -P 3306 --protocol=tcp -u root --password=mariadb -D mariadb
   ```

### **Struttura del Progetto**
* **www:** Contiene gli esempi di pagine PHP.
* **etc:** Contiene i file di configurazione utilizzati da GitPod.
* **.devcontainer/etc:** Contiene i file di configurazione utilizzati da Codespace.

### **Installazione di Tomcat**

Per lo sviluppo di pagine JSP, segui questi passaggi:

1. **Aggiorna il sistema e installa il JDK:**
   ```bash
   sudo apt update
   sudo apt upgrade
   sudo apt install default-jdk
   java -version
   ```
2. **Crea un utente per Tomcat:**
   ```bash
   sudo useradd -r -m -U -d /workspace/LAMP/tomcat -s /bin/false tomcat
   ```
3. **Scarica e installa Tomcat:**
   ```bash
   wget -c https://downloads.apache.org/tomcat/tomcat-10/v10.1.20/bin/apache-tomcat-10.1.20.tar.gz
   sudo tar xf apache-tomcat-10.1.20.tar.gz -C tomcat
   sudo ln -s /workspace/LAMP/tomcat/apache-tomcat-10.1.20 /workspace/LAMP/tomcat/updated
   sudo chown -R tomcat: /workspace/LAMP/tomcat/
   chmod +x /workspace/LAMP/tomcat/updated/bin/*.sh
   ```
4. **Configurazione Java:**
   ```bash
   export JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64
   ```

**Riferimenti:**
* [https://docs.github.com/en/codespaces/setting-up-your-project-for-codespaces/adding-a-dev-container-configuration/setting-up-your-java-project-for-codespaces](https://docs.github.com/en/codespaces/setting-up-your-project-for-codespaces/adding-a-dev-container-configuration/setting-up-your-java-project-for-codespaces)


