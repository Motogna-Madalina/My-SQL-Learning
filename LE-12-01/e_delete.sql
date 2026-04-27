
USE Shop_DB_Motogna;
-- Verkäufe von einem Kunden löschen
DELETE FROM verkauf
WHERE kunden_id = 2;

-- Kunden löschen
DELETE FROM kunden
WHERE kunden_id = 2;


-- Verkäufe von einem Artikel löschen
DELETE FROM verkauf
WHERE artikel_id = 3;

-- Artikel löschen
DELETE FROM artikel
WHERE artikel_id = 3;