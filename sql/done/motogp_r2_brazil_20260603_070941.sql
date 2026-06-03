
-- MotoGP R2 Brésil — GP + Sprint
-- Source: captures officielles MotoGP.com

-- Résultats GP Brésil (course principale)
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1,  'Marco Bezzecchi',       'Aprilia Racing',                    25, '30:19.760'),
  (2,  'Jorge Martin',          'Aprilia Racing',                    20, '+3.231'),
  (3,  'Fabio Di Giannantonio', 'Pertamina Enduro VR46 Racing Team', 16, '+3.780'),
  (4,  'Marc Marquez',          'Ducati Lenovo Team',                 13, '+4.089'),
  (5,  'Ai Ogura',              'Trackhouse MotoGP Team',            11, '+8.403'),
  (6,  'Alex Marquez',          'BK8 Gresini Racing MotoGP',         10, '+8.918'),
  (7,  'Pedro Acosta',          'Red Bull KTM Factory Racing',        9, '+10.687'),
  (8,  'Fermin Aldeguer',       'BK8 Gresini Racing MotoGP',          8, '+11.359'),
  (9,  'Johann Zarco',          'Castrol Honda LCR',                   7, '+12.907'),
  (10, 'Raul Fernandez',        'Trackhouse MotoGP Team',              6, '+16.370'),
  (11, 'Luca Marini',           'Honda HRC Castrol',                   5, '+18.529'),
  (12, 'Franco Morbidelli',     'Pertamina Enduro VR46 Racing Team',   4, '+19.980'),
  (13, 'Diogo Moreira',         'Pro Honda LCR',                       3, '+21.322'),
  (14, 'Alex Rins',             'Monster Energy Yamaha MotoGP Team',   2, '+22.699'),
  (15, 'Enea Bastianini',       'Red Bull KTM Tech3',                  1, '+23.840')
) AS v(pos, driver, team, pts, gap)
WHERE r.series_id = 'MotoGP' AND r.round = 2 AND r.type = 'sprint_weekend'
  AND NOT EXISTS (SELECT 1 FROM results res WHERE res.race_id = r.id);

-- Résultats Sprint Brésil
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1, 'Marc Marquez',          'Ducati Lenovo Team',                 12, '19:41.982'),
  (2, 'Fabio Di Giannantonio', 'Pertamina Enduro VR46 Racing Team',   9, '+0.213'),
  (3, 'Jorge Martin',          'Aprilia Racing',                       7, '+3.587'),
  (4, 'Marco Bezzecchi',       'Aprilia Racing',                       6, '+4.061'),
  (5, 'Ai Ogura',              'Trackhouse MotoGP Team',               5, '+4.994'),
  (6, 'Fabio Quartararo',      'Monster Energy Yamaha MotoGP Team',    4, '+7.728'),
  (7, 'Alex Marquez',          'BK8 Gresini Racing MotoGP',            3, '+8.153'),
  (8, 'Francesco Bagnaia',     'Ducati Lenovo Team',                    2, '+8.342'),
  (9, 'Pedro Acosta',          'Red Bull KTM Factory Racing',           1, '+9.096')
) AS v(pos, driver, team, pts, gap)
WHERE r.series_id = 'MotoGP' AND r.round = 2 AND r.type = 'sprint'
  AND NOT EXISTS (SELECT 1 FROM results res WHERE res.race_id = r.id);

UPDATE races SET status = 'done' WHERE series_id = 'MotoGP' AND round = 2;
