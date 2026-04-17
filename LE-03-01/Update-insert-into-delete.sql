USE uebungsdatenbank;

-- 1: Add a new qualification: SQL
INSERT INTO qualifikationen (qid, bezeichnung, kuerzel, kategorie)
VALUES (101, 'SQL', 'ITE', 'Informatik');

-- 2: Add a new qualification: Sys-Admin
INSERT INTO qualifikationen (qid, bezeichnung, kuerzel, kategorie)
VALUES (102, 'Sys-Admin', 'ADA', 'Support');

-- 3: Add a qualification with only a name
INSERT INTO qualifikationen (qid, bezeichnung)
VALUES (103, 'Projektleitung');

-- 4: Change text
UPDATE qualglobal
SET bezeichnung = 'Second Level Helpdesk'
WHERE qid = 2;

-- 4: Change text and short name for qid = 3
UPDATE qualglobal
SET bezeichnung = 'First Level Helpdesk', kuerzel = 'FLH'
WHERE qid = 3;

-- 5: Change DAT to DBE
UPDATE qualglobal
SET kuerzel = 'DBE'
WHERE kuerzel = 'DAT';

-- 6: Delete row with qid = 2
DELETE FROM qualglobalarchiv
WHERE qid = 2;

-- 7: Delete rows 5, 6 and 7
DELETE FROM qualglobalarchiv
WHERE qid IN (5, 6, 7);

-- 8: Delete all rows
DELETE FROM qualglobalarchiv;