
-- ══════════════════════════════════════════════════════════════════
-- CORRECTION CALENDRIER MotoGP 2026 — correspond exactement au calendrier officiel
-- Supprimer les doublons "fin saison" + corriger rounds + ajouter manquants
-- ══════════════════════════════════════════════════════════════════

-- 1. Supprimer les lignes "fin saison" (doublons)
DELETE FROM races
WHERE series_id = 'MotoGP'
  AND (name ILIKE '%fin saison%' OR name ILIKE '%fin de saison%');

-- 2. Supprimer les sprints générés automatiquement (on va les recréer proprement)
DELETE FROM races
WHERE series_id = 'MotoGP'
  AND type = 'sprint'
  AND round >= 8;

-- 3. Corriger les rounds et noms pour correspondre exactement au calendrier officiel
-- D'après la capture : R1-R22 avec Japan=R16

-- Mettre à jour les rounds existants selon les noms corrects
UPDATE races SET round = 1  WHERE series_id = 'MotoGP' AND name ILIKE '%tha%ande%' AND type = 'sprint_weekend';
UPDATE races SET round = 2  WHERE series_id = 'MotoGP' AND name ILIKE '%brésil%'   AND type = 'sprint_weekend';
UPDATE races SET round = 3  WHERE series_id = 'MotoGP' AND name ILIKE '%amériques%' AND type = 'sprint_weekend';
UPDATE races SET round = 4  WHERE series_id = 'MotoGP' AND name ILIKE '%espagne%'   AND type = 'sprint_weekend';
UPDATE races SET round = 5  WHERE series_id = 'MotoGP' AND name ILIKE '%france%'    AND type = 'sprint_weekend';
UPDATE races SET round = 6  WHERE series_id = 'MotoGP' AND name ILIKE '%catalogne%' AND type = 'sprint_weekend';
UPDATE races SET round = 7  WHERE series_id = 'MotoGP' AND name ILIKE '%italie%'    AND type = 'sprint_weekend';
UPDATE races SET round = 8  WHERE series_id = 'MotoGP' AND name ILIKE '%hongrie%'   AND type = 'sprint_weekend';
UPDATE races SET round = 9  WHERE series_id = 'MotoGP' AND name ILIKE '%tchèque%'   AND type = 'sprint_weekend';
UPDATE races SET round = 10 WHERE series_id = 'MotoGP' AND name ILIKE '%pays-bas%'  AND type = 'sprint_weekend';
UPDATE races SET round = 11 WHERE series_id = 'MotoGP' AND name ILIKE '%allemagne%' AND type = 'sprint_weekend';
UPDATE races SET round = 12 WHERE series_id = 'MotoGP' AND name ILIKE '%grande-bretagne%' AND type = 'sprint_weekend';
UPDATE races SET round = 13 WHERE series_id = 'MotoGP' AND name ILIKE '%aragon%'    AND type = 'sprint_weekend';
UPDATE races SET round = 14 WHERE series_id = 'MotoGP' AND name ILIKE '%san marin%' AND type = 'sprint_weekend';
UPDATE races SET round = 15 WHERE series_id = 'MotoGP' AND name ILIKE '%autriche%'  AND type = 'sprint_weekend';
UPDATE races SET round = 16 WHERE series_id = 'MotoGP' AND name ILIKE '%japon%'     AND type = 'sprint_weekend';
UPDATE races SET round = 17 WHERE series_id = 'MotoGP' AND name ILIKE '%indonésie%' AND type = 'sprint_weekend';
UPDATE races SET round = 18 WHERE series_id = 'MotoGP' AND name ILIKE '%australie%' AND type = 'sprint_weekend';
UPDATE races SET round = 19 WHERE series_id = 'MotoGP' AND name ILIKE '%malaisie%'  AND type = 'sprint_weekend';
UPDATE races SET round = 20 WHERE series_id = 'MotoGP' AND (name ILIKE '%qatar%' OR name ILIKE '%losail%') AND type = 'sprint_weekend';
UPDATE races SET round = 21 WHERE series_id = 'MotoGP' AND (name ILIKE '%portugal%' OR name ILIKE '%portimao%') AND type = 'sprint_weekend';
UPDATE races SET round = 22 WHERE series_id = 'MotoGP' AND name ILIKE '%valence%'   AND type = 'sprint_weekend';

-- 4. Ajouter GP Japon s'il manque (Round 16, 02-04 Oct 2026)
INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
SELECT 'MotoGP', 'GP Japon', 'Motegi Circuit', 'Japon', '2026-10-02', '2026-10-04', 16, 'sprint_weekend', 'upcoming', 'motogp_jpn'
WHERE NOT EXISTS (
  SELECT 1 FROM races WHERE series_id = 'MotoGP' AND round = 16 AND type = 'sprint_weekend'
);

-- 5. Recréer les sprints pour tous les rounds avec les bons rounds
INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
SELECT 
  r.series_id,
  REPLACE(REPLACE(r.name, 'GP ', 'Sprint — '), 'Grand Prix', 'Sprint') as name,
  r.circuit, r.country, r.date_start, r.date_end, r.round,
  'sprint', r.status, r.circuit_key
FROM races r
WHERE r.series_id = 'MotoGP' AND r.type = 'sprint_weekend'
  AND NOT EXISTS (
    SELECT 1 FROM races s WHERE s.series_id = 'MotoGP' AND s.round = r.round AND s.type = 'sprint'
  );

-- Vérification finale
SELECT round, name, type, date_start, status
FROM races WHERE series_id = 'MotoGP' AND type = 'sprint_weekend'
ORDER BY round;
