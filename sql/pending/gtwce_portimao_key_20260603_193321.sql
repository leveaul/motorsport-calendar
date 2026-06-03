
UPDATE races SET circuit_key = 'gtwce_portimao'
WHERE series_id = 'GTWCE' 
  AND (name ILIKE '%portimao%' OR name ILIKE '%portim%' OR name ILIKE '%algarve%'
       OR circuit ILIKE '%portimao%' OR circuit ILIKE '%algarve%');
