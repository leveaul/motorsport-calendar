
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='WRC' AND round=5);

INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, 0, v.gap
FROM races r,
(VALUES
  (1,  'S.Ogier / V.Landais',       'Toyota GR Yaris Rally1',  '2:43:18.9'),
  (2,  'E.Evans / S.Martin',        'Toyota GR Yaris Rally1',  '+19.9'),
  (3,  'S.Pajari / M.Salminen',     'Toyota GR Yaris Rally1',  '+1:40.8'),
  (4,  'T.Katsuta / A.Johnston',    'Toyota GR Yaris Rally1',  '+1:51.2'),
  (5,  'A.Fourmaux / A.Coria',      'Hyundai i20 N Rally1',    '+3:29.5'),
  (6,  'T.Neuville / M.Wydaeghe',   'Hyundai i20 N Rally1',    '+3:41.0'),
  (7,  'D.Sordo / C.Carrera',       'Hyundai i20 N Rally1',    '+3:57.7'),
  (8,  'J.McErlean / E.Treacy',     'Ford Puma Rally1',        '+5:45.4'),
  (9,  'J.Armstrong / S.Byrne',     'Ford Puma Rally1',        '+7:52.2'),
  (10, 'O.Solberg / E.Edmondson',   'Toyota GR Yaris Rally1',  'ABN ES17 - Accident')
) AS v(pos, driver, team, gap)
WHERE r.series_id='WRC' AND r.round=5;
