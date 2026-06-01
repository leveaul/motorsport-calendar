
-- Classement complet MotoGP pilotes après R8 Mugello (31 mai 2026)
-- Source: crash.net official standings + autohebdof1.com
DELETE FROM standings WHERE series_id = 'MotoGP' AND type = 'driver' AND season = 2026;

INSERT INTO standings (series_id, season, type, position, name, nationality, points, wins) VALUES
('MotoGP', 2026, 'driver',  1, 'Marco Bezzecchi',        'Italie',    173, 4),
('MotoGP', 2026, 'driver',  2, 'Jorge Martín',            'Espagne',   156, 2),
('MotoGP', 2026, 'driver',  3, 'Fabio Di Giannantonio',  'Italie',    134, 1),
('MotoGP', 2026, 'driver',  4, 'Pedro Acosta',            'Espagne',   103, 0),
('MotoGP', 2026, 'driver',  5, 'Ai Ogura',                'Japon',      99, 0),
('MotoGP', 2026, 'driver',  6, 'Raúl Fernández',          'Espagne',    96, 1),
('MotoGP', 2026, 'driver',  7, 'Francesco Bagnaia',       'Italie',     91, 0),
('MotoGP', 2026, 'driver',  8, 'Marc Márquez',            'Espagne',    87, 0),
('MotoGP', 2026, 'driver',  9, 'Fermín Aldeguer',         'Espagne',    71, 0),
('MotoGP', 2026, 'driver', 10, 'Toprak Razgatlioglu',    'Turquie',    59, 0),
('MotoGP', 2026, 'driver', 11, 'Diogo Moreira',           'Brésil',     43, 0),
('MotoGP', 2026, 'driver', 12, 'Jack Miller',             'Australie',  38, 0),
('MotoGP', 2026, 'driver', 13, 'Brad Binder',             'Afrique du Sud', 35, 0),
('MotoGP', 2026, 'driver', 14, 'Maverick Viñales',        'Espagne',    28, 0),
('MotoGP', 2026, 'driver', 15, 'Franco Morbidelli',       'Italie',     22, 0),
('MotoGP', 2026, 'driver', 16, 'Joan Mir',                'Espagne',    19, 0),
('MotoGP', 2026, 'driver', 17, 'Enea Bastianini',         'Italie',     17, 0),
('MotoGP', 2026, 'driver', 18, 'Alex Rins',               'Espagne',    14, 0),
('MotoGP', 2026, 'driver', 19, 'Álex Márquez',            'Espagne',    12, 0),
('MotoGP', 2026, 'driver', 20, 'Luca Marini',             'Italie',      8, 0),
('MotoGP', 2026, 'driver', 21, 'Johann Zarco',            'France',      6, 0),
('MotoGP', 2026, 'driver', 22, 'Cal Crutchlow',           'Grande-Bretagne', 2, 0);

-- Constructeurs MotoGP après R8
DELETE FROM standings WHERE series_id = 'MotoGP' AND type = 'team' AND season = 2026;
INSERT INTO standings (series_id, season, type, position, name, nationality, points, wins) VALUES
('MotoGP', 2026, 'team', 1, 'Aprilia',  'Italie',    261, 5),
('MotoGP', 2026, 'team', 2, 'Ducati',   'Italie',    219, 3),
('MotoGP', 2026, 'team', 3, 'KTM',      'Autriche',  103, 0),
('MotoGP', 2026, 'team', 4, 'Yamaha',   'Japon',      59, 0),
('MotoGP', 2026, 'team', 5, 'Honda',    'Japon',      51, 0);
