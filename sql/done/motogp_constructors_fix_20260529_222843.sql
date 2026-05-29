
-- ═══════════════════════════════════════════════════════════════════════
-- CORRECTIF CLASSEMENT CONSTRUCTEURS MotoGP 2026
-- Règle : seul le meilleur résultat par constructeur/course compte
-- Source officielle après R7 Catalogne (17 mai 2026)
-- ═══════════════════════════════════════════════════════════════════════

-- Supprimer l'ancien classement constructeurs MotoGP
DELETE FROM standings
WHERE series_id = 'MotoGP' AND type = 'team' AND season = 2026;

-- Insérer le classement constructeurs correct
-- (points = meilleur pilote par constructeur, agrégé sur toutes les courses)
INSERT INTO standings (series_id, season, type, position, name, nationality, points, wins) VALUES
('MotoGP', 2026, 'team', 1, 'Aprilia',  'Italie',    216, 3),
('MotoGP', 2026, 'team', 2, 'Ducati',   'Italie',    189, 3),
('MotoGP', 2026, 'team', 3, 'KTM',      'Autriche',  115, 0),
('MotoGP', 2026, 'team', 4, 'Honda',    'Japon',      72, 0),
('MotoGP', 2026, 'team', 5, 'Yamaha',   'Japon',      48, 0);

-- Note sur le calcul :
-- Aprilia : meilleur entre Racing (Bezzecchi/Martin) et Trackhouse (Ogura/Fernandez) par course
-- Ducati  : meilleur entre Lenovo (M.Marquez/Bagnaia), VR46 (DiGia/Morbidelli), Gresini (A.Marquez/Aldeguer)
-- KTM     : meilleur entre Red Bull (Acosta/Binder) et Tech3 (Bastianini/Vinales)
-- Honda   : meilleur entre HRC (Mir/Marini) et LCR (Zarco/Moreira)
-- Yamaha  : meilleur entre Factory (Quartararo/Rins/Fernandez) et Pramac (Razgatlioglu/Miller)

SELECT position, name, points, wins FROM standings
WHERE series_id = 'MotoGP' AND type = 'team' AND season = 2026
ORDER BY position;
