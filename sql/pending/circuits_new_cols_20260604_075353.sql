
-- Ajouter les nouvelles colonnes
ALTER TABLE circuits ADD COLUMN IF NOT EXISTS prev_winner    TEXT;
ALTER TABLE circuits ADD COLUMN IF NOT EXISTS special_stages INT;
ALTER TABLE circuits ADD COLUMN IF NOT EXISTS total_distance TEXT;
ALTER TABLE circuits ADD COLUMN IF NOT EXISTS surface        TEXT;

-- ══════════════════════════════════════════════════════════════════
-- Stats WRC (special_stages, total_distance, surface, prev_winner)
-- Source: wrc.com / Wikipedia
-- ══════════════════════════════════════════════════════════════════
INSERT INTO circuits (key, series_id, first_year, special_stages, total_distance, surface, prev_winner)
VALUES
('wrc_montecarlo','WRC','WRC: 1973', 15, '294.5 km', 'Asphalte',  'O.Solberg/Toyota (2026)'),
('wrc_sweden',    'WRC','WRC: 1973', 14, '258.2 km', 'Neige',     'K.Rovanpera/Toyota (2025)'),
('wrc_kenya',     'WRC','WRC: 2021', 19, '384.7 km', 'Gravier',   'S.Ogier/Toyota (2025)'),
('wrc_croatia',   'WRC','WRC: 2021', 16, '307.4 km', 'Asphalte',  'E.Evans/Toyota (2025)'),
('wrc_canarias',  'WRC','WRC: 2025', 13, '241.8 km', 'Asphalte',  'A.Katsuta/Toyota (2025)'),
('wrc_portugal',  'WRC','WRC: 1973', 18, '356.2 km', 'Gravier',   'O.Solberg/Toyota (2025)'),
('wrc_japan',     'WRC','WRC: 2004', 17, '312.5 km', 'Asphalte',  'E.Evans/Toyota (2025)'),
('wrc_greece',    'WRC','WRC: 1973', 16, '298.3 km', 'Gravier',   'T.Neuville/Hyundai (2024)'),
('wrc_estonia',   'WRC','WRC: 2020', 20, '341.6 km', 'Gravier',   'K.Rovanpera/Toyota (2024)'),
('wrc_finland',   'WRC','WRC: 1973', 23, '428.9 km', 'Gravier',   'E.Evans/Toyota (2024)'),
('wrc_paraguay',  'WRC','WRC: 2026',  0, 'A definir','Gravier',   'Nouveau rally (2026)'),
('wrc_chile',     'WRC','WRC: 2019', 15, '271.4 km', 'Gravier',   'S.Ogier/Toyota (2019)'),
('wrc_italy',     'WRC','WRC: 2004', 14, '259.8 km', 'Gravier',   'T.Neuville/Hyundai (2024)'),
('wrc_saudi',     'WRC','WRC: 2026',  0, 'A definir','Gravier',   'Nouveau rally (2026)')
ON CONFLICT (key) DO UPDATE SET
  first_year     = EXCLUDED.first_year,
  special_stages = EXCLUDED.special_stages,
  total_distance = EXCLUDED.total_distance,
  surface        = EXCLUDED.surface,
  prev_winner    = EXCLUDED.prev_winner;

-- ══════════════════════════════════════════════════════════════════
-- Vainqueur précédent F1 2025 (dernier GP de chaque circuit)
-- ══════════════════════════════════════════════════════════════════
UPDATE circuits SET prev_winner = 'L.Hamilton/Ferrari (2025)'      WHERE key = 'f1_albertpark';
UPDATE circuits SET prev_winner = 'L.Hamilton/Ferrari (2025)'      WHERE key = 'f1_shanghai';
UPDATE circuits SET prev_winner = 'K.Antonelli/Mercedes (2025)'    WHERE key = 'f1_bahrain';
UPDATE circuits SET prev_winner = 'O.Piastri/McLaren (2025)'       WHERE key = 'f1_jeddah';
UPDATE circuits SET prev_winner = 'L.Norris/McLaren (2025)'        WHERE key = 'f1_miami';
UPDATE circuits SET prev_winner = 'M.Verstappen/Red Bull (2025)'   WHERE key = 'f1_imola';
UPDATE circuits SET prev_winner = 'C.Leclerc/Ferrari (2025)'       WHERE key = 'f1_monaco';
UPDATE circuits SET prev_winner = 'O.Piastri/McLaren (2025)'       WHERE key = 'f1_barcelona';
UPDATE circuits SET prev_winner = 'L.Norris/McLaren (2025)'        WHERE key = 'f1_montreal';
UPDATE circuits SET prev_winner = 'L.Norris/McLaren (2025)'        WHERE key = 'f1_redbullring';
UPDATE circuits SET prev_winner = 'L.Norris/McLaren (2025)'        WHERE key = 'f1_silverstone';
UPDATE circuits SET prev_winner = 'G.Russell/Mercedes (2025)'      WHERE key = 'f1_spa';
UPDATE circuits SET prev_winner = 'O.Piastri/McLaren (2025)'       WHERE key = 'f1_hungaroring';
UPDATE circuits SET prev_winner = 'M.Verstappen/Red Bull (2025)'   WHERE key = 'f1_zandvoort';
UPDATE circuits SET prev_winner = 'C.Leclerc/Ferrari (2025)'       WHERE key = 'f1_monza';
UPDATE circuits SET prev_winner = 'L.Norris/McLaren (2025)'        WHERE key = 'f1_baku';
UPDATE circuits SET prev_winner = 'L.Norris/McLaren (2025)'        WHERE key = 'f1_marinabay';
UPDATE circuits SET prev_winner = 'C.Leclerc/Ferrari (2025)'       WHERE key = 'f1_cota';
UPDATE circuits SET prev_winner = 'C.Leclerc/Ferrari (2025)'       WHERE key = 'f1_mexicocity';
UPDATE circuits SET prev_winner = 'M.Verstappen/Red Bull (2025)'   WHERE key = 'f1_interlagos';
UPDATE circuits SET prev_winner = 'C.Leclerc/Ferrari (2025)'       WHERE key = 'f1_lasvegas';
UPDATE circuits SET prev_winner = 'O.Piastri/McLaren (2025)'       WHERE key = 'f1_losail';
UPDATE circuits SET prev_winner = 'L.Norris/McLaren (2025)'        WHERE key = 'f1_yasmarina';
UPDATE circuits SET prev_winner = 'A etablir (2026)'               WHERE key = 'f1_madrid';

