--#collegamento al server DB
-- mysql -u root -p 
-- crea il database "gestione_voli"
CREATE DATABASE gestione_voli;
-- seleziona il database appena creato
USE gestione_voli;

CREATE USER IF NOT EXISTS dbadmin@localhost IDENTIFIED BY 'lamp';
GRANT SELECT, INSERT, UPDATE, DELETE ON gestione_voli.* TO dbadmin@localhost;
GRANT ALL ON gestione_voli.* TO dbadmin@localhost;

-- crea la tabella "aerei"
CREATE TABLE aerei (
   id_aereo INT PRIMARY KEY,
   modello VARCHAR(50),
   compagnia_aerea VARCHAR(50),
   posti_totali INT
);
SHOW TABLES;

-- inserisce alcuni dati nella tabella "aerei"
INSERT INTO aerei (id_aereo, modello, compagnia_aerea, posti_totali)
VALUES
   (1, 'Airbus A320', 'Alitalia', 180),
   (2, 'Boeing 737', 'Ryanair', 189),
   (3, 'Airbus A380', 'Emirates', 853);

INSERT INTO aerei (id_aereo, modello, compagnia_aerea, posti_totali)
VALUES (9, 'Boeing 777', 'Alitalia', 280);

-- crea la tabella "aeroporti"
CREATE TABLE aeroporti (
   id_aeroporto INT PRIMARY KEY,
   nome VARCHAR(50),
   citta VARCHAR(50),
   paese VARCHAR(50)
);

-- inserisce alcuni dati nella tabella "aeroporti"
INSERT INTO aeroporti (id_aeroporto, nome, citta, paese)
VALUES
   (1, 'Leonardo da Vinci', 'Roma', 'Italia'),
   (2, 'Malpensa', 'Milano', 'Italia'),
   (3, 'Heathrow', 'Londra', 'Regno Unito');

-- crea la tabella "voli"
CREATE TABLE voli (
   id_volo INT PRIMARY KEY,
   id_aereo INT,
   id_aeroporto_partenza INT,
   id_aeroporto_arrivo INT,
   data_ora_partenza DATETIME,
   data_ora_arrivo DATETIME,
   FOREIGN KEY (id_aereo) REFERENCES aerei(id_aereo),
   FOREIGN KEY (id_aeroporto_partenza) REFERENCES aeroporti(id_aeroporto),
   FOREIGN KEY (id_aeroporto_arrivo) REFERENCES aeroporti(id_aeroporto)
);

-- inserisce alcuni dati nella tabella "voli"
INSERT INTO voli (id_volo, id_aereo, id_aeroporto_partenza, id_aeroporto_arrivo,
                  data_ora_partenza, data_ora_arrivo)
VALUES
   (1, 1, 1, 2, '2023-02-01 08:00:00', '2023-02-01 10:00:00'),
   (2, 2, 2, 3, '2023-02-02 08:00:00', '2023-02-02 10:00:00'),
   (3, 3, 1, 3, '2023-02-03 08:00:00', '2023-02-03 10:00:00'),
   (4, 1, 2, 1, '2023-02-04 08:00:00', '2023-02-04 10:00:00'),
   (5, 2, 3, 2, '2023-02-05 08:00:00', '2023-02-05 10:00:00'),
   (6, 3, 2, 1,'2023-02-06 08:00:00','2023-02-06 10:00:00');

-- Ecco il codice SQL per aggiungere altri 5 record alle tabelle del database:

-- inserisce alcuni dati nella tabella "aerei"
INSERT INTO aerei (id_aereo, modello, compagnia_aerea, posti_totali)
VALUES
   (4, 'Boeing 747', 'British Airways', 416),
   (5, 'Airbus A330', 'Delta Air Lines', 277),
   (6, 'Boeing 777', 'American Airlines', 396),
   (7, 'Airbus A350', 'Qatar Airways', 440),
   (8, 'Boeing 787', 'Etihad Airways', 254);

-- inserisce alcuni dati nella tabella "aeroporti"
INSERT INTO aeroporti (id_aeroporto, nome, citta, paese)
VALUES
   (4, 'Charles de Gaulle', 'Parigi', 'Francia'),
   (5, 'Schiphol', 'Amsterdam', 'Paesi Bassi'),
   (6, 'Dubai International', 'Dubai', 'Emirati Arabi Uniti'),
   (7, 'Los Angeles International', 'Los Angeles', 'Stati Uniti'),
   (8, 'Narita International Airport', 'Tokyo', 'Giappone');

-- inserisce alcuni dati nella tabella "voli"
INSERT INTO voli (id_volo, id_aereo, id_aeroporto_partenza, id_aeroporto_arrivo,
                  data_ora_partenza, data_ora_arrivo)
VALUES
   (7, 3, 3, 1,'2023-02-07 08:00:00','2023-02-07 10:00:00'),
   (8, 4, 4, 2,'2023-02-08 08:00:00','2023-02-08 10:00:00'),
   (9, 5, 5, 3,'2023-02-09 08:00:00','2023-02-09 10:00:00'),
   (10,6,1 ,2,'2023-02-10 08:00:00','2023-02-10 10:00:00'),
   (11,7 ,2 ,1,'2023-02-11 08:00:00','2023-02-11 10:00:00');

