-- Create database
CREATE DATABASE IF NOT EXISTS mengeoperatoren;
USE mengeoperatoren;

-- Create tables
CREATE TABLE niederlassungbelgien (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    vorname VARCHAR(100)
);

CREATE TABLE niederlassungholland (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    vorname VARCHAR(100)
);

CREATE TABLE niederlassungschweiz (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    vorname VARCHAR(100)
);


-- =========================
-- Punkt 1
-- UNION = no duplicates
-- =========================
SELECT name, vorname FROM niederlassungbelgien
UNION
SELECT name, vorname FROM niederlassungholland;


-- =========================
-- Punkt 2
-- UNION ALL = includes duplicates
-- =========================
SELECT name, vorname FROM niederlassungbelgien
UNION ALL
SELECT name, vorname FROM niederlassungholland;


-- =========================
-- Punkt 3
-- UNION from 3 tables (no duplicates)
-- =========================
SELECT name, vorname FROM niederlassungbelgien
UNION
SELECT name, vorname FROM niederlassungholland
UNION
SELECT name, vorname FROM niederlassungschweiz;

-- =========================
-- Punkt 4
-- INTERSECTION (common rows)
-- MySQL uses INNER JOIN
-- What it is in both of them
-- =========================

SELECT niederlassungbelgien.name, niederlassungbelgien.vorname
FROM niederlassungbelgien
INNER JOIN niederlassungholland
ON niederlassungbelgien.name = niederlassungholland.name
AND niederlassungbelgien.vorname = niederlassungholland.vorname;

-- =========================
-- Punkt 5
-- DIFFERENCE (only in Holland)
-- =========================
SELECT name, vorname FROM niederlassungholland
WHERE (name, vorname) NOT IN (
    SELECT name, vorname FROM niederlassungbelgien
);

-- =========================
-- Punkt 6
-- Add status column
-- =========================
ALTER TABLE niederlassungbelgien ADD status VARCHAR(10);
ALTER TABLE niederlassungholland ADD status VARCHAR(10);

-- Only active employees (no duplicates)
SELECT name, vorname, status FROM niederlassungbelgien
WHERE status = 'aktiv'
UNION
SELECT name, vorname, status FROM niederlassungholland
WHERE status = 'aktiv';


-- =========================
-- Punkt 7
-- UNION + ORDER BY name
-- =========================

SELECT name, vorname FROM niederlassungbelgien
UNION
SELECT name, vorname FROM niederlassungholland
ORDER BY name;