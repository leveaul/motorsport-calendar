
-- Insérer Sprint R4 Espagne (manquant après suppression du Qatar R4)
INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
SELECT r.series_id, 'Sprint - Espagne', r.circuit, r.country, r.date_start, r.date_end, 4, 'sprint', r.status, r.circuit_key
FROM races r WHERE r.series_id = 'MotoGP' AND r.round = 4 AND r.type = 'sprint_weekend'
AND NOT EXISTS (SELECT 1 FROM races WHERE series_id='MotoGP' AND round=4 AND type='sprint');

-- Insérer GP Qatar R20 sprint_weekend (le sprint existe mais pas le sprint_weekend)
INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
SELECT r.series_id, 'GP Qatar', r.circuit, r.country, r.date_start, r.date_end, 20, 'sprint_weekend', r.status, r.circuit_key
FROM races r WHERE r.series_id = 'MotoGP' AND r.round = 20 AND r.type = 'sprint'
AND NOT EXISTS (SELECT 1 FROM races WHERE series_id='MotoGP' AND round=20 AND type='sprint_weekend');

SELECT type, COUNT(*) as nb FROM races WHERE series_id='MotoGP' GROUP BY type ORDER BY type;
