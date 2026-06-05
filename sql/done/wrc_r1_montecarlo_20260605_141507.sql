
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='WRC' AND round=1);

INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, 0, v.gap
FROM races r,
(VALUES
  (1, 'O.Solberg / E.Edmondson', 'Toyota GR Yaris Rally1',  '4:24:59.0'),
  (2, 'E.Evans / S.Martin',      'Toyota GR Yaris Rally1',  '+51.8'),
  (3, 'S.Ogier / V.Landais',     'Toyota GR Yaris Rally1',  '+2:02.2'),
  (4, 'A.Fourmaux / A.Coria',    'Hyundai i20 N Rally1',    '+5:59.3'),
  (5, 'T.Neuville / M.Wydaeghe', 'Hyundai i20 N Rally1',    '+10:29.8'),
  (6, 'T.Katsuta / A.Johnston',  'Toyota GR Yaris Rally1',  '+13:05.4'),
  (7, 'H.Paddon / J.Kennard',    'Hyundai i20 N Rally1',    '+18:47.5'),
  (8, 'S.Pajari / M.Salminen',   'Toyota GR Yaris Rally1',  'ABN SS12 - Accident'),
  (9, 'G.Munster / L.Louka',     'Ford Puma Rally1',        'ABN SS14 - Mécanique'),
  (10,'J.McErlean / E.Treacy',   'Ford Puma Rally1',        'ABN SS17 - Sortie'),
  (11,'J.Armstrong / S.Byrne',   'Ford Puma Rally1',        'ABN SS16 - Accident')
) AS v(pos, driver, team, gap)
WHERE r.series_id='WRC' AND r.round=1;
