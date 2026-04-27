USE Shop_DB_Motogna;

-- View für Umsatz pro Kunde erstellen
CREATE VIEW kunden_umsatz AS
SELECT kunden.kunden_id,
       kunden.vorname,
       kunden.nachname,
       SUM(artikel.preis * verkauf.menge) AS umsatz
FROM kunden
JOIN verkauf ON kunden.kunden_id = verkauf.kunden_id
JOIN artikel ON verkauf.artikel_id = artikel.artikel_id
GROUP BY kunden.kunden_id, kunden.vorname, kunden.nachname;