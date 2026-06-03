
-- MotoGP R5 France (Le Mans) — GP + Sprint
-- Source: captures officielles MotoGP.com

-- Résultats GP France
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1,  'Jorge Martin',          'Aprilia Racing',                    25, '41:18.001'),
  (2,  'Marco Bezzecchi',       'Aprilia Racing',                    20, '+0.477'),
  (3,  'Ai Ogura',              'Trackhouse MotoGP Team',            16, '+0.874'),
  (4,  'Fabio Di Giannantonio', 'Pertamina Enduro VR46 Racing Team', 13, '+2.851'),
  (5,  'Pedro Acosta',          'Red Bull KTM Factory Racing',       11, '+2.991'),
  (6,  'Fabio Quartararo',      'Monster Energy Yamaha MotoGP Team', 10, '+7.756'),
  (7,  'Enea Bastianini',       'Red Bull KTM Tech3',                 9, '+8.615'),
  (8,  'Raul Fernandez',        'Trackhouse MotoGP Team',             8, '+12.497'),
  (9,  'Fermin Aldeguer',       'BK8 Gresini Racing MotoGP',          7, '+14.903'),
  (10, 'Luca Marini',           'Honda HRC Castrol',                   6, '+15.016'),
  (11, 'Johann Zarco',          'Castrol Honda LCR',                   5, '+16.549'),
  (12, 'Alex Rins',             'Monster Energy Yamaha MotoGP Team',   4, '+32.343'),
  (13, 'Toprak Razgatlioglu',   'Prima Pramac Yamaha MotoGP',          3, '+32.476'),
  (14, 'Franco Morbidelli',     'Pertamina Enduro VR46 Racing Team',   2, '+32.774'),
  (15, 'Jack Miller',           'Prima Pramac Yamaha MotoGP',          1, '+36.059')
) AS v(pos, driver, team, pts, gap)
WHERE r.series_id = 'MotoGP' AND r.round = 5 AND r.type = 'sprint_weekend'
  AND NOT EXISTS (SELECT 1 FROM results res WHERE res.race_id = r.id);

-- Résultats Sprint France
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1, 'Jorge Martin',      'Aprilia Racing',                    12, '19:46.830'),
  (2, 'F. Bagnaia',        'Ducati Lenovo Team',                  9, '+1.107'),
  (3, 'Marco Bezzecchi',   'Aprilia Racing',                      7, '+2.786'),
  (4, 'Pedro Acosta',      'Red Bull KTM Factory Racing',          6, '+3.808'),
  (5, 'Fabio Quartararo',  'Monster Energy Yamaha MotoGP Team',    5, '+4.402'),
  (6, 'Joan Mir',          'Honda HRC Castrol',                    4, '+4.630'),
  (7, 'Ai Ogura',          'Trackhouse MotoGP Team',               3, '+5.670'),
  (8, 'Alex Marquez',      'BK8 Gresini Racing MotoGP',            2, '+6.608'),
  (9, 'Diogo Moreira',     'Pro Honda LCR',                        1, '+10.368')
) AS v(pos, driver, team, pts, gap)
WHERE r.series_id = 'MotoGP' AND r.round = 5 AND r.type = 'sprint'
  AND NOT EXISTS (SELECT 1 FROM results res WHERE res.race_id = r.id);

UPDATE races SET status = 'done' WHERE series_id = 'MotoGP' AND round = 5;
