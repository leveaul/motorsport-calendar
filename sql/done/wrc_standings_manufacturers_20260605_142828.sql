
-- Classement constructeurs WRC 2026 après R7 Japon
DELETE FROM standings WHERE series_id='WRC' AND type='team' AND season=2026;

INSERT INTO standings (series_id, season, type, position, name, nationality, points, wins)
VALUES
('WRC', 2026, 'team', 1, 'Toyota Gazoo Racing WRT',  'jp', 370, 6),
('WRC', 2026, 'team', 2, 'Hyundai Shell Mobis WRT',  'kr', 243, 1),
('WRC', 2026, 'team', 3, 'Toyota Gazoo Racing WRT2', 'jp', 106, 0),
('WRC', 2026, 'team', 4, 'M-Sport Ford WRT',         'gb',  85, 0);
