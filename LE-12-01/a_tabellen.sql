DROP DATABASE IF EXISTS Shop_DB_Motogna;
-- Datenbank erstellen
CREATE DATABASE IF NOT EXISTS Shop_DB_Motogna;
USE Shop_DB_Motogna;

-- Tabelle Kunden
CREATE TABLE kunden (
    kunden_id INT AUTO_INCREMENT PRIMARY KEY,
    vorname VARCHAR(100),
    nachname VARCHAR(100),
    strasse VARCHAR(100),
    hausnummer VARCHAR(10),
    postleitzahl VARCHAR(10),
    stadt VARCHAR(100),
    telefonnummer VARCHAR(20),
    email VARCHAR(255)
);

-- Tabelle Lieferanten
CREATE TABLE lieferanten (
    lieferanten_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    strasse VARCHAR(100),
    hausnummer VARCHAR(10),
    postleitzahl VARCHAR(10),
    stadt VARCHAR(100),
    telefonnummer VARCHAR(20),
    email VARCHAR(255)
);

-- Tabelle Artikel
CREATE TABLE artikel (
    artikel_id INT AUTO_INCREMENT PRIMARY KEY,
    bezeichnung VARCHAR(100),
    beschreibung TEXT,
    preis DECIMAL(10,2),
    lagerbestand INT,
    lieferanten_id INT,
    FOREIGN KEY (lieferanten_id) REFERENCES lieferanten(lieferanten_id)
);

-- Tabelle Verkauf
CREATE TABLE verkauf (
    verkauf_id INT AUTO_INCREMENT PRIMARY KEY,
    kunden_id INT,
    lieferanten_id INT,
    artikel_id INT,
    menge INT,
    datum DATE,
    FOREIGN KEY (kunden_id) REFERENCES kunden(kunden_id),
    FOREIGN KEY (lieferanten_id) REFERENCES lieferanten(lieferanten_id),
    FOREIGN KEY (artikel_id) REFERENCES artikel(artikel_id)
);