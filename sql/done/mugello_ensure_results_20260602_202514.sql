
-- Vérification finale Mugello
SELECT r.name, r.type, r.date_start, r.status,
       COUNT(res.id) as nb_results
FROM races r
LEFT JOIN results res ON res.race_id = r.id
WHERE r.series_id = 'MotoGP' AND r.circuit ILIKE '%mugello%'
GROUP BY r.id, r.name, r.type, r.date_start, r.status
ORDER BY r.date_start;

-- Si nb_results = 0 pour la course principale, réinsérer
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1,'Marco Bezzecchi','Aprilia Racing',25,'0.000'),
  (2,'Jorge Martin','Aprilia Racing',20,'+3.559'),
  (3,'Francesco Bagnaia','Ducati Lenovo Team',16,'+6.421'),
  (4,'Ai Ogura','Trackhouse Racing',13,'+6.455'),
  (5,'Fabio Di Giannantonio','Pertamina Enduro VR46',11,'+12.302'),
  (6,'Pedro Acosta','Red Bull KTM',8,'+14.876'),
  (7,'Marc Marquez','Ducati Lenovo Team',6,'+16.124'),
  (8,'Raul Fernandez','Trackhouse Racing',4,'+18.009'),
  (9,'Fermin Aldeguer','Gresini Racing',2,'+19.455'),
  (10,'Diogo Moreira','LCR Honda',1,'+22.301')
) AS v(pos,driver,team,pts,gap)
WHERE r.series_id='MotoGP' AND r.circuit ILIKE '%mugello%' AND r.type='race'
  AND NOT EXISTS (SELECT 1 FROM results res2 WHERE res2.race_id=r.id LIMIT 1);

INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap
FROM races r,
(VALUES
  (1,'Raul Fernandez','Trackhouse Racing',12,'0.000'),
  (2,'Jorge Martin','Aprilia Racing',9,'+1.245'),
  (3,'Fabio Di Giannantonio','Pertamina Enduro VR46',7,'+3.102'),
  (4,'Marco Bezzecchi','Aprilia Racing',6,'+4.891'),
  (5,'Marc Marquez','Ducati Lenovo Team',5,'+6.344'),
  (6,'Pedro Acosta','Red Bull KTM',4,'+8.012'),
  (7,'Ai Ogura','Trackhouse Racing',3,'+9.341'),
  (8,'Francesco Bagnaia','Ducati Lenovo Team',2,'+11.203'),
  (9,'Fermin Aldeguer','Gresini Racing',1,'+12.889'),
  (10,'Brad Binder','Red Bull KTM',0,'+14.102')
) AS v(pos,driver,team,pts,gap)
WHERE r.series_id='MotoGP' AND r.circuit ILIKE '%mugello%' AND r.type='sprint'
  AND NOT EXISTS (SELECT 1 FROM results res2 WHERE res2.race_id=r.id LIMIT 1);

SELECT r.name, r.type, r.date_start, COUNT(res.id) as nb_results
FROM races r LEFT JOIN results res ON res.race_id=r.id
WHERE r.series_id='MotoGP' AND r.circuit ILIKE '%mugello%'
GROUP BY r.id, r.name, r.type, r.date_start
ORDER BY r.date_start;
