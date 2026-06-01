
-- ═══════════════════════════════════════════════════════════════════════
-- RESET COMPLET circuit_key — source de vérité unique, prefixée par série
-- F1 → f1_xxx | MotoGP → motogp_xxx | WEC → wec_xxx | ELMS → elms_xxx
-- ═══════════════════════════════════════════════════════════════════════

-- ── F1 : tous les circuits par nom de course ─────────────────────────
UPDATE races SET circuit_key = CASE
  WHEN name ILIKE '%australie%'    OR name ILIKE '%australia%'      THEN 'f1_albertpark'
  WHEN name ILIKE '%bahreïn%'      OR name ILIKE '%bahrain%'        THEN 'f1_bahrain'
  WHEN name ILIKE '%chine%'        OR name ILIKE '%china%'          THEN 'f1_shanghai'
  WHEN name ILIKE '%japon%'        OR name ILIKE '%japan%'          THEN 'f1_suzuka'
  WHEN name ILIKE '%miami%'                                         THEN 'f1_miami'
  WHEN name ILIKE '%émilie%'       OR name ILIKE '%imola%'          THEN 'f1_imola'
  WHEN name ILIKE '%monaco%'                                        THEN 'f1_monaco'
  WHEN name ILIKE '%canada%'                                        THEN 'f1_montreal'
  WHEN name ILIKE '%espagne%'      OR name ILIKE '%spain%'
    OR name ILIKE '%barcelona%'    OR name ILIKE '%catalogne%'      THEN 'f1_barcelona'
  WHEN name ILIKE '%autriche%'     OR name ILIKE '%austria%'        THEN 'f1_redbullring'
  WHEN name ILIKE '%grande-bretagne%' OR name ILIKE '%great britain%'
    OR name ILIKE '%british%'      OR name ILIKE '%silverstone%'    THEN 'f1_silverstone'
  WHEN name ILIKE '%hongrie%'      OR name ILIKE '%hungary%'        THEN 'f1_hungaroring'
  WHEN name ILIKE '%belgique%'     OR name ILIKE '%belgium%'        THEN 'f1_spa'
  WHEN name ILIKE '%pays-bas%'     OR name ILIKE '%netherlands%'
    OR name ILIKE '%dutch%'        OR name ILIKE '%zandvoort%'      THEN 'f1_zandvoort'
  WHEN name ILIKE '%italie%'       OR name ILIKE '%italy%'
    OR name ILIKE '%monza%'                                         THEN 'f1_monza'
  WHEN name ILIKE '%azerbaïdjan%'  OR name ILIKE '%azerbaijan%'
    OR name ILIKE '%baku%'                                          THEN 'f1_baku'
  WHEN name ILIKE '%singapour%'    OR name ILIKE '%singapore%'      THEN 'f1_marinabay'
  WHEN name ILIKE '%états-unis%'   OR name ILIKE '%united states%'
    OR name ILIKE '%austin%'       OR name ILIKE '%cota%'           THEN 'f1_cota'
  WHEN name ILIKE '%mexique%'      OR name ILIKE '%mexico%'         THEN 'f1_mexicocity'
  WHEN name ILIKE '%brésil%'       OR name ILIKE '%brazil%'         THEN 'f1_interlagos'
  WHEN name ILIKE '%las vegas%'                                     THEN 'f1_lasvegas'
  WHEN name ILIKE '%qatar%'                                         THEN 'f1_losail'
  WHEN name ILIKE '%abu dhabi%'    OR name ILIKE '%abu%'            THEN 'f1_yasmarina'
  WHEN name ILIKE '%arabie%'       OR name ILIKE '%saudi%'
    OR name ILIKE '%jeddah%'                                        THEN 'f1_jeddah'
  WHEN name ILIKE '%madrid%'                                        THEN 'f1_madrid'
  ELSE circuit_key
END
WHERE series_id = 'F1';

