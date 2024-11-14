CREATE DATABASE IF NOT EXISTS videoteca;
USE videoteca;

CREATE TABLE IF NOT EXISTS Registi (
    ID_Regista INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Generi (
    ID_Genere INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Film(
    ID_Film INT AUTO_INCREMENT PRIMARY KEY,
    Titolo VARCHAR(100) NOT NULL,
    Anno_Uscita YEAR NOT NULL,
    Durata INT NOT NULL,
    ID_Regista INT NOT NULL,
    ID_Genere INT NOT NULL,
    FOREIGN KEY (ID_Regista) REFERENCES Registi(ID_Regista) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (ID_Genere) REFERENCES Generi(ID_Genere) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Clienti (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    Email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Ricevute (
    ID_Ricevuta INT AUTO_INCREMENT PRIMARY KEY,
    Data_Scandenza DATE NOT NULL,
    ID_Cliente INT NOT NULL,
    ID_Film INT NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Clienti(ID_Cliente) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (ID_Film) REFERENCES Film(ID_Film) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Stati_Pagamenti (
    ID_Stato INT AUTO_INCREMENT PRIMARY KEY,
    Descrizione VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Pagamenti (
    ID_Pagamento INT AUTO_INCREMENT PRIMARY KEY,
    Data_Pagamento DATE,
    Prezzo REAL NOT NULL,
    ID_Ricevuta INT NOT NULL,
    Stato_Pagamento INT NOT NULL,
    FOREIGN KEY (ID_Ricevuta) REFERENCES Ricevute(ID_Ricevuta) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (Stato_Pagamento) REFERENCES Stati_Pagamenti(ID_Stato) ON DELETE NO ACTION ON UPDATE CASCADE
);



INSERT INTO Registi (Nome, Cognome) VALUES
    ('James', 'Cameron'),
    ('Shane', 'Black'),
    ('Enrico', 'Bellini');
 
INSERT INTO Generi (Nome) VALUES
    ('Fantascienza'),
    ('Azione'),
    ('Drammatico');

INSERT INTO Film (Titolo, Durata, Anno_Uscita, ID_Regista, ID_Genere) VALUES
    ('Avatar', 162, 2009, 1, 1),
    ('Titanic', 195, 1997, 1, 3),
    ('Ironman 3', 130, 2013, 2, 2);

INSERT INTO Clienti (Nome, Cognome, Email) VALUES
    ('Mario', 'Rossi', 'mario.rossi@gmail.com'),
    ('Giorgio', 'Bianchi', 'giorgio.bianchi@gmail.com'),
    ('Luigi', 'Verdi', 'luigi.verdi@gmail.com');

INSERT INTO Ricevute (ID_Film, ID_Cliente, Data_Scandenza) VALUES
    (1, 1, '2024-10-27'),
    (2, 2, '2024-10-28'),
    (3, 3, '2024-10-28');

INSERT INTO Stati_Pagamenti (Descrizione) VALUES
    ('Non pagato'),
    ('Pagato');
    
INSERT INTO Pagamenti (Data_Pagamento, Prezzo, ID_Ricevuta, Stato_Pagamento) VALUES
    ('2024-10-10', 100, 1, 2),
    (NULL, 150, 2, 1),
    (NULL, 200, 3, 1);


SHOW TABLES;


