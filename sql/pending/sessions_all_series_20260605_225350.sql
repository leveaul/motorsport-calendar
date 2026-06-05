-- ══════════════════════════════════════════════════════════════════
-- SESSIONS COMPLÈTES — F1, MotoGP, WEC, ELMS, GTWCE, IMSA
-- Sources: f1calendar.com (UTC), motorsportscalendar.com, motogpnews.com
-- ══════════════════════════════════════════════════════════════════

-- Vider les sessions existantes et repartir proprement
DELETE FROM sessions;

-- ══════════════════════════════════════════════════════════════════
-- F1 — Structure sessions
-- Race normale   : FP1, FP2, FP3, Qualifications, Course
-- Sprint weekend : FP1, Sprint Qualifs, Sprint, Qualifications, Course
-- ══════════════════════════════════════════════════════════════════

-- R1 Australie (6-8 Mar) — race normale
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(1,'FP1',         '2026-03-06 02:30:00+00', 60),
(1,'FP2',         '2026-03-06 06:00:00+00', 60),
(1,'FP3',         '2026-03-07 02:30:00+00', 60),
(1,'Qualifications','2026-03-07 06:00:00+00', 60),
(1,'Course',      '2026-03-08 05:00:00+00', 120);

-- R2 Chine (13-15 Mar) — sprint weekend
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(2,'FP1',         '2026-03-13 03:30:00+00', 60),
(2,'Sprint Qualifs','2026-03-13 07:30:00+00', 30),
(2,'Sprint',      '2026-03-14 03:00:00+00', 30),
(2,'Qualifications','2026-03-14 07:00:00+00', 60),
(2,'Course',      '2026-03-15 07:00:00+00', 120);

-- R3 Japon (20-22 Mar) — race normale
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(3,'FP1',         '2026-03-20 02:30:00+00', 60),
(3,'FP2',         '2026-03-20 06:00:00+00', 60),
(3,'FP3',         '2026-03-21 02:30:00+00', 60),
(3,'Qualifications','2026-03-21 06:00:00+00', 60),
(3,'Course',      '2026-03-22 05:00:00+00', 120);

-- R4 Miami (1-3 Mai) — sprint weekend
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(4,'FP1',         '2026-05-01 17:30:00+00', 60),
(4,'Sprint Qualifs','2026-05-01 21:30:00+00', 30),
(4,'Sprint',      '2026-05-02 16:00:00+00', 30),
(4,'Qualifications','2026-05-02 20:00:00+00', 60),
(4,'Course',      '2026-05-03 19:00:00+00', 120);

-- R5 Canada (22-24 Mai) — sprint weekend
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(5,'FP1',         '2026-05-22 17:30:00+00', 60),
(5,'Sprint Qualifs','2026-05-22 21:30:00+00', 30),
(5,'Sprint',      '2026-05-23 16:00:00+00', 30),
(5,'Qualifications','2026-05-23 20:00:00+00', 60),
(5,'Course',      '2026-05-24 18:00:00+00', 120);

-- R6 Monaco (5-7 Jun) — race normale
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(6,'FP1',         '2026-06-05 11:30:00+00', 60),
(6,'FP2',         '2026-06-05 15:00:00+00', 60),
(6,'FP3',         '2026-06-06 10:30:00+00', 60),
(6,'Qualifications','2026-06-06 14:00:00+00', 60),
(6,'Course',      '2026-06-07 13:00:00+00', 120);

-- R7 Barcelone (12-14 Jun) — race normale
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(7,'FP1',         '2026-06-12 11:30:00+00', 60),
(7,'FP2',         '2026-06-12 15:00:00+00', 60),
(7,'FP3',         '2026-06-13 10:30:00+00', 60),
(7,'Qualifications','2026-06-13 14:00:00+00', 60),
(7,'Course',      '2026-06-14 13:00:00+00', 120);

-- R8 Autriche (26-28 Jun) — sprint weekend
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(8,'FP1',         '2026-06-26 11:30:00+00', 60),
(8,'Sprint Qualifs','2026-06-26 15:30:00+00', 30),
(8,'Sprint',      '2026-06-27 11:00:00+00', 30),
(8,'Qualifications','2026-06-27 15:00:00+00', 60),
(8,'Course',      '2026-06-28 13:00:00+00', 120);

