
-- ══════════════════════════════════════════════════════════════════
-- RESET COMPLET CALENDRIER MotoGP 2026
-- Source: capture officielle fournie par l'utilisateur
-- ══════════════════════════════════════════════════════════════════

-- 1. Sauvegarder les résultats existants avant de toucher aux races
-- (les résultats sont liés par race_id, on va les réassocier après)

-- 2. Supprimer toutes les courses MotoGP (sprint + sprint_weekend) sauf celles avec résultats
-- On garde les rounds 1-7 qui ont des résultats
DELETE FROM races
WHERE series_id = 'MotoGP'
  AND type = 'sprint'
  AND NOT EXISTS (SELECT 1 FROM results r WHERE r.race_id = races.id);

DELETE FROM races  
WHERE series_id = 'MotoGP'
  AND type = 'sprint_weekend'
  AND round > 22;

-- 3. Corriger dates et circuit_key pour tous les rounds (source: capture officielle)
UPDATE races SET
  name = v.name, circuit = v.circuit, country = v.country,
  date_start = v.ds::date, date_end = v.de::date, circuit_key = v.ckey
FROM (VALUES
  (1,  'GP Thaïlande',          'Chang International Circuit',          'Thaïlande',   '2026-02-27','2026-03-01','motogp_tha'),
  (2,  'GP Brésil',             'Autódromo Internacional Ayrton Senna', 'Brésil',      '2026-03-20','2026-03-22','motogp_bra'),
  (3,  'GP Amériques',          'Circuit of the Americas',              'États-Unis',  '2026-03-27','2026-03-29','motogp_usa'),
  (4,  'GP Espagne',            'Circuito de Jerez',                    'Espagne',     '2026-04-24','2026-04-26','motogp_spa'),
  (5,  'GP France',             'Circuit Bugatti, Le Mans',             'France',      '2026-05-08','2026-05-10','motogp_fra'),
  (6,  'GP Catalogne',          'Circuit de Barcelona-Catalunya',       'Espagne',     '2026-05-15','2026-05-17','motogp_cat'),
  (7,  'GP Italie',             'Autodromo del Mugello',                'Italie',      '2026-05-29','2026-05-31','motogp_ita'),
  (8,  'GP Hongrie',            'Balaton Park Circuit',                 'Hongrie',     '2026-06-05','2026-06-07','motogp_hun'),
  (9,  'GP République Tchèque', 'Automotodrom Brno',                    'Rep. Tcheque','2026-06-19','2026-06-21','motogp_cze'),
  (10, 'GP Pays-Bas',           'TT Circuit Assen',                     'Pays-Bas',    '2026-06-26','2026-06-28','motogp_nld'),
  (11, 'GP Allemagne',          'Sachsenring',                          'Allemagne',   '2026-07-10','2026-07-12','motogp_ger'),
  (12, 'GP Grande-Bretagne',    'Silverstone Circuit',                  'Angleterre',  '2026-08-07','2026-08-09','motogp_gbr'),
  (13, 'GP Aragon',             'MotorLand Aragon',                     'Espagne',     '2026-08-28','2026-08-30','motogp_ara'),
  (14, 'GP San Marin',          'Misano World Circuit',                 'Italie',      '2026-09-11','2026-09-13','motogp_rsm'),
  (15, 'GP Autriche',           'Red Bull Ring',                        'Autriche',    '2026-09-18','2026-09-20','motogp_aut'),
  (16, 'GP Japon',              'Motegi Circuit',                       'Japon',       '2026-10-02','2026-10-04','motogp_jpn'),
  (17, 'GP Indonesie',          'Mandalika Circuit',                    'Indonesie',   '2026-10-09','2026-10-11','motogp_ina'),
  (18, 'GP Australie',          'Phillip Island Grand Prix Circuit',    'Australie',   '2026-10-23','2026-10-25','motogp_aus'),
  (19, 'GP Malaisie',           'Sepang International Circuit',         'Malaisie',    '2026-10-30','2026-11-01','motogp_mal'),
  (20, 'GP Qatar',              'Lusail International Circuit',         'Qatar',       '2026-11-06','2026-11-08','motogp_qat'),
  (21, 'GP Portugal',           'Algarve International Circuit',        'Portugal',    '2026-11-20','2026-11-22','motogp_por'),
  (22, 'GP Valence',            'Circuit Ricardo Tormo',                'Espagne',     '2026-11-27','2026-11-29','motogp_val')
) AS v(round, name, circuit, country, ds, de, ckey)
WHERE races.series_id = 'MotoGP'
  AND races.type = 'sprint_weekend'
  AND races.round = v.round;

-- 4. Ajouter Japon si manquant
INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
SELECT 'MotoGP','GP Japon','Motegi Circuit','Japon','2026-10-02','2026-10-04',16,'sprint_weekend','upcoming','motogp_jpn'
WHERE NOT EXISTS (SELECT 1 FROM races WHERE series_id='MotoGP' AND round=16 AND type='sprint_weekend');

-- 5. Mettre à jour le status (done si date passée)
UPDATE races SET status = 'done'
WHERE series_id = 'MotoGP' AND type = 'sprint_weekend' AND date_end < CURRENT_DATE;

UPDATE races SET status = 'upcoming'
WHERE series_id = 'MotoGP' AND type = 'sprint_weekend' AND date_end >= CURRENT_DATE;

-- 6. Recréer les sprints manquants avec les bons rounds et bonnes dates
INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
SELECT r.series_id,
  REPLACE(r.name, 'GP ', 'Sprint - ') as name,
  r.circuit, r.country, r.date_start, r.date_end, r.round,
  'sprint', r.status, r.circuit_key
FROM races r
WHERE r.series_id = 'MotoGP' AND r.type = 'sprint_weekend'
  AND NOT EXISTS (SELECT 1 FROM races s WHERE s.series_id='MotoGP' AND s.round=r.round AND s.type='sprint');

-- Vérification
SELECT round, name, type, date_start, status, circuit_key
FROM races WHERE series_id='MotoGP' AND type='sprint_weekend'
ORDER BY round;
