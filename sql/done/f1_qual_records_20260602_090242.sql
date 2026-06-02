
-- Ajouter colonne qual_record dans circuits
ALTER TABLE circuits ADD COLUMN IF NOT EXISTS qual_record TEXT;

-- Records en qualifications F1 (source motorsporttickets.com + Wikipedia, mai 2026)
UPDATE circuits SET qual_record = '1:15.096 - Norris/McLaren (2025 Q)'       WHERE key = 'f1_albertpark';
UPDATE circuits SET qual_record = '1:30.027 - Verstappen/Red Bull (2024 Q)'  WHERE key = 'f1_shanghai';
UPDATE circuits SET qual_record = '1:26.983 - Verstappen/Red Bull (2023 Q)'  WHERE key = 'f1_suzuka';
UPDATE circuits SET qual_record = '1:29.177 - Verstappen/Red Bull (2024 Q)'  WHERE key = 'f1_bahrain';
UPDATE circuits SET qual_record = '1:27.472 - Verstappen/Red Bull (2023 Q)'  WHERE key = 'f1_jeddah';
UPDATE circuits SET qual_record = '1:26.814 - Norris/McLaren (2025 Q)'       WHERE key = 'f1_miami';
UPDATE circuits SET qual_record = '1:10.635 - Verstappen/Red Bull (2024 Q)'  WHERE key = 'f1_montreal';
UPDATE circuits SET qual_record = '1:09.954 - Norris/McLaren (2025 Q)'       WHERE key = 'f1_monaco';
UPDATE circuits SET qual_record = '1:11.383 - Norris/McLaren (2025 Q)'       WHERE key = 'f1_barcelona';
UPDATE circuits SET qual_record = '1:02.939 - Verstappen/Red Bull (2023 Q)'  WHERE key = 'f1_redbullring';
UPDATE circuits SET qual_record = '1:24.219 - Norris/McLaren (2025 Q)'       WHERE key = 'f1_silverstone';
UPDATE circuits SET qual_record = '1:39.659 - Verstappen/Red Bull (2023 Q)'  WHERE key = 'f1_spa';
UPDATE circuits SET qual_record = '1:14.407 - Verstappen/Red Bull (2023 Q)'  WHERE key = 'f1_hungaroring';
UPDATE circuits SET qual_record = '1:08.558 - Verstappen/Red Bull (2023 Q)'  WHERE key = 'f1_zandvoort';
UPDATE circuits SET qual_record = '1:18.792 - Verstappen/Red Bull (2025 Q)'  WHERE key = 'f1_monza';
UPDATE circuits SET qual_record = '1:40.203 - Leclerc/Ferrari (2023 Q)'      WHERE key = 'f1_baku';
UPDATE circuits SET qual_record = '1:30.984 - Sainz/Ferrari (2023 Q)'        WHERE key = 'f1_marinabay';
UPDATE circuits SET qual_record = '1:34.009 - Sainz/Ferrari (2023 Q)'        WHERE key = 'f1_cota';
UPDATE circuits SET qual_record = '1:15.784 - Verstappen/Red Bull (2023 Q)'  WHERE key = 'f1_mexicocity';
UPDATE circuits SET qual_record = '1:07.827 - Verstappen/Red Bull (2023 Q)'  WHERE key = 'f1_interlagos';
UPDATE circuits SET qual_record = '1:31.291 - Leclerc/Ferrari (2023 Q)'      WHERE key = 'f1_lasvegas';
UPDATE circuits SET qual_record = '1:20.294 - Norris/McLaren (2024 Q)'       WHERE key = 'f1_losail';
UPDATE circuits SET qual_record = '1:23.251 - Norris/McLaren (2024 Q)'       WHERE key = 'f1_yasmarina';
UPDATE circuits SET qual_record = '1:13.609 - Verstappen/Red Bull (2023 Q)'  WHERE key = 'f1_imola';
UPDATE circuits SET qual_record = 'A etablir (2026 Q)'                        WHERE key = 'f1_madrid';

SELECT key, lap_record, qual_record FROM circuits WHERE series_id = 'F1' ORDER BY key;
