
-- Mettre à jour circuit_key pour toutes les courses WEC
-- en se basant sur le nom de la course (plus fiable que le circuit)
UPDATE races SET circuit_key = 'wec_losail'
WHERE series_id = 'WEC' AND (
    name ILIKE '%qatar%' OR name ILIKE '%losail%' OR name ILIKE '%lusail%'
    OR circuit ILIKE '%losail%' OR circuit ILIKE '%lusail%' OR circuit ILIKE '%qatar%'
);

UPDATE races SET circuit_key = 'wec_imola'
WHERE series_id = 'WEC' AND (
    name ILIKE '%imola%' OR circuit ILIKE '%imola%' OR circuit ILIKE '%dino%' OR circuit ILIKE '%enzo%'
);

UPDATE races SET circuit_key = 'wec_spa'
WHERE series_id = 'WEC' AND (
    name ILIKE '%spa%' OR circuit ILIKE '%spa%' OR circuit ILIKE '%francorchamps%'
);

UPDATE races SET circuit_key = 'wec_lemans'
WHERE series_id = 'WEC' AND (
    name ILIKE '%le mans%' OR name ILIKE '%mans%' OR circuit ILIKE '%sarthe%' OR circuit ILIKE '%mans%'
);

UPDATE races SET circuit_key = 'wec_saopaulo'
WHERE series_id = 'WEC' AND (
    name ILIKE '%paulo%' OR name ILIKE '%brazil%' OR name ILIKE '%brasil%'
    OR circuit ILIKE '%paulo%' OR circuit ILIKE '%interlagos%'
    OR circuit ILIKE '%goiania%' OR circuit ILIKE '%goiânia%'
    OR circuit ILIKE '%senna%' OR circuit ILIKE '%pace%'
);

UPDATE races SET circuit_key = 'wec_cota'
WHERE series_id = 'WEC' AND (
    name ILIKE '%americas%' OR name ILIKE '%texas%' OR name ILIKE '%austin%'
    OR circuit ILIKE '%americas%' OR circuit ILIKE '%cota%' OR circuit ILIKE '%austin%'
);

UPDATE races SET circuit_key = 'wec_fuji'
WHERE series_id = 'WEC' AND (
    name ILIKE '%fuji%' OR name ILIKE '%japan%' OR name ILIKE '%japon%'
    OR circuit ILIKE '%fuji%'
);

UPDATE races SET circuit_key = 'wec_bahrain'
WHERE series_id = 'WEC' AND (
    name ILIKE '%bahrain%' OR name ILIKE '%bahrein%'
    OR circuit ILIKE '%bahrain%' OR circuit ILIKE '%sakhir%'
);

UPDATE races SET circuit_key = 'wec_portimao'
WHERE series_id = 'WEC' AND (
    name ILIKE '%portimao%' OR name ILIKE '%portugal%' OR name ILIKE '%algarve%'
    OR circuit ILIKE '%portimao%' OR circuit ILIKE '%algarve%'
);

-- Vérification
SELECT name, circuit, circuit_key FROM races WHERE series_id = 'WEC' ORDER BY date_start;
