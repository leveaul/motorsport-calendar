
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='WRC' AND round=7);

INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, 0, v.gap
FROM races r,
(VALUES
  (1,  'E.Evans / S.Martin',        'Toyota GR Yaris Rally1',  '3:17:08.0'),
  (2,  'S.Ogier / V.Landais',       'Toyota GR Yaris Rally1',  '+12.8'),
  (3,  'S.Pajari / M.Salminen',     'Toyota GR Yaris Rally1',  '+51.4'),
  (4,  'T.Katsuta / A.Johnston',    'Toyota GR Yaris Rally1',  '+1:03.5'),
  (5,  'A.Fourmaux / A.Coria',      'Hyundai i20 N Rally1',    '+2:34.8'),
  (6,  'T.Neuville / M.Wydaeghe',   'Hyundai i20 N Rally1',    '+3:13.6'),
  (7,  'H.Paddon / J.Kennard',      'Hyundai i20 N Rally1',    '+4:44.8'),
  (8,  'J.Armstrong / S.Byrne',     'Ford Puma Rally1',        '+5:45.2'),
  (9,  'J.McErlean / E.Treacy',     'Ford Puma Rally1',        '+9:23.0'),
  (10, 'O.Solberg / E.Edmondson',   'Toyota GR Yaris Rally1',  '+49:43.6')
) AS v(pos, driver, team, gap)
WHERE r.series_id='WRC' AND r.round=7;
