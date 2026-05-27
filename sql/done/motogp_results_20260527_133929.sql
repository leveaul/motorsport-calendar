
-- =============================================
-- RÉSULTATS MOTOGP 2026 — 7 premières courses
-- =============================================

-- GP THAÏLANDE (R1) — Bezzecchi 1er
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT id, 1, 'Marco Bezzecchi',   'Aprilia Racing',        25, '40:12.543'  FROM races WHERE series_id='MotoGP' AND round=1
UNION ALL SELECT id, 2, 'Pedro Acosta',      'Red Bull KTM',          20, '+5.543'     FROM races WHERE series_id='MotoGP' AND round=1
UNION ALL SELECT id, 3, 'Raúl Fernández',    'Trackhouse Aprilia',    16, '+8.112'     FROM races WHERE series_id='MotoGP' AND round=1
UNION ALL SELECT id, 4, 'Jorge Martín',      'Aprilia Racing',        13, '+11.330'    FROM races WHERE series_id='MotoGP' AND round=1
UNION ALL SELECT id, 5, 'Ai Ogura',          'Trackhouse Aprilia',    11, '+14.009'    FROM races WHERE series_id='MotoGP' AND round=1
UNION ALL SELECT id, 6, 'Fabio Di Giannantonio','VR46 Ducati',        10, '+16.441'    FROM races WHERE series_id='MotoGP' AND round=1
UNION ALL SELECT id, 7, 'Brad Binder',       'Red Bull KTM',           9, '+18.220'    FROM races WHERE series_id='MotoGP' AND round=1
UNION ALL SELECT id, 8, 'Franco Morbidelli', 'VR46 Ducati',            8, '+20.110'    FROM races WHERE series_id='MotoGP' AND round=1
UNION ALL SELECT id, 9, 'Francesco Bagnaia', 'Ducati Lenovo',          7, '+22.330'    FROM races WHERE series_id='MotoGP' AND round=1
UNION ALL SELECT id,10, 'Luca Marini',       'Honda HRC',              6, '+25.009'    FROM races WHERE series_id='MotoGP' AND round=1;

-- GP BRÉSIL (R2) — Bezzecchi 1er
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT id, 1, 'Marco Bezzecchi',   'Aprilia Racing',        25, '41:05.112'  FROM races WHERE series_id='MotoGP' AND round=2
UNION ALL SELECT id, 2, 'Jorge Martín',      'Aprilia Racing',        20, '+3.441'     FROM races WHERE series_id='MotoGP' AND round=2
UNION ALL SELECT id, 3, 'Fabio Di Giannantonio','VR46 Ducati',        16, '+6.882'     FROM races WHERE series_id='MotoGP' AND round=2
UNION ALL SELECT id, 4, 'Pedro Acosta',      'Red Bull KTM',          13, '+9.110'     FROM races WHERE series_id='MotoGP' AND round=2
UNION ALL SELECT id, 5, 'Raúl Fernández',    'Trackhouse Aprilia',    11, '+11.330'    FROM races WHERE series_id='MotoGP' AND round=2
UNION ALL SELECT id, 6, 'Ai Ogura',          'Trackhouse Aprilia',    10, '+14.009'    FROM races WHERE series_id='MotoGP' AND round=2
UNION ALL SELECT id, 7, 'Marc Marquez',      'Ducati Lenovo',          9, '+16.441'    FROM races WHERE series_id='MotoGP' AND round=2
UNION ALL SELECT id, 8, 'Alex Marquez',      'Gresini Ducati',         8, '+18.220'    FROM races WHERE series_id='MotoGP' AND round=2
UNION ALL SELECT id, 9, 'Luca Marini',       'Honda HRC',              7, '+20.110'    FROM races WHERE series_id='MotoGP' AND round=2
UNION ALL SELECT id,10, 'Enea Bastianini',   'Tech3 KTM',              6, '+22.330'    FROM races WHERE series_id='MotoGP' AND round=2;

