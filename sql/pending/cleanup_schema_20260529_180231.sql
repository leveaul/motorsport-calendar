
-- ═══════════════════════════════════════════════════════
-- MÉNAGE SUPABASE — ajout colonnes + prefixes
-- ═══════════════════════════════════════════════════════

-- 1. Ajouter colonne category dans results
--    (pour GTP, GTD, GTD Pro, LMP2, LMP3, LMGT3, Hypercar...)
ALTER TABLE results ADD COLUMN IF NOT EXISTS category TEXT;

-- 2. Ajouter colonne circuit_key dans races
--    (clé directe vers le tracé : f1_monaco, wec_spa, motogp_ita...)
ALTER TABLE races ADD COLUMN IF NOT EXISTS circuit_key TEXT;

-- 3. Remplir circuit_key pour les courses F1 existantes
UPDATE races SET circuit_key = CASE
  WHEN circuit ILIKE '%monaco%'           THEN 'f1_monaco'
  WHEN circuit ILIKE '%monza%'            THEN 'f1_monza'
  WHEN circuit ILIKE '%silverstone%'      THEN 'f1_silverstone'
  WHEN circuit ILIKE '%spa%'              THEN 'f1_spa'
  WHEN circuit ILIKE '%suzuka%'           THEN 'f1_suzuka'
  WHEN circuit ILIKE '%albert park%'      THEN 'f1_albertpark'
  WHEN circuit ILIKE '%red bull ring%' OR circuit ILIKE '%spielberg%' THEN 'f1_redbullring'
  WHEN circuit ILIKE '%barcelona%' OR circuit ILIKE '%catalunya%' THEN 'f1_barcelona'
  WHEN circuit ILIKE '%zandvoort%'        THEN 'f1_zandvoort'
  WHEN circuit ILIKE '%hungaroring%'      THEN 'f1_hungaroring'
  WHEN circuit ILIKE '%imola%'            THEN 'f1_imola'
  WHEN circuit ILIKE '%yas marina%'       THEN 'f1_yasmarina'
  WHEN circuit ILIKE '%americas%' OR circuit ILIKE '%austin%' THEN 'f1_cota'
  WHEN circuit ILIKE '%baku%'             THEN 'f1_baku'
  WHEN circuit ILIKE '%lusail%' OR circuit ILIKE '%losail%' THEN 'f1_losail'
  WHEN circuit ILIKE '%marina bay%' OR circuit ILIKE '%singapore%' THEN 'f1_marinabay'
  WHEN circuit ILIKE '%gilles villeneuve%' OR circuit ILIKE '%montreal%' THEN 'f1_montreal'
  WHEN circuit ILIKE '%interlagos%' OR circuit ILIKE '%paulo%' THEN 'f1_interlagos'
  WHEN circuit ILIKE '%jeddah%'           THEN 'f1_jeddah'
  WHEN circuit ILIKE '%miami%'            THEN 'f1_miami'
  WHEN circuit ILIKE '%las vegas%'        THEN 'f1_lasvegas'
  WHEN circuit ILIKE '%shanghai%'         THEN 'f1_shanghai'
  WHEN circuit ILIKE '%bahrain%'          THEN 'f1_bahrain'
  WHEN circuit ILIKE '%mexico%'           THEN 'f1_mexicocity'
  ELSE NULL
END
WHERE series_id = 'F1';

-- 4. Remplir circuit_key pour MotoGP
UPDATE races SET circuit_key = CASE
  WHEN circuit ILIKE '%buriram%' OR circuit ILIKE '%chang%'    THEN 'motogp_tha'
  WHEN circuit ILIKE '%goiania%' OR circuit ILIKE '%senna%'    THEN 'motogp_bra'
  WHEN circuit ILIKE '%americas%' OR circuit ILIKE '%austin%'  THEN 'motogp_usa'
  WHEN circuit ILIKE '%jerez%'                                  THEN 'motogp_spa'
  WHEN circuit ILIKE '%bugatti%' OR circuit ILIKE '%le mans%'  THEN 'motogp_fra'
  WHEN circuit ILIKE '%catalunya%' OR circuit ILIKE '%barcelona%' THEN 'motogp_cat'
  WHEN circuit ILIKE '%mugello%'                                THEN 'motogp_ita'
  WHEN circuit ILIKE '%balaton%'                                THEN 'motogp_hun'
  WHEN circuit ILIKE '%brno%'                                   THEN 'motogp_cze'
  WHEN circuit ILIKE '%assen%'                                  THEN 'motogp_nld'
  WHEN circuit ILIKE '%sachsenring%'                            THEN 'motogp_ger'
  WHEN circuit ILIKE '%silverstone%'                            THEN 'motogp_gbr'
  WHEN circuit ILIKE '%aragon%'                                 THEN 'motogp_ara'
  WHEN circuit ILIKE '%misano%'                                 THEN 'motogp_rsm'
  WHEN circuit ILIKE '%red bull ring%' OR circuit ILIKE '%spielberg%' THEN 'motogp_aut'
  WHEN circuit ILIKE '%motegi%'                                 THEN 'motogp_jpn'
  WHEN circuit ILIKE '%mandalika%'                              THEN 'motogp_ina'
  WHEN circuit ILIKE '%phillip island%'                         THEN 'motogp_aus'
  WHEN circuit ILIKE '%sepang%'                                 THEN 'motogp_mal'
  WHEN circuit ILIKE '%lusail%' OR circuit ILIKE '%losail%'    THEN 'motogp_qat'
  WHEN circuit ILIKE '%algarve%' OR circuit ILIKE '%portimao%' THEN 'motogp_por'
  WHEN circuit ILIKE '%valencia%' OR circuit ILIKE '%tormo%'   THEN 'motogp_val'
  ELSE NULL
END
WHERE series_id = 'MotoGP';

-- 5. Remplir circuit_key pour WEC
UPDATE races SET circuit_key = CASE
  WHEN circuit ILIKE '%lusail%' OR circuit ILIKE '%losail%'    THEN 'wec_losail'
  WHEN circuit ILIKE '%imola%'                                  THEN 'wec_imola'
  WHEN circuit ILIKE '%spa%'                                    THEN 'wec_spa'
  WHEN circuit ILIKE '%sarthe%' OR circuit ILIKE '%le mans%'   THEN 'wec_lemans'
  WHEN circuit ILIKE '%paulo%' OR circuit ILIKE '%interlagos%' THEN 'wec_saopaulo'
  WHEN circuit ILIKE '%americas%'                               THEN 'wec_cota'
  WHEN circuit ILIKE '%fuji%'                                   THEN 'wec_fuji'
  WHEN circuit ILIKE '%bahrain%'                                THEN 'wec_bahrain'
  WHEN circuit ILIKE '%portimao%' OR circuit ILIKE '%algarve%' THEN 'wec_portimao'
  ELSE NULL
END
WHERE series_id = 'WEC';

-- 6. Préfixer category pour les résultats existants WEC/IMSA
--    (on met un placeholder pour l'instant, à affiner manuellement)
UPDATE results SET category = 'Hypercar'
WHERE race_id IN (SELECT id FROM races WHERE series_id = 'WEC')
  AND position <= 5 AND category IS NULL;

UPDATE results SET category = 'GTP'
WHERE race_id IN (SELECT id FROM races WHERE series_id = 'IMSA')
  AND position <= 4 AND category IS NULL;

-- Vérification
SELECT series_id, circuit_key, COUNT(*) as n
FROM races
WHERE circuit_key IS NOT NULL
GROUP BY series_id, circuit_key
ORDER BY series_id, circuit_key;
