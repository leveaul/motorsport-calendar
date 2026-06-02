
SELECT 
  r.id,
  r.name,
  r.type,
  r.status,
  r.round,
  r.date_start,
  r.circuit_key,
  COUNT(res.id) as nb_results
FROM races r
LEFT JOIN results res ON res.race_id = r.id
WHERE r.series_id = 'MotoGP' 
  AND r.date_start >= '2026-05-28'
  AND r.date_start <= '2026-06-03'
GROUP BY r.id, r.name, r.type, r.status, r.round, r.date_start, r.circuit_key
ORDER BY r.date_start, r.type;
