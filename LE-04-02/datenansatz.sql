USE kundenverwaltung;

INSERT INTO kunden (Name, Vorname, Email, Telefon, Geburtsdatum)
VALUES ('Garcia', 'Juan', 'juan@gmail.com', '123456789', '1990-05-10');

INSERT INTO mageschenk (geschenkID, artikel, preis, jahrzugehörigkeit)
VALUES (1, 'Tasse', 10.00, 2);

-- ERROR (UNIQUE)
INSERT INTO mageschenk (geschenkID, artikel, preis, jahrzugehörigkeit)
VALUES (5, 'Tasse', 13.00, 2);

-- ERROR: Duplicate entry 'Tasse' for key 'mageschenk.artikel'
-- The value 'Tasse' already exists in the column.
-- UNIQUE does not allow duplicate values.
-- The INSERT statement is not executed.


-- ERROR (NOT NULL)
INSERT INTO mitarbeitergeschenk (geschenkID, artikel, preis, jahrzugehörigkeit)
VALUES (3, 'Tasse', NULL, 3);

-- ERROR: Column 'preis' cannot be NULL
-- The column 'preis' has a NOT NULL constraint.
-- NULL values are not allowed.
-- The INSERT statement is not executed.


-- DAS PASST
INSERT INTO mitarbeitergeschenk VALUES (1, 'Tasse', 10.00, 5);
INSERT INTO mitarbeitergeschenk VALUES (2, 'Buch', 15.00, 10);


-- ERROR (CHECK)
INSERT INTO mitarbeitergeschenk VALUES (3, 'Stift', 5.00, 7);

-- Die Werte müssen 5, 10, 15 oder 20 sein.
-- Der Wert 7 ist nicht erlaubt.
-- Darum gibt es einen Fehler und das INSERT wird nicht ausgeführt.