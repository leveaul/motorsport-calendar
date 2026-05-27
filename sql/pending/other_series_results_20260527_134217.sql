
-- =============================================
-- RÉSULTATS IMSA 2026 — 5 premières courses
-- =============================================

-- ROLEX 24 DAYTONA (R1) — Porsche Penske #7
INSERT INTO results (race_id, position, driver, team, gap)
SELECT id, 1, 'Andlauer / Nasr / Heinrich',      'Porsche Penske #7',          'Vainqueur GTP' FROM races WHERE series_id='IMSA' AND round=1
UNION ALL SELECT id, 2, 'Aitken / Bamber / Vesti',           'Whelen Cadillac #31',        '+1.5s GTP'     FROM races WHERE series_id='IMSA' AND round=1
UNION ALL SELECT id, 3, 'Estre / Vanthoor / Campbell',       'Porsche Penske #6',          '+3.2s GTP'     FROM races WHERE series_id='IMSA' AND round=1
UNION ALL SELECT id, 4, 'Milner / Catsburg / ?',             'Corvette Racing #4',         'GTD Pro P1'    FROM races WHERE series_id='IMSA' AND round=1
UNION ALL SELECT id, 5, 'Engel / Marciello / Auer',          'Winward Racing #57 Mercedes','GTD P1'        FROM races WHERE series_id='IMSA' AND round=1;

-- 12H SEBRING (R2) — Porsche Penske #7 (1-2 Porsche)
INSERT INTO results (race_id, position, driver, team, gap)
SELECT id, 1, 'Andlauer / Nasr / Heinrich',      'Porsche Penske #7',          'Vainqueur GTP' FROM races WHERE series_id='IMSA' AND round=2
UNION ALL SELECT id, 2, 'Estre / Vanthoor / Campbell',       'Porsche Penske #6',          '+18.4s GTP'    FROM races WHERE series_id='IMSA' AND round=2
UNION ALL SELECT id, 3, 'Aitken / Bamber / Vesti',           'Whelen Cadillac #31',        '+45.2s GTP'    FROM races WHERE series_id='IMSA' AND round=2
UNION ALL SELECT id, 4, 'Milner / Catsburg',                 'Corvette Racing #4',         'GTD Pro P1'    FROM races WHERE series_id='IMSA' AND round=2
UNION ALL SELECT id, 5, 'Ferrari AF Corse',                  'AF Corse Ferrari',           'GTD P1'        FROM races WHERE series_id='IMSA' AND round=2;

-- LONG BEACH (R3) — Acura Meyer Shank
INSERT INTO results (race_id, position, driver, team, gap)
SELECT id, 1, 'van der Zande / Yelloly',         'Acura Meyer Shank #93',      'Vainqueur GTP' FROM races WHERE series_id='IMSA' AND round=3
UNION ALL SELECT id, 2, 'Eng / Wittmann',                    'BMW M Team WRT #25',         '+2.1s GTP'     FROM races WHERE series_id='IMSA' AND round=3
UNION ALL SELECT id, 3, 'Heinrich / Pino',                   'JDC Miller Porsche #5',      '+5.4s GTP'     FROM races WHERE series_id='IMSA' AND round=3
UNION ALL SELECT id, 4, 'Telitz / Pedersen',                 'Vasser Sullivan Racing #12', 'GTD WIN'       FROM races WHERE series_id='IMSA' AND round=3;

-- LAGUNA SECA (R4) — JDC Miller Porsche (Heinrich)
INSERT INTO results (race_id, position, driver, team, gap)
SELECT id, 1, 'Heinrich / van der Helm',         'JDC Miller Porsche #5',      'Vainqueur GTP' FROM races WHERE series_id='IMSA' AND round=4
UNION ALL SELECT id, 2, 'Bamber / Aitken',                   'Whelen Cadillac #31',        '+0.758s GTP'   FROM races WHERE series_id='IMSA' AND round=4
UNION ALL SELECT id, 3, 'Estre / Vanthoor',                  'Porsche Penske #6',          '+12.3s GTP'    FROM races WHERE series_id='IMSA' AND round=4
UNION ALL SELECT id, 4, 'Milner / Catsburg',                 'Corvette Racing #4',         'GTD Pro P1'    FROM races WHERE series_id='IMSA' AND round=4;

-- DETROIT (R5)
INSERT INTO results (race_id, position, driver, team, gap)
SELECT id, 1, 'À mettre à jour',                'GTP Winner',                 'Résultat à venir' FROM races WHERE series_id='IMSA' AND round=5;

-- CLASSEMENTS IMSA (après Laguna Seca)
INSERT INTO standings (series_id, season, type, position, name, points, wins) VALUES
('IMSA', 2026, 'driver', 1, 'Laurin Heinrich',           0, 3),
('IMSA', 2026, 'driver', 2, 'Jack Aitken / Earl Bamber', 0, 0),
('IMSA', 2026, 'driver', 3, 'Estre / Vanthoor / Campbell',0, 0);

