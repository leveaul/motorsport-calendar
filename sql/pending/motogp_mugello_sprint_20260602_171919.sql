
-- Résultats Sprint MotoGP Mugello R8 (30 mai 2026)
-- Source: crash.net + motograndprix.motorionline.com

-- Supprimer anciens résultats sprint si besoin
DELETE FROM results WHERE race_id = (
  SELECT id FROM races 
  WHERE series_id = 'MotoGP' AND circuit ILIKE '%mugello%' AND type = 'sprint'
  LIMIT 1
);

-- Insérer résultats sprint
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1,  'Raúl Fernández',        'Trackhouse Racing',        12, '0.000'),
  (2,  'Jorge Martín',           'Aprilia Racing',            9, '+1.245'),
  (3,  'Fabio Di Giannantonio', 'Pertamina Enduro VR46',     7, '+3.102'),
  (4,  'Marco Bezzecchi',        'Aprilia Racing',            6, '+4.891'),
  (5,  'Marc Márquez',           'Ducati Lenovo Team',        5, '+6.344'),
  (6,  'Álex Márquez',           'Gresini Racing',            4, '+8.123'),
  (7,  'Francesco Bagnaia',      'Ducati Lenovo Team',        3, '+9.567'),
  (8,  'Ai Ogura',               'Trackhouse Racing',         2, '+11.204'),
  (9,  'Pedro Acosta',           'Red Bull KTM',              1, '+12.891'),
  (10, 'Diogo Moreira',          'LCR Honda',                 0, '+14.332')
) AS v(pos, driver, team, pts, gap)
WHERE r.series_id = 'MotoGP' 
  AND r.circuit ILIKE '%mugello%' 
  AND r.type = 'sprint';

SELECT count(*) AS sprint_results FROM results 
WHERE race_id = (
  SELECT id FROM races WHERE series_id = 'MotoGP' AND circuit ILIKE '%mugello%' AND type = 'sprint' LIMIT 1
);
