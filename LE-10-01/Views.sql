-- ================================
-- CREATE TABLES
-- ================================

CREATE TABLE mitarbeiter (
    mitarbeiterid INT PRIMARY KEY,
    name VARCHAR(50),
    vorname VARCHAR(50),
    urlaubstage INT,
    urlaubgenommen INT,
    krankenversicherung VARCHAR(50)
);
-- Stores employee data

CREATE TABLE sachpraemie (
    praemieid INT AUTO_INCREMENT PRIMARY KEY,
    mitarbeiterid INT,
    preis DECIMAL(10,2)
);
-- Stores bonuses

CREATE TABLE bonus (
    bonusid INT AUTO_INCREMENT PRIMARY KEY,
    mitarbeiterid INT,
    bonus DECIMAL(10,2)
);
-- Stores bonus values


-- ================================
-- INSERT DATA
-- ================================

INSERT INTO mitarbeiter VALUES
(1, 'Perez', 'Juan', 30, 10, 'AOK'),
(2, 'Lopez', 'Maria', 25, 5, 'TK'),
(3, 'Gomez', 'Carlos', 20, 2, 'BARMER');

INSERT INTO sachpraemie (mitarbeiterid, preis) VALUES
(1, 100),
(1, 50),
(2, 200);

INSERT INTO bonus (mitarbeiterid, bonus) VALUES
(1, 500),
(2, 300),
(3, 100);


-- ================================
-- VIEWS
-- ================================

-- Punkt 1
CREATE VIEW v_urlaub AS
SELECT name, vorname, urlaubstage, urlaubgenommen
FROM mitarbeiter;
-- Shows vacation data


-- Punkt 2
CREATE VIEW v_praemie AS
SELECT mitarbeiter.name, mitarbeiter.vorname, sachpraemie.preis AS praemie
FROM mitarbeiter
JOIN sachpraemie
ON mitarbeiter.mitarbeiterid = sachpraemie.mitarbeiterid;
-- Combines employees with their bonuses


-- Punkt 3
CREATE VIEW v_mitarbeiterbonus AS
SELECT mitarbeiter.name, mitarbeiter.vorname, bonus.bonus
FROM mitarbeiter
JOIN bonus
ON mitarbeiter.mitarbeiterid = bonus.mitarbeiterid
ORDER BY bonus.bonus ASC;
-- Shows employee bonuses sorted ascending


-- Punkt 4
CREATE VIEW v_mitarbeiterkrankenkasse AS
SELECT name, vorname, krankenversicherung
FROM mitarbeiter;
-- Shows insurance data


-- Insert into view
INSERT INTO v_mitarbeiterkrankenkasse (name, vorname, krankenversicherung)
VALUES ('Test', 'User', 'AOK');
-- Insert through view


-- Punkt 5
DROP VIEW v_mitarbeiterkrankenkasse;
-- Deletes the view