-- ══════════════════════════════════════════════════════════════════
-- Vainqueur précédent MotoGP 2025
-- ══════════════════════════════════════════════════════════════════
UPDATE circuits SET prev_winner = 'J.Martin/Aprilia (2025)'        WHERE key = 'motogp_tha';
UPDATE circuits SET prev_winner = 'M.Marquez/Ducati (2025)'        WHERE key = 'motogp_bra';
UPDATE circuits SET prev_winner = 'M.Marquez/Ducati (2025)'        WHERE key = 'motogp_usa';
UPDATE circuits SET prev_winner = 'M.Marquez/Ducati (2025)'        WHERE key = 'motogp_spa';
UPDATE circuits SET prev_winner = 'F.Bagnaia/Ducati (2025)'        WHERE key = 'motogp_fra';
UPDATE circuits SET prev_winner = 'F.Bagnaia/Ducati (2025)'        WHERE key = 'motogp_cat';
UPDATE circuits SET prev_winner = 'M.Marquez/Ducati (2025)'        WHERE key = 'motogp_ita';
UPDATE circuits SET prev_winner = 'M.Marquez/Ducati (2025)'        WHERE key = 'motogp_hun';
UPDATE circuits SET prev_winner = 'F.Bagnaia/Ducati (2025)'        WHERE key = 'motogp_cze';
UPDATE circuits SET prev_winner = 'F.Bagnaia/Ducati (2025)'        WHERE key = 'motogp_nld';
UPDATE circuits SET prev_winner = 'F.Di Giannantonio/Ducati (2025)'WHERE key = 'motogp_ger';
UPDATE circuits SET prev_winner = 'F.Quartararo/Yamaha (2025)'     WHERE key = 'motogp_gbr';
UPDATE circuits SET prev_winner = 'M.Marquez/Ducati (2025)'        WHERE key = 'motogp_ara';
UPDATE circuits SET prev_winner = 'F.Bagnaia/Ducati (2024)'        WHERE key = 'motogp_rsm';
UPDATE circuits SET prev_winner = 'J.Martin/Ducati (2024)'         WHERE key = 'motogp_aut';
UPDATE circuits SET prev_winner = 'F.Bagnaia/Ducati (2025)'        WHERE key = 'motogp_jpn';
UPDATE circuits SET prev_winner = 'M.Bezzecchi/Aprilia (2025)'     WHERE key = 'motogp_ina';
UPDATE circuits SET prev_winner = 'F.Quartararo/Yamaha (2025)'     WHERE key = 'motogp_aus';
UPDATE circuits SET prev_winner = 'F.Bagnaia/Ducati (2024)'        WHERE key = 'motogp_mal';
UPDATE circuits SET prev_winner = 'M.Marquez/Ducati (2025)'        WHERE key = 'motogp_qat';
UPDATE circuits SET prev_winner = 'M.Marquez/Honda (2023)'         WHERE key = 'motogp_por';
UPDATE circuits SET prev_winner = 'M.Bezzecchi/Aprilia (2025)'     WHERE key = 'motogp_val';

-- ══════════════════════════════════════════════════════════════════
-- Vainqueur précédent WEC / ELMS / GTWCE / IMSA
-- ══════════════════════════════════════════════════════════════════
UPDATE circuits SET prev_winner = 'Toyota GR010 #7 (2025)'         WHERE key = 'wec_losail';
UPDATE circuits SET prev_winner = 'Ferrari 499P #51 (2025)'        WHERE key = 'wec_imola';
UPDATE circuits SET prev_winner = 'Toyota GR010 #7 (2025)'         WHERE key = 'wec_spa';
UPDATE circuits SET prev_winner = 'Ferrari 499P #51 (2025)'        WHERE key = 'wec_lemans';
UPDATE circuits SET prev_winner = 'Toyota GR010 #8 (2025)'         WHERE key = 'wec_saopaulo';
UPDATE circuits SET prev_winner = 'Porsche 963 #5 (2025)'          WHERE key = 'wec_cota';
UPDATE circuits SET prev_winner = 'Toyota GR010 #7 (2024)'         WHERE key = 'wec_fuji';
UPDATE circuits SET prev_winner = 'Toyota GR010 #8 (2024)'         WHERE key = 'wec_bahrain';
UPDATE circuits SET prev_winner = 'Ferrari 499P #51 (2024)'        WHERE key = 'wec_portimao';
