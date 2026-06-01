
CREATE TABLE IF NOT EXISTS circuits (
  key        TEXT PRIMARY KEY,
  series_id  TEXT NOT NULL,
  lap_length TEXT,
  turns      INT,
  laps       INT,
  lap_record TEXT,
  first_year TEXT
);
ALTER TABLE circuits ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public read circuits" ON circuits;
CREATE POLICY "Public read circuits" ON circuits FOR SELECT USING (true);

INSERT INTO circuits (key, series_id, lap_length, turns, laps, lap_record, first_year) VALUES
('f1_monaco','F1','3.337 km',19,78,'1:12.909 - Hamilton (2021)','F1: 1950'),
('f1_monza','F1','5.793 km',11,53,'1:19.119 - Leclerc (2019)','F1: 1950'),
('f1_spa','F1','7.004 km',19,44,'1:41.252 - Bottas (2018)','F1: 1950'),
('f1_suzuka','F1','5.807 km',18,53,'1:30.983 - Hamilton (2019)','F1: 1987'),
('f1_barcelona','F1','4.657 km',16,66,'1:16.330 - Verstappen (2023)','F1: 1991'),
('f1_zandvoort','F1','4.259 km',14,72,'1:11.097 - Verstappen (2021)','F1: 1952'),
('f1_imola','F1','4.909 km',19,63,'1:15.484 - Hamilton (2020)','F1: 1980'),
('f1_yasmarina','F1','5.281 km',16,58,'1:26.103 - Verstappen (2021)','F1: 2009'),
('f1_cota','F1','5.513 km',20,56,'1:36.169 - Hamilton (2012)','F1: 2012'),
('f1_baku','F1','6.003 km',20,51,'1:43.009 - Leclerc (2019)','F1: 2017'),
('f1_losail','F1','5.380 km',16,57,'1:24.319 - Hamilton (2021)','F1: 2021'),
('f1_marinabay','F1','4.940 km',19,62,'1:35.867 - Leclerc (2023)','F1: 2008'),
('f1_montreal','F1','4.361 km',14,70,'1:13.078 - Vettel (2019)','F1: 1978'),
('f1_jeddah','F1','6.174 km',27,50,'1:30.734 - Leclerc (2022)','F1: 2021'),
('f1_miami','F1','5.412 km',19,57,'1:29.708 - Verstappen (2023)','F1: 2022'),
('f1_lasvegas','F1','6.201 km',17,50,'1:35.490 - Leclerc (2023)','F1: 2023'),
('f1_shanghai','F1','5.451 km',16,56,'1:32.238 - Schumacher (2004)','F1: 2004'),
('f1_bahrain','F1','5.412 km',15,57,'1:31.447 - De la Rosa (2005)','F1: 2004'),
('f1_redbullring','F1','4.318 km',10,71,'1:05.619 - Hamilton (2020)','F1: 1970'),
('f1_silverstone','F1','5.891 km',18,52,'1:27.097 - Verstappen (2020)','F1: 1950'),
('f1_hungaroring','F1','4.381 km',14,70,'1:16.627 - Hamilton (2020)','F1: 1986'),
('f1_mexicocity','F1','4.304 km',17,71,'1:17.774 - Bottas (2021)','F1: 1963'),
('f1_interlagos','F1','4.309 km',15,71,'1:10.540 - Verstappen (2023)','F1: 1973'),
('f1_madrid','F1','5.416 km',22,57,'A etablir (2026)','F1: 2026'),
('motogp_tha','MotoGP','4.554 km',12,26,'1:28.526 - Bezzecchi/Aprilia (2026)','MotoGP: 2018'),
('motogp_bra','MotoGP','4.212 km',14,20,'1:17.408 - Bezzecchi/Aprilia (2026)','MotoGP: 2026'),
('motogp_usa','MotoGP','5.513 km',20,21,'2:00.864 - Di Giannantonio/Ducati (2026)','MotoGP: 2013'),
('motogp_spa','MotoGP','4.423 km',13,25,'1:35.610 - Quartararo/Yamaha (2025)','MotoGP: 1992'),
('motogp_fra','MotoGP','4.185 km',14,27,'1:29.288 - M.Marquez/Ducati (2026)','MotoGP: 2000'),
('motogp_cat','MotoGP','4.657 km',16,24,'1:37.536 - A.Marquez/Ducati (2025)','MotoGP: 1992'),
('motogp_ita','MotoGP','5.245 km',15,23,'1:44.169 - M.Marquez/Ducati (2025)','MotoGP: 1994'),
('motogp_hun','MotoGP','4.197 km',13,27,'1:36.518 - M.Marquez/Ducati (2025)','MotoGP: 2024'),
('motogp_cze','MotoGP','5.403 km',14,22,'1:52.303 - Bagnaia/Ducati (2025)','MotoGP: 1987'),
('motogp_nld','MotoGP','4.542 km',18,26,'1:30.540 - Bagnaia/Ducati (2024)','MotoGP: 1949'),
('motogp_ger','MotoGP','3.671 km',13,30,'1:19.071 - Di Giannantonio/Ducati (2025)','MotoGP: 1998'),
('motogp_gbr','MotoGP','5.900 km',18,20,'1:57.233 - Quartararo/Yamaha (2025)','MotoGP: 1987'),
('motogp_ara','MotoGP','5.344 km',17,23,'1:45.704 - M.Marquez/Ducati (2025)','MotoGP: 2010'),
('motogp_rsm','MotoGP','4.226 km',16,28,'1:30.031 - Bagnaia/Ducati (2024)','MotoGP: 1993'),
('motogp_aut','MotoGP','4.318 km',10,28,'1:27.748 - Martin/Ducati (2024)','MotoGP: 2016'),
('motogp_jpn','MotoGP','4.801 km',14,24,'1:42.911 - Bagnaia/Ducati (2025)','MotoGP: 1999'),
('motogp_ina','MotoGP','4.310 km',17,27,'1:28.832 - Bezzecchi/Aprilia (2025)','MotoGP: 2021'),
('motogp_aus','MotoGP','4.448 km',12,27,'1:26.465 - Quartararo/Yamaha (2025)','MotoGP: 1997'),
('motogp_mal','MotoGP','5.543 km',15,20,'1:56.337 - Bagnaia/Ducati (2024)','MotoGP: 1999'),
('motogp_qat','MotoGP','5.380 km',16,22,'1:50.499 - M.Marquez/Ducati (2025)','MotoGP: 2004'),
('motogp_por','MotoGP','4.653 km',15,25,'1:37.226 - M.Marquez/Honda (2023)','MotoGP: 2020'),
('motogp_val','MotoGP','4.005 km',14,28,'1:28.809 - Bezzecchi/Aprilia (2025)','MotoGP: 1999'),
('wec_losail','WEC','5.380 km',16,NULL,'3:26.359 - Kobayashi/Toyota (2024)','WEC: 2024'),
('wec_imola','WEC','4.909 km',19,NULL,'1:28.920 - Giovinazzi/Ferrari (2025)','WEC: 2024'),
('wec_spa','WEC','7.004 km',19,NULL,'2:01.649 - Kobayashi/Toyota (2024)','WEC: 2012'),
('wec_lemans','WEC','13.626 km',38,NULL,'3:14.791 - Kobayashi/Toyota (2017)','24H: 1923'),
('wec_saopaulo','WEC','4.309 km',15,NULL,'1:43.627 - Hartley/Toyota (2025)','WEC: 2025'),
('wec_cota','WEC','5.513 km',20,NULL,'1:50.932 - Bamber/Porsche (2025)','WEC: 2025'),
('wec_fuji','WEC','4.563 km',16,NULL,'1:26.048 - Kobayashi/Toyota (2019)','WEC: 2012'),
('wec_bahrain','WEC','5.412 km',15,NULL,'1:42.321 - Buemi/Toyota (2023)','WEC: 2012'),
('wec_portimao','WEC','4.653 km',15,NULL,'1:33.886 - Buemi/Toyota (2021)','WEC: 2021')
ON CONFLICT (key) DO UPDATE SET
  lap_length = EXCLUDED.lap_length,
  turns      = EXCLUDED.turns,
  laps       = EXCLUDED.laps,
  lap_record = EXCLUDED.lap_record,
  first_year = EXCLUDED.first_year;

UPDATE races AS s
SET date_start = r.date_start - interval '1 day'
FROM races AS r
WHERE s.series_id = 'F1'
  AND s.type = 'sprint'
  AND r.series_id = 'F1'
  AND r.type = 'race'
  AND r.round = s.round
  AND s.date_start >= r.date_start;

SELECT count(*) AS circuits_count FROM circuits;
