
SELECT id, name, circuit, series_id, circuit_key 
FROM races 
WHERE series_id = 'WEC' 
ORDER BY date_start;
