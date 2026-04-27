USE shop_db_motogna;

-- Alle Bestellungen vom Kunden löschen
DELETE FROM bestellung
WHERE verkauf_id IN (
SELECT verkauf_id FROM verkauf WHERE kunden_id = 1
);

-- Verkäufe vom Kunden löschen
DELETE FROM verkauf
WHERE kunden_id = 1;

-- Kunde löschen
DELETE FROM kunden
WHERE kunden_id = 1;

-- Alle Bestellungen mit diesem Artikel löschen
DELETE FROM bestellung
WHERE artikel_id = 1;

-- Artikel löschen
DELETE FROM artikel
WHERE artikel_id = 1;
