
-- Insérer les courses sprint MotoGP manquantes (rounds 8-22)
-- Chaque sprint a la même date que la course principale (même weekend)
-- et le même circuit_key que la course principale

INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
SELECT 
  r.series_id,
  REPLACE(r.name, 'GP ', 'Sprint — ') as name,
  r.circuit,
  r.country,
  r.date_start,
  r.date_end,
  r.round,
  'sprint' as type,
  r.status,
  r.circuit_key
FROM races r
WHERE r.series_id = 'MotoGP'
  AND r.type = 'sprint_weekend'
  AND r.round >= 8
  AND NOT EXISTS (
    SELECT 1 FROM races s 
    WHERE s.series_id = 'MotoGP' 
      AND s.round = r.round 
      AND s.type = 'sprint'
  )
ORDER BY r.round;

-- Vérification
SELECT round, name, type, date_start, status
FROM races 
WHERE series_id = 'MotoGP' AND type = 'sprint'
ORDER BY round;
