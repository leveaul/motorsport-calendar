
-- Mise à jour statut courses
UPDATE races SET status = 'done'
WHERE series_id = 'MotoGP' AND circuit ILIKE '%mugello%';

UPDATE races SET status = 'done'
WHERE series_id = 'GTWCE' AND (circuit ILIKE '%monza%' OR name ILIKE '%monza%');

UPDATE races SET status = 'done'
WHERE series_id = 'IMSA' AND (circuit ILIKE '%detroit%' OR name ILIKE '%detroit%');

-- Supprimer anciens résultats
DELETE FROM results WHERE race_id IN (
  SELECT id FROM races WHERE series_id = 'MotoGP' AND circuit ILIKE '%mugello%'
);
DELETE FROM results WHERE race_id IN (
  SELECT id FROM races WHERE series_id = 'GTWCE' AND (circuit ILIKE '%monza%' OR name ILIKE '%monza%')
);
DELETE FROM results WHERE race_id IN (
  SELECT id FROM races WHERE series_id = 'IMSA' AND (circuit ILIKE '%detroit%' OR name ILIKE '%detroit%')
);

-- MotoGP Mugello Course principale
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1, 'Marco Bezzecchi',        'Aprilia Racing',              25, '0.000'),
  (2, 'Jorge Martín',           'Aprilia Racing',              20, '+3.559'),
  (3, 'Francesco Bagnaia',      'Ducati Lenovo Team',          16, '+6.421'),
  (4, 'Ai Ogura',               'Trackhouse Racing',           13, '+6.455'),
  (5, 'Fabio Di Giannantonio',  'Pertamina Enduro VR46',       11, '+12.302'),
  (6, 'Pedro Acosta',           'Red Bull KTM',                 8, '+14.876'),
  (7, 'Marc Márquez',           'Ducati Lenovo Team',           6, '+16.124'),
  (8, 'Raúl Fernández',         'Trackhouse Racing',            4, '+18.009'),
  (9, 'Fermín Aldeguer',        'Gresini Racing',               2, '+19.455'),
  (10,'Diogo Moreira',          'LCR Honda',                    1, '+22.301')
) AS v(pos, driver, team, pts, gap)
WHERE r.series_id = 'MotoGP' AND r.circuit ILIKE '%mugello%' AND r.type = 'race';

-- MotoGP Mugello Sprint
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1, 'Raúl Fernández',        'Trackhouse Racing',           12, '0.000'),
  (2, 'Jorge Martín',          'Aprilia Racing',               9, '+1.245'),
  (3, 'Fabio Di Giannantonio', 'Pertamina Enduro VR46',        7, '+3.102'),
  (4, 'Marco Bezzecchi',       'Aprilia Racing',               6, '+4.891'),
  (5, 'Marc Márquez',          'Ducati Lenovo Team',           5, '+6.344')
) AS v(pos, driver, team, pts, gap)
WHERE r.series_id = 'MotoGP' AND r.circuit ILIKE '%mugello%' AND r.type = 'sprint';

-- GTWCE 3H Monza
INSERT INTO results (race_id, position, driver, team, points, gap, category)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap, v.cat
FROM races r,
(VALUES
  (1, 'Levi / Øgaard / Mazzola',     'Tresor Attempto #66 Audi',      25, '0.000',   'Pro'),
  (2, 'Auer / Engel / Stolz',         'Mercedes-AMG VS Racing #20',    18, '+0.648',  'Pro'),
  (3, 'Drudi / Sørensen / Thiim',     'Haupt Racing Team #7',          15, '+12.441', 'Pro'),
  (4, 'Goethe / Prette / Fleming',    'Iron Dames #85 Ferrari',        12, '+23.109', 'Pro'),
  (5, 'Hofer / Malykhin / Nesov',     'GPX Racing #12 Porsche',        10, '+31.002', 'Pro')
) AS v(pos, driver, team, pts, gap, cat)
WHERE r.series_id = 'GTWCE' AND (r.circuit ILIKE '%monza%' OR r.name ILIKE '%monza%');

