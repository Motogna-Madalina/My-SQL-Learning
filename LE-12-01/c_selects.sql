USE Shop_DB_Motogna;
-- Alle Kunden
SELECT * FROM kunden;

-- Alle Lieferanten
SELECT * FROM lieferanten;

-- Alle Artikel
SELECT * FROM artikel;

-- Lagerbestand von einem Artikel
SELECT lagerbestand FROM artikel WHERE artikel_id = 1;

-- Verkäufe von einem Kunden
SELECT * FROM verkauf WHERE kunden_id = 1;

-- Verkäufe von einem Lieferanten
SELECT verkauf.verkauf_id, verkauf.datum
FROM verkauf
JOIN bestellung ON verkauf.verkauf_id = bestellung.verkauf_id
JOIN artikel ON bestellung.artikel_id = artikel.artikel_id
WHERE artikel.lieferanten_id = 1;

-- Artikel unter Preis
SELECT * FROM artikel WHERE preis < 100;

-- Gesamtumsatz
SELECT SUM(artikel.preis * bestellung.menge) AS gesamtumsatz
FROM bestellung
JOIN artikel ON bestellung.artikel_id = artikel.artikel_id;

-- Verkäufe mit allen Infos
SELECT
kunden.vorname,
kunden.nachname,
artikel.bezeichnung,
bestellung.menge,
verkauf.datum
FROM verkauf
JOIN kunden ON verkauf.kunden_id = kunden.kunden_id
JOIN bestellung ON verkauf.verkauf_id = bestellung.verkauf_id
JOIN artikel ON bestellung.artikel_id = artikel.artikel_id;

-- Artikel und Lieferanten
SELECT
artikel.bezeichnung,
lieferanten.name
FROM artikel
JOIN lieferanten ON artikel.lieferanten_id = lieferanten.lieferanten_id;
