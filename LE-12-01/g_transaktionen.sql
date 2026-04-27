USE shop_db_motogna;

-- Transaktion starten
START TRANSACTION;

-- Lager reduzieren
UPDATE artikel
SET lagerbestand = lagerbestand - 1
WHERE artikel_id = 1;

-- Neuer Verkauf
INSERT INTO verkauf (kunden_id, datum)
VALUES (1, CURDATE());

-- Bestellung hinzufügen
INSERT INTO bestellung (verkauf_id, artikel_id, menge)
VALUES (LAST_INSERT_ID(), 1, 1);

-- Alles speichern
COMMIT;

-- Bei Fehler:
-- ROLLBACK;
