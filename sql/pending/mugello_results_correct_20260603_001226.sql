
-- Supprimer les anciens résultats Mugello course (race_id=30)
DELETE FROM results WHERE race_id = 30;

-- Insérer les résultats corrects depuis la capture officielle MotoGP
INSERT INTO results (race_id, position, driver, team, points, gap) VALUES
(30, 1,  'Marco Bezzecchi',       'Aprilia Racing',                    25, '40:57.347'),
(30, 2,  'Jorge Martin',          'Aprilia Racing',                    20, '+3.559'),
(30, 3,  'Francesco Bagnaia',     'Ducati Lenovo Team',                16, '+5.098'),
(30, 4,  'Ai Ogura',              'Trackhouse MotoGP Team',            13, '+5.132'),
(30, 5,  'Fabio Di Giannantonio', 'Pertamina Enduro VR46 Racing Team', 11, '+5.453'),
(30, 6,  'Pedro Acosta',          'Red Bull KTM Factory Racing',       10, '+7.467'),
(30, 7,  'Marc Marquez',          'Ducati Lenovo Team',                 9, '+10.762'),
(30, 8,  'Fermin Aldeguer',       'BK8 Gresini Racing MotoGP',         8, '+14.644'),
(30, 9,  'Raul Fernandez',        'Trackhouse MotoGP Team',             7, '+13.380'),
(30, 10, 'Diogo Moreira',         'Pro Honda LCR',                      6, '+21.366'),
(30, 11, 'Brad Binder',           'Red Bull KTM Factory Racing',        5, '+21.479'),
(30, 12, 'Joan Mir',              'Honda HRC Castrol',                   4, '+21.795'),
(30, 13, 'Luca Marini',           'Honda HRC Castrol',                   3, '+22.059'),
(30, 14, 'Franco Morbidelli',     'Pertamina Enduro VR46 Racing Team',  2, '+29.789'),
(30, 15, 'Jack Miller',           'Prima Pramac Yamaha MotoGP',          1, '+32.289');
