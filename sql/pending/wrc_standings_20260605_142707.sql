
DELETE FROM standings WHERE series_id='WRC' AND type='driver' AND season=2026;

INSERT INTO standings (series_id, season, type, position, name, nationality, points, wins)
VALUES
('WRC', 2026, 'driver', 1,  'Elfyn Evans',        'gb', 151, 2),
('WRC', 2026, 'driver', 2,  'Takamoto Katsuta',   'jp', 131, 2),
('WRC', 2026, 'driver', 3,  'Oliver Solberg',     'se', 102, 1),
('WRC', 2026, 'driver', 4,  'Sami Pajari',        'fi',  96, 0),
('WRC', 2026, 'driver', 5,  'Sebastien Ogier',    'fr',  90, 1),
('WRC', 2026, 'driver', 6,  'Adrien Fourmaux',    'fr',  89, 0),
('WRC', 2026, 'driver', 7,  'Thierry Neuville',   'be',  73, 1),
('WRC', 2026, 'driver', 8,  'Hayden Paddon',      'nz',  21, 0),
('WRC', 2026, 'driver', 9,  'Esapekka Lappi',     'fi',  21, 0),
('WRC', 2026, 'driver', 10, 'Yohan Rossel',       'fr',  20, 0),
('WRC', 2026, 'driver', 11, 'Leo Rossel',         'fr',  18, 0),
('WRC', 2026, 'driver', 12, 'Jon Armstrong',      'ie',  14, 0),
('WRC', 2026, 'driver', 13, 'Robert Virves',      'ee',  10, 0),
('WRC', 2026, 'driver', 14, 'Nikolay Gryazin',    'ru',  10, 0),
('WRC', 2026, 'driver', 15, 'Daniel Sordo',       'es',  10, 0),
('WRC', 2026, 'driver', 16, 'Gus Greensmith',     'gb',   8, 0),
('WRC', 2026, 'driver', 17, 'Alejandro Cachon',   'es',   7, 0),
('WRC', 2026, 'driver', 18, 'Joshua McErlean',    'ie',   7, 0),
('WRC', 2026, 'driver', 19, 'Fabrizio Zaldivar',  'py',   6, 0),
('WRC', 2026, 'driver', 20, 'Roberto Dapra',      'it',   6, 0),
('WRC', 2026, 'driver', 21, 'Roope Korhonen',     'fi',   5, 0),
('WRC', 2026, 'driver', 22, 'Andreas Mikkelsen',  'no',   4, 0),
('WRC', 2026, 'driver', 23, 'Martins Sesks',      'lv',   2, 0);
