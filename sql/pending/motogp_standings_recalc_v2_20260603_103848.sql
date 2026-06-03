
DELETE FROM standings WHERE series_id = 'MotoGP' AND type = 'driver' AND season = 2026;

INSERT INTO standings (series_id, season, type, position, name, nationality, points, wins)
SELECT
  'MotoGP', 2026, 'driver',
  ROW_NUMBER() OVER (ORDER BY SUM(res.points) DESC, COUNT(*) FILTER (WHERE res.position = 1 AND r.type = 'sprint_weekend') DESC)::int,
  res.driver,
  '--',
  SUM(res.points)::int,
  COUNT(*) FILTER (WHERE res.position = 1 AND r.type = 'sprint_weekend')::int
FROM results res
JOIN races r ON r.id = res.race_id
WHERE r.series_id = 'MotoGP'
GROUP BY res.driver
HAVING SUM(res.points) > 0
ORDER BY SUM(res.points) DESC;