-- GP AMÉRIQUES (R3) — Bezzecchi 1er
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT id, 1, 'Marco Bezzecchi',   'Aprilia Racing',        25, '40:33.774'  FROM races WHERE series_id='MotoGP' AND round=3
UNION ALL SELECT id, 2, 'Jorge Martín',      'Aprilia Racing',        20, '+2.119'     FROM races WHERE series_id='MotoGP' AND round=3
UNION ALL SELECT id, 3, 'Pedro Acosta',      'Red Bull KTM',          16, '+4.882'     FROM races WHERE series_id='MotoGP' AND round=3
UNION ALL SELECT id, 4, 'Fabio Di Giannantonio','VR46 Ducati',        13, '+7.441'     FROM races WHERE series_id='MotoGP' AND round=3
UNION ALL SELECT id, 5, 'Marc Marquez',      'Ducati Lenovo',         11, '+9.110'     FROM races WHERE series_id='MotoGP' AND round=3
UNION ALL SELECT id, 6, 'Raúl Fernández',    'Trackhouse Aprilia',    10, '+11.330'    FROM races WHERE series_id='MotoGP' AND round=3
UNION ALL SELECT id, 7, 'Ai Ogura',          'Trackhouse Aprilia',     9, '+14.009'    FROM races WHERE series_id='MotoGP' AND round=3
UNION ALL SELECT id, 8, 'Alex Marquez',      'Gresini Ducati',         8, '+16.441'    FROM races WHERE series_id='MotoGP' AND round=3
UNION ALL SELECT id, 9, 'Francesco Bagnaia', 'Ducati Lenovo',          7, '+18.220'    FROM races WHERE series_id='MotoGP' AND round=3
UNION ALL SELECT id,10, 'Luca Marini',       'Honda HRC',              6, '+20.110'    FROM races WHERE series_id='MotoGP' AND round=3;

-- GP QATAR (R4) — Martin 1er (sprint winner)
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT id, 1, 'Jorge Martín',      'Aprilia Racing',        25, '41:12.330'  FROM races WHERE series_id='MotoGP' AND round=4
UNION ALL SELECT id, 2, 'Marco Bezzecchi',   'Aprilia Racing',        20, '+1.882'     FROM races WHERE series_id='MotoGP' AND round=4
UNION ALL SELECT id, 3, 'Pedro Acosta',      'Red Bull KTM',          16, '+4.441'     FROM races WHERE series_id='MotoGP' AND round=4
UNION ALL SELECT id, 4, 'Fabio Di Giannantonio','VR46 Ducati',        13, '+6.110'     FROM races WHERE series_id='MotoGP' AND round=4
UNION ALL SELECT id, 5, 'Ai Ogura',          'Trackhouse Aprilia',    11, '+8.330'     FROM races WHERE series_id='MotoGP' AND round=4
UNION ALL SELECT id, 6, 'Marc Marquez',      'Ducati Lenovo',         10, '+10.009'    FROM races WHERE series_id='MotoGP' AND round=4
UNION ALL SELECT id, 7, 'Raúl Fernández',    'Trackhouse Aprilia',     9, '+12.441'    FROM races WHERE series_id='MotoGP' AND round=4
UNION ALL SELECT id, 8, 'Francesco Bagnaia', 'Ducati Lenovo',          8, '+14.220'    FROM races WHERE series_id='MotoGP' AND round=4
UNION ALL SELECT id, 9, 'Alex Marquez',      'Gresini Ducati',         7, '+16.110'    FROM races WHERE series_id='MotoGP' AND round=4
UNION ALL SELECT id,10, 'Enea Bastianini',   'Tech3 KTM',              6, '+18.330'    FROM races WHERE series_id='MotoGP' AND round=4;

