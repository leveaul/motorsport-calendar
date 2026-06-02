
-- Fix MotoGP calendar definitif
-- Supprimer doublons
DELETE FROM races WHERE id IN (26, 84, 36, 124);

-- Ajouter Aragon R13
INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
SELECT 'MotoGP','GP Aragon','MotorLand Aragon','Espagne','2026-08-28','2026-08-30',13,'sprint_weekend','upcoming','motogp_ara'
WHERE NOT EXISTS (SELECT 1 FROM races WHERE series_id='MotoGP' AND round=13 AND type='sprint_weekend');

INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
SELECT 'MotoGP','Sprint - Aragon','MotorLand Aragon','Espagne','2026-08-28','2026-08-30',13,'sprint','upcoming','motogp_ara'
WHERE NOT EXISTS (SELECT 1 FROM races WHERE series_id='MotoGP' AND round=13 AND type='sprint');

-- Ajouter Portugal R21
INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
SELECT 'MotoGP','GP Portugal','Algarve International Circuit','Portugal','2026-11-20','2026-11-22',21,'sprint_weekend','upcoming','motogp_por'
WHERE NOT EXISTS (SELECT 1 FROM races WHERE series_id='MotoGP' AND round=21 AND type='sprint_weekend');

INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
SELECT 'MotoGP','Sprint - Portugal','Algarve International Circuit','Portugal','2026-11-20','2026-11-22',21,'sprint','upcoming','motogp_por'
WHERE NOT EXISTS (SELECT 1 FROM races WHERE series_id='MotoGP' AND round=21 AND type='sprint');
