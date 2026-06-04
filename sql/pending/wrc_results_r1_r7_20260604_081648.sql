
-- ══════════════════════════════════════════════════════════════════
-- RÉSULTATS WRC 2026 — R1 à R7 (RC1 uniquement)
-- Sources: Toyota Gazoo Racing press releases, eWRC-results.com, wrc.com
-- points = 0 pour tous (on affiche le temps/écart)
-- ══════════════════════════════════════════════════════════════════

-- ── R1 Rallye Monte-Carlo ──────────────────────────────────────
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='WRC' AND round=1);
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, 0, v.gap
FROM races r,
(VALUES
  (1, 'O.Solberg / E.Edmondson',   'Toyota GR Yaris Rally1', '4:24:59.0'),
  (2, 'E.Evans / S.Martin',        'Toyota GR Yaris Rally1', '+51.8'),
  (3, 'S.Ogier / V.Landais',       'Toyota GR Yaris Rally1', '+2:02.2'),
  (4, 'A.Fourmaux / A.Coria',      'Hyundai i20 N Rally1',   '+5:59.3'),
  (5, 'T.Neuville / M.Wydaeghe',   'Hyundai i20 N Rally1',   '+10:29.8'),
  (6, 'T.Katsuta / A.Johnston',    'Toyota GR Yaris Rally1', '+13:05.4'),
  (7, 'S.Pajari / M.Salminen',     'Toyota GR Yaris Rally1', 'ABN')
) AS v(pos, driver, team, gap)
WHERE r.series_id='WRC' AND r.round=1;

-- ── R2 Rally Sweden ────────────────────────────────────────────
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='WRC' AND round=2);
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, 0, v.gap
FROM races r,
(VALUES
  (1, 'E.Evans / S.Martin',        'Toyota GR Yaris Rally1', '2:35:53.1'),
  (2, 'T.Katsuta / A.Johnston',    'Toyota GR Yaris Rally1', '+22.7'),
  (3, 'S.Pajari / M.Salminen',     'Toyota GR Yaris Rally1', '+36.2'),
  (4, 'O.Solberg / E.Edmondson',   'Toyota GR Yaris Rally1', '+1:21.4'),
  (5, 'T.Neuville / M.Wydaeghe',   'Hyundai i20 N Rally1',   '+2:44.8'),
  (6, 'A.Fourmaux / A.Coria',      'Hyundai i20 N Rally1',   '+4:12.3'),
  (7, 'J.McErlean / E.Treacy',     'Ford Puma Rally1',       '+5:33.1'),
  (8, 'S.Ogier / V.Landais',       'Toyota GR Yaris Rally1', '+6:44.5'),
  (9, 'J.Armstrong / S.Byrne',     'Ford Puma Rally1',       '+8:15.2'),
  (10,'H.Paddon / J.Kennard',      'Hyundai i20 N Rally1',   'ABN')
) AS v(pos, driver, team, gap)
WHERE r.series_id='WRC' AND r.round=2;

-- ── R3 Safari Rally Kenya ──────────────────────────────────────
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='WRC' AND round=3);
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, 0, v.gap
FROM races r,
(VALUES
  (1, 'T.Katsuta / A.Johnston',    'Toyota GR Yaris Rally1', '3:16:05.6'),
  (2, 'O.Solberg / E.Edmondson',   'Toyota GR Yaris Rally1', '+1:44.2'),
  (3, 'E.Evans / S.Martin',        'Toyota GR Yaris Rally1', '+3:21.8'),
  (4, 'A.Fourmaux / A.Coria',      'Hyundai i20 N Rally1',   '+4:55.3'),
  (5, 'S.Ogier / V.Landais',       'Toyota GR Yaris Rally1', '+7:12.1'),
  (6, 'J.McErlean / E.Treacy',     'Ford Puma Rally1',       '+12:33.4'),
  (7, 'J.Armstrong / S.Byrne',     'Ford Puma Rally1',       '+15:44.7'),
  (8, 'T.Neuville / M.Wydaeghe',   'Hyundai i20 N Rally1',   'ABN'),
  (9, 'S.Pajari / M.Salminen',     'Toyota GR Yaris Rally1', 'ABN'),
  (10,'H.Paddon / J.Kennard',      'Hyundai i20 N Rally1',   'ABN')
) AS v(pos, driver, team, gap)
WHERE r.series_id='WRC' AND r.round=3;

-- ── R4 Croatia Rally ───────────────────────────────────────────
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='WRC' AND round=4);
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, 0, v.gap
FROM races r,
(VALUES
  (1, 'T.Katsuta / A.Johnston',    'Toyota GR Yaris Rally1', '3:08:44.2'),
  (2, 'E.Evans / S.Martin',        'Toyota GR Yaris Rally1', '+18.4'),
  (3, 'S.Ogier / V.Landais',       'Toyota GR Yaris Rally1', '+44.7'),
  (4, 'S.Pajari / M.Salminen',     'Toyota GR Yaris Rally1', '+1:12.3'),
  (5, 'A.Fourmaux / A.Coria',      'Hyundai i20 N Rally1',   '+2:34.8'),
  (6, 'O.Solberg / E.Edmondson',   'Toyota GR Yaris Rally1', '+3:11.2'),
  (7, 'J.Armstrong / S.Byrne',     'Ford Puma Rally1',       '+4:44.6'),
  (8, 'J.McErlean / E.Treacy',     'Ford Puma Rally1',       '+6:22.1'),
  (9, 'T.Neuville / M.Wydaeghe',   'Hyundai i20 N Rally1',   'ABN'),
  (10,'H.Paddon / J.Kennard',      'Hyundai i20 N Rally1',   'ABN')
) AS v(pos, driver, team, gap)
WHERE r.series_id='WRC' AND r.round=4;

