USE mitarbeiter_bonus;

-- Punto 1
CREATE VIEW  v_urlaub AS
SELECT
    name,
    vorname,
    urlaubstage,
    urlaubgenommen
FROM mitarbeiter;

-- Punto 2
CREATE VIEW v_praemie AS
SELECT
    mitarbeiter.name,
    mitarbeiter.vorname,
    sachpraemie.praemieid,
    sachpraemie.grund
FROM mitarbeiter
JOIN sachpraemie
    ON mitarbeiterid = sachpraemie.mitarbeiterid;

-- Punto 3
CREATE VIEW v_mitarbeiterbonus AS
SELECT
    mitarbeiter.name,
    mitarbeiter.vorname,
    bonus.bonus
FROM mitarbeiter
JOIN bonus
    ON mitarbeiterid = bonus.mitarbeiterid
ORDER BY bonus.bonus ASC;

-- Punto 4
CREATE VIEW v_mitarbeiterkrankenkasse AS
SELECT
    name,
    vorname,
    krankenversicherung
FROM mitarbeiter;

-- Insert en la view (puede requerir más campos según tu tabla)
INSERT INTO v_mitarbeiterkrankenkasse (name, vorname, krankenversicherung)
VALUES ('Perez', 'Juan', 'AOK');

-- Punto 5
DROP VIEW v_mitarbeiterkrankenkasse;