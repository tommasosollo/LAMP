## Cosa sono le immagini Docker?

**Un'immagine Docker è come una fotografia istantanea di un ambiente software.** È un file di sola lettura che contiene tutto il necessario per eseguire un'applicazione: il sistema operativo, le librerie, le dipendenze, il codice sorgente e qualsiasi altro file necessario.

**Immagina di voler installare un'applicazione su un nuovo computer.** Normalmente, dovresti installare il sistema operativo, configurare il software di base, installare tutte le dipendenze e infine copiare il codice dell'applicazione. Con Docker, invece, crei un'immagine che contiene già tutto questo. Quando vuoi eseguire l'applicazione, avvii un contenitore (container) basato su quell'immagine.

### Perché usare le immagini Docker?

* **Consistenza:** Assicura che l'applicazione funzioni sempre nello stesso modo, indipendentemente dall'ambiente in cui viene eseguita.
* **Portabilità:** Le immagini Docker possono essere eseguite su qualsiasi sistema che supporti Docker, sia esso un laptop, un server cloud o una macchina virtuale.
* **Isolamento:** Ogni contenitore Docker ha il proprio ambiente isolato, evitando conflitti tra le applicazioni.
* **Efficienza:** Le immagini Docker sono leggere e condivisibili, riducendo il consumo di risorse.
* **Velocità:** L'avvio di un contenitore Docker è molto più veloce rispetto all'avvio di una macchina virtuale.
* **Facilità di gestione:** Docker fornisce strumenti per gestire il ciclo di vita dei contenitori, come la creazione, l'avvio, l'arresto e la rimozione.

### Come funzionano le immagini Docker?

* **Dockerfile:** Un Dockerfile è un file di testo che contiene le istruzioni per creare un'immagine Docker.
* **Build:** Il comando `docker build` legge il Dockerfile e crea l'immagine.
* **Container:** Un container è un'istanza in esecuzione di un'immagine Docker.
* **Registry:** Un registry è un repository dove vengono archiviate le immagini Docker. Il più famoso è Docker Hub.

### Un esempio pratico

Supponiamo di voler eseguire un'applicazione web basata su Node.js. Potremmo creare un Dockerfile con le seguenti istruzioni:

```dockerfile
FROM node:14-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
```

Questo Dockerfile:

1. Utilizza l'immagine base `node:14-alpine`.
2. Crea una directory di lavoro `/app`.
3. Copia i file `package.json` e `package-lock.json`.
4. Installa le dipendenze.
5. Copia il resto del codice sorgente.
6. Espone la porta 3000.
7. Avvia l'applicazione eseguendo `npm start`.

Una volta creata l'immagine, possiamo avviare un contenitore con il comando `docker run`.

**In sintesi, le immagini Docker sono un modo potente e flessibile per creare e distribuire applicazioni.** Sono diventate uno standard de facto nel mondo del containerization e sono utilizzate da milioni di sviluppatori in tutto il mondo.
