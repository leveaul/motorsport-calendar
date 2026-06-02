
-- Insérer TOUS les sprints manquants (idempotent)
INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
SELECT 
    sw.series_id,
    REPLACE(sw.name, 'GP ', 'Sprint - ') as name,
    sw.circuit, sw.country, sw.date_start, sw.date_end, sw.round,
    'sprint', sw.status, sw.circuit_key
FROM races sw
WHERE sw.series_id = 'MotoGP' 
  AND sw.type = 'sprint_weekend'
  AND NOT EXISTS (
    SELECT 1 FROM races s 
    WHERE s.series_id = 'MotoGP' 
      AND s.round = sw.round 
      AND s.type = 'sprint'
  )
ORDER BY sw.round;

SELECT type, COUNT(*) as nb FROM races WHERE series_id = 'MotoGP' GROUP BY type ORDER BY type;
