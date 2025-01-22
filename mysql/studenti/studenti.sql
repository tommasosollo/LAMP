CREATE DATABASE IF NOT EXISTS studenti;
USE studenti;


CREATE TABLE corsi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE studenti (
    matricola INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    data_nascita DATE NOT NULL,
    FK_corsi INT NOT NULL,
    FOREIGN KEY (FK_corsi) REFERENCES corsi(id) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE materie (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE valutazioni (
    id INT AUTO_INCREMENT PRIMARY KEY,
    FK_studenti INT NOT NULL,
    FK_materie INT NOT NULL,
    voto INT NOT NULL,
    FOREIGN KEY (FK_studenti) REFERENCES studenti(matricola) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (FK_materie) REFERENCES materie(id) ON DELETE NO ACTION ON UPDATE CASCADE
);


INSERT INTO corsi (nome) VALUES
('Informatica'),
('Matematica'),
('Scienze'),
('Lingue'),
('Geografia'),
('Economia');


INSERT INTO studenti (nome, cognome, data_nascita, FK_corsi) VALUES
('Mario', 'Rossi', '1995-05-20', 1),
('Giuseppe', 'Bianchi', '1998-08-15', 2),
('Luigi', 'Verdi', '1997-03-10', 3),
('Anna', 'Neri', '1996-12-12', 4),
('Giorgio', 'Gialli', '1999-07-05', 1),
('Antonio', 'Pellegrini', '1998-11-01', 2),
('Emanuele', 'Russo', '1997-06-07', 3),
('Francesco', 'Marconi', '1996-10-03', 4);


INSERT INTO materie (nome) VALUES
('Algebra'),
('Geometria'),
('Fisica'),
('Italiano'),
('Inglese'),
('Lettere'),
('Matematica');


INSERT INTO valutazioni (FK_studenti, FK_materie, voto) VALUES
(1, 1, 8),
(1, 2, 9),
(1, 3, 10),
(1, 4, 7),
(1, 5, 8),
(2, 1, 9),
(2, 2, 8),
(2, 3, 9),
(2, 4, 9),
(2, 5, 9),
(3, 1, 8),
(3, 2, 7),
(3, 3, 8),
(3, 4, 9),
(3, 5, 8),
(4, 1, 9),
(4, 2, 9),
(4, 3, 8),
(4, 4, 9),
(4, 5, 9),
(5, 1, 9),
(5, 2, 9),
(5, 3, 9),
(5, 4, 9),
(5, 5, 9),
(6, 1, 8),
(6, 2, 9),
(6, 3, 8),
(6, 4, 9),
(6, 5, 8),
(7, 1, 9),
(7, 2, 9),
(7, 3, 9),
(7, 4, 9),
(7, 5, 9),
(8, 1, 8),
(8, 2, 9),
(8, 3, 9),
(8, 4, 9),
(8, 5, 9);


select s.matricola, s.nome, s.cognome, s.data_nascita as 'data nascita', c.nome as 'corso di studi' from studenti s join corsi c on s.FK_corsi = c.id;

select s.cognome, s.nome, v.voto, m.nome as 'materia' from studenti s, valutazioni v, materie m where s.matricola = v.FK_studenti and v.FK_materie = m.id order by cognome;



