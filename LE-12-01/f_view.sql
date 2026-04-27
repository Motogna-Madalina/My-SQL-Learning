USE Shop_DB_Motogna;

-- View für Kunden Umsatz
CREATE OR REPLACE VIEW kunden_umsatz AS
SELECT
kunden.kunden_id,
kunden.vorname,
kunden.nachname,
SUM(artikel.preis * bestellung.menge) AS umsatz
FROM verkauf
JOIN kunden ON verkauf.kunden_id = kunden.kunden_id
JOIN bestellung ON verkauf.verkauf_id = bestellung.verkauf_id
JOIN artikel ON bestellung.artikel_id = artikel.artikel_id
GROUP BY kunden.kunden_id;
