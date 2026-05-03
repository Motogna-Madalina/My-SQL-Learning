USE vereinsverwaltung;

-- Teams
INSERT INTO Teams (team_name) VALUES
('Team A'),
('Team B'),
('Team C');

-- Spieler
INSERT INTO Spieler (spieler_name, position, team_id) VALUES
('Max Müller', 'Stürmer', 1),
('Lukas Schmidt', 'Mittelfeld', 1),
('Jonas Weber', 'Verteidiger', 2),
('Paul Fischer', 'Torwart', 3);

-- Trainer
INSERT INTO Trainer (trainer_name, gehalt) VALUES
('Thomas Keller', 3000.00),
('Stefan Braun', 3200.00),
('Michael Wolf', 2800.00);

-- Trainer_Teams
INSERT INTO Trainer_Teams (team_id, trainer_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Ausbildungen
INSERT INTO Ausbildungen_fur_Trainer (ausbildung_name) VALUES
('UEFA A Lizenz'),
('Fitness Trainer'),
('Taktik Schulung');

-- Trainer_Ausbildung
INSERT INTO Trainer_Ausbildung (trainer_id, ausbildung_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3);

INSERT INTO trainer_spieler (trainer_id, spieler_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4);
