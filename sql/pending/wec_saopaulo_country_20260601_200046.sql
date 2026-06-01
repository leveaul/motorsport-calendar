
-- Forcer circuit_key wec_saopaulo pour toutes les courses WEC au Brésil
-- peu importe le nom exact du circuit
UPDATE races SET circuit_key = 'wec_saopaulo'
WHERE series_id = 'WEC' 
AND (
    name ILIKE '%paulo%' OR name ILIKE '%brazil%' OR name ILIKE '%brasil%'
    OR name ILIKE '%interlagos%' OR name ILIKE '%goiania%'
    OR circuit ILIKE '%paulo%' OR circuit ILIKE '%interlagos%' 
    OR circuit ILIKE '%goiania%' OR circuit ILIKE '%pace%'
    OR circuit ILIKE '%senna%' OR circuit ILIKE '%josé%'
    OR country ILIKE '%brazil%' OR country ILIKE '%brésil%' OR country ILIKE '%brasil%'
);

-- Vérification
SELECT name, circuit, circuit_key, country FROM races 
WHERE series_id = 'WEC' ORDER BY date_start;
