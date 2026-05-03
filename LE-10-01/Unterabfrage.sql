DROP DATABASE IF EXISTS mitarbeiter_bonus;
CREATE DATABASE IF NOT EXISTS mitarbeiter_bonus;
USE mitarbeiter_bonus;
-- Create employee table
CREATE TABLE mitarbeiter (
    mitarbeiterid INT PRIMARY KEY,
    vorname VARCHAR(50),
    nachname VARCHAR(50),
    steuerklasse INT
);
-- Stores employee data


-- Create bonus table
CREATE TABLE sachpraemie (
    praemieid INT AUTO_INCREMENT PRIMARY KEY,
    mitarbeiterid INT,
    preis DECIMAL(10,2),
    grund VARCHAR(255),
    FOREIGN KEY (mitarbeiterid) REFERENCES mitarbeiter(mitarbeiterid)
);
-- Stores bonuses assigned to employees


-- Create tax class table
CREATE TABLE steuerklasse (
    klasse INT PRIMARY KEY
);
-- Stores valid tax classes




-- Punkt 1: Get employees who received one or more bonuses
SELECT vorname, nachname
FROM mitarbeiter
WHERE mitarbeiterid IN (
    SELECT mitarbeiterid
    FROM sachpraemie
);
-- This query selects all employees whose ID appears in the bonus table,
-- meaning they have received at least one bonus.


-- Punkt 2: Get employees who received bonuses (sum of prices per employee)
SELECT vorname, nachname
FROM mitarbeiter
WHERE mitarbeiterid IN (
    SELECT mitarbeiterid
    FROM sachpraemie
    GROUP BY mitarbeiterid
    HAVING SUM(preis) > 0
);
-- This query groups bonuses by employee and checks if the total sum of bonuses is greater than 0.
-- Then it returns the names of those employees.


-- Punkt 3: Find employees with a tax class that does NOT exist in the tax table
SELECT vorname, nachname
FROM mitarbeiter
WHERE steuerklasse NOT IN (
    SELECT klasse
    FROM steuerklasse
);
-- This query finds employees whose tax class is not listed in the steuerklasse table.
-- It helps detect invalid or missing tax class entries.


-- Punkt 4: Same as Punkt 3 but using EXISTS
SELECT vorname, nachname
FROM mitarbeiter
WHERE NOT EXISTS (
    SELECT 1
    FROM steuerklasse
    WHERE steuerklasse.klasse = mitarbeiter.steuerklasse
);
);
-- This query checks if a matching tax class exists.
-- If not, the employee is included in the result.
-- EXISTS is often more efficient for large datasets.