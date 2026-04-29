USE cd_datenbank;
INSERT INTO interpreten (Interpret) VALUES
('The Beatles'),
('Pink Floyd'),
('Led Zeppelin'),
('Queen'),
('The Rolling Stones');

INSERT INTO musikrichtung (Musikrichtung) VALUES
('Rock'),
('Pop'),
('Jazz'),
('Blues'),
('Classical');

INSERT INTO title (Title, InterpretID, Beurteilung) VALUES
('Hey Jude', 1, 1),
('Comfortably Numb', 2, 1),
('Stairway to Heaven', 3, 1),
('Bohemian Rhapsody', 4, 1),
('Satisfaction', 5, 1);

INSERT INTO CD (CDNR, CDNAME, INTERPRETID, MUSIKRICHTUNGID) VALUES
(1, 'Abbey Road', 1, 1),
(2, 'The Dark Side of the Moon', 2, 1),
(3, 'Led Zeppelin IV', 3, 1),
(4, 'A Night at the Opera', 4, 1),
(5, 'Let It Bleed', 5, 1);

INSERT INTO title_cd (TitleNr, CDNr) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);