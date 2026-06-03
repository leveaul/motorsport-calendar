
-- Supprimer anciens résultats sprint Mugello
DELETE FROM results WHERE race_id = (
  SELECT id FROM races WHERE series_id='MotoGP' AND round=7 AND type='sprint'
);

-- Insérer résultats corrects sprint Mugello
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1, 'Raul Fernandez',        'Trackhouse MotoGP Team',            12, '19:28.408'),
  (2, 'Jorge Martin',          'Aprilia Racing',                     9, '+1.289'),
  (3, 'Fabio Di Giannantonio', 'Pertamina Enduro VR46 Racing Team',  7, '+3.287'),
  (4, 'Marco Bezzecchi',       'Aprilia Racing',                     6, '+4.481'),
  (5, 'Marc Marquez',          'Ducati Lenovo Team',                  5, '+9.055'),
  (6, 'Fermin Aldeguer',       'BK8 Gresini Racing MotoGP',          4, '+9.758'),
  (7, 'Francesco Bagnaia',     'Ducati Lenovo Team',                  3, '+10.983'),
  (8, 'Ai Ogura',              'Trackhouse MotoGP Team',              2, '+11.411'),
  (9, 'Pedro Acosta',          'Red Bull KTM Factory Racing',         1, '+11.809')
) AS v(pos, driver, team, pts, gap)
WHERE r.series_id='MotoGP' AND r.round=7 AND r.type='sprint';
