-- Create database
DROP DATABASE IF EXISTS maschinen;
CREATE DATABASE maschinen;
USE maschinen;

-- Punkt 1: Create table with composite primary key
CREATE TABLE produktionsmaschinen (
    maschinenID INT,
    variante INT,
    bezeichnung VARCHAR(200) NOT NULL,

    PRIMARY KEY(maschinenID, variante)
);

-- Punkt 2: Use single primary key and UNIQUE constraint
DROP TABLE produktionsmaschinen;
CREATE TABLE produktionsmaschinen (
    globalID INT PRIMARY KEY,
    maschinenID INT,
    variante INT,
    bezeichnung VARCHAR(200),

    UNIQUE (maschinenID, variante)
);

-- Punkt 3: Add runtime columns and CHECK constraint
DROP TABLE produktionsmaschinen;
CREATE TABLE produktionsmaschinen (
    globalID INT,
    laufzeit INT,
    maxlaufzeit INT,
    maschinenID INT,
    variante INT,
    bezeichnung VARCHAR(200),

    PRIMARY KEY (globalID),
    UNIQUE (maschinenID, variante),
    CHECK (laufzeit < maxlaufzeit)
);