INSERT INTO standings (series_id, season, type, position, name, points, wins) VALUES
('IMSA', 2026, 'team', 1, 'Porsche Penske Motorsport', 0, 2),
('IMSA', 2026, 'team', 2, 'JDC Miller MotorSports',    0, 2),
('IMSA', 2026, 'team', 3, 'Whelen Cadillac',           0, 0);

-- =============================================
-- RÉSULTATS ELMS 2026 — 2 premières courses
-- =============================================

-- 4H BARCELONE (R1)
INSERT INTO results (race_id, position, driver, team, gap)
SELECT id, 1, 'Masson / Gray / Rousset',         'Forestier Racing #29 LMP2',  'LMP2 WIN'      FROM races WHERE series_id='ELMS' AND round=1
UNION ALL SELECT id, 2, 'Hughes / Peebles / ?',              'Algarve Pro Racing #25 LMP2','LMP2 P2'       FROM races WHERE series_id='ELMS' AND round=1
UNION ALL SELECT id, 3, 'Pedersen / Gaarde / ?',             'Rinaldi Racing #5 LMP3',     'LMP3 WIN'      FROM races WHERE series_id='ELMS' AND round=1
UNION ALL SELECT id, 4, 'Al-Khelaifi / Martin / ?',          'Team Qatar Iron Lynx #62',   'LMGT3 WIN'     FROM races WHERE series_id='ELMS' AND round=1;

-- 4H PAUL RICARD (R2)
INSERT INTO results (race_id, position, driver, team, gap)
SELECT id, 1, 'Peebles / Saucy / Hanley',        'United Autosports #22 LMP2', 'LMP2 WIN'      FROM races WHERE series_id='ELMS' AND round=2
UNION ALL SELECT id, 2, 'de Gerus / Hanley / ?',             'United Autosports #22 LMP2', 'LMP2 P2'       FROM races WHERE series_id='ELMS' AND round=2
UNION ALL SELECT id, 3, 'Bukhantsov / Chou / Cubides',       'Inter Europol #13 LMP3',     'LMP3 WIN'      FROM races WHERE series_id='ELMS' AND round=2
UNION ALL SELECT id, 4, 'Jaubert / Serra / Kimura',          'Kessel Racing #57 Ferrari',  'LMGT3 WIN'     FROM races WHERE series_id='ELMS' AND round=2
UNION ALL SELECT id, 5, 'Eastwood / McDonald / ?',           'TF Sport #33 Corvette',      'LMGT3 P2'      FROM races WHERE series_id='ELMS' AND round=2;

-- CLASSEMENTS ELMS (après 2 courses)
INSERT INTO standings (series_id, season, type, position, name, points, wins) VALUES
('ELMS', 2026, 'driver', 1, 'Peebles / Saucy / Hanley (UA #22)',   0, 1),
('ELMS', 2026, 'driver', 2, 'Masson / Gray / Rousset (Forestier)', 0, 1),
('ELMS', 2026, 'driver', 3, 'Bukhantsov / Chou (Inter Europol)',   0, 2);

INSERT INTO standings (series_id, season, type, position, name, points, wins) VALUES
('ELMS', 2026, 'team', 1, 'United Autosports',          0, 1),
('ELMS', 2026, 'team', 2, 'Forestier Racing by Panis',  0, 1),
('ELMS', 2026, 'team', 3, 'Inter Europol Competition',  0, 2);

-- =============================================
-- RÉSULTATS GT WORLD CHALLENGE EUROPE 2026
-- =============================================

-- 6H PAUL RICARD (R1) — Mercedes Winward
INSERT INTO results (race_id, position, driver, team, gap)
SELECT id, 1, 'Auer / Engel / Stolz',            'Winward Mercedes #48',       'Pro WIN'       FROM races WHERE series_id='GTWCE' AND round=1
UNION ALL SELECT id, 2, 'Drudi / Sørensen / Thiim',          'Comtoyou Racing #3 Aston',   'Pro P2'        FROM races WHERE series_id='GTWCE' AND round=1
UNION ALL SELECT id, 3, 'Goethe / Prette / Fleming',         'Garage 59 McLaren',          'Pro P3'        FROM races WHERE series_id='GTWCE' AND round=1
UNION ALL SELECT id, 4, 'Malykhin / Nesov / Hofer',          'GetSpeed Mercedes',          'Pro-Am P1'     FROM races WHERE series_id='GTWCE' AND round=1;

-- CLASSEMENTS GTWCE
INSERT INTO standings (series_id, season, type, position, name, points, wins) VALUES
('GTWCE', 2026, 'driver', 1, 'Auer / Engel / Stolz',         33, 1),
('GTWCE', 2026, 'driver', 2, 'Drudi / Sørensen / Thiim',     24, 0),
('GTWCE', 2026, 'driver', 3, 'Goethe / Prette / Fleming',    19, 0);

INSERT INTO standings (series_id, season, type, position, name, points, wins) VALUES
('GTWCE', 2026, 'team', 1, 'Winward Racing / GetSpeed Mercedes', 33, 1),
('GTWCE', 2026, 'team', 2, 'Comtoyou Racing Aston Martin',       24, 0),
('GTWCE', 2026, 'team', 3, 'Garage 59 McLaren',                  19, 0);