-- R9 Grande-Bretagne (3-5 Jul) — sprint weekend
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(9,'FP1',         '2026-07-03 11:30:00+00', 60),
(9,'Sprint Qualifs','2026-07-03 15:30:00+00', 30),
(9,'Sprint',      '2026-07-04 11:00:00+00', 30),
(9,'Qualifications','2026-07-04 15:00:00+00', 60),
(9,'Course',      '2026-07-05 14:00:00+00', 120);

-- R10 Belgique (17-19 Jul) — race normale
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(10,'FP1',        '2026-07-17 11:30:00+00', 60),
(10,'FP2',        '2026-07-17 15:00:00+00', 60),
(10,'FP3',        '2026-07-18 10:30:00+00', 60),
(10,'Qualifications','2026-07-18 14:00:00+00', 60),
(10,'Course',     '2026-07-19 13:00:00+00', 120);

-- R11 Hongrie (24-26 Jul) — race normale
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(11,'FP1',        '2026-07-24 11:30:00+00', 60),
(11,'FP2',        '2026-07-24 15:00:00+00', 60),
(11,'FP3',        '2026-07-25 10:30:00+00', 60),
(11,'Qualifications','2026-07-25 14:00:00+00', 60),
(11,'Course',     '2026-07-26 13:00:00+00', 120);

-- R12 Pays-Bas (21-23 Aout) — sprint weekend
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(12,'FP1',        '2026-08-21 10:30:00+00', 60),
(12,'Sprint Qualifs','2026-08-21 14:30:00+00', 30),
(12,'Sprint',     '2026-08-22 10:00:00+00', 30),
(12,'Qualifications','2026-08-22 14:00:00+00', 60),
(12,'Course',     '2026-08-23 13:00:00+00', 120);

-- R13 Italie (4-6 Sep) — race normale
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(13,'FP1',        '2026-09-04 10:30:00+00', 60),
(13,'FP2',        '2026-09-04 14:00:00+00', 60),
(13,'FP3',        '2026-09-05 10:30:00+00', 60),
(13,'Qualifications','2026-09-05 14:00:00+00', 60),
(13,'Course',     '2026-09-06 13:00:00+00', 120);

-- R14 Madrid (11-13 Sep) — race normale
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(14,'FP1',        '2026-09-11 11:30:00+00', 60),
(14,'FP2',        '2026-09-11 15:00:00+00', 60),
(14,'FP3',        '2026-09-12 10:30:00+00', 60),
(14,'Qualifications','2026-09-12 14:00:00+00', 60),
(14,'Course',     '2026-09-13 13:00:00+00', 120);

-- R15 Azerbaïdjan (24-26 Sep) — race normale (samedi)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(15,'FP1',        '2026-09-24 08:30:00+00', 60),
(15,'FP2',        '2026-09-24 12:00:00+00', 60),
(15,'FP3',        '2026-09-25 08:30:00+00', 60),
(15,'Qualifications','2026-09-25 12:00:00+00', 60),
(15,'Course',     '2026-09-26 11:00:00+00', 120);

-- R16 Singapour (9-11 Oct) — sprint weekend
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(16,'FP1',        '2026-10-09 09:30:00+00', 60),
(16,'Sprint Qualifs','2026-10-09 13:30:00+00', 30),
(16,'Sprint',     '2026-10-10 09:00:00+00', 30),
(16,'Qualifications','2026-10-10 13:00:00+00', 60),
(16,'Course',     '2026-10-11 12:00:00+00', 120);

-- R17 Etats-Unis (23-25 Oct) — race normale
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(17,'FP1',        '2026-10-23 17:30:00+00', 60),
(17,'FP2',        '2026-10-23 21:00:00+00', 60),
(17,'FP3',        '2026-10-24 17:30:00+00', 60),
(17,'Qualifications','2026-10-24 21:00:00+00', 60),
(17,'Course',     '2026-10-25 19:00:00+00', 120);

-- R18 Mexique (30 Oct-1 Nov) — race normale
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(18,'FP1',        '2026-10-30 17:30:00+00', 60),
(18,'FP2',        '2026-10-30 21:00:00+00', 60),
(18,'FP3',        '2026-10-31 16:30:00+00', 60),
(18,'Qualifications','2026-10-31 20:00:00+00', 60),
(18,'Course',     '2026-11-01 19:00:00+00', 120);

