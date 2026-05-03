DROP DATABASE IF EXISTS Vereinsverwaltung;

CREATE DATABASE Vereinsverwaltung;
USE Vereinsverwaltung;

CREATE TABLE IF NOT EXISTS Teams (
    team_id INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Spieler (
    spieler_id INT AUTO_INCREMENT PRIMARY KEY,
    spieler_name VARCHAR(100),
    position VARCHAR(100),
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE IF NOT EXISTS Trainer (
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    trainer_name VARCHAR(100),
    gehalt DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Trainer_Teams (
    team_id INT,
    trainer_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (trainer_id) REFERENCES Trainer(trainer_id)
);


CREATE TABLE IF NOT EXISTS Ausbildungen_fur_Trainer (
    ausbildung_id INT AUTO_INCREMENT PRIMARY KEY,
    ausbildung_name VARCHAR(100)
);


CREATE TABLE IF NOT EXISTS Trainer_Ausbildung (
    trainer_id INT,
    ausbildung_id INT,
    FOREIGN KEY (trainer_id) REFERENCES Trainer(trainer_id),
    FOREIGN KEY (ausbildung_id) REFERENCES Ausbildungen_fur_Trainer(ausbildung_id)
);

CREATE TABLE IF NOT EXISTS Trainer_Spieler (
    trainer_id INT,
    spieler_id INT,
    FOREIGN KEY (trainer_id) REFERENCES Trainer(trainer_id),
    FOREIGN KEY (spieler_id) REFERENCES Spieler(spieler_id)
);