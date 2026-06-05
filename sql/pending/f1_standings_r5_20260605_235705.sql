
DELETE FROM standings WHERE series_id='F1' AND type='driver' AND season=2026;
INSERT INTO standings (series_id, season, type, position, name, nationality, points, wins) VALUES
('F1',2026,'driver', 1,'Kimi Antonelli',   'it',131,4),
('F1',2026,'driver', 2,'George Russell',   'gb', 88,1),
('F1',2026,'driver', 3,'Charles Leclerc',  'mc', 75,0),
('F1',2026,'driver', 4,'Lewis Hamilton',   'gb', 72,0),
('F1',2026,'driver', 5,'Lando Norris',     'gb', 58,0),
('F1',2026,'driver', 6,'Oscar Piastri',    'au', 48,0),
('F1',2026,'driver', 7,'Max Verstappen',   'nl', 43,0),
('F1',2026,'driver', 8,'Pierre Gasly',     'fr', 20,0),
('F1',2026,'driver', 9,'Oliver Bearman',   'gb', 18,0),
('F1',2026,'driver',10,'Liam Lawson',      'nz', 16,0),
('F1',2026,'driver',11,'Franco Colapinto', 'ar', 15,0),
('F1',2026,'driver',12,'Isack Hadjar',     'fr', 14,0),
('F1',2026,'driver',13,'Carlos Sainz',     'es',  6,0),
('F1',2026,'driver',14,'Arvid Lindblad',   'se',  5,0),
('F1',2026,'driver',15,'Gabriel Bortoleto','br',  2,0),
('F1',2026,'driver',16,'Esteban Ocon',     'fr',  1,0),
('F1',2026,'driver',17,'Alexander Albon',  'th',  1,0);