-- R19 Brésil (6-8 Nov) — race normale
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(19,'FP1',        '2026-11-06 14:30:00+00', 60),
(19,'FP2',        '2026-11-06 18:00:00+00', 60),
(19,'FP3',        '2026-11-07 13:30:00+00', 60),
(19,'Qualifications','2026-11-07 17:00:00+00', 60),
(19,'Course',     '2026-11-08 16:00:00+00', 120);

-- R20 Las Vegas (20-22 Nov) — race normale (nuit)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(20,'FP1',        '2026-11-20 00:30:00+00', 60),
(20,'FP2',        '2026-11-20 04:00:00+00', 60),
(20,'FP3',        '2026-11-21 00:30:00+00', 60),
(20,'Qualifications','2026-11-21 04:00:00+00', 60),
(20,'Course',     '2026-11-22 04:00:00+00', 120);

-- R21 Qatar (27-29 Nov) — race normale
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(21,'FP1',        '2026-11-27 12:30:00+00', 60),
(21,'FP2',        '2026-11-27 16:00:00+00', 60),
(21,'FP3',        '2026-11-28 13:30:00+00', 60),
(21,'Qualifications','2026-11-28 17:00:00+00', 60),
(21,'Course',     '2026-11-29 15:00:00+00', 120);

-- R22 Abu Dhabi (4-6 Dec) — race normale
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(22,'FP1',        '2026-12-04 09:30:00+00', 60),
(22,'FP2',        '2026-12-04 13:00:00+00', 60),
(22,'FP3',        '2026-12-05 10:30:00+00', 60),
(22,'Qualifications','2026-12-05 14:00:00+00', 60),
(22,'Course',     '2026-12-06 13:00:00+00', 120);

-- ══════════════════════════════════════════════════════════════════
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
-- WEC — Structure typique : FP1(90min), FP2(90min), FP3(60min), Hyperpole, Course
-- Source: motorsportscalendar.com (UTC)
-- ══════════════════════════════════════════════════════════════════

-- R1 Qatar/Losail (dates à préciser ~Fev)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(45,'FP1',       '2026-02-13 10:00:00+00', 90),
(45,'FP2',       '2026-02-13 15:00:00+00', 90),
(45,'FP3',       '2026-02-14 09:00:00+00', 60),
(45,'Hyperpole', '2026-02-14 13:00:00+00', 30),
(45,'Course',    '2026-02-15 13:00:00+00', 360);

-- R2 Imola (Apr)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(46,'FP1',       '2026-04-16 10:00:00+00', 90),
(46,'FP2',       '2026-04-16 15:00:00+00', 90),
(46,'FP3',       '2026-04-17 09:00:00+00', 60),
(46,'Hyperpole', '2026-04-17 13:00:00+00', 30),
(46,'Course',    '2026-04-18 11:00:00+00', 360);

-- R3 Spa (7-9 Mai) — données réelles depuis motorsportscalendar.com
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(47,'FP1',       '2026-05-07 09:00:00+00', 90),
(47,'FP2',       '2026-05-07 13:40:00+00', 90),
(47,'FP3',       '2026-05-08 08:10:00+00', 60),
(47,'Hyperpole', '2026-05-08 12:30:00+00', 30),
(47,'Course',    '2026-05-09 12:00:00+00', 360);

-- R4 Le Mans 24H (Jun)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(48,'FP1',       '2026-06-10 08:00:00+00', 120),
(48,'FP2',       '2026-06-10 18:00:00+00', 120),
(48,'FP3',       '2026-06-11 08:00:00+00', 120),
(48,'Hyperpole', '2026-06-11 18:00:00+00', 30),
(48,'Course',    '2026-06-13 16:00:00+00', 1440);

-- R5 São Paulo (Jul)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(49,'FP1',       '2026-07-09 13:00:00+00', 90),
(49,'FP2',       '2026-07-09 18:00:00+00', 90),
(49,'FP3',       '2026-07-10 12:00:00+00', 60),
(49,'Hyperpole', '2026-07-10 16:00:00+00', 30),
(49,'Course',    '2026-07-11 14:00:00+00', 360);

