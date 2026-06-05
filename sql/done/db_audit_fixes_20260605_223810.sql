
-- ══════════════════════════════════════════════════════════════════
-- CORRECTIONS BASE DE DONNÉES — Audit complet 2026-06-05
-- ══════════════════════════════════════════════════════════════════

-- ── 1. MOTOGP : Sprints mal assignés R5, R6, R7 ──────────────────
-- R5 Sprint (id=85) : circuit_key=motogp_spa → devrait être motogp_fra
UPDATE races SET name='Sprint — France',     circuit_key='motogp_fra' WHERE id=85;
-- R6 Sprint (id=86) : circuit_key=motogp_fra → devrait être motogp_cat  
UPDATE races SET name='Sprint — Catalogne',  circuit_key='motogp_cat' WHERE id=86;
-- R7 Sprint (id=87) : circuit_key=motogp_cat → devrait être motogp_ita
UPDATE races SET name='Sprint — Italie',     circuit_key='motogp_ita' WHERE id=87;

-- ── 2. SESSIONS F1 : mal assignées sur GP Pays-Bas (id=12/79) ────
-- Les sessions (id=17-26) sont sur le GP Pays-Bas R12
-- alors que le GP Autriche est R8 (id=8)
-- Supprimer les sessions erronées
DELETE FROM sessions WHERE id IN (17,18,19,20,21,22,23,24,25,26);

-- Insérer les sessions sur le BON GP Autriche (R8, id=8, type=race)
-- F1 Autriche est un sprint weekend : FP1 + Sprint Qualifs + Sprint + Qualifs + Course
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(8, 'FP1',            '2026-06-26 11:30:00+00', 60),
(8, 'Sprint Qualifs', '2026-06-27 07:30:00+00', 30),
(8, 'Sprint',         '2026-06-27 11:00:00+00', 30),
(8, 'Qualifications', '2026-06-27 15:00:00+00', 60),
(8, 'Course',         '2026-06-28 13:00:00+00', 90);

-- ── 3. F1 R8 : corriger le type race → sprint_weekend ────────────
UPDATE races SET type='sprint_weekend' WHERE id=8;

-- ── 4. GTWCE R2 : doublon (id=71 et id=88 tous les deux R2) ──────
-- id=71 = 24H Spa (upcoming, 0 résultats) → round à corriger
-- id=88 = 3H Monza (done, 5 résultats) → round 2 correct
-- 24H Spa est en réalité R3 du calendrier GTWCE 2026
UPDATE races SET round=3 WHERE id=71;

-- ── 5. GTWCE : round 4 manquant (Brands Hatch, Zandvoort, Misano, Magny-Cours) ─
-- R4 Misano, R5 Nürburgring, R6 Brands Hatch (à vérifier avec calendrier officiel)
-- Pour l'instant on corrige juste le round de la 24H Spa

-- ── 6. Circuit f1_albertpark manquant en table circuits ──────────
INSERT INTO circuits (key, series_id, lap_length, turns, laps, lap_record, qual_record, first_year, prev_winner)
SELECT 'f1_albertpark', 'F1', '5.278 km', 16, 58, '1:19.813 - Leclerc/Ferrari (2024)', '1:15.946 - Verstappen/Red Bull (2023)', 'F1: 1996', 'L.Norris/McLaren (2025)'
WHERE NOT EXISTS (SELECT 1 FROM circuits WHERE key='f1_albertpark');

-- ── 7. F1 R8 Autriche : corriger le nom (était "GP Autriche" type=race) ─
UPDATE races SET name='GP Autriche', type='sprint_weekend' WHERE id=8 AND series_id='F1';

-- Vérification
SELECT id, series_id, round, name, type, circuit_key FROM races WHERE id IN (8,85,86,87,71) ORDER BY series_id, round;
SELECT id, race_id, type, datetime_utc FROM sessions WHERE race_id=8;
