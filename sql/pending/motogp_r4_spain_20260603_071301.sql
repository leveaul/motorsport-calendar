
-- MotoGP R4 Espagne (Jerez) — GP + Sprint
-- Source: captures officielles MotoGP.com

-- Résultats GP Espagne
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1,  'Alex Marquez',          'BK8 Gresini Racing MotoGP',          25, '40:48.861'),
  (2,  'Marco Bezzecchi',       'Aprilia Racing',                      20, '+1.903'),
  (3,  'Fabio Di Giannantonio', 'Pertamina Enduro VR46 Racing Team',   16, '+5.796'),
  (4,  'Jorge Martin',          'Aprilia Racing',                      13, '+9.229'),
  (5,  'Ai Ogura',              'Trackhouse MotoGP Team',              11, '+9.891'),
  (6,  'Raul Fernandez',        'Trackhouse MotoGP Team',              10, '+10.614'),
  (7,  'Johann Zarco',          'Castrol Honda LCR',                    9, '+13.039'),
  (8,  'Enea Bastianini',       'Red Bull KTM Tech3',                   8, '+14.411'),
  (9,  'Fermin Aldeguer',       'BK8 Gresini Racing MotoGP',            7, '+19.778'),
  (10, 'Pedro Acosta',          'Red Bull KTM Factory Racing',           6, '+22.431'),
  (11, 'Brad Binder',           'Red Bull KTM Factory Racing',           5, '+22.799'),
  (12, 'Franco Morbidelli',     'Pertamina Enduro VR46 Racing Team',     4, '+24.867'),
  (13, 'Luca Marini',           'Honda HRC Castrol',                     3, '+26.871'),
  (14, 'Fabio Quartararo',      'Monster Energy Yamaha MotoGP Team',     2, '+29.532'),
  (15, 'Joan Mir',              'Honda HRC Castrol',                     1, '+29.899')
) AS v(pos, driver, team, pts, gap)
WHERE r.series_id = 'MotoGP' AND r.round = 4 AND r.type = 'sprint_weekend'
  AND NOT EXISTS (SELECT 1 FROM results res WHERE res.race_id = r.id);

-- Résultats Sprint Espagne
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1, 'Marc Marquez',          'Ducati Lenovo Team',                  12, '21:25.651'),
  (2, 'Francesco Bagnaia',     'Ducati Lenovo Team',                   9, '+3.050'),
  (3, 'Franco Morbidelli',     'Pertamina Enduro VR46 Racing Team',    7, '+7.493'),
  (4, 'Brad Binder',           'Red Bull KTM Factory Racing',           6, '+8.752'),
  (5, 'Fabio Di Giannantonio', 'Pertamina Enduro VR46 Racing Team',    5, '+9.237'),
  (6, 'Raul Fernandez',        'Trackhouse MotoGP Team',                4, '+11.958'),
  (7, 'Fabio Quartararo',      'Monster Energy Yamaha MotoGP Team',     3, '+13.525'),
  (8, 'Johann Zarco',          'Castrol Honda LCR',                     2, '+14.522'),
  (9, 'Luca Marini',           'Honda HRC Castrol',                     1, '+15.769')
) AS v(pos, driver, team, pts, gap)
WHERE r.series_id = 'MotoGP' AND r.round = 4 AND r.type = 'sprint'
  AND NOT EXISTS (SELECT 1 FROM results res WHERE res.race_id = r.id);

UPDATE races SET status = 'done' WHERE series_id = 'MotoGP' AND round = 4;
