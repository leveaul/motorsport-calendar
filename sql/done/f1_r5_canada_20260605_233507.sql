
-- R5 Canada GP (race_id=5)
DELETE FROM results WHERE race_id = 5;
INSERT INTO results (race_id, position, driver, team, points, gap) VALUES
(5, 1,  'Kimi Antonelli',    'Mercedes',        25, '1:28:15.758'),
(5, 2,  'Lewis Hamilton',    'Ferrari',         18, '+10.768s'),
(5, 3,  'Max Verstappen',    'Red Bull Racing', 15, '+11.276s'),
(5, 4,  'Charles Leclerc',   'Ferrari',         12, '+44.151s'),
(5, 5,  'Isack Hadjar',      'Red Bull Racing', 10, '+1 lap'),
(5, 6,  'Franco Colapinto',  'Alpine',           8, '+1 lap'),
(5, 7,  'Liam Lawson',       'Racing Bulls',     6, '+1 lap'),
(5, 8,  'Pierre Gasly',      'Alpine',           4, '+1 lap'),
(5, 9,  'Carlos Sainz',      'Williams',         2, '+1 lap'),
(5, 10, 'Oliver Bearman',    'Haas F1 Team',     1, '+1 lap'),
(5, 11, 'Oscar Piastri',     'McLaren',          0, '+2 laps'),
(5, 12, 'Nico Hulkenberg',   'Audi',             0, '+2 laps'),
(5, 13, 'Gabriel Bortoleto', 'Audi',             0, '+2 laps'),
(5, 14, 'Esteban Ocon',      'Haas F1 Team',     0, '+2 laps'),
(5, 15, 'Lance Stroll',      'Aston Martin',     0, '+4 laps'),
(5, 16, 'Valtteri Bottas',   'Cadillac',         0, '+4 laps'),
(5, 17, 'Sergio Perez',      'Cadillac',         0, 'DNF'),
(5, 18, 'Lando Norris',      'McLaren',          0, 'DNF'),
(5, 19, 'George Russell',    'Mercedes',         0, 'DNF'),
(5, 20, 'Fernando Alonso',   'Aston Martin',     0, 'DNF'),
(5, 21, 'Alexander Albon',   'Williams',         0, 'DNF'),
(5, 22, 'Arvid Lindblad',    'Racing Bulls',     0, 'DNS');

-- R5 Sprint Canada (race_id=77)
DELETE FROM results WHERE race_id = 77;
INSERT INTO results (race_id, position, driver, team, points, gap) VALUES
(77, 1,  'George Russell',    'Mercedes',        8, '28:50.951'),
(77, 2,  'Lando Norris',      'McLaren',         7, '+1.272s'),
(77, 3,  'Kimi Antonelli',    'Mercedes',        6, '+1.843s'),
(77, 4,  'Oscar Piastri',     'McLaren',         5, '+9.797s'),
(77, 5,  'Charles Leclerc',   'Ferrari',         4, '+9.929s'),
(77, 6,  'Lewis Hamilton',    'Ferrari',         3, '+10.545s'),
(77, 7,  'Max Verstappen',    'Red Bull Racing', 2, '+15.935s'),
(77, 8,  'Arvid Lindblad',    'Racing Bulls',    1, '+29.710s'),
(77, 9,  'Franco Colapinto',  'Alpine',          0, '+31.621s'),
(77, 10, 'Carlos Sainz',      'Williams',        0, '+36.793s'),
(77, 11, 'Liam Lawson',       'Racing Bulls',    0, '+61.344s'),
(77, 12, 'Gabriel Bortoleto', 'Audi',            0, '+61.814s'),
(77, 13, 'Esteban Ocon',      'Haas F1 Team',    0, '+64.209s'),
(77, 14, 'Sergio Perez',      'Cadillac',        0, '+70.402s'),
(77, 15, 'Nico Hulkenberg',   'Audi',            0, '+72.158s'),
(77, 16, 'Lance Stroll',      'Aston Martin',    0, '+1 lap'),
(77, 17, 'Valtteri Bottas',   'Cadillac',        0, '+1 lap'),
(77, 18, 'Oliver Bearman',    'Haas F1 Team',    0, '+1 lap'),
(77, 19, 'Alexander Albon',   'Williams',        0, '+1 lap'),
(77, 20, 'Pierre Gasly',      'Alpine',          0, '+1 lap'),
(77, 21, 'Isack Hadjar',      'Red Bull Racing', 0, '+3 laps'),
(77, 22, 'Fernando Alonso',   'Aston Martin',    0, 'DNF');