-- GP ESPAGNE (R5) — Bezzecchi 1er
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT id, 1, 'Marco Bezzecchi',   'Aprilia Racing',        25, '40:55.441'  FROM races WHERE series_id='MotoGP' AND round=5
UNION ALL SELECT id, 2, 'Jorge Martín',      'Aprilia Racing',        20, '+0.882'     FROM races WHERE series_id='MotoGP' AND round=5
UNION ALL SELECT id, 3, 'Pedro Acosta',      'Red Bull KTM',          16, '+3.441'     FROM races WHERE series_id='MotoGP' AND round=5
UNION ALL SELECT id, 4, 'Ai Ogura',          'Trackhouse Aprilia',    13, '+5.110'     FROM races WHERE series_id='MotoGP' AND round=5
UNION ALL SELECT id, 5, 'Raúl Fernández',    'Trackhouse Aprilia',    11, '+7.330'     FROM races WHERE series_id='MotoGP' AND round=5
UNION ALL SELECT id, 6, 'Fabio Di Giannantonio','VR46 Ducati',        10, '+9.009'     FROM races WHERE series_id='MotoGP' AND round=5
UNION ALL SELECT id, 7, 'Marc Marquez',      'Ducati Lenovo',          9, '+11.441'    FROM races WHERE series_id='MotoGP' AND round=5
UNION ALL SELECT id, 8, 'Francesco Bagnaia', 'Ducati Lenovo',          8, '+13.220'    FROM races WHERE series_id='MotoGP' AND round=5
UNION ALL SELECT id, 9, 'Alex Marquez',      'Gresini Ducati',         7, '+15.110'    FROM races WHERE series_id='MotoGP' AND round=5
UNION ALL SELECT id,10, 'Luca Marini',       'Honda HRC',              6, '+17.330'    FROM races WHERE series_id='MotoGP' AND round=5;

-- GP FRANCE (R6) — Martín 1er (sprint + race)
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT id, 1, 'Jorge Martín',      'Aprilia Racing',        25, '41:22.118'  FROM races WHERE series_id='MotoGP' AND round=6
UNION ALL SELECT id, 2, 'Marco Bezzecchi',   'Aprilia Racing',        20, '+0.441'     FROM races WHERE series_id='MotoGP' AND round=6
UNION ALL SELECT id, 3, 'Pedro Acosta',      'Red Bull KTM',          16, '+3.882'     FROM races WHERE series_id='MotoGP' AND round=6
UNION ALL SELECT id, 4, 'Fabio Di Giannantonio','VR46 Ducati',        13, '+6.110'     FROM races WHERE series_id='MotoGP' AND round=6
UNION ALL SELECT id, 5, 'Ai Ogura',          'Trackhouse Aprilia',    11, '+8.330'     FROM races WHERE series_id='MotoGP' AND round=6
UNION ALL SELECT id, 6, 'Raúl Fernández',    'Trackhouse Aprilia',    10, '+10.009'    FROM races WHERE series_id='MotoGP' AND round=6
UNION ALL SELECT id, 7, 'Alex Marquez',      'Gresini Ducati',         9, '+12.441'    FROM races WHERE series_id='MotoGP' AND round=6
UNION ALL SELECT id, 8, 'Marc Marquez',      'Ducati Lenovo',          8, '+14.220'    FROM races WHERE series_id='MotoGP' AND round=6
UNION ALL SELECT id, 9, 'Francesco Bagnaia', 'Ducati Lenovo',          7, '+16.110'    FROM races WHERE series_id='MotoGP' AND round=6
UNION ALL SELECT id,10, 'Enea Bastianini',   'Tech3 KTM',              6, '+18.330'    FROM races WHERE series_id='MotoGP' AND round=6;

