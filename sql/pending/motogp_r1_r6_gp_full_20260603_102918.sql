
-- Supprimer les anciens résultats R1-R6 (top 10 incomplets) et réinsérer le top 15 complet

-- R1 Thaïlande GP
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='MotoGP' AND round=1 AND type='sprint_weekend');
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap FROM races r,
(VALUES
  (1,'Marco Bezzecchi','Aprilia Racing',25,'39:36.270'),
  (2,'Pedro Acosta','Red Bull KTM Factory Racing',20,'+5.543'),
  (3,'Raul Fernandez','Trackhouse MotoGP Team',16,'+9.259'),
  (4,'Jorge Martin','Aprilia Racing',13,'+12.182'),
  (5,'Ai Ogura','Trackhouse MotoGP Team',11,'+12.411'),
  (6,'Fabio Di Giannantonio','Pertamina Enduro VR46 Racing Team',10,'+16.845'),
  (7,'Brad Binder','Red Bull KTM Factory Racing',9,'+17.363'),
  (8,'Franco Morbidelli','Pertamina Enduro VR46 Racing Team',8,'+18.227'),
  (9,'Francesco Bagnaia','Ducati Lenovo Team',7,'+18.340'),
  (10,'Luca Marini','Honda HRC Castrol',6,'+19.101'),
  (11,'Johann Zarco','Castrol Honda LCR',5,'+19.903'),
  (12,'Enea Bastianini','Red Bull KTM Tech3',4,'+23.386'),
  (13,'Diogo Moreira','Pro Honda LCR',3,'+24.686'),
  (14,'Fabio Quartararo','Monster Energy Yamaha MotoGP Team',2,'+30.823'),
  (15,'Alex Rins','Monster Energy Yamaha MotoGP Team',1,'+32.955')
) AS v(pos,driver,team,pts,gap)
WHERE r.series_id='MotoGP' AND r.round=1 AND r.type='sprint_weekend';

-- R2 Brésil GP
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='MotoGP' AND round=2 AND type='sprint_weekend');
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap FROM races r,
(VALUES
  (1,'Marco Bezzecchi','Aprilia Racing',25,'30:19.760'),
  (2,'Jorge Martin','Aprilia Racing',20,'+3.231'),
  (3,'Fabio Di Giannantonio','Pertamina Enduro VR46 Racing Team',16,'+3.780'),
  (4,'Marc Marquez','Ducati Lenovo Team',13,'+4.089'),
  (5,'Ai Ogura','Trackhouse MotoGP Team',11,'+8.403'),
  (6,'Alex Marquez','BK8 Gresini Racing MotoGP',10,'+8.918'),
  (7,'Pedro Acosta','Red Bull KTM Factory Racing',9,'+10.687'),
  (8,'Fermin Aldeguer','BK8 Gresini Racing MotoGP',8,'+11.359'),
  (9,'Johann Zarco','Castrol Honda LCR',7,'+12.907'),
  (10,'Raul Fernandez','Trackhouse MotoGP Team',6,'+16.370'),
  (11,'Luca Marini','Honda HRC Castrol',5,'+18.529'),
  (12,'Franco Morbidelli','Pertamina Enduro VR46 Racing Team',4,'+19.980'),
  (13,'Diogo Moreira','Pro Honda LCR',3,'+21.322'),
  (14,'Alex Rins','Monster Energy Yamaha MotoGP Team',2,'+22.699'),
  (15,'Enea Bastianini','Red Bull KTM Tech3',1,'+23.840')
) AS v(pos,driver,team,pts,gap)
WHERE r.series_id='MotoGP' AND r.round=2 AND r.type='sprint_weekend';

-- R3 USA GP
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='MotoGP' AND round=3 AND type='sprint_weekend');
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap FROM races r,
(VALUES
  (1,'Marco Bezzecchi','Aprilia Racing',25,'40:50.653'),
  (2,'Jorge Martin','Aprilia Racing',20,'+2.036'),
  (3,'Pedro Acosta','Red Bull KTM Factory Racing',16,'+4.497'),
  (4,'Fabio Di Giannantonio','Pertamina Enduro VR46 Racing Team',13,'+6.972'),
  (5,'Marc Marquez','Ducati Lenovo Team',11,'+8.100'),
  (6,'Enea Bastianini','Red Bull KTM Tech3',10,'+8.243'),
  (7,'Alex Marquez','BK8 Gresini Racing MotoGP',9,'+11.253'),
  (8,'Raul Fernandez','Trackhouse MotoGP Team',8,'+13.129'),
  (9,'Luca Marini','Honda HRC Castrol',7,'+14.471'),
  (10,'Francesco Bagnaia','Ducati Lenovo Team',6,'+14.544'),
  (11,'Fermin Aldeguer','BK8 Gresini Racing MotoGP',5,'+21.063'),
  (12,'Brad Binder','Red Bull KTM Factory Racing',4,'+22.062'),
  (13,'Diogo Moreira','Pro Honda LCR',3,'+22.201'),
  (14,'Franco Morbidelli','Pertamina Enduro VR46 Racing Team',2,'+24.371'),
  (15,'Toprak Razgatlioglu','Prima Pramac Yamaha MotoGP',1,'+25.549')
) AS v(pos,driver,team,pts,gap)
WHERE r.series_id='MotoGP' AND r.round=3 AND r.type='sprint_weekend';

