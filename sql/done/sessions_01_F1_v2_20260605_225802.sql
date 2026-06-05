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