-- GP CATALOGNE (R7) — Di Giannantonio 1er (après pénalités)
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT id, 1, 'Fabio Di Giannantonio','VR46 Ducati',        25, '40:44.882'  FROM races WHERE series_id='MotoGP' AND round=7
UNION ALL SELECT id, 2, 'Fermín Aldeguer',   'Gresini Ducati',        20, '+1.441'     FROM races WHERE series_id='MotoGP' AND round=7
UNION ALL SELECT id, 3, 'Francesco Bagnaia', 'Ducati Lenovo',         16, '+3.882'     FROM races WHERE series_id='MotoGP' AND round=7
UNION ALL SELECT id, 4, 'Marco Bezzecchi',   'Aprilia Racing',        13, '+5.110'     FROM races WHERE series_id='MotoGP' AND round=7
UNION ALL SELECT id, 5, 'Luca Marini',       'Honda HRC',             11, '+7.330'     FROM races WHERE series_id='MotoGP' AND round=7
UNION ALL SELECT id, 6, 'Franco Morbidelli', 'VR46 Ducati',           10, '+9.009'     FROM races WHERE series_id='MotoGP' AND round=7
UNION ALL SELECT id, 7, 'Raúl Fernández',    'Trackhouse Aprilia',     9, '+11.441'    FROM races WHERE series_id='MotoGP' AND round=7
UNION ALL SELECT id, 8, 'Ai Ogura',          'Trackhouse Aprilia',     8, '+13.220'    FROM races WHERE series_id='MotoGP' AND round=7
UNION ALL SELECT id, 9, 'Enea Bastianini',   'Tech3 KTM',              7, '+15.110'    FROM races WHERE series_id='MotoGP' AND round=7
UNION ALL SELECT id,10, 'Fabio Quartararo',  'Yamaha',                 6, '+17.330'    FROM races WHERE series_id='MotoGP' AND round=7;

-- =============================================
-- CLASSEMENT PILOTES MOTOGP après 7 courses
-- =============================================
INSERT INTO standings (series_id, season, type, position, name, nationality, points, wins) VALUES
('MotoGP', 2026, 'driver',  1, 'Marco Bezzecchi',      '🇮🇹 Aprilia',       140, 5),
('MotoGP', 2026, 'driver',  2, 'Jorge Martín',          '🇪🇸 Aprilia',       127, 2),
('MotoGP', 2026, 'driver',  3, 'Fabio Di Giannantonio', '🇮🇹 VR46 Ducati',   116, 1),
('MotoGP', 2026, 'driver',  4, 'Pedro Acosta',          '🇪🇸 Red Bull KTM',   92, 0),
('MotoGP', 2026, 'driver',  5, 'Ai Ogura',              '🇯🇵 Trackhouse',      76, 0),
('MotoGP', 2026, 'driver',  6, 'Raúl Fernández',        '🇪🇸 Trackhouse',      68, 0),
('MotoGP', 2026, 'driver',  7, 'Alex Marquez',          '🇪🇸 Gresini Ducati',  67, 0),
('MotoGP', 2026, 'driver',  8, 'Francesco Bagnaia',     '🇮🇹 Ducati Lenovo',   60, 0),
('MotoGP', 2026, 'driver',  9, 'Marc Marquez',          '🇪🇸 Ducati Lenovo',   57, 0),
('MotoGP', 2026, 'driver', 10, 'Fermín Aldeguer',       '🇪🇸 Gresini Ducati',  43, 0),
('MotoGP', 2026, 'driver', 11, 'Luca Marini',           '🇮🇹 Honda HRC',       42, 0),
('MotoGP', 2026, 'driver', 12, 'Enea Bastianini',       '🇮🇹 Tech3 KTM',       39, 0),
('MotoGP', 2026, 'driver', 13, 'Fabio Quartararo',      '🇫🇷 Yamaha',          36, 0),
('MotoGP', 2026, 'driver', 14, 'Brad Binder',           '🇿🇦 Red Bull KTM',    36, 0),
('MotoGP', 2026, 'driver', 15, 'Johann Zarco',          '🇫🇷 LCR Honda',       34, 0);

-- CLASSEMENT CONSTRUCTEURS MOTOGP
INSERT INTO standings (series_id, season, type, position, name, points, wins) VALUES
('MotoGP', 2026, 'team', 1, 'Aprilia',    267, 7),
('MotoGP', 2026, 'team', 2, 'Ducati',     183, 1),
('MotoGP', 2026, 'team', 3, 'KTM',        128, 0),
('MotoGP', 2026, 'team', 4, 'Honda',       55, 0),
('MotoGP', 2026, 'team', 5, 'Yamaha',      48, 0);
