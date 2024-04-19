-- Creazione del database
CREATE DATABASE verifica_informatica;
USE verifica_informatica;

-- Tabella Dipendenti
CREATE TABLE Dipendenti (
  codDipendente INT AUTO_INCREMENT PRIMARY KEY,
  cognome VARCHAR(50),
  ruolo VARCHAR(20),
  stipendio INT,
  datadinascita DATE,
  codResponsabile INT
);

-- Tabella Progetti
CREATE TABLE Progetti (
  codProjetto INT AUTO_INCREMENT PRIMARY KEY,
  nomeprogetto VARCHAR(100)
);

-- Inserimento di alcuni dati di esempio
INSERT INTO Dipendenti (cognome, ruolo, stipendio, datadinascita, codResponsabile)
VALUES
  ('Rossi', 'Direttore', 50000, '1975-03-15', NULL),
  ('Bianchi', 'Tecnico', 35000, '1988-07-22', 1),
  ('Verdi', 'Amministratore', 40000, '1981-11-05', 1),
  ('Neri', 'Segretario', 25000, '1992-02-28', 3),
  ('Gialli', 'Tecnico', 30000, '1985-09-10', 1),
  ('Blu', 'Direttore', 55000, '1970-06-01', NULL);

INSERT INTO Progetti (nomeprogetto)
VALUES
  ('Progetto Alpha'),
  ('Progetto Beta'),
  ('Progetto Gamma'),
  ('Progetto Delta'),
  ('Progetto Epsilon'),
  ('Progetto Zeta');

UPDATE Dipendenti SET codResponsabile = 6 WHERE codDipendente = 1;
UPDATE Dipendenti SET codResponsabile = 2 WHERE codDipendente IN (3, 4);
UPDATE Dipendenti SET codResponsabile = 3 WHERE codDipendente = 5;

-- Aggiunta di ulteriori dipendenti
INSERT INTO Dipendenti (cognome, ruolo, stipendio, datadinascita, codResponsabile)
VALUES
  ('Viola', 'Tecnico', 18000, '1990-04-12', 2),
  ('Arancione', 'Segretario', 22000, '1988-11-25', 3),
  ('Azzurro', 'Amministratore', 45000, '1979-07-01', 6),
  ('Marrone', 'Direttore', 60000, '1965-02-28', NULL),
  ('Grigio', 'Tecnico', 28000, '1986-09-18', 1),
  ('Rosa', 'Segretario', 20000, '1993-06-10', 2),
  ('Verde Scuro', 'Tecnico', 32000, '1982-12-03', 6),
  ('Beige', 'Amministratore', 38000, '1977-05-15', 1);

-- Aggiunta di ulteriori progetti
INSERT INTO Progetti (nomeprogetto)
VALUES
  ('Progetto Eta'),
  ('Progetto Theta'),
  ('Progetto Iota'),
  ('Progetto Kappa');

-- Assegnazione di codResponsabile per i nuovi dipendenti
UPDATE Dipendenti SET codResponsabile = 10 WHERE codDipendente = 7;
UPDATE Dipendenti SET codResponsabile = 11 WHERE codDipendente = 8;
UPDATE Dipendenti SET codResponsabile = 12 WHERE codDipendente = 9;
UPDATE Dipendenti SET codResponsabile = 13 WHERE codDipendente = 10;
UPDATE Dipendenti SET codResponsabile = 1 WHERE codDipendente = 11;
UPDATE Dipendenti SET codResponsabile = 2 WHERE codDipendente = 12;
UPDATE Dipendenti SET codResponsabile = 3 WHERE codDipendente = 13;


SELECT cognome FROM Dipendenti WHERE stipendio >= 10000 AND stipendio <= 20000 ORDER BY cognome;
SELECT p.nomeprogetto, d.cognome FROM Progetti p JOIN Dipendenti d ON p.codProjetto = d.codResponsabile ORDER BY p.nomeprogetto, d.cognome;
SELECT DISTINCT d.ruolo FROM Dipendenti d LEFT JOIN Progetti p ON d.codResponsabile = p.codProjetto WHERE p.codProjetto IS NULL OR p.codProjetto <> 6;
SELECT cognome FROM Dipendenti WHERE datadinascita BETWEEN '1980-01-01' AND '1992-12-31';
SELECT cognome FROM Dipendenti WHERE cognome LIKE '_e%a';
SELECT d1.cognome FROM Dipendenti d1 JOIN Dipendenti d2 ON d1.codResponsabile = d2.codDipendente;
SELECT d.cognome FROM Dipendenti d LEFT JOIN Dipendenti d2 ON d.codDipendente = d2.codResponsabile WHERE d2.codResponsabile IS NULL;
SELECT * FROM Dipendenti WHERE ruolo IN ('segretario', 'tecnico', 'direttore', 'amministratore');
SELECT COUNT(*) FROM Dipendenti WHERE YEAR(CURRENT_DATE) - YEAR(datadinascita) > 50;
SELECT ruolo, COUNT(*) contaDipendenti, AVG(stipendio) mediaStipendi, MAX(stipendio) stipendioMax, MIN(stipendio) stipendioMin FROM Dipendenti GROUP BY ruolo;
SELECT p.nomeprogetto, COUNT(d.codDipendente) numeroDipendenti FROM Progetti p LEFT JOIN Dipendenti d ON d.codResponsabile = p.codProjetto GROUP BY p.nomeprogetto HAVING COUNT(d.codDipendente) > 5;
SELECT cognome, stipendio FROM Dipendenti ORDER BY stipendio DESC LIMIT 1;