-- R6 COTA (Sep)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(50,'FP1',       '2026-09-17 17:00:00+00', 90),
(50,'FP2',       '2026-09-17 21:00:00+00', 90),
(50,'FP3',       '2026-09-18 16:00:00+00', 60),
(50,'Hyperpole', '2026-09-18 20:00:00+00', 30),
(50,'Course',    '2026-09-19 18:00:00+00', 360);

-- R7 Fuji (Oct)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(51,'FP1',       '2026-10-08 01:00:00+00', 90),
(51,'FP2',       '2026-10-08 06:00:00+00', 90),
(51,'FP3',       '2026-10-09 01:00:00+00', 60),
(51,'Hyperpole', '2026-10-09 05:00:00+00', 30),
(51,'Course',    '2026-10-10 02:00:00+00', 360);

-- R8 Bahreïn (Nov)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(52,'FP1',       '2026-11-05 09:00:00+00', 90),
(52,'FP2',       '2026-11-05 14:00:00+00', 90),
(52,'FP3',       '2026-11-06 09:00:00+00', 60),
(52,'Hyperpole', '2026-11-06 13:00:00+00', 30),
(52,'Course',    '2026-11-07 13:00:00+00', 360);

-- ══════════════════════════════════════════════════════════════════
-- ELMS — Structure : FP1(90min), FP2(90min), Qualifs, Course (4H)
-- ══════════════════════════════════════════════════════════════════

-- R1 Barcelone (11-12 Avr)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(53,'FP1',    '2026-04-10 08:50:00+00', 90),
(53,'FP2',    '2026-04-11 08:10:00+00', 90),
(53,'Qualifs','2026-04-11 13:05:00+00', 60),
(53,'Course', '2026-04-12 10:00:00+00', 240);

-- R2 Paul Ricard (Mai)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(54,'FP1',    '2026-05-14 08:00:00+00', 90),
(54,'FP2',    '2026-05-15 08:00:00+00', 90),
(54,'Qualifs','2026-05-15 13:00:00+00', 60),
(54,'Course', '2026-05-16 10:00:00+00', 240);

-- R3 Imola (Jun)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(55,'FP1',    '2026-06-25 08:00:00+00', 90),
(55,'FP2',    '2026-06-26 08:00:00+00', 90),
(55,'Qualifs','2026-06-26 13:00:00+00', 60),
(55,'Course', '2026-06-27 10:00:00+00', 240);

-- R4 Spa (Jul)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(56,'FP1',    '2026-07-30 08:00:00+00', 90),
(56,'FP2',    '2026-07-31 08:00:00+00', 90),
(56,'Qualifs','2026-07-31 13:00:00+00', 60),
(56,'Course', '2026-08-01 10:00:00+00', 240);

-- R5 Silverstone (Sep)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(57,'FP1',    '2026-09-10 08:00:00+00', 90),
(57,'FP2',    '2026-09-11 08:00:00+00', 90),
(57,'Qualifs','2026-09-11 13:00:00+00', 60),
(57,'Course', '2026-09-12 10:00:00+00', 240);

-- R6 Portimão (Oct)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(58,'FP1',    '2026-10-22 08:00:00+00', 90),
(58,'FP2',    '2026-10-23 08:00:00+00', 90),
(58,'Qualifs','2026-10-23 13:00:00+00', 60),
(58,'Course', '2026-10-24 10:00:00+00', 240);

-- ══════════════════════════════════════════════════════════════════
-- GTWCE — Structure : FP(60min), Qualifs, Course (3H ou 24H)
-- ══════════════════════════════════════════════════════════════════

-- R1 Paul Ricard (11 Avr)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(70,'FP',     '2026-04-09 08:00:00+00', 60),
(70,'Qualifs','2026-04-10 08:00:00+00', 30),
(70,'Course', '2026-04-11 11:00:00+00', 180);

-- R2 Monza
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(88,'FP',     '2026-05-14 08:00:00+00', 60),
(88,'Qualifs','2026-05-15 08:00:00+00', 30),
(88,'Course', '2026-05-16 11:00:00+00', 180);

