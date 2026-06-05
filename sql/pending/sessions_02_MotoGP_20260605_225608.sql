-- MotoGP — Structure sprint weekend
-- Vendredi : FP1 08:00, Practice 12:15
-- Samedi   : Sprint Qualifs 08:00, Sprint 12:00
-- Dimanche : Qualifs 08:00, Course 11:00
-- (heures UTC — varient légèrement selon fuseau du circuit)
-- ══════════════════════════════════════════════════════════════════

-- R1 Thaïlande (27 Feb-1 Mar) — UTC+7
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(23,'FP1',          '2026-02-27 03:45:00+00', 45),
(23,'Practice',     '2026-02-27 08:00:00+00', 45),
(23,'Sprint Qualifs','2026-02-28 03:10:00+00', 30),
(23,'Sprint',       '2026-02-28 08:00:00+00', 30),
(23,'Qualifs',      '2026-03-01 03:00:00+00', 30),
(23,'Course',       '2026-03-01 08:00:00+00', 60);

-- R2 Brésil (20-22 Mar) — UTC-3
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(24,'FP1',          '2026-03-20 11:00:00+00', 45),
(24,'Practice',     '2026-03-20 15:15:00+00', 45),
(24,'Sprint Qualifs','2026-03-21 11:00:00+00', 30),
(24,'Sprint',       '2026-03-21 15:00:00+00', 30),
(24,'Qualifs',      '2026-03-22 11:00:00+00', 30),
(24,'Course',       '2026-03-22 14:00:00+00', 60);

-- R3 Amériques (27-29 Mar) — UTC-5
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(25,'FP1',          '2026-03-27 13:00:00+00', 45),
(25,'Practice',     '2026-03-27 17:15:00+00', 45),
(25,'Sprint Qualifs','2026-03-28 13:00:00+00', 30),
(25,'Sprint',       '2026-03-28 17:00:00+00', 30),
(25,'Qualifs',      '2026-03-29 13:00:00+00', 30),
(25,'Course',       '2026-03-29 16:00:00+00', 60);

-- R4 Espagne (24-26 Apr) — UTC+2
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(27,'FP1',          '2026-04-24 08:00:00+00', 45),
(27,'Practice',     '2026-04-24 12:15:00+00', 45),
(27,'Sprint Qualifs','2026-04-25 08:00:00+00', 30),
(27,'Sprint',       '2026-04-25 12:00:00+00', 30),
(27,'Qualifs',      '2026-04-26 08:00:00+00', 30),
(27,'Course',       '2026-04-26 11:00:00+00', 60);

-- R5 France (8-10 Mai) — UTC+2
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(28,'FP1',          '2026-05-08 08:00:00+00', 45),
(28,'Practice',     '2026-05-08 12:15:00+00', 45),
(28,'Sprint Qualifs','2026-05-09 08:00:00+00', 30),
(28,'Sprint',       '2026-05-09 12:00:00+00', 30),
(28,'Qualifs',      '2026-05-10 08:00:00+00', 30),
(28,'Course',       '2026-05-10 11:00:00+00', 60);

-- R6 Catalogne (22-24 Mai) — UTC+2
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(29,'FP1',          '2026-05-22 08:00:00+00', 45),
(29,'Practice',     '2026-05-22 12:15:00+00', 45),
(29,'Sprint Qualifs','2026-05-23 08:00:00+00', 30),
(29,'Sprint',       '2026-05-23 12:00:00+00', 30),
(29,'Qualifs',      '2026-05-24 08:00:00+00', 30),
(29,'Course',       '2026-05-24 11:00:00+00', 60);

-- R7 Italie/Mugello (29-31 Mai) — UTC+2
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(30,'FP1',          '2026-05-29 08:00:00+00', 45),
(30,'Practice',     '2026-05-29 12:15:00+00', 45),
(30,'Sprint Qualifs','2026-05-30 08:00:00+00', 30),
(30,'Sprint',       '2026-05-30 12:00:00+00', 30),
(30,'Qualifs',      '2026-05-31 08:00:00+00', 30),
(30,'Course',       '2026-05-31 11:00:00+00', 60);

