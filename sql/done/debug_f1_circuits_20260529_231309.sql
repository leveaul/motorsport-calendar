
SELECT name, circuit, circuit_key, date_start
FROM races
WHERE series_id = 'F1'
AND (name ILIKE '%canada%' OR name ILIKE '%madrid%' 
     OR circuit ILIKE '%canada%' OR circuit ILIKE '%madrid%'
     OR circuit ILIKE '%ifema%' OR circuit ILIKE '%villeneuve%'
     OR circuit ILIKE '%montreal%')
ORDER BY date_start;
