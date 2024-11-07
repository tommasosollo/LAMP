--mysqldump -u root videoteca > videoteca_BK.sql

--Crea Database
--DROP DATABASE IF EXISTS videoteca;
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
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL
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
    FOREIGN KEY (ID_Regista) REFERENCES regista(ID_Regista) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (ID_Produttore) REFERENCES produttore(ID_Produttore) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (ID_Categoria) REFERENCES categoria(ID_Categoria) ON DELETE NO ACTION ON UPDATE CASCADE
);


--Crea tabella attore
CREATE TABLE IF NOT EXISTS attore (
    ID_Attore INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Cognome VARCHAR(50)
);

--Crea tabella attori
CREATE TABLE IF NOT EXISTS Attori (
    ID_Attore INT NOT NULL,
    ID_Film INT NOT NULL,
    FOREIGN KEY (ID_Film) REFERENCES film(ID_Film) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ID_Attore) REFERENCES attore(ID_Attore) ON DELETE CASCADE ON UPDATE CASCADE
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
    Data_Pagamento DATE NOT NULL,
    Prezzo FLOAT NOT NULL,
    ID_Film INT NOT NULL,
    ID_Cliente INT NOT NULL,
    FOREIGN KEY (ID_Film) REFERENCES film(ID_Film) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (ID_Cliente) REFERENCES cliente(ID_Cliente) ON DELETE NO ACTION ON UPDATE CASCADE
);


--******  INSERIMENTO DATI  ******

--Inserimento registi
 INSERT INTO regista (Nome, Cognome) VALUES
 ('James', 'Cameron'),
 ('Shane', 'Black'),
 ('Enrico', 'Bellini');
 
 --Inserimento produttori
 INSERT INTO produttore (Nome, Cognome) VALUES
 ('James', 'Cameron'),
 ('Jon', 'Landau'),
 ('Stan', 'Lee');
 
 --Inserimento categorie
 INSERT INTO categoria (Nome) VALUES
 ('Fantascienza'),
 ('Azione'),
 ('Drammatico');
 
 --Inserimento film
 INSERT INTO film (Titolo, Durata, Anno_Uscita, ID_Regista, ID_Produttore, ID_Categoria) VALUES
 ('Avatar', '2:42', 2009, 1, 1, 1),
 ('Titanic', '3:15', 1997, 1, 2, 3),
 ('Ironman 3', '2:10', 2013, 2, 3, 2);
 
 --Inserimento premi
 INSERT INTO attore (Nome, Cognome) VALUES
 ('Zoe', 'Saldana'),
 ('Sam', 'Worthington'),
 ('Kate', 'Winslet'),
 ('Leonardo','DiCaprio'),
 ('Robert', 'Downey Jr.'),
 ('Ben', 'Kingsley');
 
 --Inserimento attori
 INSERT INTO Attori (ID_Attore, ID_Film) VALUES
 (1, 1),
 (2, 1),
 (3, 2),
 (4, 2),
 (5, 3),
 (6, 3);

 --Inserimento clienti
 INSERT INTO cliente (Nome, Cognome) VALUES
 ('Mario', 'Rossi'),
 ('Giorgio', 'Bianchi'),
 ('Luigi', 'Verdi');
 
 --Inserimento acquisti
 INSERT INTO acquisto (ID_Film, ID_Cliente, Prezzo, Data_Pagamento) VALUES
 (1, 1, 100, '2024-5-27'),
 (2, 2, 150, '2024-5-28'),
 (3, 3, 200, '2024-5-28');
 

 

 