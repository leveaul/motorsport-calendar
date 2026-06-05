
-- ══════════════════════════════════════════════════════════════════
-- Création table sessions
-- ══════════════════════════════════════════════════════════════════
CREATE TABLE IF NOT EXISTS sessions (
  id           SERIAL PRIMARY KEY,
  race_id      INT NOT NULL REFERENCES races(id) ON DELETE CASCADE,
  type         TEXT NOT NULL,
  datetime_utc TIMESTAMPTZ NOT NULL,
  duration_min INT
);

CREATE INDEX IF NOT EXISTS sessions_race_id_idx ON sessions(race_id);

-- ══════════════════════════════════════════════════════════════════
-- Sessions MotoGP R8 Hongrie (5-7 juin 2026)
-- Source: motogp.com schedule
-- Toutes les heures en UTC
-- ══════════════════════════════════════════════════════════════════
INSERT INTO sessions (race_id, type, datetime_utc, duration_min)
SELECT r.id, v.type, v.dt::timestamptz, v.dur
FROM races r,
(VALUES
  ('FP1',            '2026-06-05 08:00:00+00', 45),
  ('Practice',       '2026-06-05 12:15:00+00', 45),
  ('Sprint Qualifs', '2026-06-06 08:00:00+00', 30),
  ('Sprint',         '2026-06-06 12:00:00+00', 30),
  ('Qualifs',        '2026-06-07 08:00:00+00', 30),
  ('Course',         '2026-06-07 11:00:00+00', 60)
) AS v(type, dt, dur)
WHERE r.series_id = 'MotoGP' AND r.round = 8 AND r.type = 'sprint_weekend';
