
-- Comparer les rounds sprint_weekend vs sprint
SELECT 
    sw.round,
    sw.name as gp_name,
    sw.date_start,
    s.id as sprint_id,
    s.name as sprint_name
FROM races sw
LEFT JOIN races s ON s.series_id = 'MotoGP' AND s.round = sw.round AND s.type = 'sprint'
WHERE sw.series_id = 'MotoGP' AND sw.type = 'sprint_weekend'
ORDER BY sw.round;
