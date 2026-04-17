CREATE TABLE if not exists kunden(
    Kunden_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Vorname VARCHAR(100),
    Email VARCHAR(100),
    Telefon VARCHAR(50),
    Geburtsdatum DATE
);