-- R8 Hongrie (5-7 Jun) — UTC+2
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(31,'FP1',          '2026-06-05 08:00:00+00', 45),
(31,'Practice',     '2026-06-05 12:15:00+00', 45),
(31,'Sprint Qualifs','2026-06-06 08:00:00+00', 30),
(31,'Sprint',       '2026-06-06 12:00:00+00', 30),
(31,'Qualifs',      '2026-06-07 08:00:00+00', 30),
(31,'Course',       '2026-06-07 11:00:00+00', 60);

-- R9 Tchéquie (19-21 Jun) — UTC+2
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(32,'FP1',          '2026-06-19 08:00:00+00', 45),
(32,'Practice',     '2026-06-19 12:15:00+00', 45),
(32,'Sprint Qualifs','2026-06-20 08:00:00+00', 30),
(32,'Sprint',       '2026-06-20 12:00:00+00', 30),
(32,'Qualifs',      '2026-06-21 08:00:00+00', 30),
(32,'Course',       '2026-06-21 11:00:00+00', 60);

-- R10 Pays-Bas/Assen (26-28 Jun) — UTC+2
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(33,'FP1',          '2026-06-26 08:00:00+00', 45),
(33,'Practice',     '2026-06-26 12:15:00+00', 45),
(33,'Sprint Qualifs','2026-06-27 08:00:00+00', 30),
(33,'Sprint',       '2026-06-27 12:00:00+00', 30),
(33,'Qualifs',      '2026-06-28 08:00:00+00', 30),
(33,'Course',       '2026-06-28 11:00:00+00', 60);

-- R11 Allemagne (10-12 Jul) — UTC+2
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(34,'FP1',          '2026-07-10 08:00:00+00', 45),
(34,'Practice',     '2026-07-10 12:15:00+00', 45),
(34,'Sprint Qualifs','2026-07-11 08:00:00+00', 30),
(34,'Sprint',       '2026-07-11 12:00:00+00', 30),
(34,'Qualifs',      '2026-07-12 08:00:00+00', 30),
(34,'Course',       '2026-07-12 11:00:00+00', 60);

-- R12 Grande-Bretagne (24-26 Jul) — UTC+1
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(35,'FP1',          '2026-07-24 08:00:00+00', 45),
(35,'Practice',     '2026-07-24 12:15:00+00', 45),
(35,'Sprint Qualifs','2026-07-25 08:00:00+00', 30),
(35,'Sprint',       '2026-07-25 12:00:00+00', 30),
(35,'Qualifs',      '2026-07-26 08:00:00+00', 30),
(35,'Course',       '2026-07-26 11:00:00+00', 60);

-- R13 Aragon (14-16 Aout) — UTC+2
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(133,'FP1',          '2026-08-14 08:00:00+00', 45),
(133,'Practice',     '2026-08-14 12:15:00+00', 45),
(133,'Sprint Qualifs','2026-08-15 08:00:00+00', 30),
(133,'Sprint',       '2026-08-15 12:00:00+00', 30),
(133,'Qualifs',      '2026-08-16 08:00:00+00', 30),
(133,'Course',       '2026-08-16 11:00:00+00', 60);

-- R14 San Marin/Misano (4-6 Sep) — UTC+2
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(38,'FP1',          '2026-09-04 08:00:00+00', 45),
(38,'Practice',     '2026-09-04 12:15:00+00', 45),
(38,'Sprint Qualifs','2026-09-05 08:00:00+00', 30),
(38,'Sprint',       '2026-09-05 12:00:00+00', 30),
(38,'Qualifs',      '2026-09-06 08:00:00+00', 30),
(38,'Course',       '2026-09-06 11:00:00+00', 60);

