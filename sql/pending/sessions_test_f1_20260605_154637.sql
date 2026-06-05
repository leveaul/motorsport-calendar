
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
WHERE r.series_id = 'F1' AND r.round = 12
  AND NOT EXISTS (SELECT 1 FROM sessions s WHERE s.race_id = r.id);