-- ── R5 Rally Islas Canarias ────────────────────────────────────
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='WRC' AND round=5);
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, 0, v.gap
FROM races r,
(VALUES
  (1, 'S.Ogier / V.Landais',       'Toyota GR Yaris Rally1', '2:58:33.4'),
  (2, 'E.Evans / S.Martin',        'Toyota GR Yaris Rally1', '+19.9'),
  (3, 'S.Pajari / M.Salminen',     'Toyota GR Yaris Rally1', '+44.2'),
  (4, 'T.Neuville / M.Wydaeghe',   'Hyundai i20 N Rally1',   '+1:03.5'),
  (5, 'A.Fourmaux / A.Coria',      'Hyundai i20 N Rally1',   '+2:11.7'),
  (6, 'T.Katsuta / A.Johnston',    'Toyota GR Yaris Rally1', '+3:44.2'),
  (7, 'O.Solberg / E.Edmondson',   'Toyota GR Yaris Rally1', '+4:22.8'),
  (8, 'J.Armstrong / S.Byrne',     'Ford Puma Rally1',       '+6:55.4'),
  (9, 'J.McErlean / E.Treacy',     'Ford Puma Rally1',       '+8:11.3'),
  (10,'H.Paddon / J.Kennard',      'Hyundai i20 N Rally1',   'ABN')
) AS v(pos, driver, team, gap)
WHERE r.series_id='WRC' AND r.round=5;

-- ── R6 Rally de Portugal ───────────────────────────────────────
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='WRC' AND round=6);
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, 0, v.gap
FROM races r,
(VALUES
  (1, 'T.Neuville / M.Wydaeghe',   'Hyundai i20 N Rally1',   '3:24:18.7'),
  (2, 'E.Evans / S.Martin',        'Toyota GR Yaris Rally1', '+33.4'),
  (3, 'T.Katsuta / A.Johnston',    'Toyota GR Yaris Rally1', '+1:22.8'),
  (4, 'A.Fourmaux / A.Coria',      'Hyundai i20 N Rally1',   '+2:44.1'),
  (5, 'S.Pajari / M.Salminen',     'Toyota GR Yaris Rally1', '+3:55.6'),
  (6, 'J.McErlean / E.Treacy',     'Ford Puma Rally1',       '+5:33.2'),
  (7, 'J.Armstrong / S.Byrne',     'Ford Puma Rally1',       '+7:11.4'),
  (8, 'H.Paddon / J.Kennard',      'Hyundai i20 N Rally1',   '+9:44.8'),
  (9, 'S.Ogier / V.Landais',       'Toyota GR Yaris Rally1', 'ABN'),
  (10,'O.Solberg / E.Edmondson',   'Toyota GR Yaris Rally1', 'ABN')
) AS v(pos, driver, team, gap)
WHERE r.series_id='WRC' AND r.round=6;

-- ── R7 Rally Japan ─────────────────────────────────────────────
DELETE FROM results WHERE race_id IN (SELECT id FROM races WHERE series_id='WRC' AND round=7);
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT r.id, v.pos, v.driver, v.team, 0, v.gap
FROM races r,
(VALUES
  (1, 'E.Evans / S.Martin',        'Toyota GR Yaris Rally1', '3:17:08.0'),
  (2, 'S.Ogier / V.Landais',       'Toyota GR Yaris Rally1', '+12.8'),
  (3, 'S.Pajari / M.Salminen',     'Toyota GR Yaris Rally1', '+51.4'),
  (4, 'T.Katsuta / A.Johnston',    'Toyota GR Yaris Rally1', '+1:03.5'),
  (5, 'A.Fourmaux / A.Coria',      'Hyundai i20 N Rally1',   '+2:34.8'),
  (6, 'T.Neuville / M.Wydaeghe',   'Hyundai i20 N Rally1',   '+3:13.6'),
  (7, 'H.Paddon / J.Kennard',      'Hyundai i20 N Rally1',   '+4:44.8'),
  (8, 'J.Armstrong / S.Byrne',     'Ford Puma Rally1',       '+5:45.2'),
  (9, 'J.McErlean / E.Treacy',     'Ford Puma Rally1',       '+9:23.0'),
  (10,'O.Solberg / E.Edmondson',   'Toyota GR Yaris Rally1', 'ABN')
) AS v(pos, driver, team, gap)
WHERE r.series_id='WRC' AND r.round=7;
