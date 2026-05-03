-- ================================
-- CREATE TABLES
-- ================================
DROP DATABASE IF EXISTS mitarbeiter_bonus;
CREATE DATABASE IF NOT EXISTS mitarbeiter_bonus;
USE mitarbeiter_bonus;
CREATE TABLE IF NOT EXISTS mitarbeiter (
    mitarbeiterid INT PRIMARY KEY,
    name VARCHAR(50),
    vorname VARCHAR(50),
    urlaubstage INT,
    urlaubgenommen INT,
    krankenversicherung VARCHAR(50)
);
-- Stores employee data

CREATE TABLE IF NOT EXISTS sachpraemie (
    praemieid INT AUTO_INCREMENT PRIMARY KEY,
    mitarbeiterid INT,
    preis DECIMAL(10,2)
);
-- Stores bonuses

CREATE TABLE IF NOT EXISTS bonus (
    bonusid INT AUTO_INCREMENT PRIMARY KEY,
    mitarbeiterid INT,
    bonus DECIMAL(10,2)
);
-- Stores bonus values

CREATE TABLE IF NOT EXISTS steuerklasse (
steuerklasseid INT PRIMARY KEY,
steuerklasse VaRCHAR(50)
);
-- Stores valid tax classes

-- ================================
-- INSERT DATA
-- ================================
INSERT INTO mitarbeiter (mitarbeiterid, name, vorname, urlaubstage, urlaubgenommen, krankenversicherung)
VALUES
(1, 'Müller', 'Anna', 30, 10, 'AOK'),
(2, 'Schmidt', 'Bernd', 25, 5, 'TK'),
(3, 'Meier', 'Claudia', 28, 12, 'Barmer'),
(4, 'Fischer', 'David', 20, 8, 'AOK'),
(5, 'Weber', 'Eva', 22, 6, 'TK');

INSERT INTO sachpraemie (mitarbeiterid, preis)
VALUES
(1, 100.00),
(1, 150.00),
(2, 200.00),
(3, 50.00),
(4, 300.00);

INSERT INTO bonus (mitarbeiterid, bonus)
VALUES
(1, 250.00),
(2, 200.00),
(3, 50.00),
(4, 300.00),
(5, 0.00);

INSERT INTO steuerklasse (steuerklasseid, steuerklasse)
VALUES
(1, 'I'),
(2, 'II'),
(3, 'III'),
(4, 'IV'),
(5, 'V'),
(6, 'VI');




-- 1. Get employees who received one or more bonuses
SELECT DISTINCT mitarbeiter.name, mitarbeiter.vorname
FROM mitarbeiter
JOIN sachpraemie ON mitarbeiter.mitarbeiterid = sachpraemie.mitarbeiterid;


-- 2. Get employees who received bonuses (sum of prices per employee)
SELECT mitarbeiter.name, mitarbeiter.vorname, SUM(sachpraemie.preis) AS summe
FROM mitarbeiter
JOIN sachpraemie ON mitarbeiter.mitarbeiterid = sachpraemie.mitarbeiterid
GROUP BY mitarbeiter.name, mitarbeiter.vorname;

-- 3. Find employees with a tax class that does NOT exist in the tax table
SELECT name, vorname
FROM mitarbeiter
WHERE steuerklasse NOT IN (
SELECT steuerklasse FROM steuerklasse
);

SELECT name, vorname
FROM mitarbeiter
WHERE steuerklasse IS NOT NULL
AND NOT EXISTS (
    SELECT *
    FROM steuerklasse
    WHERE steuerklasse.steuerklasse = mitarbeiter.steuerklasse
);

















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