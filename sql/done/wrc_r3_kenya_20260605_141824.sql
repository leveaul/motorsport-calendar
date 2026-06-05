
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='WRC' AND round=3);

INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, 0, v.gap
FROM races r,
(VALUES
  (1,  'T.Katsuta / A.Johnston',    'Toyota GR Yaris Rally1',  '3:16:05.6'),
  (2,  'A.Fourmaux / A.Coria',      'Hyundai i20 N Rally1',    '+27.4'),
  (3,  'S.Pajari / M.Salminen',     'Toyota GR Yaris Rally1',  '+4:26.1'),
  (4,  'E.Lappi / E.Mälkönen',      'Hyundai i20 N Rally1',    '+6:07.3'),
  (5,  'O.Solberg / E.Edmondson',   'Toyota GR Yaris Rally1',  '+16:44.5'),
  (6,  'S.Ogier / V.Landais',       'Toyota GR Yaris Rally1',  '+17:30.7'),
  (7,  'T.Neuville / M.Wydaeghe',   'Hyundai i20 N Rally1',    '+19:52.4'),
  (8,  'E.Evans / S.Martin',        'Toyota GR Yaris Rally1',  '+26:20.9'),
  (9,  'J.Armstrong / S.Byrne',     'Ford Puma Rally1',        '+48:01.1'),
  (10, 'J.McErlean / E.Treacy',     'Ford Puma Rally1',        'ABN ES17 - Moteur')
) AS v(pos, driver, team, gap)
WHERE r.series_id='WRC' AND r.round=3;