-- R3 24H Spa (25-28 Jun)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(71,'FP1',    '2026-06-23 08:00:00+00', 90),
(71,'FP2',    '2026-06-23 14:00:00+00', 90),
(71,'FP3',    '2026-06-24 08:00:00+00', 90),
(71,'Qualifs','2026-06-24 15:00:00+00', 60),
(71,'Course', '2026-06-25 16:00:00+00', 1440);

-- R4 (Nürburgring ou autre — à confirmer)
-- R5 Portimão
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(74,'FP',     '2026-10-08 08:00:00+00', 60),
(74,'Qualifs','2026-10-09 08:00:00+00', 30),
(74,'Course', '2026-10-10 11:00:00+00', 180);

-- ══════════════════════════════════════════════════════════════════
-- IMSA — Structure : FP(90min), Qualifs, Course (durée variable)
-- ══════════════════════════════════════════════════════════════════

-- R1 Rolex 24 Daytona (23-25 Jan)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(59,'FP1',    '2026-01-21 16:00:00+00', 90),
(59,'FP2',    '2026-01-22 14:00:00+00', 90),
(59,'Qualifs','2026-01-22 21:00:00+00', 60),
(59,'Course', '2026-01-23 22:40:00+00', 1440);

-- R2 12H Sebring (Mar)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(60,'FP1',    '2026-03-18 16:00:00+00', 90),
(60,'FP2',    '2026-03-19 14:00:00+00', 90),
(60,'Qualifs','2026-03-19 18:00:00+00', 30),
(60,'Course', '2026-03-20 14:00:00+00', 720);

-- R3 100min Long Beach (Avr)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(61,'FP',     '2026-04-17 18:00:00+00', 60),
(61,'Qualifs','2026-04-17 22:00:00+00', 30),
(61,'Course', '2026-04-18 20:45:00+00', 100);

-- R4 2h40 Laguna Seca (Mai)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(62,'FP',     '2026-05-01 19:00:00+00', 90),
(62,'Qualifs','2026-05-01 23:00:00+00', 30),
(62,'Course', '2026-05-02 20:35:00+00', 160);

-- R5 100min Detroit (Jun)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(63,'FP',     '2026-06-05 18:00:00+00', 60),
(63,'Qualifs','2026-06-05 22:00:00+00', 30),
(63,'Course', '2026-06-06 20:45:00+00', 100);

-- R6 6H Watkins Glen (Jul)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(64,'FP1',    '2026-07-10 16:00:00+00', 90),
(64,'FP2',    '2026-07-11 14:00:00+00', 90),
(64,'Qualifs','2026-07-11 18:00:00+00', 30),
(64,'Course', '2026-07-12 15:10:00+00', 360);

-- R7 2h40 Canadian Tire (Jul)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(65,'FP',     '2026-07-17 17:00:00+00', 90),
(65,'Qualifs','2026-07-17 22:00:00+00', 30),
(65,'Course', '2026-07-18 18:35:00+00', 160);

-- R8 6H Road America (Aout)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(66,'FP1',    '2026-08-07 17:00:00+00', 90),
(66,'FP2',    '2026-08-08 15:00:00+00', 90),
(66,'Qualifs','2026-08-08 19:00:00+00', 30),
(66,'Course', '2026-08-09 16:10:00+00', 360);

-- R9 2h40 VIR (Sep)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(67,'FP',     '2026-09-04 17:00:00+00', 90),
(67,'Qualifs','2026-09-04 22:00:00+00', 30),
(67,'Course', '2026-09-05 18:35:00+00', 160);

-- R10 Battle on the Bricks Indianapolis (Sep)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(68,'FP',     '2026-09-25 17:00:00+00', 90),
(68,'Qualifs','2026-09-25 22:00:00+00', 30),
(68,'Course', '2026-09-26 18:00:00+00', 160);

-- R11 Petit Le Mans Road Atlanta (Oct)
INSERT INTO sessions (race_id, type, datetime_utc, duration_min) VALUES
(69,'FP1',    '2026-10-08 17:00:00+00', 90),
(69,'FP2',    '2026-10-09 15:00:00+00', 90),
(69,'Qualifs','2026-10-09 19:00:00+00', 30),
(69,'Course', '2026-10-10 17:05:00+00', 600);

SELECT series_id, COUNT(*) as sessions
FROM sessions s
JOIN races r ON r.id = s.race_id
GROUP BY series_id
ORDER BY series_id;
