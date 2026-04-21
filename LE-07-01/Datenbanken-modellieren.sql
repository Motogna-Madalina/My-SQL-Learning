CREATE DATABASE IF NOT EXISTS bibliothek;
USE bibliothek;

CREATE TABLE verlag (
    verlagID INT PRIMARY KEY,
    verlag VARCHAR(100)
);

CREATE TABLE fachbereich (
    fachbereichID INT PRIMARY KEY,
    fachbereich VARCHAR(100)
);

CREATE TABLE fachbuch (
    fachbuchID INT PRIMARY KEY,
    isbn VARCHAR(20),
    titel VARCHAR(255),
    verlagID INT,
    FOREIGN KEY (verlagID) REFERENCES verlag(verlagID)
);

CREATE TABLE fachbereichfachbuch (
    fachbereichID INT,
    fachbuchID INT,
    PRIMARY KEY (fachbereichID, fachbuchID),
    FOREIGN KEY (fachbereichID) REFERENCES fachbereich(fachbereichID),
    FOREIGN KEY (fachbuchID) REFERENCES fachbuch(fachbuchID)
);

-- -----------------------------------------
-- Punkt 1: Join query
-- Join books (fachbuch) with publishers (verlag)
-- Only matching records are returned (INNER JOIN)

SELECT
    fachbuch.titel,
    fachbuch.isbn,
    fachbuch.verlagid,
    verlag.verlag,
    verlag.verlagid
FROM fachbuch
JOIN verlag
ON fachbuch.verlagid = verlag.verlagid;


-- Punkt 2: LEFT JOIN query
-- Return all books, even if they have no publisher
-- Missing publisher values appear as NULL

SELECT
    fachbuch.titel,
    fachbuch.isbn,
    fachbuch.verlagid,
    verlag.verlag,
    verlag.verlagid
FROM fachbuch
LEFT JOIN verlag
ON fachbuch.verlagid = verlag.verlagid;


-- Punkt 3: CROSS JOIN
-- Combine every book with every publisher
-- Produces all possible combinations

SELECT
    fachbuch.titel,
    verlag.verlag
FROM fachbuch
CROSS JOIN verlag;


-- Punkt 4: Join query (many-to-many relationship)
-- Connect books with subject areas using a linking table
-- Result: each book with its corresponding subject areas

SELECT
    fachbuch.titel,
    fachbereich.fachbereich
FROM fachbuch
JOIN fachbereichfachbuch
    ON fachbuch.fachbuchID = fachbereichfachbuch.fachbuchID
JOIN fachbereich
    ON fachbereichfachbuch.fachbereichID = fachbereich.fachbereichID;


-- Punkt 5: Join query
-- Create a table for loans (ausleihe)
-- Join books with loans using ISBN
-- Result: borrowed books with loan dates

CREATE TABLE ausleihe (
    ausleiheID INT,
    exemplarID INT,
    von DATE,
    bis DATE,
    isbn VARCHAR(20),
    titel VARCHAR(255),
    PRIMARY KEY (ausleiheID, exemplarID)
);

SELECT
    fachbuch.isbn,
    fachbuch.titel,
    ausleihe.von,
    ausleihe.bis
FROM fachbuch
JOIN ausleihe
    ON fachbuch.isbn = ausleihe.isbn;