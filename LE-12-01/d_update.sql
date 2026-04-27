USE Shop_DB_Motogna;

-- Lager von einem Artikel verringern
UPDATE artikel
SET lagerbestand = lagerbestand - 2
WHERE artikel_id = 1;


-- Preis von einem Artikel ändern
UPDATE artikel
SET preis = 999.99
WHERE artikel_id = 1;


-- Stadt von einem Kunden ändern
UPDATE kunden
SET stadt = 'Salzburg'
WHERE kunden_id = 1;


-- Telefonnummer von einem Lieferanten ändern
UPDATE lieferanten
SET telefonnummer = '0800111222'
WHERE lieferanten_id = 2;