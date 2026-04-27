USE verwaltung_konferenz;

-- Testdaten: Referenten
INSERT INTO referent (name, e_mail, organisation) VALUES
('Dr. Anna Müller', 'a.mueller@uni-graz.at', 'Universität Graz'),
('Prof. Stefan Berger', 's.berger@tugraz.at', 'TU Graz'),
('Maria Huber', 'm.huber@freelance.at', NULL);

-- Testdaten: Teilnehmer
INSERT INTO teilnehmer (name, e_mail, organisation) VALUES
('Lukas Schmidt', 'lukas.schmidt@example.com', 'Firma ABC GmbH'),
('Julia Wagner', 'julia.wagner@example.com', 'XYZ AG'),
('Tom Fischer', 'tom.fischer@example.com', NULL),
('Sarah Klein', 'sarah.klein@example.com', 'Firma ABC GmbH');

-- Testdaten: Themen
INSERT INTO themen (kurzbeschreibung, id_referent) VALUES
('Einführung in Künstliche Intelligenz', 1),
('Datenbankdesign mit MySQL', 2),
('Agile Projektführung', 3),
('Cloud Computing Grundlagen', 1);

-- Testdaten: Zuordnung Teilnehmer zu Themen
INSERT INTO teilnehmer_themen (id_teilnehmer, id_themen) VALUES
(1, 1), (1, 2),
(2, 2), (2, 3),
(3, 1), (3, 4),
(4, 3);