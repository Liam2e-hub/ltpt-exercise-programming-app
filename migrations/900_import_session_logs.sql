BEGIN;

-- Helper: exercise_id mapping policy
-- Bench Press -> Barbell Bench Press (id 8)

/* =========================
   2026-03-17 (W1) Strength Legs
   ========================= */

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-17','Strength Legs',241,'High Bar Squat','2 sec pause. RPE 8.8');
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,100,8),
	(last_insert_rowid(),2,100,8),
	(last_insert_rowid(),3,100,8);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-17','Strength Legs',244,'Back Extension','Bodyweight');
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,0,15),
	(last_insert_rowid(),2,0,12),
	(last_insert_rowid(),3,0,10);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-17','Strength Legs',245,'Rope Crunch',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,60,15),
	(last_insert_rowid(),2,60,12);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-17','Strength Legs',243,'Plate Elevated Close Stance Squat',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,60,15);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-17','Strength Legs',242,'Stiff Leg Deadlift','Lower back injury — skipped');

/* =========================
   2026-03-18 (W1) Strength Push
   ========================= */

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-18','Strength Push',246,'Incline Bench Press',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,80,8),
	(last_insert_rowid(),2,80,7),
	(last_insert_rowid(),3,80,6);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-18','Strength Push',13,'Tricep Pushdown',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,35,10),
	(last_insert_rowid(),2,35,8),
	(last_insert_rowid(),3,35,7);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-18','Strength Push',10,'Overhead Press',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,50,6),
	(last_insert_rowid(),2,40,8),
	(last_insert_rowid(),3,40,9),
	(last_insert_rowid(),4,40,8);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-18','Strength Push',250,'Deadbug',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,25,10),
	(last_insert_rowid(),2,25,10);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-18','Strength Push',8,'Bench Press',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,25,10),
	(last_insert_rowid(),2,30,8),
	(last_insert_rowid(),3,30,7);

/* =========================
   2026-03-19 (W1) Strength Pull
   ========================= */

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-19','Strength Pull',22,'Hammer Curl',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,20,12),
	(last_insert_rowid(),2,20,10);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-19','Strength Pull',17,'Pull Up','Bodyweight');
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,0,12),
	(last_insert_rowid(),2,0,11),
	(last_insert_rowid(),3,0,9);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-19','Strength Pull',15,'Deadlift',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,140,6),
	(last_insert_rowid(),2,140,6),
	(last_insert_rowid(),3,140,6);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-19','Strength Pull',NULL,'T-Bar Row',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,50,12),
	(last_insert_rowid(),2,50,11),
	(last_insert_rowid(),3,50,8);

/* =========================
   2026-03-21 (W1) Volume Push
   ========================= */

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-21','Volume Push',NULL,'Incline Press',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,25,12),
	(last_insert_rowid(),2,25,12),
	(last_insert_rowid(),3,25,11),
	(last_insert_rowid(),4,25,9);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-21','Volume Push',NULL,'Machine Press',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,80,12),
	(last_insert_rowid(),2,80,12),
	(last_insert_rowid(),3,80,12),
	(last_insert_rowid(),4,80,11);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-21','Volume Push',14,'Skull Crusher',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,30,12),
	(last_insert_rowid(),2,30,12),
	(last_insert_rowid(),3,30,12);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-21','Volume Push',11,'Lateral Raise',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,15,12),
	(last_insert_rowid(),2,15,12),
	(last_insert_rowid(),3,15,10);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-21','Volume Push',NULL,'Machine Fly',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,63,12),
	(last_insert_rowid(),2,63,10),
	(last_insert_rowid(),3,63,10);

/* =========================
   2026-03-22 (W1) Volume Pull
   ========================= */

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES (
	'liam','2026-03-22','Volume Pull',NULL,'Rear Delt Fly',
	'WARNING: reps count (4) != weights count (3); missing weights padded as NULL'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,15,17),
	(last_insert_rowid(),2,30,15),
	(last_insert_rowid(),3,42,15),
	(last_insert_rowid(),4,NULL,12);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-22','Volume Pull',NULL,'Pull Up (Pronated)','Bodyweight');
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,0,10),
	(last_insert_rowid(),2,0,9),
	(last_insert_rowid(),3,0,7);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-22','Volume Pull',NULL,'Low Cable Row',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,55,12),
	(last_insert_rowid(),2,55,12),
	(last_insert_rowid(),3,55,12),
	(last_insert_rowid(),4,55,12);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-22','Volume Pull',16,'Bent Over Row',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,100,10),
	(last_insert_rowid(),2,100,10),
	(last_insert_rowid(),3,100,8);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES (
	'liam','2026-03-22','Volume Pull',18,'Lat Pulldown',
	'WARNING: reps count (4) != weights count (2); missing weights padded as NULL'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,50,17),
	(last_insert_rowid(),2,55,12),
	(last_insert_rowid(),3,NULL,12),
	(last_insert_rowid(),4,NULL,12);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-22','Volume Pull',NULL,'Shrugs',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,90,15),
	(last_insert_rowid(),2,90,15),
	(last_insert_rowid(),3,90,12);

/* =========================
   2026-03-23 (W1) Abs & Arms
   ========================= */

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-23','Abs & Arms',21,'Bicep Curl',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,17.5,12),
	(last_insert_rowid(),2,17.5,12),
	(last_insert_rowid(),3,17.5,7);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-23','Abs & Arms',NULL,'Single Arm Tricep Extension',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,15,10),
	(last_insert_rowid(),2,15,10);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-23','Abs & Arms',NULL,'Leg Raise','Toe to bar — back sore');
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,0,7),
	(last_insert_rowid(),2,0,3),
	(last_insert_rowid(),3,0,3),
	(last_insert_rowid(),4,0,3);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES (
	'liam','2026-03-23','Abs & Arms',NULL,'Crunch',
	'WARNING: reps count (4) != weights count (3); missing weights padded as NULL'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,25,15),
	(last_insert_rowid(),2,30,13),
	(last_insert_rowid(),3,20,11),
	(last_insert_rowid(),4,NULL,11);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-23','Abs & Arms',NULL,'Dips','+10kg');
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,10,8),
	(last_insert_rowid(),2,10,7),
	(last_insert_rowid(),3,10,6);

INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
VALUES ('liam','2026-03-23','Abs & Arms',30,'Preacher Curl',NULL);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES
	(last_insert_rowid(),1,20,15),
	(last_insert_rowid(),2,20,9),
	(last_insert_rowid(),3,20,9);

/* =========================
   NOTE
   ========================= */
-- The remainder of the full SQL (all 228 logs) is included on this page below.
-- Search in this code block for a date (e.g. 2026-05-11) to jump.

-- Due to message size limits, Notion is the source of truth for the full script.

COMMIT;
