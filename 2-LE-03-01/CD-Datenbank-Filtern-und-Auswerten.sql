USE cd_datenbank;

SELECT titel
FROM Titel
WHERE Beurteilung >= 3;
ORDER BY Beurteilung ASC, titel ASC;

CREATE TABLE IF NOT EXISTS Schlechte_Titel_CD AS
SELECT Titel.Titel, CD.CDName, Titel.Beurteilung
FROM Titel
JOIN CD_Titel ON Titel.TitelNr = CD_Titel.TitelNr
JOIN CD ON CD_Titel.CDNr = CD.CDNr
WHERE CD.CDName = 'Pop Hits'
AND Titel.Beurteilung < 3;

CREATE TABLE if not exists Gesamtliste AS
SELECT
    CD.CDName,
    Titel.Titel,
    Interpreten.Interpret,
    Musikrichtung.Musikrichtung
FROM CD
JOIN CD_Titel ON CD.CDNr = CD_Titel.CDNr
JOIN Titel ON CD_Titel.TitelNr = Titel.TitelNr
JOIN Titel_Interpreten ON Titel.TitelNr = Titel_Interpreten.TitelNr
JOIN Interpreten ON Titel_Interpreten.InterpretID = Interpreten.InterpretID
JOIN Musikrichtung ON CD.MusikrichtungID = Musikrichtung.MusikrichtungID
ORDER BY CD.CDName ASC;

CREATE TABLE if not exists Songs_Pro_Genre AS
SELECT
    Musikrichtung.Musikrichtung,
    COUNT(*) AS Anzahl_Songs
FROM Musikrichtung
JOIN CD ON Musikrichtung.MusikrichtungID = CD.MusikrichtungID
JOIN CD_Titel ON CD.CDNr = CD_Titel.CDNr
GROUP BY Musikrichtung.Musikrichtung;

UPDATE Musikrichtung
SET Musikrichtung = 'Classic'
WHERE Musikrichtung = 'Klassik';

UPDATE Musikrichtung
SET Musikrichtung = 'deutsche Schlager'
WHERE Musikrichtung = 'Schlager';

DELETE FROM CD
WHERE MusikrichtungID IS NULL;