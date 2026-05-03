
USE vereinsverwaltung;

SELECT Spieler.spieler_name, Teams.team_name
FROM Spieler
JOIN Teams ON Spieler.team_id = Teams.team_id
ORDER BY Spieler.spieler_name ASC;

SELECT Ausbildungen_fur_Trainer.ausbildung_name, Trainer.trainer_name
FROM Trainer
JOIN Trainer_Ausbildung ON Trainer.trainer_id = Trainer_Ausbildung.trainer_id
JOIN Ausbildungen_fur_Trainer ON Trainer_Ausbildung.ausbildung_id = Ausbildungen_fur_Trainer.ausbildung_id
ORDER BY Ausbildungen_fur_Trainer.ausbildung_name;


-- tenemos que unir jugadores con trainers

SELECT Spieler.spieler_name, Trainer.trainer_name
FROM Spieler
JOIN Trainer_Spieler ON Spieler.spieler_id = Trainer_Spieler.spieler_id
JOIN Trainer ON Trainer_Spieler.trainer_id = Trainer.trainer_id;


UPDATE Trainer
SET gehalt = gehalt * 1.25
WHERE trainer_id > 0;