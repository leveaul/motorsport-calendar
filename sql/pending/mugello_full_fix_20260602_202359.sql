
-- ═══════════════════════════════════════════════════════
-- DIAGNOSTIC COMPLET MUGELLO + CORRECTION
-- ═══════════════════════════════════════════════════════

-- 1. Voir l'état exact
SELECT r.id, r.name, r.type, r.status, r.date_start, r.round,
       COUNT(res.id) as nb_results
FROM races r
LEFT JOIN results res ON res.race_id = r.id
WHERE r.series_id = 'MotoGP' AND r.circuit ILIKE '%mugello%'
GROUP BY r.id, r.name, r.type, r.status, r.date_start, r.round
ORDER BY r.date_start, r.type;

-- 2. Forcer status=done pour toutes les courses MotoGP passées
UPDATE races SET status = 'done'
WHERE series_id = 'MotoGP'
  AND date_start < CURRENT_DATE
  AND status != 'done';

-- 3. Vérifier/corriger les dates sprint Mugello
-- Sprint doit être date_start de la course principale - 1 jour
UPDATE races AS sprint
SET date_start = (
    SELECT race.date_start - INTERVAL '1 day'
    FROM races race
    WHERE race.series_id = 'MotoGP'
      AND race.circuit ILIKE '%mugello%'
      AND race.type = 'race'
    LIMIT 1
)
WHERE sprint.series_id = 'MotoGP'
  AND sprint.circuit ILIKE '%mugello%'
  AND sprint.type = 'sprint';

-- 4. Vérifier les résultats sprint
SELECT r.name, r.type, r.date_start, r.status,
       res.position, res.driver
FROM races r
JOIN results res ON res.race_id = r.id
WHERE r.series_id = 'MotoGP' AND r.circuit ILIKE '%mugello%'
ORDER BY r.type, res.position
LIMIT 20;
