USE Shop_DB_Motogna;

-- Verkauf machen und Lager reduzieren
START TRANSACTION;

UPDATE artikel
SET lagerbestand = lagerbestand - 1
WHERE artikel_id = 1;

INSERT INTO verkauf (kunden_id, lieferanten_id, artikel_id, menge, datum)
VALUES (1, 1, 1, 1, CURDATE());

COMMIT;


-- Neuer Kunde und Verkauf machen
START TRANSACTION;

INSERT INTO kunden (vorname, nachname)
VALUES ('Peter', 'Huber');

INSERT INTO verkauf (kunden_id, lieferanten_id, artikel_id, menge, datum)
VALUES (4, 1, 1, 1, CURDATE());

COMMIT;

-- Preis ändern und Verkäufe aktualisieren
START TRANSACTION;

-- Preis im Artikel ändern
UPDATE artikel
SET preis = 1100.00
WHERE artikel_id = 1;

-- Verkäufe mit neuem Preis berechnen
UPDATE verkauf
SET menge = menge
WHERE artikel_id = 1;

COMMIT;