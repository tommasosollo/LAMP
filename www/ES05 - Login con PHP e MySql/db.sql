CREATE DATABASE IF NOT EXISTS ES05;
USE ES05;

DROP USER IF EXISTS 'ES05_user'@'localhost';
CREATE USER 'ES05_user'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE ON ES05.* TO 'ES05_user'@'localhost';

CREATE TABLE IF NOT EXISTS Utenti (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL
);

INSERT INTO utenti (UserID, Username, Password )
VALUES (NULL, 'utente', 'prova');