-- R4 Espagne GP
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='MotoGP' AND round=4 AND type='sprint_weekend');
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap FROM races r,
(VALUES
  (1,'Alex Marquez','BK8 Gresini Racing MotoGP',25,'40:48.861'),
  (2,'Marco Bezzecchi','Aprilia Racing',20,'+1.903'),
  (3,'Fabio Di Giannantonio','Pertamina Enduro VR46 Racing Team',16,'+5.796'),
  (4,'Jorge Martin','Aprilia Racing',13,'+9.229'),
  (5,'Ai Ogura','Trackhouse MotoGP Team',11,'+9.891'),
  (6,'Raul Fernandez','Trackhouse MotoGP Team',10,'+10.614'),
  (7,'Johann Zarco','Castrol Honda LCR',9,'+13.039'),
  (8,'Enea Bastianini','Red Bull KTM Tech3',8,'+14.411'),
  (9,'Fermin Aldeguer','BK8 Gresini Racing MotoGP',7,'+19.778'),
  (10,'Pedro Acosta','Red Bull KTM Factory Racing',6,'+22.431'),
  (11,'Brad Binder','Red Bull KTM Factory Racing',5,'+22.799'),
  (12,'Franco Morbidelli','Pertamina Enduro VR46 Racing Team',4,'+24.867'),
  (13,'Luca Marini','Honda HRC Castrol',3,'+26.871'),
  (14,'Fabio Quartararo','Monster Energy Yamaha MotoGP Team',2,'+29.532'),
  (15,'Joan Mir','Honda HRC Castrol',1,'+29.899')
) AS v(pos,driver,team,pts,gap)
WHERE r.series_id='MotoGP' AND r.round=4 AND r.type='sprint_weekend';

-- R5 France GP
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='MotoGP' AND round=5 AND type='sprint_weekend');
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap FROM races r,
(VALUES
  (1,'Jorge Martin','Aprilia Racing',25,'41:18.001'),
  (2,'Marco Bezzecchi','Aprilia Racing',20,'+0.477'),
  (3,'Ai Ogura','Trackhouse MotoGP Team',16,'+0.874'),
  (4,'Fabio Di Giannantonio','Pertamina Enduro VR46 Racing Team',13,'+2.851'),
  (5,'Pedro Acosta','Red Bull KTM Factory Racing',11,'+2.991'),
  (6,'Fabio Quartararo','Monster Energy Yamaha MotoGP Team',10,'+7.756'),
  (7,'Enea Bastianini','Red Bull KTM Tech3',9,'+8.615'),
  (8,'Raul Fernandez','Trackhouse MotoGP Team',8,'+12.497'),
  (9,'Fermin Aldeguer','BK8 Gresini Racing MotoGP',7,'+14.903'),
  (10,'Luca Marini','Honda HRC Castrol',6,'+15.016'),
  (11,'Johann Zarco','Castrol Honda LCR',5,'+16.549'),
  (12,'Alex Rins','Monster Energy Yamaha MotoGP Team',4,'+32.343'),
  (13,'Toprak Razgatlioglu','Prima Pramac Yamaha MotoGP',3,'+32.476'),
  (14,'Franco Morbidelli','Pertamina Enduro VR46 Racing Team',2,'+32.774'),
  (15,'Jack Miller','Prima Pramac Yamaha MotoGP',1,'+36.059')
) AS v(pos,driver,team,pts,gap)
WHERE r.series_id='MotoGP' AND r.round=5 AND r.type='sprint_weekend';

-- R6 Catalogne GP
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='MotoGP' AND round=6 AND type='sprint_weekend');
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, v.pts, v.gap FROM races r,
(VALUES
  (1,'Fabio Di Giannantonio','Pertamina Enduro VR46 Racing Team',25,'20:06.243'),
  (2,'Fermin Aldeguer','BK8 Gresini Racing MotoGP',20,'+1.466'),
  (3,'Francesco Bagnaia','Ducati Lenovo Team',16,'+4.320'),
  (4,'Marco Bezzecchi','Aprilia Racing',13,'+4.679'),
  (5,'Fabio Quartararo','Monster Energy Yamaha MotoGP Team',11,'+4.876'),
  (6,'Luca Marini','Honda HRC Castrol',10,'+4.971'),
  (7,'Brad Binder','Red Bull KTM Factory Racing',9,'+5.137'),
  (8,'Ai Ogura','Trackhouse MotoGP Team',8,'+5.377'),
  (9,'Diogo Moreira','Pro Honda LCR',7,'+6.839'),
  (10,'Franco Morbidelli','Pertamina Enduro VR46 Racing Team',6,'+7.160'),
  (11,'Maverick Vinales','Red Bull KTM Tech3',5,'+10.147'),
  (12,'Augusto Fernandez','Yamaha Factory Racing',4,'+16.245'),
  (13,'Joan Mir','Honda HRC Castrol',3,'+17.250'),
  (14,'Alex Rins','Monster Energy Yamaha MotoGP Team',2,'+22.916'),
  (15,'Jack Miller','Prima Pramac Yamaha MotoGP',1,'+26.452')
) AS v(pos,driver,team,pts,gap)
WHERE r.series_id='MotoGP' AND r.round=6 AND r.type='sprint_weekend';
