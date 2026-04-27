USE Shop_DB_Motogna;

-- Beispieldaten für Tabelle Kunden
INSERT INTO kunden (vorname, nachname, strasse, hausnummer, postleitzahl, stadt, telefonnummer, email)
VALUES
('Luca', 'Motogna', 'Hauptstrasse', '12', '1010', 'Wien', '06601234567', 'luca.motogna@email.com'),
('Anna', 'Müller', 'Bahnhofstrasse', '5', '8010', 'Graz', '06641234567', 'anna.mueller@email.com'),
('Max', 'Schmidt', 'Ringstrasse', '20', '4020', 'Linz', '06761234567', 'max.schmidt@email.com');

-- Beispieldaten für Tabelle Lieferanten
INSERT INTO lieferanten (name, strasse, hausnummer, postleitzahl, stadt, telefonnummer, email)
VALUES
('Amazon', 'Industriestrasse', '1', '1010', 'Wien', '0800123456', 'kontakt@amazon.at'),
('MediaMarkt', 'Shoppingcenter', '10', '4020', 'Linz', '0800654321', 'info@mediamarkt.at'),
('Saturn', 'Elektronikweg', '3', '8010', 'Graz', '0800987654', 'service@saturn.at');

-- Beispieldaten für Tabelle Artikel
INSERT INTO artikel (bezeichnung, beschreibung, preis, lagerbestand, lieferanten_id)
VALUES
('Laptop', 'Leistungsstarker Laptop', 1200.00, 10, 1),
('Smartphone', 'Neuestes Modell Smartphone', 800.00, 25, 2),
('Kopfhörer', 'Kabellose Kopfhörer', 150.00, 50, 3),
('Maus', 'Wireless Maus', 30.00, 100, 2);

-- Beispieldaten für Tabelle Verkauf
INSERT INTO verkauf (kunden_id, lieferanten_id, artikel_id, menge, datum)
VALUES
(1, 1, 1, 1, '2024-01-10'),
(2, 2, 2, 2, '2024-01-11'),
(3, 3, 3, 1, '2024-01-12'),
(1, 2, 4, 3, '2024-01-13');