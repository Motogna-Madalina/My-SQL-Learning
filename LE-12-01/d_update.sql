USE Shop_DB_Motogna;

-- Lagerbestand reduzieren
UPDATE artikel
SET lagerbestand = lagerbestand - 1
WHERE artikel_id = 1;

-- Preis ändern
UPDATE artikel
SET preis = 899.99
WHERE artikel_id = 1;

-- Kunde ändern
UPDATE kunden
SET stadt = 'Salzburg'
WHERE kunden_id = 1;
