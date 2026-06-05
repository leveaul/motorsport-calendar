
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='WRC' AND round=2);

INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, 0, v.gap
FROM races r,
(VALUES
  (1,  'E.Evans / S.Martin',        'Toyota GR Yaris Rally1',  '2:35:53.1'),
  (2,  'T.Katsuta / A.Johnston',    'Toyota GR Yaris Rally1',  '+14.3'),
  (3,  'S.Pajari / M.Salminen',     'Toyota GR Yaris Rally1',  '+46.0'),
  (4,  'O.Solberg / E.Edmondson',   'Toyota GR Yaris Rally1',  '+1:11.6'),
  (5,  'A.Fourmaux / A.Coria',      'Hyundai i20 N Rally1',    '+1:50.3'),
  (6,  'E.Lappi / E.Mälkönen',      'Hyundai i20 N Rally1',    '+1:53.2'),
  (7,  'T.Neuville / M.Wydaeghe',   'Hyundai i20 N Rally1',    '+3:45.9'),
  (8,  'J.Armstrong / S.Byrne',     'Ford Puma Rally1',        '+4:05.5'),
  (9,  'J.McErlean / E.Treacy',     'Ford Puma Rally1',        '+6:05.4'),
  (10, 'L.Bertelli / S.Scattolin',  'Toyota GR Yaris Rally1',  '+17:40.5'),
  (11, 'M.Sesks / F.Renārs',        'Ford Puma Rally1',        '+51:21.5')
) AS v(pos, driver, team, gap)
WHERE r.series_id='WRC' AND r.round=2;
