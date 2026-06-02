
-- Vérifier status exact et résultats pour Mugello
SELECT r.id, r.name, r.type, r.status, r.round,
       COUNT(res.id) as nb_results
FROM races r
LEFT JOIN results res ON res.race_id = r.id
WHERE r.series_id = 'MotoGP' AND r.circuit ILIKE '%mugello%'
GROUP BY r.id, r.name, r.type, r.status, r.round
ORDER BY r.type;

-- Vérifier aussi si le status est bien 'done'
-- Si status = 'upcoming' le useEffect ne charge pas les résultats !
UPDATE races SET status = 'done'
WHERE series_id = 'MotoGP' 
  AND circuit ILIKE '%mugello%'
  AND date_start <= CURRENT_DATE;
