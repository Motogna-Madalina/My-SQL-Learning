DROP DATABASE IF EXISTS Shop_DB_Motogna;

-- Datenbank erstellen
CREATE DATABASE IF NOT EXISTS Shop_DB_Motogna;

-- Datenbank auswählen
USE Shop_DB_Motogna;

-- Tabelle kunden
CREATE TABLE IF NOT EXISTS kunden (
kunden_id INT AUTO_INCREMENT PRIMARY KEY,
vorname VARCHAR(100) NOT NULL,
nachname VARCHAR(100) NOT NULL,
strasse VARCHAR(100),
hausnummer VARCHAR(10),
postleitzahl VARCHAR(10),
stadt VARCHAR(100),
telefonnummer VARCHAR(20) UNIQUE,
email VARCHAR(255) UNIQUE NOT NULL

);

-- Tabelle lieferanten
CREATE TABLE IF NOT EXISTS lieferanten (
lieferanten_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
strasse VARCHAR(100),
hausnummer VARCHAR(10),
postleitzahl VARCHAR(10),
stadt VARCHAR(100),
telefonnummer VARCHAR(20) UNIQUE,
email VARCHAR(255) UNIQUE NOT NULL

);

-- Tabelle artikel
CREATE TABLE IF NOT EXISTS artikel (
artikel_id INT AUTO_INCREMENT PRIMARY KEY,
bezeichnung VARCHAR(100) NOT NULL UNIQUE,
beschreibung TEXT,
preis DECIMAL(10,2) NOT NULL,
lagerbestand INT NOT NULL,
lieferanten_id INT,
FOREIGN KEY (lieferanten_id)
REFERENCES lieferanten(lieferanten_id)

);

-- Tabelle verkauf
CREATE TABLE IF NOT EXISTS verkauf (
verkauf_id INT AUTO_INCREMENT PRIMARY KEY,
kunden_id INT,
datum DATE,
FOREIGN KEY (kunden_id)
REFERENCES kunden(kunden_id)
);

-- Tabelle bestellung (Zwischentabelle)
CREATE TABLE IF NOT EXISTS bestellung (
verkauf_id INT,
artikel_id INT,
menge INT NOT NULL,
FOREIGN KEY (verkauf_id) REFERENCES verkauf(verkauf_id),
FOREIGN KEY (artikel_id) REFERENCES artikel(artikel_id)

);
