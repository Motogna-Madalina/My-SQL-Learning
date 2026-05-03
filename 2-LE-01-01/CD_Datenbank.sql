DROP DATABASE IF EXISTS cd_datenbank;
CREATE DATABASE IF NOT EXISTS cd_datenbank;
USE cd_datenbank;

-- ======================
-- TABLA Musikrichtung
-- ======================
CREATE TABLE IF NOT EXISTS Musikrichtung (
    MusikrichtungID INT PRIMARY KEY,
    Musikrichtung VARCHAR(255)
);

-- ======================
-- TABLA Interpreten
-- ======================
CREATE TABLE IF NOT EXISTS Interpreten (
    InterpretID INT PRIMARY KEY,
    Interpret VARCHAR(255)
);

-- ======================
-- TABLA CD
-- ======================
CREATE TABLE IF NOT EXISTS CD (
    CDNr INT PRIMARY KEY,
    CDName VARCHAR(255),
    MusikrichtungID INT,
    FOREIGN KEY (MusikrichtungID) REFERENCES Musikrichtung(MusikrichtungID)
);

-- ======================
-- TABLA Titel
-- ======================
CREATE TABLE IF NOT EXISTS Titel (
    TitelNr INT PRIMARY KEY,
    Titel VARCHAR(255),
    Beurteilung INT
);

-- ======================
-- TABLA CD_Titel
-- ======================
CREATE TABLE IF NOT EXISTS CD_Titel (
    TitelNr INT,
    CDNr INT,
    FOREIGN KEY (TitelNr) REFERENCES Titel(TitelNr),
    FOREIGN KEY (CDNr) REFERENCES CD(CDNr)
);

-- ======================
-- TABLA Titel_Interpreten
-- ======================
CREATE TABLE IF NOT EXISTS Titel_Interpreten (
    InterpretID INT,
    TitelNr INT,
    FOREIGN KEY (InterpretID) REFERENCES Interpreten(InterpretID),
    FOREIGN KEY (TitelNr) REFERENCES Titel(TitelNr)
);

-- ======================
-- TABLA CD_Interpreten
-- ======================
CREATE TABLE IF NOT EXISTS CD_Interpreten (
    InterpretID INT,
    CDNr INT,
    FOREIGN KEY (InterpretID) REFERENCES Interpreten(InterpretID),
    FOREIGN KEY (CDNr) REFERENCES CD(CDNr)
);