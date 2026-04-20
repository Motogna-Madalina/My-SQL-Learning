CREATE DATABASE maschinen;
USE maschinen;

-- Punkt 1

CREATE TABLE produktionsmaschinen (
    maschinenID INT,
    variante INT,
    bezeichnung VARCHAR(200) NOT NULL,

    PRIMARY KEY(maschinenID, variante )
);

-- Punkt 2

DROP TABLE produktionsmaschinen;
CREATE TABLE produktionsmaschinen (
    globalID INT PRIMARY KEY,
    maschinenID INT,
    variante INT,
    bezeichnung VARCHAR(200),

    UNIQUE (maschinenID, variante)
);

-- Punkt 3

DROP TABLE produktionsmaschinen;
CREATE TABLE produktionsmaschinen (
    globalID INT,
    laufzeit INT,
    maxlaufzeit INT,
    machinenID INT,
    variante INT,
    bezeichung VARCHAR(200),

    PRIMARY KEY (globalID),
    UNIQUE (machinenID, variante),
    CHECK (laufzeit < maxlaufzeit)
 );
 