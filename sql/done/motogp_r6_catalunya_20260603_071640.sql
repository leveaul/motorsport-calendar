
-- MotoGP R6 Catalogne (Barcelona) — GP + Sprint
-- Source: captures officielles MotoGP.com

-- Résultats GP Catalogne
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1,  'Fabio Di Giannantonio', 'Pertamina Enduro VR46 Racing Team', 25, '20:06.243'),
  (2,  'Fermin Aldeguer',       'BK8 Gresini Racing MotoGP',         20, '+1.466'),
  (3,  'Francesco Bagnaia',     'Ducati Lenovo Team',                  16, '+4.320'),
  (4,  'Marco Bezzecchi',       'Aprilia Racing',                      13, '+4.679'),
  (5,  'Fabio Quartararo',      'Monster Energy Yamaha MotoGP Team',   11, '+4.876'),
  (6,  'Luca Marini',           'Honda HRC Castrol',                   10, '+4.971'),
  (7,  'Brad Binder',           'Red Bull KTM Factory Racing',          9, '+5.137'),
  (8,  'Ai Ogura',              'Trackhouse MotoGP Team',               8, '+5.377'),
  (9,  'Diogo Moreira',         'Pro Honda LCR',                        7, '+6.839'),
  (10, 'Franco Morbidelli',     'Pertamina Enduro VR46 Racing Team',    6, '+7.160'),
  (11, 'Maverick Vinales',      'Red Bull KTM Tech3',                   5, '+10.147'),
  (12, 'Augusto Fernandez',     'Yamaha Factory Racing',                4, '+16.245'),
  (13, 'Joan Mir',              'Honda HRC Castrol',                    3, '+17.250'),
  (14, 'Alex Rins',             'Monster Energy Yamaha MotoGP Team',    2, '+22.916'),
  (15, 'Jack Miller',           'Prima Pramac Yamaha MotoGP',           1, '+26.452')
) AS v(pos, driver, team, pts, gap)
WHERE r.series_id = 'MotoGP' AND r.round = 6 AND r.type = 'sprint_weekend'
  AND NOT EXISTS (SELECT 1 FROM results res WHERE res.race_id = r.id);

-- Résultats Sprint Catalogne
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1, 'Alex Marquez',          'BK8 Gresini Racing MotoGP',          12, '20:02.258'),
  (2, 'Pedro Acosta',          'Red Bull KTM Factory Racing',          9, '+0.041'),
  (3, 'Fabio Di Giannantonio', 'Pertamina Enduro VR46 Racing Team',    7, '+0.457'),
  (4, 'Raul Fernandez',        'Trackhouse MotoGP Team',               6, '+2.928'),
  (5, 'Johann Zarco',          'Castrol Honda LCR',                    5, '+4.764'),
  (6, 'Francesco Bagnaia',     'Ducati Lenovo Team',                   4, '+4.894'),
  (7, 'Franco Morbidelli',     'Pertamina Enduro VR46 Racing Team',    3, '+6.175'),
  (8, 'Ai Ogura',              'Trackhouse MotoGP Team',               2, '+6.871'),
  (9, 'Marco Bezzecchi',       'Aprilia Racing',                       1, '+7.381')
) AS v(pos, driver, team, pts, gap)
WHERE r.series_id = 'MotoGP' AND r.round = 6 AND r.type = 'sprint'
  AND NOT EXISTS (SELECT 1 FROM results res WHERE res.race_id = r.id);

UPDATE races SET status = 'done' WHERE series_id = 'MotoGP' AND round = 6;
