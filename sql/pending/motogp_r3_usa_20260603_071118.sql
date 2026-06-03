
-- MotoGP R3 USA (Circuit of the Americas) — GP + Sprint
-- Source: captures officielles MotoGP.com

-- Résultats GP USA (course principale)
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1,  'Marco Bezzecchi',       'Aprilia Racing',                    25, '40:50.653'),
  (2,  'Jorge Martin',          'Aprilia Racing',                    20, '+2.036'),
  (3,  'Pedro Acosta',          'Red Bull KTM Factory Racing',       16, '+4.497'),
  (4,  'Fabio Di Giannantonio', 'Pertamina Enduro VR46 Racing Team', 13, '+6.972'),
  (5,  'Marc Marquez',          'Ducati Lenovo Team',                 11, '+8.100'),
  (6,  'Enea Bastianini',       'Red Bull KTM Tech3',                 10, '+8.243'),
  (7,  'Alex Marquez',          'BK8 Gresini Racing MotoGP',          9, '+11.253'),
  (8,  'Raul Fernandez',        'Trackhouse MotoGP Team',              8, '+13.129'),
  (9,  'Luca Marini',           'Honda HRC Castrol',                   7, '+14.471'),
  (10, 'Francesco Bagnaia',     'Ducati Lenovo Team',                   6, '+14.544'),
  (11, 'Fermin Aldeguer',       'BK8 Gresini Racing MotoGP',           5, '+21.063'),
  (12, 'Brad Binder',           'Red Bull KTM Factory Racing',          4, '+22.062'),
  (13, 'Diogo Moreira',         'Pro Honda LCR',                        3, '+22.201'),
  (14, 'Franco Morbidelli',     'Pertamina Enduro VR46 Racing Team',    2, '+24.371'),
  (15, 'Toprak Razgatlioglu',   'Prima Pramac Yamaha MotoGP',           1, '+25.549')
) AS v(pos, driver, team, pts, gap)
WHERE r.series_id = 'MotoGP' AND r.round = 3 AND r.type = 'sprint_weekend'
  AND NOT EXISTS (SELECT 1 FROM results res WHERE res.race_id = r.id);

-- Résultats Sprint USA
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1, 'Jorge Martin',   'Aprilia Racing',              12, '20:19.546'),
  (2, 'F. Bagnaia',     'Ducati Lenovo Team',            9, '+0.755'),
  (3, 'Enea Bastianini','Red Bull KTM Tech3',             7, '+3.199'),
  (4, 'Alex Marquez',   'BK8 Gresini Racing MotoGP',     6, '+3.638'),
  (5, 'Luca Marini',    'Honda HRC Castrol',              5, '+5.521'),
  (6, 'Ai Ogura',       'Trackhouse MotoGP Team',         4, '+7.183'),
  (7, 'Raul Fernandez', 'Trackhouse MotoGP Team',         3, '+8.634'),
  (8, 'Pedro Acosta',   'Red Bull KTM Factory Racing',    2, '+10.484'),
  (9, 'Johann Zarco',   'Castrol Honda LCR',               1, '+10.574')
) AS v(pos, driver, team, pts, gap)
WHERE r.series_id = 'MotoGP' AND r.round = 3 AND r.type = 'sprint'
  AND NOT EXISTS (SELECT 1 FROM results res WHERE res.race_id = r.id);

UPDATE races SET status = 'done' WHERE series_id = 'MotoGP' AND round = 3;
