USE cd_datenbank;

-- ======================
-- Musikrichtung
-- ======================
INSERT INTO Musikrichtung VALUES
(1, 'Rock'),
(2, 'Pop'),
(3, 'Hip Hop');

-- ======================
-- Interpreten
-- ======================
INSERT INTO Interpreten VALUES
(1, 'Queen'),
(2, 'Taylor Swift'),
(3, 'Eminem');

-- ======================
-- CD
-- ======================
INSERT INTO CD VALUES
(1, 'Best of Rock', 1),
(2, 'Pop Hits', 2);

-- ======================
-- Titel
-- ======================
INSERT INTO Titel VALUES
(1, 'Bohemian Rhapsody', 5),
(2, 'Shake It Off', 4),
(3, 'Lose Yourself', 5);

-- ======================
-- CD_Titel
-- ======================
INSERT INTO CD_Titel VALUES
(1, 1),
(2, 2),
(3, 2);

-- ======================
-- Titel_Interpreten
-- ======================
INSERT INTO Titel_Interpreten VALUES
(1, 1),
(2, 2),
(3, 3);

-- ======================
-- CD_Interpreten
-- ======================
INSERT INTO CD_Interpreten VALUES
(1, 1),
(2, 2),
(3, 2);