-- R15 Autriche (18-20 Sep) — UTC+2
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(37,'FP1',          '2026-09-18 08:00:00+00', 45),
(37,'Practice',     '2026-09-18 12:15:00+00', 45),
(37,'Sprint Qualifs','2026-09-19 08:00:00+00', 30),
(37,'Sprint',       '2026-09-19 12:00:00+00', 30),
(37,'Qualifs',      '2026-09-20 08:00:00+00', 30),
(37,'Course',       '2026-09-20 11:00:00+00', 60);

-- R16 Japon/Motegi (2-4 Oct) — UTC+9
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(104,'FP1',          '2026-10-02 01:45:00+00', 45),
(104,'Practice',     '2026-10-02 06:00:00+00', 45),
(104,'Sprint Qualifs','2026-10-03 01:00:00+00', 30),
(104,'Sprint',       '2026-10-03 06:00:00+00', 30),
(104,'Qualifs',      '2026-10-04 01:00:00+00', 30),
(104,'Course',       '2026-10-04 05:00:00+00', 60);

-- R17 Indonésie (9-11 Oct) — UTC+8
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(39,'FP1',          '2026-10-09 02:00:00+00', 45),
(39,'Practice',     '2026-10-09 06:15:00+00', 45),
(39,'Sprint Qualifs','2026-10-10 02:00:00+00', 30),
(39,'Sprint',       '2026-10-10 06:00:00+00', 30),
(39,'Qualifs',      '2026-10-11 02:00:00+00', 30),
(39,'Course',       '2026-10-11 05:00:00+00', 60);

-- R18 Australie (23-25 Oct) — UTC+11
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(40,'FP1',          '2026-10-23 00:00:00+00', 45),
(40,'Practice',     '2026-10-23 04:15:00+00', 45),
(40,'Sprint Qualifs','2026-10-24 00:00:00+00', 30),
(40,'Sprint',       '2026-10-24 04:00:00+00', 30),
(40,'Qualifs',      '2026-10-25 00:00:00+00', 30),
(40,'Course',       '2026-10-25 03:00:00+00', 60);

-- R19 Malaisie (30 Oct-1 Nov) — UTC+8
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(41,'FP1',          '2026-10-30 02:00:00+00', 45),
(41,'Practice',     '2026-10-30 06:15:00+00', 45),
(41,'Sprint Qualifs','2026-10-31 02:00:00+00', 30),
(41,'Sprint',       '2026-10-31 06:00:00+00', 30),
(41,'Qualifs',      '2026-11-01 02:00:00+00', 30),
(41,'Course',       '2026-11-01 05:00:00+00', 60);

-- R20 Qatar (6-8 Nov) — UTC+3
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(138,'FP1',          '2026-11-06 10:00:00+00', 45),
(138,'Practice',     '2026-11-06 14:15:00+00', 45),
(138,'Sprint Qualifs','2026-11-07 10:00:00+00', 30),
(138,'Sprint',       '2026-11-07 14:00:00+00', 30),
(138,'Qualifs',      '2026-11-08 10:00:00+00', 30),
(138,'Course',       '2026-11-08 13:00:00+00', 60);

-- R21 Portugal (20-22 Nov) — UTC+0
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(135,'FP1',          '2026-11-20 09:00:00+00', 45),
(135,'Practice',     '2026-11-20 13:15:00+00', 45),
(135,'Sprint Qualifs','2026-11-21 09:00:00+00', 30),
(135,'Sprint',       '2026-11-21 13:00:00+00', 30),
(135,'Qualifs',      '2026-11-22 09:00:00+00', 30),
(135,'Course',       '2026-11-22 12:00:00+00', 60);

-- R22 Valence (4-6 Dec) — UTC+1
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(44,'FP1',          '2026-12-04 09:00:00+00', 45),
(44,'Practice',     '2026-12-04 13:15:00+00', 45),
(44,'Sprint Qualifs','2026-12-05 09:00:00+00', 30),
(44,'Sprint',       '2026-12-05 13:00:00+00', 30),
(44,'Qualifs',      '2026-12-06 09:00:00+00', 30),
(44,'Course',       '2026-12-06 12:00:00+00', 60);

-- ══════════════════════════════════════════════════════════════════
