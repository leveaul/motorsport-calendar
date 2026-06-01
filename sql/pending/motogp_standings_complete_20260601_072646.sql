
-- Classement COMPLET MotoGP pilotes après R8 Mugello (31 mai 2026)
-- Source: autohebdof1.com (classement officiel complet)
-- En MotoGP TOUS les pilotes classifiés marquent des points (pas uniquement top 15)
DELETE FROM standings WHERE series_id = 'MotoGP' AND type = 'driver' AND season = 2026;

INSERT INTO standings (series_id, season, type, position, name, nationality, points, wins) VALUES
('MotoGP', 2026, 'driver',  1, 'Marco Bezzecchi',       'Italie',         173, 4),
('MotoGP', 2026, 'driver',  2, 'Jorge Martín',           'Espagne',        156, 2),
('MotoGP', 2026, 'driver',  3, 'Fabio Di Giannantonio', 'Italie',         134, 1),
('MotoGP', 2026, 'driver',  4, 'Pedro Acosta',           'Espagne',        103, 0),
('MotoGP', 2026, 'driver',  5, 'Ai Ogura',               'Japon',           92, 0),
('MotoGP', 2026, 'driver',  6, 'Raúl Fernández',         'Espagne',         87, 1),
('MotoGP', 2026, 'driver',  7, 'Francesco Bagnaia',      'Italie',          82, 0),
('MotoGP', 2026, 'driver',  8, 'Marc Márquez',           'Espagne',         71, 0),
('MotoGP', 2026, 'driver',  9, 'Álex Márquez',           'Espagne',         67, 1),
('MotoGP', 2026, 'driver', 10, 'Fermín Aldeguer',        'Espagne',         59, 0),
('MotoGP', 2026, 'driver', 11, 'Luca Marini',            'Italie',          46, 0),
('MotoGP', 2026, 'driver', 12, 'Brad Binder',            'Afrique du Sud',  42, 0),
('MotoGP', 2026, 'driver', 13, 'Enea Bastianini',        'Italie',          39, 0),
('MotoGP', 2026, 'driver', 14, 'Franco Morbidelli',      'Italie',          38, 0),
('MotoGP', 2026, 'driver', 15, 'Fabio Quartararo',       'France',          37, 0),
('MotoGP', 2026, 'driver', 16, 'Johann Zarco',           'France',          34, 0),
('MotoGP', 2026, 'driver', 17, 'Diogo Moreira',          'Brésil',          23, 0),
('MotoGP', 2026, 'driver', 18, 'Joan Mir',               'Espagne',         15, 0),
('MotoGP', 2026, 'driver', 19, 'Álex Rins',              'Espagne',          9, 0),
('MotoGP', 2026, 'driver', 20, 'Maverick Viñales',       'Espagne',          5, 0),
('MotoGP', 2026, 'driver', 21, 'Augusto Fernández',      'Espagne',          4, 0),
('MotoGP', 2026, 'driver', 22, 'Toprak Razgatlioglu',   'Turquie',          4, 0),
('MotoGP', 2026, 'driver', 23, 'Jack Miller',            'Australie',        3, 0);

-- Constructeurs MotoGP après R8 (meilleur résultat par constructeur / course)
DELETE FROM standings WHERE series_id = 'MotoGP' AND type = 'team' AND season = 2026;
INSERT INTO standings (series_id, season, type, position, name, nationality, points, wins) VALUES
('MotoGP', 2026, 'team', 1, 'Aprilia',  'Italie',    261, 5),
('MotoGP', 2026, 'team', 2, 'Ducati',   'Italie',    219, 3),
('MotoGP', 2026, 'team', 3, 'KTM',      'Autriche',  103, 0),
('MotoGP', 2026, 'team', 4, 'Yamaha',   'Japon',      59, 0),
('MotoGP', 2026, 'team', 5, 'Honda',    'Japon',      51, 0);
