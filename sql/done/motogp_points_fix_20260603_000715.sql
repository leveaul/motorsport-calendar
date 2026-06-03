
-- Correction barème MotoGP sprint (12-9-7-6-5-4-3-2-1)
UPDATE results SET points = CASE position
  WHEN 1 THEN 12 WHEN 2 THEN 9 WHEN 3 THEN 7
  WHEN 4 THEN 6  WHEN 5 THEN 5 WHEN 6 THEN 4
  WHEN 7 THEN 3  WHEN 8 THEN 2 WHEN 9 THEN 1
  ELSE 0
END
WHERE race_id IN (
  SELECT id FROM races WHERE series_id='MotoGP' AND type='sprint'
);

-- Correction barème MotoGP course (25-20-16-13-11-10-9-8-7-6-5-4-3-2-1)
UPDATE results SET points = CASE position
  WHEN 1  THEN 25 WHEN 2  THEN 20 WHEN 3  THEN 16
  WHEN 4  THEN 13 WHEN 5  THEN 11 WHEN 6  THEN 10
  WHEN 7  THEN 9  WHEN 8  THEN 8  WHEN 9  THEN 7
  WHEN 10 THEN 6  WHEN 11 THEN 5  WHEN 12 THEN 4
  WHEN 13 THEN 3  WHEN 14 THEN 2  WHEN 15 THEN 1
  ELSE 0
END
WHERE race_id IN (
  SELECT id FROM races WHERE series_id='MotoGP' AND type='sprint_weekend'
);

SELECT 'done' as status;
