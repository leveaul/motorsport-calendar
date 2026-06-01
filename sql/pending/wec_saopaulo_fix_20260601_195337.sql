
UPDATE races SET circuit_key = 'wec_saopaulo'
WHERE series_id = 'WEC' AND (
    name ILIKE '%paulo%' OR name ILIKE '%brazil%' OR name ILIKE '%brasil%'
    OR circuit ILIKE '%paulo%' OR circuit ILIKE '%interlagos%' OR circuit ILIKE '%pace%'
    OR circuit ILIKE '%goiania%' OR circuit ILIKE '%goiânia%'
);
SELECT name, circuit, circuit_key FROM races WHERE series_id = 'WEC' ORDER BY date_start;
