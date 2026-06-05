
-- R4 Miami GP (race_id=4)
DELETE FROM results WHERE race_id = 4;
INSERT INTO results (race_id, position, driver, team, points, gap) VALUES
(4, 1,  'Kimi Antonelli',    'Mercedes',        25, '1:33:19.273'),
(4, 2,  'Lando Norris',      'McLaren',         18, '+3.264s'),
(4, 3,  'Oscar Piastri',     'McLaren',         15, '+27.092s'),
(4, 4,  'George Russell',    'Mercedes',        12, '+43.051s'),
(4, 5,  'Max Verstappen',    'Red Bull Racing', 10, '+48.949s'),
(4, 6,  'Lewis Hamilton',    'Ferrari',          8, '+53.753s'),
(4, 7,  'Franco Colapinto',  'Alpine',           6, '+61.871s'),
(4, 8,  'Charles Leclerc',   'Ferrari',          4, '+64.245s'),
(4, 9,  'Carlos Sainz',      'Williams',         2, '+82.072s'),
(4, 10, 'Alexander Albon',   'Williams',         1, '+90.972s'),
(4, 11, 'Oliver Bearman',    'Haas F1 Team',     0, '+1 lap'),
(4, 12, 'Gabriel Bortoleto', 'Audi',             0, '+1 lap'),
(4, 13, 'Esteban Ocon',      'Haas F1 Team',     0, '+1 lap'),
(4, 14, 'Arvid Lindblad',    'Racing Bulls',     0, '+1 lap'),
(4, 15, 'Fernando Alonso',   'Aston Martin',     0, '+1 lap'),
(4, 16, 'Sergio Perez',      'Cadillac',         0, '+1 lap'),
(4, 17, 'Lance Stroll',      'Aston Martin',     0, '+1 lap'),
(4, 18, 'Valtteri Bottas',   'Cadillac',         0, '+2 laps'),
(4, 19, 'Nico Hulkenberg',   'Audi',             0, 'DNF'),
(4, 20, 'Liam Lawson',       'Racing Bulls',     0, 'DNF'),
(4, 21, 'Pierre Gasly',      'Alpine',           0, 'DNF'),
(4, 22, 'Isack Hadjar',      'Red Bull Racing',  0, 'DNF');

-- R4 Sprint Miami (race_id=76)
DELETE FROM results WHERE race_id = 76;
INSERT INTO results (race_id, position, driver, team, points, gap) VALUES
(76, 1,  'Lando Norris',      'McLaren',         8, '29:15.045'),
(76, 2,  'Oscar Piastri',     'McLaren',         7, '+3.766s'),
(76, 3,  'Charles Leclerc',   'Ferrari',         6, '+6.251s'),
(76, 4,  'George Russell',    'Mercedes',        5, '+12.951s'),
(76, 5,  'Max Verstappen',    'Red Bull Racing', 4, '+13.639s'),
(76, 6,  'Kimi Antonelli',    'Mercedes',        3, '+13.777s'),
(76, 7,  'Lewis Hamilton',    'Ferrari',         2, '+21.665s'),
(76, 8,  'Pierre Gasly',      'Alpine',          1, '+30.525s'),
(76, 9,  'Isack Hadjar',      'Red Bull Racing', 0, '+35.346s'),
(76, 10, 'Franco Colapinto',  'Alpine',          0, '+36.970s'),
(76, 11, 'Esteban Ocon',      'Haas F1 Team',    0, '+56.972s'),
(76, 12, 'Oliver Bearman',    'Haas F1 Team',    0, '+57.365s'),
(76, 13, 'Carlos Sainz',      'Williams',        0, '+58.504s'),
(76, 14, 'Liam Lawson',       'Racing Bulls',    0, '+59.358s'),
(76, 15, 'Fernando Alonso',   'Aston Martin',    0, '+76.067s'),
(76, 16, 'Sergio Perez',      'Cadillac',        0, '+76.691s'),
(76, 17, 'Lance Stroll',      'Aston Martin',    0, '+77.626s'),
(76, 18, 'Alexander Albon',   'Williams',        0, '+88.173s'),
(76, 19, 'Valtteri Bottas',   'Cadillac',        0, '+89.597s'),
(76, 20, 'Nico Hulkenberg',   'Audi',            0, 'DNS'),
(76, 21, 'Arvid Lindblad',    'Racing Bulls',    0, 'DNS'),
(76, 22, 'Gabriel Bortoleto', 'Audi',            0, 'DSQ');
