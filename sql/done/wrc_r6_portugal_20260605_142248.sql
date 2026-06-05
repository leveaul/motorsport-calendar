
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='WRC' AND round=6);

INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, 0, v.gap
FROM races r,
(VALUES
  (1,  'T.Neuville / M.Wydaeghe',   'Hyundai i20 N Rally1',    '3:53:01.7'),
  (2,  'O.Solberg / E.Edmondson',   'Toyota GR Yaris Rally1',  '+16.3'),
  (3,  'E.Evans / S.Martin',        'Toyota GR Yaris Rally1',  '+29.1'),
  (4,  'A.Fourmaux / A.Coria',      'Hyundai i20 N Rally1',    '+54.8'),
  (5,  'T.Katsuta / A.Johnston',    'Toyota GR Yaris Rally1',  '+1:12.6'),
  (6,  'S.Ogier / V.Landais',       'Toyota GR Yaris Rally1',  '+1:26.6'),
  (7,  'S.Pajari / M.Salminen',     'Toyota GR Yaris Rally1',  '+2:50.9'),
  (8,  'D.Sordo / C.Carrera',       'Hyundai i20 N Rally1',    '+4:10.0'),
  (9,  'M.Sesks / F.Renārs',        'Ford Puma Rally1',        '+6:49.2'),
  (10, 'J.McErlean / E.Treacy',     'Ford Puma Rally1',        '+20:07.9'),
  (11, 'J.Armstrong / S.Byrne',     'Ford Puma Rally1',        'ABN ES15 - Accident')
) AS v(pos, driver, team, gap)
WHERE r.series_id='WRC' AND r.round=6;
