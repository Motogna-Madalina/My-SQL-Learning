USE bibliothek;

INSERT INTO verlag VALUES
(1, 'Programmier Verlag'),
(2, 'IT Technik Verlag'),
(3, 'Elektrotechnik Verlag'),
(4, 'Automatisierung Verlag'),
(5, 'Medien Verlag');

INSERT INTO fachbereich VALUES
(1, 'Applikationsentwicklung'),
(2, 'IT Technik'),
(3, 'Elektrotechnik'),
(4, 'Automatisierungstechnik');

INSERT INTO fachbuch VALUES
(1, '1111', 'Applikationsentwicklung Fundamentals', 1),
(2, '2222', 'Applikationsentwicklung Advanced', 1),
(3, '3333', 'IT Technik - Betriebstechnik Fundamentals', 2),
(4, '4444', 'IT Technik - Betriebstechnik Advanced', 2),
(5, '5555', 'IT Technik - Systemtechnik Fundamentals', 2),
(6, '6666', 'IT Technik - Systemtechnik Advanced', 2),
(7, '7777', 'Elektrotechnik I', 3),
(8, '8888', 'Elektrotechnik II', 3),
(9, '9999', 'Robotik', 4);

INSERT INTO fachbereichfachbuch VALUES
(1,1),
(1,2),
(2,3),
(2,4),
(2,5),
(2,6),
(3,7),
(3,8),
(4,9);