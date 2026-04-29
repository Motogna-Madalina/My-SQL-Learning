
USE uebungsdatenbank;

-- Point 1: Show when employees started and left the company
SELECT
  name,
  vorname,
  eintrittsdatum,
  austrittsdatum
FROM mitarbeiter;

-- Point 2: Same as before, but also show the reason for leaving
SELECT
  name,
  vorname,
  eintrittsdatum,
  austrittsdatum,
  austrittsgrund
FROM mitarbeiter;

-- Point 3: Show all employees and all their information
SELECT *
FROM mitarbeiter;

-- Point 4: Show employees who work in Sales
SELECT *
FROM mitarbeiter
WHERE abteilung = 'Vertrieb';

-- Point 5: Show employees who already took 30 vacation days
SELECT *
FROM mitarbeiter
WHERE urlaubstage >= 30;

-- Point 6: Show employees who have children
SELECT *
FROM mitarbeiter
WHERE anzahlkinder > 0;

-- Point 7: Show employees hired between 1990 and 2000
SELECT *
FROM mitarbeiter
WHERE eintrittsdatum BETWEEN '1990-01-01' AND '2000-01-01';

-- Point 8: Show women who work in Sales
SELECT *
FROM mitarbeiter
WHERE abteilung = 'Vertrieb' AND geschlecht = 'w';

-- Point 9: Show employees with health insurance MH Plus Bonn or IKK gesund plus
SELECT *
FROM mitarbeiter
WHERE krankenversicherung = 'MH Plus Bonn' OR krankenversicherung = 'IKK gesund plus';

-- Point 10: Show single mothers (women with children who are not married)
SELECT *
FROM mitarbeiter
WHERE geschlecht = 'w' AND anzahlkinder > 0 AND verheiratet = 'nein';

-- Point 11: Show all columns from health insurance table, only first 10 rows
SELECT *
FROM krankenkasse
LIMIT 10;

-- Point 12: Show name, first name and department, sorted by department, last name and first name
SELECT name, vorname, abteilung
FROM mitarbeiter
ORDER BY abteilung, name, vorname;

-- Point 13: Show name, first name, department and bonus, sorted by department and bonus
SELECT name, vorname, abteilung, bonus
FROM mitarbeiter
ORDER BY abteilung, bonus;

-- Point 14: Show address columns with custom column names (aliases)
SELECT
  name AS Name,
  vorname AS Vorname,
  strasse AS Strasse,
  hausnummer AS Hausnummer,
  plz AS Postleitzahl,
  ort AS Ort
FROM mitarbeiter;

-- Point 15: Show each city only once and count how often it appears
SELECT ort, COUNT(*) AS anzahl
FROM mitarbeiter
GROUP BY ort;