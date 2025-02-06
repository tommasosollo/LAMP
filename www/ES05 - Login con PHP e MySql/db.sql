CREATE DATABASE IF NOT EXISTS ES05;
USE ES05;

DROP USER IF EXISTS 'ES05_user'@'localhost';
CREATE USER 'ES05_user'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE ON ES05.* TO 'ES05_user'@'localhost';

CREATE TABLE IF NOT EXISTS Utenti (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Nome VARCHAR(50) NOT NULL,
    Cognome VARCHAR(50) NOT NULL
);

INSERT INTO Utenti (Username, Password, Email, Nome, Cognome) VALUES 
('user1', 'password1', 'user1@example.com', 'User', 'One');