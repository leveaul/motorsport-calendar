
-- ══════════════════════════════════════════════════════════════════
-- CORRECTIONS PRÉCISES basées sur le dump CSV
-- ══════════════════════════════════════════════════════════════════

-- 1. Supprimer l'ancienne entrée Qatar round=4 (id 26 sprint_weekend + id 84 sprint)
DELETE FROM races WHERE id = 26;  -- GP Qatar 2026-04-12 sprint_weekend round=4
DELETE FROM races WHERE id = 84;  -- Sprint — Qatar 2026-04-12 sprint round=4

-- 2. Supprimer les doublons San Marin (garder les plus récents : 38 et 129)
DELETE FROM races WHERE id = 36;  -- doublon sprint_weekend San Marin
DELETE FROM races WHERE id = 124; -- doublon sprint San Marin

-- 3. Ajouter GP Aragon (round 13) manquant
INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
VALUES ('MotoGP', 'GP Aragon', 'MotorLand Aragon', 'Espagne', '2026-08-28', '2026-08-30', 13, 'sprint_weekend', 'upcoming', 'motogp_ara');

INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
VALUES ('MotoGP', 'Sprint - Aragon', 'MotorLand Aragon', 'Espagne', '2026-08-28', '2026-08-30', 13, 'sprint', 'upcoming', 'motogp_ara');

-- 4. Ajouter GP Portugal (round 21) manquant
INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
VALUES ('MotoGP', 'GP Portugal', 'Algarve International Circuit', 'Portugal', '2026-11-20', '2026-11-22', 21, 'sprint_weekend', 'upcoming', 'motogp_por');

INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
VALUES ('MotoGP', 'Sprint - Portugal', 'Algarve International Circuit', 'Portugal', '2026-11-20', '2026-11-22', 21, 'sprint', 'upcoming', 'motogp_por');

-- 5. Corriger le sprint round=4 Espagne qui a une mauvaise date (2026-04-26 au lieu de 2026-04-24)
UPDATE races SET date_start = '2026-04-24', date_end = '2026-04-26', name = 'Sprint - Espagne'
WHERE id = 85;

-- Vérification finale
SELECT round, name, type, date_start, status
FROM races WHERE series_id = 'MotoGP'
ORDER BY round, type;
