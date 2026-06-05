
-- R2 Chine GP (race_id=2)
DELETE FROM results WHERE race_id = 2;
INSERT INTO results (race_id, position, driver, team, points, gap) VALUES
(2, 1,  'Kimi Antonelli',    'Mercedes',        25, '1:33:15.607'),
(2, 2,  'George Russell',    'Mercedes',        18, '+5.515s'),
(2, 3,  'Lewis Hamilton',    'Ferrari',         15, '+25.267s'),
(2, 4,  'Charles Leclerc',   'Ferrari',         12, '+28.894s'),
(2, 5,  'Oliver Bearman',    'Haas F1 Team',    10, '+57.268s'),
(2, 6,  'Pierre Gasly',      'Alpine',           8, '+59.647s'),
(2, 7,  'Liam Lawson',       'Racing Bulls',     6, '+80.588s'),
(2, 8,  'Isack Hadjar',      'Red Bull Racing',  4, '+87.247s'),
(2, 9,  'Carlos Sainz',      'Williams',         2, '+1 lap'),
(2, 10, 'Franco Colapinto',  'Alpine',           1, '+1 lap'),
(2, 11, 'Nico Hulkenberg',   'Audi',             0, '+1 lap'),
(2, 12, 'Arvid Lindblad',    'Racing Bulls',     0, '+1 lap'),
(2, 13, 'Valtteri Bottas',   'Cadillac',         0, '+1 lap'),
(2, 14, 'Esteban Ocon',      'Haas F1 Team',     0, '+1 lap'),
(2, 15, 'Sergio Perez',      'Cadillac',         0, '+1 lap'),
(2, 16, 'Max Verstappen',    'Red Bull Racing',  0, 'DNF'),
(2, 17, 'Fernando Alonso',   'Aston Martin',     0, 'DNF'),
(2, 18, 'Lance Stroll',      'Aston Martin',     0, 'DNF'),
(2, 19, 'Oscar Piastri',     'McLaren',          0, 'DNS'),
(2, 20, 'Lando Norris',      'McLaren',          0, 'DNS'),
(2, 21, 'Gabriel Bortoleto', 'Audi',             0, 'DNS'),
(2, 22, 'Alexander Albon',   'Williams',         0, 'DNS');

-- R2 Sprint Chine (race_id=75)
DELETE FROM results WHERE race_id = 75;
INSERT INTO results (race_id, position, driver, team, points, gap) VALUES
(75, 1,  'George Russell',    'Mercedes',        8, '33:38.998'),
(75, 2,  'Charles Leclerc',   'Ferrari',         7, '+0.674s'),
(75, 3,  'Lewis Hamilton',    'Ferrari',         6, '+2.554s'),
(75, 4,  'Lando Norris',      'McLaren',         5, '+4.433s'),
(75, 5,  'Kimi Antonelli',    'Mercedes',        4, '+5.688s'),
(75, 6,  'Oscar Piastri',     'McLaren',         3, '+6.809s'),
(75, 7,  'Liam Lawson',       'Racing Bulls',    2, '+10.900s'),
(75, 8,  'Oliver Bearman',    'Haas F1 Team',    1, '+11.271s'),
(75, 9,  'Max Verstappen',    'Red Bull Racing', 0, '+11.619s'),
(75, 10, 'Esteban Ocon',      'Haas F1 Team',    0, '+13.887s'),
(75, 11, 'Pierre Gasly',      'Alpine',          0, '+14.780s'),
(75, 12, 'Carlos Sainz',      'Williams',        0, '+15.753s'),
(75, 13, 'Gabriel Bortoleto', 'Audi',            0, '+15.858s'),
(75, 14, 'Franco Colapinto',  'Alpine',          0, '+16.393s'),
(75, 15, 'Isack Hadjar',      'Red Bull Racing', 0, '+16.430s'),
(75, 16, 'Alexander Albon',   'Williams',        0, '+20.014s'),
(75, 17, 'Fernando Alonso',   'Aston Martin',    0, '+21.599s'),
(75, 18, 'Lance Stroll',      'Aston Martin',    0, '+21.971s'),
(75, 19, 'Sergio Perez',      'Cadillac',        0, '+28.241s'),
(75, 20, 'Nico Hulkenberg',   'Audi',            0, 'DNF'),
(75, 21, 'Valtteri Bottas',   'Cadillac',        0, 'DNF'),
(75, 22, 'Arvid Lindblad',    'Racing Bulls',    0, 'DNF');