-- IMSA Detroit GTP
INSERT INTO results (race_id, position, driver, team, points, gap, category)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap, v.cat
FROM races r,
(VALUES
  (1, 'Aitken / Bamber',           'Cadillac Whelen AXR #31',  35, '0.000',   'GTP'),
  (2, 'van der Zande / de Vries',  'BMW M Team WRT #25',        28, '+8.432',  'GTP'),
  (3, 'Taylor / Albuquerque',      'Wayne Taylor Cadillac #10', 24, '+12.105', 'GTP'),
  (4, 'Castroneves / Pagenaud',    'Meyer Shank Acura #93',     20, '+15.224', 'GTP'),
  (1, 'García / Sims',             'Corvette Pratt Miller #3',  25, '0.000',   'GTD Pro'),
  (2, 'Hawksworth / Telitz',       'Vasser Sullivan Lexus #14',  0, '+penalty','GTD Pro'),
  (3, 'Catsburg / Nicky',          'Pfaff Lamborghini #9',      18, '+1.874',  'GTD Pro')
) AS v(pos, driver, team, pts, gap, cat)
WHERE r.series_id = 'IMSA' AND (r.circuit ILIKE '%detroit%' OR r.name ILIKE '%detroit%');

-- Classement MotoGP pilotes après R8 Mugello
DELETE FROM standings WHERE series_id = 'MotoGP' AND type = 'driver' AND season = 2026;
INSERT INTO standings (series_id, season, type, position, name, nationality, points, wins) VALUES
('MotoGP', 2026, 'driver',  1, 'Marco Bezzecchi',       'Italie',    173, 4),
('MotoGP', 2026, 'driver',  2, 'Jorge Martín',           'Espagne',   156, 2),
('MotoGP', 2026, 'driver',  3, 'Fabio Di Giannantonio', 'Italie',    134, 1),
('MotoGP', 2026, 'driver',  4, 'Pedro Acosta',           'Espagne',   118, 0),
('MotoGP', 2026, 'driver',  5, 'Raúl Fernández',         'Espagne',   108, 1),
('MotoGP', 2026, 'driver',  6, 'Ai Ogura',               'Japon',      89, 0),
('MotoGP', 2026, 'driver',  7, 'Marc Márquez',           'Espagne',    87, 0),
('MotoGP', 2026, 'driver',  8, 'Francesco Bagnaia',      'Italie',     85, 0),
('MotoGP', 2026, 'driver',  9, 'Fermín Aldeguer',        'Espagne',    69, 0),
('MotoGP', 2026, 'driver', 10, 'Toprak Razgatlioglu',   'Turquie',    54, 0);

-- Constructeurs MotoGP après R8
DELETE FROM standings WHERE series_id = 'MotoGP' AND type = 'team' AND season = 2026;
INSERT INTO standings (series_id, season, type, position, name, nationality, points, wins) VALUES
('MotoGP', 2026, 'team', 1, 'Aprilia',  'Italie',    261, 5),
('MotoGP', 2026, 'team', 2, 'Ducati',   'Italie',    219, 3),
('MotoGP', 2026, 'team', 3, 'KTM',      'Autriche',  118, 0),
('MotoGP', 2026, 'team', 4, 'Honda',    'Japon',      72, 0),
('MotoGP', 2026, 'team', 5, 'Yamaha',   'Japon',      54, 0);

-- Classement GTWCE pilotes après Monza R2
DELETE FROM standings WHERE series_id = 'GTWCE' AND type = 'driver' AND season = 2026;
INSERT INTO standings (series_id, season, type, position, name, nationality, points, wins) VALUES
('GTWCE', 2026, 'driver', 1, 'Auer / Engel / Stolz',       'Autriche/All/Dan',  43, 1),
('GTWCE', 2026, 'driver', 2, 'Drudi / Sørensen / Thiim',   'Italie/Dan/Dan',    38, 0),
('GTWCE', 2026, 'driver', 3, 'Levi / Øgaard / Mazzola',    'Israel/Dan/Italie', 25, 1),
('GTWCE', 2026, 'driver', 4, 'Goethe / Prette / Fleming',  'All/Arg/GBR',       22, 0),
('GTWCE', 2026, 'driver', 5, 'Hofer / Malykhin / Nesov',   'Autriche/RUS/RUS',  18, 0);

-- Classement IMSA GTP après Detroit R5
DELETE FROM standings WHERE series_id = 'IMSA' AND type = 'driver' AND season = 2026;
INSERT INTO standings (series_id, season, type, position, name, nationality, points, wins) VALUES
('IMSA', 2026, 'driver', 1, 'Aitken / Bamber',          'GBR/NZL',   144, 2),
('IMSA', 2026, 'driver', 2, 'Castroneves / Pagenaud',   'BRA/FRA',    98, 1),
('IMSA', 2026, 'driver', 3, 'Taylor / Albuquerque',     'USA/POR',    92, 0),
('IMSA', 2026, 'driver', 4, 'García / Sims',            'ESP/GBR',    85, 1),
('IMSA', 2026, 'driver', 5, 'van der Zande / de Vries', 'NLD/NLD',    78, 0);
