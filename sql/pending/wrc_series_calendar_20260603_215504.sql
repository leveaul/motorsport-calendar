
-- ══════════════════════════════════════════════════════════════════
-- WRC 2026 — Création série + calendrier complet 14 rounds
-- Source: wrc.com / toyotagazooracing.com
-- ══════════════════════════════════════════════════════════════════

-- Série WRC
INSERT INTO series (id, name, full_name, season)
SELECT 'WRC', 'WRC', 'FIA World Rally Championship', 2026
WHERE NOT EXISTS (SELECT 1 FROM series WHERE id = 'WRC');

-- Calendrier 2026 (14 rounds)
INSERT INTO races (series_id, name, circuit, country, date_start, date_end, round, type, status, circuit_key)
VALUES
('WRC','Rallye Monte-Carlo','Monaco / Alpes françaises','Monaco','2026-01-22','2026-01-25',1,'race','done','wrc_montecarlo'),
('WRC','Rally Sweden','Umeå','Suède','2026-02-12','2026-02-15',2,'race','done','wrc_sweden'),
('WRC','Safari Rally Kenya','Naivasha','Kenya','2026-03-12','2026-03-15',3,'race','done','wrc_kenya'),
('WRC','Croatia Rally','Rijeka','Croatie','2026-04-09','2026-04-12',4,'race','done','wrc_croatia'),
('WRC','Rally Islas Canarias','Las Palmas','Espagne','2026-04-23','2026-04-26',5,'race','done','wrc_canarias'),
('WRC','Rally de Portugal','Matosinhos','Portugal','2026-05-07','2026-05-10',6,'race','done','wrc_portugal'),
('WRC','Rally Japan','Toyota','Japon','2026-05-28','2026-05-31',7,'race','done','wrc_japan'),
('WRC','EKO Acropolis Rally Greece','Grèce','Grèce','2026-06-25','2026-06-28',8,'race','upcoming','wrc_greece'),
('WRC','Rally Estonia','Tartu','Estonie','2026-07-16','2026-07-19',9,'race','upcoming','wrc_estonia'),
('WRC','Rally Finland','Jyväskylä','Finlande','2026-07-30','2026-08-02',10,'race','upcoming','wrc_finland'),
('WRC','Rally Paraguay','Paraguay','Paraguay','2026-08-27','2026-08-30',11,'race','upcoming','wrc_paraguay'),
('WRC','Rally Chile','Santiago','Chili','2026-09-10','2026-09-13',12,'race','upcoming','wrc_chile'),
('WRC','Rally Italy','Italie','Italie','2026-10-01','2026-10-04',13,'race','upcoming','wrc_italy'),
('WRC','Rally Saudi Arabia','Arabie Saoudite','Arabie Saoudite','2026-11-12','2026-11-15',14,'race','upcoming','wrc_saudi')
ON CONFLICT DO NOTHING;

SELECT round, name, country, date_start, status FROM races WHERE series_id='WRC' ORDER BY round;
