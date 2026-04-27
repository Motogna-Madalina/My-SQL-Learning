USE shop_db_motogna;

-- Kunden einfügen
INSERT INTO kunden (vorname, nachname, stadt, email, telefonnummer)
VALUES
('Max', 'Mustermann', 'Wien', '[max@test.com](mailto:max@test.com)', '111111'),
('Anna', 'Musterfrau', 'Graz', '[anna@test.com](mailto:anna@test.com)', '222222');

-- Lieferanten einfügen
INSERT INTO lieferanten (name, stadt, email, telefonnummer)
VALUES
('Tech GmbH', 'Wien', '[tech@test.com](mailto:tech@test.com)', '333333'),
('Office AG', 'Linz', '[office@test.com](mailto:office@test.com)', '444444');

-- Artikel einfügen
INSERT INTO artikel (bezeichnung, preis, lagerbestand, lieferanten_id)
VALUES
('Laptop', 1000.00, 10, 1),
('Maus', 20.00, 50, 2);

-- Verkauf erstellen
INSERT INTO verkauf (kunden_id, datum)
VALUES
(1, '2025-01-01'),
(2, '2025-01-02');

-- Bestellung (Verbindung Verkauf + Artikel)
INSERT INTO bestellung (verkauf_id, artikel_id, menge)
VALUES
(1, 1, 1),
(1, 2, 2),
(2, 2, 1);