ALTER TABLE aeroporti MODIFY COLUMN nome VARCHAR(100);

INSERT INTO aeroporti (id_aeroporto, nome, citta, paese) VALUES
(9, 'Dublin Airport', 'Dublino', 'Irlanda'),
(10, 'Barajas Airport', 'Madrid', 'Spagna'),
(11, 'Vienna International Airport', 'Vienna', 'Austria'),
(12, 'Brussels Airport', 'Bruxelles', 'Belgio'),
(13, 'Zurich Airport', 'Zurigo', 'Svizzera'),
(14, 'Geneva Airport', 'Ginevra', 'Svizzera'),
(15, 'Frankfurt Airport', 'Francoforte sul Meno', 'Germania'),
(16, 'Munich Airport', 'Monaco di Baviera', 'Germania'),
(17, 'Copenhagen Airport', 'Copenaghen', 'Danimarca'),
(18, 'Oslo Airport', 'Oslo', 'Norvegia'),
(19, 'Stockholm Arlanda Airport', 'Stoccolma', 'Svezia'),
(20, 'Helsinki Airport', 'Helsinki', 'Finlandia'),
(21, 'Manchester Airport', 'Manchester', 'Regno Unito'),
(22, 'Edinburgh Airport', 'Edimburgo', 'Regno Unito'),
(23, 'Dubai World Central - Al Maktoum International Airport', 'Dubai', 'Emirati Arabi Uniti'),
(24, 'Abu Dhabi International Airport', 'Abu Dhabi', 'Emirati Arabi Uniti'),
(25, 'Hong Kong International Airport', 'Hong Kong', 'Cina'),
(26, 'Shanghai Pudong International Airport', 'Shanghai', 'Cina'),
(27, 'Beijing Capital International Airport', 'Pechino', 'Cina'),
(28, 'Singapore Changi Airport', 'Singapore', 'Singapore'),
(29, 'Kuala Lumpur International Airport', 'Kuala Lumpur', 'Malesia'),
(30, 'Sydney Airport', 'Sydney', 'Australia'),
(31, 'Melbourne Airport', 'Melbourne', 'Australia'),
(32, 'Auckland Airport', 'Auckland', 'Nuova Zelanda'),
(33, 'Vancouver International Airport', 'Vancouver', 'Canada'),
(34, 'Toronto Pearson International Airport', 'Toronto', 'Canada'),
(35, 'John F. Kennedy International Airport', 'New York', 'Stati Uniti'),
(36, 'Los Angeles International Airport', 'Los Angeles', 'Stati Uniti'),
(37, 'San Francisco International Airport', 'San Francisco', 'Stati Uniti'),
(38, 'Miami International Airport', 'Miami', 'Stati Uniti');
INSERT IGNORE INTO aeroporti (id_aeroporto, nome, citta, paese) VALUES
(39, 'Las Vegas McCarran International Airport', 'Las Vegas', 'Stati Uniti'),
(40, 'O\'Hare International Airport', 'Chicago', 'Stati Uniti'),
(41, 'Dallas/Fort Worth International Airport', 'Dallas', 'Stati Uniti'),
(42, 'George Bush Intercontinental Airport', 'Houston', 'Stati Uniti'),
(43, 'El Dorado International Airport', 'Bogotá', 'Colombia'),
(44, 'São Paulo-Guarulhos International Airport', 'São Paulo','Brazil'),
(45, 'John F. Kennedy International Airport', 'New York City', 'United States'),
(46, 'Munich Airport', 'Munich', 'Germany'),
(47, 'Cape Town International Airport', 'Cape Town', 'South Africa'),
(48, 'Sheremetyevo International Airport', 'Moscow', 'Russia'),
(49, 'Kuala Lumpur International Airport', 'Sepang', 'Malaysia'),
(50, 'Dubai International Airport', 'Dubai', 'United Arab Emirates'),
(51, 'Chhatrapati Shivaji Maharaj International Airport', 'Mumbai', 'India'),
(52, 'Incheon International Airport', 'Seoul', 'South Korea'),
(53, 'Perth Airport', 'Perth', 'Australia'),
(54, 'Gatwick Airport', 'London', 'United Kingdom'),
(55, 'Brussels Airport', 'Brussels', 'Belgium'),
(56, 'Dublin Airport', 'Dublin', 'Ireland'),
(57, 'Vienna International Airport', 'Vienna', 'Austria'),
(58, 'Kansai International Airport', 'Osaka', 'Japan'),
(59, 'Rajiv Gandhi International Airport', 'Hyderabad', 'India'),
(60, 'Munich Airport', 'Munich', 'Germany'),
(61, 'Copenhagen Airport', 'Copenhagen', 'Denmark'),
(62, 'Taiwan Taoyuan International Airport', 'Taipei', 'Taiwan'),
(63, 'Sheremetyevo International Airport', 'Moscow', 'Russia'),
(64, 'Adolfo Suárez Madrid–Barajas Airport', 'Madrid', 'Spain'),
(65, 'Lisbon Airport', 'Lisbon', 'Portugal');
