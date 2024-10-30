--Crea database
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

-- Crea la tabella degli autori
CREATE TABLE IF NOT EXISTS autori (
    id_autore INT AUTO_INCREMENT PRIMARY KEY,
    nome_autore VARCHAR(50) NOT NULL,
    nazionalita VARCHAR(50),
    data_nascita DATE,
    data_morte DATE
);

-- Inserire alcuni dati nella tabella degli autori
INSERT INTO autori (nome_autore, nazionalita, data_nascita, data_morte)
VALUES
    ('Jane Austen', 'Inglese', '1775-12-16', '1817-07-18'),
    ('George Orwell', 'Inglese', '1903-06-25', '1950-01-21'),
    ('Harper Lee', 'Americana', '1926-04-28', '2016-02-19');

-- Verifico il corretto inserimento dei dati
SELECT * FROM autori;

-- Creare la tabella delle categorie
CREATE TABLE IF NOT EXISTS categorie (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL
);

-- Inserire alcuni dati nella tabella delle categorie
INSERT INTO categorie (nome_categoria)
VALUES
    ('Romanzo'),
    ('Saggio'),
    ('Fantascienza'),
    ('Mistero');

-- Verifico il corretto inserimento dei dati
SELECT * FROM categorie ;

-- Creare la tabella dei libri
CREATE TABLE IF NOT EXISTS libri (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titolo VARCHAR(100) NOT NULL,
    id_autore INT,
    id_categoria INT,
    anno_pubblicazione INT,
    FOREIGN KEY (id_autore) REFERENCES autori(id_autore),
    FOREIGN KEY (id_categoria) REFERENCES categorie(id_categoria)
);

-- Inserire alcuni dati nella tabella dei libri
INSERT INTO libri (titolo, id_autore, id_categoria, anno_pubblicazione)
VALUES
    ('Orgoglio e pregiudizio', 1, 1, 1813),
    ('1984', 2, 3, 1949),
    ('Il buio oltre la siepe', 3, 1, 1960),
    ('Guerra e pace', 1, 1, 1869);

-- Verifico il corretto inserimento dei dati
SELECT * FROM libri;
