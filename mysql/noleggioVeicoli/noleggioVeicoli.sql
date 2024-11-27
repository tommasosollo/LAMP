CREATE DATABASE NoleggioVeicoli;
USE NoleggioVeicoli;

CREATE TABLE Clienti (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    data_registrazione TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Veicoli (
    veicolo_id INT AUTO_INCREMENT PRIMARY KEY,
    modello VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    anno INT CHECK (anno >= 2000 AND anno <= 2024),
    targa VARCHAR(15) UNIQUE NOT NULL,
    prezzo_giornaliero DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Noleggi (
    noleggio_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    veicolo_id INT NOT NULL,
    data_inizio DATE NOT NULL,
    data_fine DATE NOT NULL,
    totale DECIMAL(10, 2) NOT NULL CHECK (totale > 0),
    FOREIGN KEY (cliente_id) REFERENCES Clienti(cliente_id) ON DELETE CASCADE,
    FOREIGN KEY (veicolo_id) REFERENCES Veicoli(veicolo_id) ON DELETE CASCADE
);

CREATE TABLE Pagamenti (
    pagamento_id INT AUTO_INCREMENT PRIMARY KEY,
    noleggio_id INT NOT NULL,
    data_pagamento DATE NOT NULL,
    importo DECIMAL(10, 2) NOT NULL CHECK (importo > 0),
    metodo_pagamento ENUM('Carta', 'Bonifico', 'Contanti') NOT NULL,
    FOREIGN KEY (noleggio_id) REFERENCES Noleggi(noleggio_id) ON DELETE CASCADE
);

INSERT INTO Clienti (nome, cognome, email, telefono)
VALUES 
    ('Mario', 'Rossi', 'mario.rossi@email.com', '3331234567'),
    ('Anna', 'Bianchi', 'anna.bianchi@email.com', '3349876543'),
    ('Luca', 'Verdi', 'luca.verdi@email.com', '3355678901');

INSERT INTO Veicoli (modello, marca, anno, targa, prezzo_giornaliero)
VALUES 
    ('Panda', 'Fiat', 2020, 'AB123CD', 30.00),
    ('Golf', 'Volkswagen', 2019, 'EF456GH', 45.00),
    ('Civic', 'Honda', 2021, 'IJ789KL', 50.00);

INSERT INTO Noleggi (cliente_id, veicolo_id, data_inizio, data_fine, totale)
VALUES 
    (1, 1, '2024-11-01', '2024-11-05', 120.00),
    (2, 2, '2024-11-10', '2024-11-12', 90.00);

INSERT INTO Pagamenti (noleggio_id, data_pagamento, importo, metodo_pagamento)
VALUES 
    (1, '2024-11-05', 120.00, 'Carta'),
    (2, '2024-11-12', 90.00, 'Bonifico');




SELECT * FROM Clienti;
SELECT * FROM Veicoli;
SELECT * FROM Noleggi;
SELECT * FROM Pagamenti;



ALTER TABLE Clienti ADD COLUMN indirizzo VARCHAR(100);
ALTER TABLE Veicoli MODIFY COLUMN prezzo_giornaliero DECIMAL(10, 2) NULL;

DROP TABLE Pagamenti;

CREATE TABLE Pagamenti (
    pagamento_id INT AUTO_INCREMENT PRIMARY KEY,
    noleggio_id INT NOT NULL,
    data_pagamento DATE NOT NULL,
    importo DECIMAL(10, 2) NOT NULL CHECK (importo > 0),
    metodo_pagamento ENUM('Carta', 'Bonifico', 'Contanti') NOT NULL,
    FOREIGN KEY (noleggio_id) REFERENCES Noleggi(noleggio_id) ON DELETE CASCADE
);




INSERT INTO Clienti (nome, cognome) VALUES ('Giulia', 'Rossi');

INSERT INTO Clienti (nome, cognome, email, telefono)
VALUES 
    ('Giulio', 'Rossi', 'mario.rossi@email.com', '3331234567');

INSERT INTO Veicoli (modello, marca, anno, targa, prezzo_giornaliero)
VALUES ('Focus', 'Ford', 2022, 'AB123CD', 40.00);

INSERT INTO Veicoli (modello, marca, anno, targa, prezzo_giornaliero)
VALUES ('Clio', 'Renault', 2025, 'ST696TS', 40.00);

INSERT INTO Noleggi (cliente_id, veicolo_id, data_inizio, data_fine, totale)
VALUES 
    (1, 3, '2024-11-01', '2024-11-05', -120.00);

INSERT INTO Noleggi (cliente_id, veicolo_id, data_inizio, data_fine, totale)
VALUES 
    (100, 3, '2024-11-01', '2024-11-05', 120.00);

DELETE FROM Clienti WHERE Cliente_id = 1;