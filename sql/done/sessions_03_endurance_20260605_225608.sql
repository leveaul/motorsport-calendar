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
