
-- Insérer la série WRC (colonnes exactes : id, name, color, icon)
INSERT INTO series (id, name, color, icon)
SELECT 'WRC', 'FIA World Rally Championship', '#1A1A1A', '🚗'
WHERE NOT EXISTS (SELECT 1 FROM series WHERE id = 'WRC');

-- Calendrier WRC 2026 — 14 rounds
INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
SELECT 'WRC', v.name, v.circuit, v.country, v.ds::date, v.de::date, v.rnd, 'race',
  CASE WHEN v.ds::date < CURRENT_DATE THEN 'done' ELSE 'upcoming' END, v.ckey
FROM (VALUES
  (1,'Rallye Monte-Carlo','Monaco','Monaco','2026-01-22','2026-01-25','wrc_montecarlo'),
  (2,'Rally Sweden','Umea','Suede','2026-02-12','2026-02-15','wrc_sweden'),
  (3,'Safari Rally Kenya','Naivasha','Kenya','2026-03-12','2026-03-15','wrc_kenya'),
  (4,'Croatia Rally','Rijeka','Croatie','2026-04-09','2026-04-12','wrc_croatia'),
  (5,'Rally Islas Canarias','Las Palmas','Espagne','2026-04-23','2026-04-26','wrc_canarias'),
  (6,'Rally de Portugal','Matosinhos','Portugal','2026-05-07','2026-05-10','wrc_portugal'),
  (7,'Rally Japan','Toyota','Japon','2026-05-28','2026-05-31','wrc_japan'),
  (8,'EKO Acropolis Rally Greece','Lamia','Grece','2026-06-25','2026-06-28','wrc_greece'),
  (9,'Rally Estonia','Tartu','Estonie','2026-07-16','2026-07-19','wrc_estonia'),
  (10,'Rally Finland','Jyvaskyla','Finlande','2026-07-30','2026-08-02','wrc_finland'),
  (11,'Rally Paraguay','Asuncion','Paraguay','2026-08-27','2026-08-30','wrc_paraguay'),
  (12,'Rally Chile','Santiago','Chili','2026-09-10','2026-09-13','wrc_chile'),
  (13,'Rally Italy','Italie','Italie','2026-10-01','2026-10-04','wrc_italy'),
  (14,'Rally Saudi Arabia','Arabie Saoudite','Arabie Saoudite','2026-11-12','2026-11-15','wrc_saudi')
) AS v(rnd, name, circuit, country, ds, de, ckey)
WHERE NOT EXISTS (SELECT 1 FROM races WHERE series_id='WRC' AND round=v.rnd);

SELECT COUNT(*) as nb_rounds FROM races WHERE series_id='WRC';
