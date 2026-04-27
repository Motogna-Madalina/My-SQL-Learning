USE Shop_DB_Motogna;

-- Alle Kunden anzeigen
SELECT * FROM kunden;

-- Alle Lieferanten anzeigen
SELECT * FROM lieferanten;

-- Alle Artikel anzeigen
SELECT * FROM artikel;

-- Lagerbestand eines bestimmten Artikels anzeigen
SELECT lagerbestand
FROM artikel
WHERE artikel_id = 1;


-- Alle Verkäufe eines bestimmten Kunden anzeigen
SELECT *
FROM verkauf
WHERE kunden_id = 1;


-- Alle Verkäufe eines bestimmten Lieferanten anzeigen
SELECT *
FROM verkauf
WHERE lieferanten_id = 1;


-- Alle Artikel unter einem bestimmten Preis anzeigen
SELECT *
FROM artikel
WHERE preis < 200;


-- Gesamtumsatz des Shops berechnen
SELECT SUM(artikel.preis * verkauf.menge) AS gesamtumsatz
FROM verkauf
JOIN artikel ON verkauf.artikel_id = artikel.artikel_id;


-- Lagerbestand eines Artikels um eine bestimmte Menge reduzieren
UPDATE artikel
SET lagerbestand = lagerbestand - 2
WHERE artikel_id = 1;


-- Einen Kunden und alle zugehörigen Verkäufe löschen
DELETE FROM verkauf
WHERE kunden_id = 2;

DELETE FROM kunden
WHERE kunden_id = 2;


-- Einen Artikel und alle zugehörigen Verkäufe löschen
DELETE FROM verkauf
WHERE artikel_id = 3;

DELETE FROM artikel
WHERE artikel_id = 3;


-- Alle Verkäufe mit Informationen zu Kunde, Lieferant und Artikel anzeigen
SELECT verkauf.verkauf_id,
       kunden.vorname,
       kunden.nachname,
       artikel.bezeichnung,
       lieferanten.name,
       verkauf.menge,
       verkauf.datum
FROM verkauf
JOIN kunden ON verkauf.kunden_id = kunden.kunden_id
JOIN artikel ON verkauf.artikel_id = artikel.artikel_id
JOIN lieferanten ON verkauf.lieferanten_id = lieferanten.lieferanten_id;


-- Alle Artikel und ihre Lieferanten anzeigen
SELECT artikel.bezeichnung,
       lieferanten.name
FROM artikel
JOIN lieferanten ON artikel.lieferanten_id = lieferanten.lieferanten_id;