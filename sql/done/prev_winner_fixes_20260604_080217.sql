
-- Corrections vainqueurs précédents MotoGP 2025
UPDATE circuits SET prev_winner = 'M.Marquez/Ducati (2025)'     WHERE key = 'motogp_aut';
UPDATE circuits SET prev_winner = 'M.Marquez/Ducati (2025)'     WHERE key = 'motogp_rsm';
UPDATE circuits SET prev_winner = 'M.Bezzecchi/Aprilia (2025)'  WHERE key = 'motogp_por';

-- Corrections vainqueurs précédents F1 2025
-- Source: formula1.com calendar 2025
UPDATE circuits SET prev_winner = 'L.Norris/McLaren (2025)'     WHERE key = 'f1_albertpark';
UPDATE circuits SET prev_winner = 'O.Piastri/McLaren (2025)'    WHERE key = 'f1_shanghai';
UPDATE circuits SET prev_winner = 'M.Verstappen/Red Bull (2025)'WHERE key = 'f1_suzuka';
UPDATE circuits SET prev_winner = 'O.Piastri/McLaren (2025)'    WHERE key = 'f1_bahrain';
UPDATE circuits SET prev_winner = 'M.Verstappen/Red Bull (2025)'WHERE key = 'f1_lasvegas';
