
-- Forcer réinsertion sessions F1 GP Autriche R12
DELETE FROM sessions WHERE race_id IN (
  SELECT id FROM races WHERE series_id='F1' AND round=12
);
INSERT INTO sessions (race_id, type, datetime_utc, duration_min)
SELECT r.id, v.type, v.dt::timestamptz, v.dur
FROM races r,
(VALUES
  ('FP1',            '2026-06-26 11:30:00+00', 60),
  ('Sprint Qualifs', '2026-06-27 07:30:00+00', 30),
  ('Sprint',         '2026-06-27 11:00:00+00', 30),
  ('Qualifications', '2026-06-27 15:00:00+00', 60),
  ('Course',         '2026-06-28 13:00:00+00', 90)
) AS v(type, dt, dur)
WHERE r.series_id = 'F1' AND r.round = 12;

SELECT s.race_id, s.type, s.datetime_utc 
FROM sessions s
JOIN races r ON r.id = s.race_id
WHERE r.series_id = 'F1' AND r.round = 12;