-- ── MotoGP : par circuit (nom du tracé en base) ───────────────────────
UPDATE races SET circuit_key = CASE
  WHEN circuit ILIKE '%buriram%'   OR circuit ILIKE '%chang%'       THEN 'motogp_tha'
  WHEN circuit ILIKE '%goiania%'   OR circuit ILIKE '%goiânia%'
    OR circuit ILIKE '%ayrton%'    OR circuit ILIKE '%senna%'       THEN 'motogp_bra'
  WHEN circuit ILIKE '%americas%'  OR circuit ILIKE '%cota%'        THEN 'motogp_usa'
  WHEN circuit ILIKE '%jerez%'     OR circuit ILIKE '%ángel nieto%' THEN 'motogp_spa'
  WHEN circuit ILIKE '%bugatti%'   OR circuit ILIKE '%mans%'        THEN 'motogp_fra'
  WHEN circuit ILIKE '%catalunya%' OR circuit ILIKE '%montmeló%'    THEN 'motogp_cat'
  WHEN circuit ILIKE '%mugello%'                                    THEN 'motogp_ita'
  WHEN circuit ILIKE '%balaton%'                                    THEN 'motogp_hun'
  WHEN circuit ILIKE '%brno%'                                       THEN 'motogp_cze'
  WHEN circuit ILIKE '%assen%'                                      THEN 'motogp_nld'
  WHEN circuit ILIKE '%sachsenring%'                                THEN 'motogp_ger'
  WHEN circuit ILIKE '%silverstone%'                                THEN 'motogp_gbr'
  WHEN circuit ILIKE '%aragon%'    OR circuit ILIKE '%motorland%'   THEN 'motogp_ara'
  WHEN circuit ILIKE '%misano%'    OR circuit ILIKE '%simoncelli%'  THEN 'motogp_rsm'
  WHEN circuit ILIKE '%spielberg%' OR circuit ILIKE '%red bull ring%' THEN 'motogp_aut'
  WHEN circuit ILIKE '%motegi%'                                     THEN 'motogp_jpn'
  WHEN circuit ILIKE '%mandalika%' OR circuit ILIKE '%pertamina%'   THEN 'motogp_ina'
  WHEN circuit ILIKE '%phillip island%'                             THEN 'motogp_aus'
  WHEN circuit ILIKE '%sepang%'    OR circuit ILIKE '%petronas%'    THEN 'motogp_mal'
  WHEN circuit ILIKE '%lusail%'    OR circuit ILIKE '%losail%'      THEN 'motogp_qat'
  WHEN circuit ILIKE '%algarve%'   OR circuit ILIKE '%portimão%'
    OR circuit ILIKE '%portimao%'                                   THEN 'motogp_por'
  WHEN circuit ILIKE '%tormo%'     OR circuit ILIKE '%valencia%'    THEN 'motogp_val'
  ELSE circuit_key
END
WHERE series_id = 'MotoGP';

-- ── WEC : par nom de course (plus fiable que le circuit) ──────────────
UPDATE races SET circuit_key = CASE
  WHEN name ILIKE '%qatar%'  OR name ILIKE '%lusail%'               THEN 'wec_losail'
  WHEN name ILIKE '%imola%'                                         THEN 'wec_imola'
  WHEN name ILIKE '%spa%'                                           THEN 'wec_spa'
  WHEN name ILIKE '%mans%'   OR name ILIKE '%le mans%'              THEN 'wec_lemans'
  WHEN name ILIKE '%paulo%'  OR name ILIKE '%brazil%'
    OR name ILIKE '%brasil%' OR name ILIKE '%sao paulo%'            THEN 'wec_saopaulo'
  WHEN name ILIKE '%americas%' OR name ILIKE '%austin%'
    OR name ILIKE '%texas%'  OR name ILIKE '%cota%'                 THEN 'wec_cota'
  WHEN name ILIKE '%fuji%'   OR name ILIKE '%japan%'                THEN 'wec_fuji'
  WHEN name ILIKE '%bahrain%' OR name ILIKE '%bahreïn%'             THEN 'wec_bahrain'
  WHEN name ILIKE '%portimao%' OR name ILIKE '%portugal%'
    OR name ILIKE '%algarve%'                                       THEN 'wec_portimao'
  ELSE circuit_key
END
WHERE series_id = 'WEC';

-- Vérification finale
SELECT series_id, name, circuit_key FROM races
WHERE series_id IN ('F1','MotoGP','WEC')
ORDER BY series_id, date_start;
