
-- Insérer résultats sprint MotoGP Mugello si pas encore présents
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1, 'Raul Fernandez',        'Trackhouse Racing',     12, '0.000'),
  (2, 'Jorge Martin',          'Aprilia Racing',          9, '+1.245'),
  (3, 'Fabio Di Giannantonio', 'Pertamina Enduro VR46',   7, '+3.102'),
  (4, 'Marco Bezzecchi',       'Aprilia Racing',           6, '+4.891'),
  (5, 'Marc Marquez',          'Ducati Lenovo Team',       5, '+6.344'),
  (6, 'Pedro Acosta',          'Red Bull KTM',             4, '+8.012'),
  (7, 'Ai Ogura',              'Trackhouse Racing',        3, '+9.341'),
  (8, 'Francesco Bagnaia',     'Ducati Lenovo Team',       2, '+11.203'),
  (9, 'Fermin Aldeguer',       'Gresini Racing',           1, '+12.889'),
  (10,'Brad Binder',           'Red Bull KTM',             0, '+14.102')
) AS v(pos, driver, team, pts, gap)
WHERE r.series_id = 'MotoGP' 
  AND r.circuit ILIKE '%mugello%' 
  AND r.type = 'sprint'
  AND NOT EXISTS (
    SELECT 1 FROM results res2 WHERE res2.race_id = r.id
  );

SELECT 'done' as status;
