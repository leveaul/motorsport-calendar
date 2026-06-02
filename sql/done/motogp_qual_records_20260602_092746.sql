
-- Mise à jour records MotoGP
-- qual_record = all-time lap record (course + qualif, source motorsporttickets.com 01/06/2026)
-- lap_record  = meilleur tour EN COURSE uniquement (source Wikipedia par GP)

-- All-time records (peuvent être en qualif ou en course)
UPDATE circuits SET qual_record = '1:28.526 - Bezzecchi/Aprilia (2026)' WHERE key = 'motogp_tha';
UPDATE circuits SET qual_record = '1:17.408 - Bezzecchi/Aprilia (2026)' WHERE key = 'motogp_bra';
UPDATE circuits SET qual_record = '2:00.864 - Di Giannantonio/Ducati (2026)' WHERE key = 'motogp_usa';
UPDATE circuits SET qual_record = '1:35.610 - Quartararo/Yamaha (2025)' WHERE key = 'motogp_spa';
UPDATE circuits SET qual_record = '1:29.288 - M.Marquez/Ducati (2026)' WHERE key = 'motogp_fra';
UPDATE circuits SET qual_record = '1:37.536 - A.Marquez/Ducati (2025)' WHERE key = 'motogp_cat';
UPDATE circuits SET qual_record = '1:43.921 - Bezzecchi/Aprilia (2026)' WHERE key = 'motogp_ita';
UPDATE circuits SET qual_record = '1:36.518 - M.Marquez/Ducati (2025)' WHERE key = 'motogp_hun';
UPDATE circuits SET qual_record = '1:52.303 - Bagnaia/Ducati (2025)' WHERE key = 'motogp_cze';
UPDATE circuits SET qual_record = '1:30.540 - Bagnaia/Ducati (2024)' WHERE key = 'motogp_nld';
UPDATE circuits SET qual_record = '1:19.071 - Di Giannantonio/Ducati (2025)' WHERE key = 'motogp_ger';
UPDATE circuits SET qual_record = '1:57.233 - Quartararo/Yamaha (2025)' WHERE key = 'motogp_gbr';
UPDATE circuits SET qual_record = '1:45.704 - M.Marquez/Ducati (2025)' WHERE key = 'motogp_ara';
UPDATE circuits SET qual_record = '1:30.031 - Bagnaia/Ducati (2024)' WHERE key = 'motogp_rsm';
UPDATE circuits SET qual_record = '1:27.748 - Martin/Ducati (2024)' WHERE key = 'motogp_aut';
UPDATE circuits SET qual_record = '1:42.911 - Bagnaia/Ducati (2025)' WHERE key = 'motogp_jpn';
UPDATE circuits SET qual_record = '1:28.832 - Bezzecchi/Aprilia (2025)' WHERE key = 'motogp_ina';
UPDATE circuits SET qual_record = '1:26.465 - Quartararo/Yamaha (2025)' WHERE key = 'motogp_aus';
UPDATE circuits SET qual_record = '1:56.337 - Bagnaia/Ducati (2024)' WHERE key = 'motogp_mal';
UPDATE circuits SET qual_record = '1:50.499 - M.Marquez/Ducati (2025)' WHERE key = 'motogp_qat';
UPDATE circuits SET qual_record = '1:37.226 - M.Marquez/Honda (2023)' WHERE key = 'motogp_por';
UPDATE circuits SET qual_record = '1:28.809 - Bezzecchi/Aprilia (2025)' WHERE key = 'motogp_val';

-- Corriger aussi le lap_record Mugello (course) avec le nouveau record 2026
UPDATE circuits SET lap_record = '1:43.921 - Bezzecchi/Aprilia (2026)' WHERE key = 'motogp_ita';

-- Corriger USA : le lap_record course 2026 = 2:00.864 DiGia (déjà bon)
-- Vérif
SELECT key, lap_record, qual_record FROM circuits WHERE series_id = 'MotoGP' ORDER BY key;
