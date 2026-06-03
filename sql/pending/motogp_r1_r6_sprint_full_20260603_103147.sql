
-- Remplacer résultats sprint R1-R6 avec top 9 complet

-- R1 Sprint Thaïlande
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='MotoGP' AND round=1 AND type='sprint');
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap FROM races r,
(VALUES
  (1,'Pedro Acosta','Red Bull KTM Factory Racing',12,'19:39.155'),
  (2,'Marc Marquez','Ducati Lenovo Team',9,'+0.108'),
  (3,'Raul Fernandez','Trackhouse MotoGP Team',7,'+0.540'),
  (4,'Ai Ogura','Trackhouse MotoGP Team',6,'+2.100'),
  (5,'Jorge Martin','Aprilia Racing',5,'+3.851'),
  (6,'Brad Binder','Red Bull KTM Factory Racing',4,'+4.612'),
  (7,'Joan Mir','Honda HRC Castrol',3,'+4.924'),
  (8,'Fabio Di Giannantonio','Pertamina Enduro VR46 Racing Team',2,'+5.748'),
  (9,'Francesco Bagnaia','Ducati Lenovo Team',1,'+6.910')
) AS v(pos,driver,team,pts,gap)
WHERE r.series_id='MotoGP' AND r.round=1 AND r.type='sprint';

-- R2 Sprint Brésil
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='MotoGP' AND round=2 AND type='sprint');
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap FROM races r,
(VALUES
  (1,'Marc Marquez','Ducati Lenovo Team',12,'19:41.982'),
  (2,'Fabio Di Giannantonio','Pertamina Enduro VR46 Racing Team',9,'+0.213'),
  (3,'Jorge Martin','Aprilia Racing',7,'+3.587'),
  (4,'Marco Bezzecchi','Aprilia Racing',6,'+4.061'),
  (5,'Ai Ogura','Trackhouse MotoGP Team',5,'+4.994'),
  (6,'Fabio Quartararo','Monster Energy Yamaha MotoGP Team',4,'+7.728'),
  (7,'Alex Marquez','BK8 Gresini Racing MotoGP',3,'+8.153'),
  (8,'Francesco Bagnaia','Ducati Lenovo Team',2,'+8.342'),
  (9,'Pedro Acosta','Red Bull KTM Factory Racing',1,'+9.096')
) AS v(pos,driver,team,pts,gap)
WHERE r.series_id='MotoGP' AND r.round=2 AND r.type='sprint';

-- R3 Sprint USA
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='MotoGP' AND round=3 AND type='sprint');
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap FROM races r,
(VALUES
  (1,'Jorge Martin','Aprilia Racing',12,'20:19.546'),
  (2,'Francesco Bagnaia','Ducati Lenovo Team',9,'+0.755'),
  (3,'Enea Bastianini','Red Bull KTM Tech3',7,'+3.199'),
  (4,'Alex Marquez','BK8 Gresini Racing MotoGP',6,'+3.638'),
  (5,'Luca Marini','Honda HRC Castrol',5,'+5.521'),
  (6,'Ai Ogura','Trackhouse MotoGP Team',4,'+7.183'),
  (7,'Raul Fernandez','Trackhouse MotoGP Team',3,'+8.634'),
  (8,'Pedro Acosta','Red Bull KTM Factory Racing',2,'+10.484'),
  (9,'Johann Zarco','Castrol Honda LCR',1,'+10.574')
) AS v(pos,driver,team,pts,gap)
WHERE r.series_id='MotoGP' AND r.round=3 AND r.type='sprint';

-- R4 Sprint Espagne
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='MotoGP' AND round=4 AND type='sprint');
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap FROM races r,
(VALUES
  (1,'Marc Marquez','Ducati Lenovo Team',12,'21:25.651'),
  (2,'Francesco Bagnaia','Ducati Lenovo Team',9,'+3.050'),
  (3,'Franco Morbidelli','Pertamina Enduro VR46 Racing Team',7,'+7.493'),
  (4,'Brad Binder','Red Bull KTM Factory Racing',6,'+8.752'),
  (5,'Fabio Di Giannantonio','Pertamina Enduro VR46 Racing Team',5,'+9.237'),
  (6,'Raul Fernandez','Trackhouse MotoGP Team',4,'+11.958'),
  (7,'Fabio Quartararo','Monster Energy Yamaha MotoGP Team',3,'+13.525'),
  (8,'Johann Zarco','Castrol Honda LCR',2,'+14.522'),
  (9,'Luca Marini','Honda HRC Castrol',1,'+15.769')
) AS v(pos,driver,team,pts,gap)
WHERE r.series_id='MotoGP' AND r.round=4 AND r.type='sprint';

-- R5 Sprint France
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='MotoGP' AND round=5 AND type='sprint');
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap FROM races r,
(VALUES
  (1,'Jorge Martin','Aprilia Racing',12,'19:46.830'),
  (2,'Francesco Bagnaia','Ducati Lenovo Team',9,'+1.107'),
  (3,'Marco Bezzecchi','Aprilia Racing',7,'+2.786'),
  (4,'Pedro Acosta','Red Bull KTM Factory Racing',6,'+3.808'),
  (5,'Fabio Quartararo','Monster Energy Yamaha MotoGP Team',5,'+4.402'),
  (6,'Joan Mir','Honda HRC Castrol',4,'+4.630'),
  (7,'Ai Ogura','Trackhouse MotoGP Team',3,'+5.670'),
  (8,'Alex Marquez','BK8 Gresini Racing MotoGP',2,'+6.608'),
  (9,'Diogo Moreira','Pro Honda LCR',1,'+10.368')
) AS v(pos,driver,team,pts,gap)
WHERE r.series_id='MotoGP' AND r.round=5 AND r.type='sprint';

-- R6 Sprint Catalogne
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='MotoGP' AND round=6 AND type='sprint');
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap FROM races r,
(VALUES
  (1,'Alex Marquez','BK8 Gresini Racing MotoGP',12,'20:02.258'),
  (2,'Pedro Acosta','Red Bull KTM Factory Racing',9,'+0.041'),
  (3,'Fabio Di Giannantonio','Pertamina Enduro VR46 Racing Team',7,'+0.457'),
  (4,'Raul Fernandez','Trackhouse MotoGP Team',6,'+2.928'),
  (5,'Johann Zarco','Castrol Honda LCR',5,'+4.764'),
  (6,'Francesco Bagnaia','Ducati Lenovo Team',4,'+4.894'),
  (7,'Franco Morbidelli','Pertamina Enduro VR46 Racing Team',3,'+6.175'),
  (8,'Ai Ogura','Trackhouse MotoGP Team',2,'+6.871'),
  (9,'Marco Bezzecchi','Aprilia Racing',1,'+7.381')
) AS v(pos,driver,team,pts,gap)
WHERE r.series_id='MotoGP' AND r.round=6 AND r.type='sprint';
