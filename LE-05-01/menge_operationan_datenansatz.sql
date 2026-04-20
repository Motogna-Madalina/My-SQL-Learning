USE mengeoperatoren;

INSERT INTO niederlassungbelgien (name, vorname) VALUES
('Müller', 'Max'),
('Schmidt', 'Anna'),
('Meier', 'Tom');

INSERT INTO niederlassungholland (name, vorname) VALUES
('Müller', 'Max'),   -- duplicate
('Klein', 'Lisa'),
('Meier', 'Tom');    -- duplicate

INSERT INTO niederlassungschweiz (name, vorname) VALUES
('Müller', 'Max'),   -- duplicate
('Fischer', 'Luca'),
('Meier', 'Tom');    -- duplicate