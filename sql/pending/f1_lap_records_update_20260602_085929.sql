
-- Mise à jour des lap records F1 (records en course officiels)
-- Source: motorsporttickets.com/blog/lap-records-in-formula-1 — 26 mai 2026
-- Convention F1 : record officiel = meilleur tour EN COURSE

UPDATE circuits SET lap_record = '1:19.813 - Leclerc/Ferrari (2024)'        WHERE key = 'f1_albertpark';
UPDATE circuits SET lap_record = '1:32.238 - Schumacher/Ferrari (2004)'     WHERE key = 'f1_shanghai';
UPDATE circuits SET lap_record = '1:30.965 - Antonelli/Mercedes (2025)'     WHERE key = 'f1_suzuka';
UPDATE circuits SET lap_record = '1:31.447 - De la Rosa/McLaren (2005)'     WHERE key = 'f1_bahrain';
UPDATE circuits SET lap_record = '1:30.734 - Hamilton/Mercedes (2021)'      WHERE key = 'f1_jeddah';
UPDATE circuits SET lap_record = '1:29.708 - Verstappen/Red Bull (2023)'    WHERE key = 'f1_miami';
UPDATE circuits SET lap_record = '1:13.078 - Bottas/Mercedes (2019)'        WHERE key = 'f1_montreal';
UPDATE circuits SET lap_record = '1:12.909 - Hamilton/Mercedes (2021)'      WHERE key = 'f1_monaco';
UPDATE circuits SET lap_record = '1:16.330 - Piastri/McLaren (2025)'        WHERE key = 'f1_barcelona';
UPDATE circuits SET lap_record = '1:05.619 - Sainz/McLaren (2020)'          WHERE key = 'f1_redbullring';
UPDATE circuits SET lap_record = '1:27.097 - Verstappen/Red Bull (2020)'    WHERE key = 'f1_silverstone';
UPDATE circuits SET lap_record = '1:44.701 - Perez/Red Bull (2024)'         WHERE key = 'f1_spa';
UPDATE circuits SET lap_record = '1:16.627 - Hamilton/Mercedes (2020)'      WHERE key = 'f1_hungaroring';
UPDATE circuits SET lap_record = '1:11.097 - Hamilton/Mercedes (2021)'      WHERE key = 'f1_zandvoort';
UPDATE circuits SET lap_record = '1:20.901 - Norris/McLaren (2025)'         WHERE key = 'f1_monza';
UPDATE circuits SET lap_record = '1:43.009 - Leclerc/Ferrari (2019)'        WHERE key = 'f1_baku';
UPDATE circuits SET lap_record = '1:33.808 - Hamilton/Ferrari (2025)'       WHERE key = 'f1_marinabay';
UPDATE circuits SET lap_record = '1:36.169 - Leclerc/Ferrari (2019)'        WHERE key = 'f1_cota';
UPDATE circuits SET lap_record = '1:17.774 - Bottas/Mercedes (2021)'        WHERE key = 'f1_mexicocity';
UPDATE circuits SET lap_record = '1:10.540 - Bottas/Mercedes (2018)'        WHERE key = 'f1_interlagos';
UPDATE circuits SET lap_record = '1:33.365 - Verstappen/Red Bull (2025)'    WHERE key = 'f1_lasvegas';
UPDATE circuits SET lap_record = '1:22.384 - Norris/McLaren (2024)'         WHERE key = 'f1_losail';
UPDATE circuits SET lap_record = '1:25.637 - Magnussen/Haas (2024)'         WHERE key = 'f1_yasmarina';
UPDATE circuits SET lap_record = '1:15.484 - Hamilton/Mercedes (2020)'      WHERE key = 'f1_imola';
UPDATE circuits SET lap_record = 'A etablir (2026)'                          WHERE key = 'f1_madrid';

-- Vérification
SELECT key, lap_record FROM circuits WHERE series_id = 'F1' ORDER BY key;
