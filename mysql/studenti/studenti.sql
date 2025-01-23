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
    capogruppo INT NOT NULL,
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


INSERT INTO studenti (nome, cognome, data_nascita, FK_corsi, capogruppo) VALUES
('Giuseppe', 'Rossi', '1990-05-15', 1, 1),
('Maria', 'Bianchi', '1992-03-20', 2, 2),
('Luca', 'Verdi', '1991-08-10', 3, 1),
('Giorgio', 'Gialli', '1992-07-15', 4, 2),
('Anna', 'Neri', '1990-12-05', 5, 1),
('Andrea', 'Rossi', '1991-06-10', 6, 2),
('Giuseppe', 'Bianchi', '1990-05-15', 1, 2),
('Maria', 'Verdi', '1992-03-20', 2, 1),
('Luca', 'Gialli', '1992-07-15', 4, 2);




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


select s.cognome, s.nome, s.data_nascita as 'data di nascita' 
from studenti s;


select s.nome 
from studenti s 
where s.cognome = "Rossi";


select YEAR(CURDATE()) - YEAR(s.data_nascita) as 'età'
from studenti s 
where s.matricola = '1';

select s.nome 
from studenti s 
where s.nome like 'M%';

select v.voto from valutazioni v where v.FK_studenti = '1';


select v.voto from valutazioni v join studenti s on v.FK_studenti = s.matricola and s.cognome = 'Rossi';


select s.matricola, s.nome, s.cognome, s.data_nascita as 'data nascita', c.nome as 'corso di studi' from studenti s join corsi c on s.FK_corsi = c.id;

select s.cognome, s.nome, v.voto, m.nome as 'materia', YEAR(CURDATE()) - YEAR(s.data_nascita) as 'data di nascita'
from studenti s, valutazioni v, materie m 
where s.matricola = v.FK_studenti and v.FK_materie = m.id 
order by cognome;

select s.cognome, s.nome, v.voto, m.nome as 'materia', YEAR(CURDATE()) - YEAR(s.data_nascita) as 'età'
from studenti s, valutazioni v, materie m 
where s.matricola = v.FK_studenti and v.FK_materie = m.id and s.cognome like 'M%'
order by cognome;

select s.cognome, COUNT(v.voto) as 'numero voti', AVG(v.voto) as 'media voti', MAX(v.voto) as 'voto massimo', MIN(v.voto) as 'voto minimo'
from valutazioni v, studenti s
where v.FK_studenti = '7' and s.matricola = v.FK_studenti
GROUP BY s.cognome;

select COUNT(s.matricola) as "numero studenti maggiorenni" 
from studenti s 
WHERE YEAR(CURDATE()) - YEAR(s.data_nascita) >= 18;

select s.cognome as 'studenti senza voti' 
from studenti s 
LEFT JOIN valutazioni v ON s.matricola = v.FK_studenti 
WHERE v.voto IS NULL;