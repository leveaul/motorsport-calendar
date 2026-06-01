
UPDATE races SET circuit_key = 'f1_montreal'
WHERE series_id = 'F1' AND (
    circuit ILIKE '%gilles%' OR circuit ILIKE '%montreal%' OR circuit ILIKE '%canada%'
    OR name ILIKE '%canada%'
);

UPDATE races SET circuit_key = 'f1_madrid'
WHERE series_id = 'F1' AND (
    circuit ILIKE '%madrid%' OR circuit ILIKE '%ifema%' OR circuit ILIKE '%madring%'
    OR name ILIKE '%madrid%'
);

SELECT name, circuit, circuit_key FROM races
WHERE series_id = 'F1' AND (name ILIKE '%canada%' OR name ILIKE '%madrid%')
ORDER BY date_start;
