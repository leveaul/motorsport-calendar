
-- Remettre le bon circuit_key pour le GP F1 Brésil (écrasé par erreur)
UPDATE races SET circuit_key = 'f1_interlagos'
WHERE series_id = 'F1' AND (
    circuit ILIKE '%interlagos%' OR circuit ILIKE '%paulo%'
    OR name ILIKE '%brésil%' OR name ILIKE '%brazil%'
);

-- Vérif
SELECT name, circuit, circuit_key, series_id FROM races 
WHERE circuit ILIKE '%interlagos%' OR circuit ILIKE '%paulo%'
   OR (name ILIKE '%brazil%' AND series_id IN ('F1','WEC'))
ORDER BY series_id, date_start;
