
-- ══════════════════════════════════════════════════════════
-- MotoGP R1 Thaïlande — GP (sprint_weekend) + Sprint
-- Source: captures officielles MotoGP.com
-- ══════════════════════════════════════════════════════════

-- Résultats GP Thaïlande (course principale)
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1,  'Marco Bezzecchi',       'Aprilia Racing',                    25, '39:36.270'),
  (2,  'Pedro Acosta',          'Red Bull KTM Factory Racing',       20, '+5.543'),
  (3,  'Raul Fernandez',        'Trackhouse MotoGP Team',            16, '+9.259'),
  (4,  'Jorge Martin',          'Aprilia Racing',                    13, '+12.182'),
  (5,  'Ai Ogura',              'Trackhouse MotoGP Team',            11, '+12.411'),
  (6,  'Fabio Di Giannantonio', 'Pertamina Enduro VR46 Racing Team', 10, '+16.845'),
  (7,  'Brad Binder',           'Red Bull KTM Factory Racing',        9, '+17.363'),
  (8,  'Franco Morbidelli',     'Pertamina Enduro VR46 Racing Team',  8, '+18.227'),
  (9,  'Francesco Bagnaia',     'Ducati Lenovo Team',                  7, '+18.340'),
  (10, 'Luca Marini',           'Honda HRC Castrol',                   6, '+19.101'),
  (11, 'Johann Zarco',          'Castrol Honda LCR',                   5, '+19.903'),
  (12, 'Enea Bastianini',       'Red Bull KTM Tech3',                  4, '+23.386'),
  (13, 'Diogo Moreira',         'Pro Honda LCR',                       3, '+24.686'),
  (14, 'Fabio Quartararo',      'Monster Energy Yamaha MotoGP Team',   2, '+30.823'),
  (15, 'Alex Rins',             'Monster Energy Yamaha MotoGP Team',   1, '+32.955')
) AS v(pos, driver, team, pts, gap)
WHERE r.series_id = 'MotoGP' AND r.round = 1 AND r.type = 'sprint_weekend'
  AND NOT EXISTS (SELECT 1 FROM results res WHERE res.race_id = r.id);

-- Résultats Sprint Thaïlande
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1, 'Pedro Acosta',          'Red Bull KTM Factory Racing',       12, '19:39.155'),
  (2, 'Marc Marquez',          'Ducati Lenovo Team',                  9, '+0.108'),
  (3, 'Raul Fernandez',        'Trackhouse MotoGP Team',              7, '+0.540'),
  (4, 'Ai Ogura',              'Trackhouse MotoGP Team',              6, '+2.100'),
  (5, 'Jorge Martin',          'Aprilia Racing',                      5, '+3.851'),
  (6, 'Brad Binder',           'Red Bull KTM Factory Racing',         4, '+4.612'),
  (7, 'Joan Mir',              'Honda HRC Castrol',                    3, '+4.924'),
  (8, 'Fabio Di Giannantonio', 'Pertamina Enduro VR46 Racing Team',   2, '+5.748'),
  (9, 'Francesco Bagnaia',     'Ducati Lenovo Team',                   1, '+6.910')
) AS v(pos, driver, team, pts, gap)
WHERE r.series_id = 'MotoGP' AND r.round = 1 AND r.type = 'sprint'
  AND NOT EXISTS (SELECT 1 FROM results res WHERE res.race_id = r.id);

-- Mettre à jour le statut
UPDATE races SET status = 'done' WHERE series_id = 'MotoGP' AND round = 1;
