
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='WRC' AND round=4);

INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, 0, v.gap
FROM races r,
(VALUES
  (1, 'T.Katsuta / A.Johnston',    'Toyota GR Yaris Rally1',  '2:51:15.8'),
  (2, 'S.Pajari / M.Salminen',     'Toyota GR Yaris Rally1',  '+20.7'),
  (3, 'H.Paddon / J.Kennard',      'Hyundai i20 N Rally1',    '+2:07.7'),
  (4, 'J.McErlean / E.Treacy',     'Ford Puma Rally1',        '+12:23.1'),
  (5, 'A.Fourmaux / A.Coria',      'Hyundai i20 N Rally1',    '+49:21.5'),
  (6, 'J.Armstrong / S.Byrne',     'Ford Puma Rally1',        '+49:31.1'),
  (7, 'E.Evans / S.Martin',        'Toyota GR Yaris Rally1',  '+56:14.8'),
  (8, 'O.Solberg / E.Edmondson',   'Toyota GR Yaris Rally1',  '+1:19:02.2'),
  (9, 'T.Neuville / M.Wydaeghe',   'Hyundai i20 N Rally1',    'ABN ES20 - Sortie')
) AS v(pos, driver, team, gap)
WHERE r.series_id='WRC' AND r.round=4;
