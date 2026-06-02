
-- Vérifier les courses MotoGP Mugello et leurs résultats
SELECT r.id, r.name, r.type, r.status, r.date_start,
       COUNT(res.id) as nb_resultats
FROM races r
LEFT JOIN results res ON res.race_id = r.id
WHERE r.series_id = 'MotoGP' AND r.circuit ILIKE '%mugello%'
GROUP BY r.id, r.name, r.type, r.status, r.date_start
ORDER BY r.date_start;
