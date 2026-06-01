
-- Vérifier F1 Brésil
SELECT name, circuit, circuit_key FROM races 
WHERE series_id = 'F1' AND (name ILIKE '%brésil%' OR name ILIKE '%bresil%' OR name ILIKE '%brazil%' OR circuit ILIKE '%interlagos%' OR circuit ILIKE '%paulo%')
ORDER BY date_start;
