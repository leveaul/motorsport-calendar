
-- =============================================
-- SPRINTS MOTOGP 2026 — Rounds 1 à 7
-- Insérés comme entrées type='sprint' liées au même round
-- =============================================

-- D'abord insérer les courses sprint dans la table races
INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status)
SELECT 'MotoGP', 'Sprint — Thaïlande',   circuit, country, date_start, date_start, round, 'sprint', 'done' FROM races WHERE series_id='MotoGP' AND round=1 AND type='sprint_weekend'
UNION ALL
SELECT 'MotoGP', 'Sprint — Brésil',      circuit, country, date_start, date_start, round, 'sprint', 'done' FROM races WHERE series_id='MotoGP' AND round=2 AND type='sprint_weekend'
UNION ALL
SELECT 'MotoGP', 'Sprint — Amériques',   circuit, country, date_start, date_start, round, 'sprint', 'done' FROM races WHERE series_id='MotoGP' AND round=3 AND type='sprint_weekend'
UNION ALL
SELECT 'MotoGP', 'Sprint — Qatar',       circuit, country, date_start, date_start, round, 'sprint', 'done' FROM races WHERE series_id='MotoGP' AND round=4 AND type='sprint_weekend'
UNION ALL
SELECT 'MotoGP', 'Sprint — Espagne',     circuit, country, date_start, date_start, round, 'sprint', 'done' FROM races WHERE series_id='MotoGP' AND round=5 AND type='sprint_weekend'
UNION ALL
SELECT 'MotoGP', 'Sprint — France',      circuit, country, date_start, date_start, round, 'sprint', 'done' FROM races WHERE series_id='MotoGP' AND round=6 AND type='sprint_weekend'
UNION ALL
SELECT 'MotoGP', 'Sprint — Catalogne',   circuit, country, date_start, date_start, round, 'sprint', 'done' FROM races WHERE series_id='MotoGP' AND round=7 AND type='sprint_weekend';

-- SPRINT R1 — THAÏLANDE — Acosta 1er (Marquez pénalisé)
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT id, 1, 'Pedro Acosta',         'Red Bull KTM',       8, '22:14.441' FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Thaïlande%'
UNION ALL SELECT id, 2, 'Marc Marquez',       'Ducati Lenovo',      7, '+0.8s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Thaïlande%'
UNION ALL SELECT id, 3, 'Raúl Fernández',     'Trackhouse Aprilia', 6, '+2.1s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Thaïlande%'
UNION ALL SELECT id, 4, 'Marco Bezzecchi',    'Aprilia Racing',     5, 'DNF'       FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Thaïlande%'
UNION ALL SELECT id, 5, 'Jorge Martín',       'Aprilia Racing',     4, '+5.2s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Thaïlande%';

-- SPRINT R2 — BRÉSIL — Martín 1er
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT id, 1, 'Jorge Martín',         'Aprilia Racing',     8, '21:55.332' FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Brésil%'
UNION ALL SELECT id, 2, 'Marco Bezzecchi',    'Aprilia Racing',     7, '+1.2s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Brésil%'
UNION ALL SELECT id, 3, 'Fabio Di Giannantonio','VR46 Ducati',      6, '+3.4s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Brésil%'
UNION ALL SELECT id, 4, 'Pedro Acosta',       'Red Bull KTM',       5, '+5.1s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Brésil%'
UNION ALL SELECT id, 5, 'Marc Marquez',       'Ducati Lenovo',      4, '+7.3s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Brésil%';

-- SPRINT R3 — AMÉRIQUES — Bagnaia 1er (après chute Marquez)
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT id, 1, 'Francesco Bagnaia',    'Ducati Lenovo',      8, '22:31.118' FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Amériques%'
UNION ALL SELECT id, 2, 'Jorge Martín',       'Aprilia Racing',     7, '+0.6s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Amériques%'
UNION ALL SELECT id, 3, 'Pedro Acosta',       'Red Bull KTM',       6, '+2.8s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Amériques%'
UNION ALL SELECT id, 4, 'Marco Bezzecchi',    'Aprilia Racing',     5, '+4.1s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Amériques%'
UNION ALL SELECT id, 5, 'Ai Ogura',           'Trackhouse Aprilia', 4, '+6.3s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Amériques%';

-- SPRINT R4 — QATAR — Marc Marquez 1er
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT id, 1, 'Marc Marquez',         'Ducati Lenovo',      8, '22:44.009' FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Qatar%'
UNION ALL SELECT id, 2, 'Pedro Acosta',       'Red Bull KTM',       7, '+1.1s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Qatar%'
UNION ALL SELECT id, 3, 'Marco Bezzecchi',    'Aprilia Racing',     6, '+3.2s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Qatar%'
UNION ALL SELECT id, 4, 'Jorge Martín',       'Aprilia Racing',     5, '+4.8s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Qatar%'
UNION ALL SELECT id, 5, 'Fabio Di Giannantonio','VR46 Ducati',      4, '+6.5s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Qatar%';

-- SPRINT R5 — ESPAGNE — Martín 1er
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT id, 1, 'Jorge Martín',         'Aprilia Racing',     8, '23:02.441' FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Espagne%'
UNION ALL SELECT id, 2, 'Francesco Bagnaia',  'Ducati Lenovo',      7, '+0.9s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Espagne%'
UNION ALL SELECT id, 3, 'Marco Bezzecchi',    'Aprilia Racing',     6, '+2.4s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Espagne%'
UNION ALL SELECT id, 4, 'Alex Marquez',       'Gresini Ducati',     5, '+3.8s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Espagne%'
UNION ALL SELECT id, 5, 'Johann Zarco',       'LCR Honda',          4, '+5.1s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Espagne%';

-- SPRINT R6 — FRANCE — Bezzecchi 1er (podium lockout Aprilia)
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT id, 1, 'Marco Bezzecchi',      'Aprilia Racing',     8, '22:18.772' FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%France%'
UNION ALL SELECT id, 2, 'Jorge Martín',       'Aprilia Racing',     7, '+0.4s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%France%'
UNION ALL SELECT id, 3, 'Ai Ogura',           'Trackhouse Aprilia', 6, '+1.8s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%France%'
UNION ALL SELECT id, 4, 'Pedro Acosta',       'Red Bull KTM',       5, '+3.2s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%France%'
UNION ALL SELECT id, 5, 'Fabio Di Giannantonio','VR46 Ducati',      4, '+5.1s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%France%';

-- SPRINT R7 — CATALOGNE — Alex Marquez 1er (0.041s sur Acosta !)
INSERT INTO results (race_id, position, driver, team, points, gap)
SELECT id, 1, 'Alex Marquez',         'Gresini Ducati',     8, '21:44.882' FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Catalogne%'
UNION ALL SELECT id, 2, 'Pedro Acosta',       'Red Bull KTM',       7, '+0.041s'   FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Catalogne%'
UNION ALL SELECT id, 3, 'Fabio Di Giannantonio','VR46 Ducati',      6, '+1.2s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Catalogne%'
UNION ALL SELECT id, 4, 'Raúl Fernández',     'Trackhouse Aprilia', 5, '+3.1s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Catalogne%'
UNION ALL SELECT id, 5, 'Johann Zarco',       'LCR Honda',          4, '+4.8s'     FROM races WHERE series_id='MotoGP' AND type='sprint' AND name LIKE '%Catalogne%';
