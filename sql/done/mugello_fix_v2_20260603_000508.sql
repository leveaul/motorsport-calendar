
-- Fix Mugello : créer le sprint R7 + insérer tous les résultats
-- Les IDs sont des integers (pas des UUIDs)

-- 1. Créer le sprint Mugello s'il n'existe pas
INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
SELECT 'MotoGP','Sprint - Italie','Autodromo del Mugello','Italie','2026-05-31','2026-05-31',7,'sprint','done','motogp_ita'
WHERE NOT EXISTS (SELECT 1 FROM races WHERE series_id='MotoGP' AND round=7 AND type='sprint');

-- 2. Résultats course principale Mugello (race_id=30, integer)
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT 30, v.pos, v.driver, v.team, v.pts, v.gap
FROM (VALUES
  (1,'Marco Bezzecchi','Aprilia Racing',25,'0.000'),
  (2,'Jorge Martin','Aprilia Racing',20,'+3.559'),
  (3,'Francesco Bagnaia','Ducati Lenovo Team',16,'+6.421'),
  (4,'Ai Ogura','Trackhouse Racing',13,'+6.455'),
  (5,'Fabio Di Giannantonio','Pertamina Enduro VR46',11,'+12.302'),
  (6,'Pedro Acosta','Red Bull KTM',8,'+14.876'),
  (7,'Marc Marquez','Ducati Lenovo Team',6,'+16.124'),
  (8,'Raul Fernandez','Trackhouse Racing',4,'+18.009'),
  (9,'Fermin Aldeguer','Gresini Racing',2,'+19.455'),
  (10,'Diogo Moreira','LCR Honda',1,'+22.301'),
  (11,'Brad Binder','Red Bull KTM',0,'+24.112'),
  (12,'Jack Miller','Tech3 KTM',0,'+25.441'),
  (13,'Enea Bastianini','Pramac Yamaha',0,'+28.003'),
  (14,'Luca Marini','HRC Honda',0,'+30.221'),
  (15,'Johann Zarco','LCR Honda',0,'+33.445')
) AS v(pos,driver,team,pts,gap)
WHERE NOT EXISTS (SELECT 1 FROM results WHERE race_id=30);

-- 3. Résultats sprint Mugello (round=7, type=sprint)
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
  (9,'Fermin Aldeguer','Gresini Racing',1,'+12.889')
) AS v(pos,driver,team,pts,gap)
WHERE r.series_id='MotoGP' AND r.round=7 AND r.type='sprint'
  AND NOT EXISTS (SELECT 1 FROM results res WHERE res.race_id=r.id);
