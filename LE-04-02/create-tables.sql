CREATE TABLE if not exists kunden(
    Kunden_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Vorname VARCHAR(100),
    Email VARCHAR(100),
    Telefon VARCHAR(50),
    Geburtsdatum DATE
);

DROP TABLE IF EXISTS mitarbeitergeschenk;


CREATE TABLE mitarbeitergeschenk (
    geschenkID SMALLINT PRIMARY KEY,
    artikel VARCHAR(200) NOT NULL UNIQUE,
    preis DECIMAL(5,2) NOT NULL DEFAULT 0.00,
    jahrzugehörigkeit SMALLINT NOT NULL CHECK (jahrzugehörigkeit IN (5, 10, 15, 20))
);