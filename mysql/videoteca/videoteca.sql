--Crea Database
DROP IF EXISTS DATABASE videoteca;
CREATE DATABASE IF NOT EXISTS videoteca;
USE videoteca;

--Crea Tabella regista
CREATE TABLE IF NOT EXISTS regista (
    ID_Regista INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL
);

--Crea Tabella produttore
CREATE TABLE IF NOT EXISTS produttore (
    ID_Produttore INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL
);


--Crea Tabella categoria
CREATE TABLE IF NOT EXISTS categoria (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL
);

--Crea Tabella film
CREATE TABLE IF NOT EXISTS film (
    ID_Film INT AUTO_INCREMENT PRIMARY KEY,
    Titolo VARCHAR(100) NOT NULL,
    Durata TIME,
    Anno_Uscita YEAR NOT NULL,
    ID_Regista INT NOT NULL,
    ID_Produttore INT NOT NULL,
    ID_Categoria INT NOT NULL,
    FOREIGN KEY (ID_Regista) REFERENCES regista(ID_Regista),
    FOREIGN KEY (ID_Produttore) REFERENCES produttore(ID_Produttore),
    FOREIGN KEY (ID_Categoria) REFERENCES categoria(ID_Categoria)
);


--Crea tabella premio
CREATE TABLE IF NOT EXISTS premio (
    ID_Premio INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Ente VARCHAR(50)
);

--Crea tabella premi_vinti
CREATE TABLE IF NOT EXISTS premi_vinti (
    ID_Premio_Vinto INT AUTO_INCREMENT PRIMARY KEY,
    Titolo VARCHAR(100) NOT NULL,
    Anno_Premio YEAR NOT NULL,
    ID_Film INT NOT NULL,
    ID_Premio INT NOT NULL,
    FOREIGN KEY (ID_Film) REFERENCES film(ID_Film),
    FOREIGN KEY (ID_Premio) REFERENCES premio(ID_Premio)
);

--Crea tabella cliente
CREATE TABLE IF NOT EXISTS cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL
);

--Crea tabella acquisto
 CREATE TABLE IF NOT EXISTS acquisto (
    ID_Acquisto INT AUTO_INCREMENT PRIMARY KEY,
    ID_Film INT NOT NULL,
    ID_Cliente INT NOT NULL,
    FOREIGN KEY (ID_Film) REFERENCES film(ID_Film),
    FOREIGN KEY (ID_Cliente) REFERENCES cliente(ID_Cliente)
);

--Crea tabella fattura
 CREATE TABLE IF NOT EXISTS fattura (
    ID_Fattura INT AUTO_INCREMENT PRIMARY KEY,
    Data_Pagamento DATE NOT NULL,
    Prezzo FLOAT NOT NULL,
    ID_Acquisto INT NOT NULL,
    FOREIGN KEY (ID_Acquisto) REFERENCES acquisto(ID_Acquisto)
);


--******  INSERIMENTO DATI  ******

--Inserimento registi
 INSERT INTO regista (Nome, Cognome) VALUES
 ('Giuseppe', 'Boccaccio'),
 ('Guido', 'Borgogno'),
 ('Enrico', 'Bellini');
 
 --Inserimento produttori
 INSERT INTO produttore (Nome) VALUES
 ('Maria Stella'),
 ('Antonio Russo'),
 ('Andrea Borghese');
 
 --Inserimento categorie
 INSERT INTO categoria (Nome) VALUES
 ('Commedia'),
 ('Avventura'),
 ('Drammatico');
 
 --Inserimento film
 INSERT INTO film (Titolo, Durata, Anno_Uscita, ID_Regista, ID_Produttore, ID_Categoria) VALUES
 ('Il Mare di Capri', '1:35', 1993, 1, 1, 1),
 ('Il Ritorno del Re', '2:15', 1985, 2, 2, 2),
 ('Il Pianista', '2:10', 1973, 3, 3, 3);
 
 --Inserimento premi
 INSERT INTO premio (Nome, Ente) VALUES
 ('Oscar', 'American Film Institute'),
 ('Prime', 'British Film Institute'),
 ('Oscar', 'Academy of Motion Picture Arts and Sciences');
 
 --Inserimento premi vinti
 INSERT INTO premi_vinti (Titolo, Anno_Premio, ID_Film, ID_Premio) VALUES
 ('Il Mare di Capri', 1993, 1, 1),
 ('Il Ritorno del Re', 1985, 2, 2),
 ('Il Pianista', 1973, 3, 3);

 --Inserimento clienti
 INSERT INTO cliente (Nome, Cognome) VALUES
 ('Mario', 'Rossi'),
 ('Giorgio', 'Bianchi'),
 ('Luigi', 'Verdi');
 
 --Inserimento acquisti
 INSERT INTO acquisto (ID_Film, ID_Cliente) VALUES
 (1, 1),
 (2, 2),
 (3, 3);
 
 --Inserimento fatture
 INSERT INTO fattura (Data_Pagamento, Prezzo, ID_Acquisto) VALUES
 ('2022-01-01', 100, 1),
 ('2022-02-15', 150, 2),
 ('2022-03-30', 200, 3);
 