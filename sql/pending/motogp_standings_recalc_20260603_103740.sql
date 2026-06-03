
-- ══════════════════════════════════════════════════════════════════
-- RECALCUL CLASSEMENT PILOTES MotoGP 2026
-- Basé sur les résultats réels en base (R1-R7)
-- ══════════════════════════════════════════════════════════════════

-- Supprimer l'ancien classement
DELETE FROM standings WHERE series_id = 'MotoGP' AND type = 'driver' AND season = 2026;

-- Recalculer depuis les résultats
INSERT INTO standings (series_id, season, type, position, name, nationality, points, wins)
WITH points_par_pilote AS (
  SELECT
    res.driver,
    SUM(res.points) as total_points,
    COUNT(*) FILTER (WHERE res.position = 1 AND r.type = 'sprint_weekend') as wins
  FROM results res
  JOIN races r ON r.id = res.race_id
  WHERE r.series_id = 'MotoGP'
    AND r.season IS NULL OR r.series_id = 'MotoGP'
  GROUP BY res.driver
),
ranked AS (
  SELECT
    driver,
    total_points,
    wins,
    ROW_NUMBER() OVER (ORDER BY total_points DESC, wins DESC) as position
  FROM points_par_pilote
  WHERE total_points > 0
)
SELECT
  'MotoGP', 2026, 'driver',
  position::int,
  driver,
  '--',
  total_points::int,
  wins::int
FROM ranked
ORDER BY position;

-- Vérification
SELECT position, name, points, wins
FROM standings
WHERE series_id = 'MotoGP' AND type = 'driver' AND season = 2026
ORDER BY position;
