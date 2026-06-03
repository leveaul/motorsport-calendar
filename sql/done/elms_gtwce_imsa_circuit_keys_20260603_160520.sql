
-- circuit_key pour les courses ELMS
UPDATE races SET circuit_key = 'elms_barcelona'   WHERE series_id='ELMS' AND (name ILIKE '%barcelona%' OR name ILIKE '%catalun%' OR circuit ILIKE '%barcelona%');
UPDATE races SET circuit_key = 'elms_imola'        WHERE series_id='ELMS' AND (name ILIKE '%imola%' OR circuit ILIKE '%imola%');
UPDATE races SET circuit_key = 'elms_lecastellet'  WHERE series_id='ELMS' AND (name ILIKE '%castellet%' OR name ILIKE '%ricard%' OR circuit ILIKE '%ricard%');
UPDATE races SET circuit_key = 'elms_portimao'     WHERE series_id='ELMS' AND (name ILIKE '%portimao%' OR name ILIKE '%portim%' OR circuit ILIKE '%portim%');
UPDATE races SET circuit_key = 'elms_silverstone'  WHERE series_id='ELMS' AND (name ILIKE '%silverstone%' OR circuit ILIKE '%silverstone%');
UPDATE races SET circuit_key = 'elms_spa'          WHERE series_id='ELMS' AND (name ILIKE '%spa%' OR circuit ILIKE '%spa%');

-- circuit_key pour les courses GTWCE
UPDATE races SET circuit_key = 'gtwce_barcelona'   WHERE series_id='GTWCE' AND (name ILIKE '%barcelona%' OR circuit ILIKE '%barcelona%');
UPDATE races SET circuit_key = 'gtwce_brandshatch' WHERE series_id='GTWCE' AND (name ILIKE '%brands%' OR circuit ILIKE '%brands%');
UPDATE races SET circuit_key = 'gtwce_lecastellet' WHERE series_id='GTWCE' AND (name ILIKE '%castellet%' OR name ILIKE '%ricard%' OR circuit ILIKE '%ricard%');
UPDATE races SET circuit_key = 'gtwce_magnycours'  WHERE series_id='GTWCE' AND (name ILIKE '%magny%' OR circuit ILIKE '%magny%');
UPDATE races SET circuit_key = 'gtwce_misano'      WHERE series_id='GTWCE' AND (name ILIKE '%misano%' OR circuit ILIKE '%misano%');
UPDATE races SET circuit_key = 'gtwce_monza'       WHERE series_id='GTWCE' AND (name ILIKE '%monza%' OR circuit ILIKE '%monza%');
UPDATE races SET circuit_key = 'gtwce_nurburgring' WHERE series_id='GTWCE' AND (name ILIKE '%nürburg%' OR name ILIKE '%nurburgring%' OR circuit ILIKE '%nürburg%');
UPDATE races SET circuit_key = 'gtwce_spa'         WHERE series_id='GTWCE' AND (name ILIKE '%spa%' OR circuit ILIKE '%spa%');
UPDATE races SET circuit_key = 'gtwce_zandvoort'   WHERE series_id='GTWCE' AND (name ILIKE '%zandvoort%' OR circuit ILIKE '%zandvoort%');

-- circuit_key pour les courses IMSA
UPDATE races SET circuit_key = 'imsa_daytona'      WHERE series_id='IMSA' AND (name ILIKE '%daytona%' OR circuit ILIKE '%daytona%');
UPDATE races SET circuit_key = 'imsa_sebring'      WHERE series_id='IMSA' AND (name ILIKE '%sebring%' OR circuit ILIKE '%sebring%');
UPDATE races SET circuit_key = 'imsa_longbeach'    WHERE series_id='IMSA' AND (name ILIKE '%long beach%' OR circuit ILIKE '%long beach%');
UPDATE races SET circuit_key = 'imsa_lagunaseca'   WHERE series_id='IMSA' AND (name ILIKE '%laguna%' OR circuit ILIKE '%laguna%');
UPDATE races SET circuit_key = 'imsa_roadatlanta'  WHERE series_id='IMSA' AND (name ILIKE '%atlanta%' OR name ILIKE '%petit%' OR circuit ILIKE '%atlanta%');
UPDATE races SET circuit_key = 'imsa_roadamerica'  WHERE series_id='IMSA' AND (name ILIKE '%road america%' OR circuit ILIKE '%road america%');
UPDATE races SET circuit_key = 'imsa_detroit'      WHERE series_id='IMSA' AND (name ILIKE '%detroit%' OR circuit ILIKE '%detroit%');
UPDATE races SET circuit_key = 'imsa_mosport'      WHERE series_id='IMSA' AND (name ILIKE '%mosport%' OR name ILIKE '%canadian%' OR circuit ILIKE '%mosport%');
UPDATE races SET circuit_key = 'imsa_indianapolis' WHERE series_id='IMSA' AND (name ILIKE '%indianapolis%' OR name ILIKE '%indy%' OR circuit ILIKE '%indianapolis%');
UPDATE races SET circuit_key = 'imsa_vir'          WHERE series_id='IMSA' AND (name ILIKE '%virginia%' OR name ILIKE '%vir%' OR circuit ILIKE '%virginia%');
UPDATE races SET circuit_key = 'imsa_watkinsglen'  WHERE series_id='IMSA' AND (name ILIKE '%watkins%' OR circuit ILIKE '%watkins%');

SELECT series_id, name, circuit_key FROM races WHERE series_id IN ('ELMS','GTWCE','IMSA') ORDER BY series_id, name;
