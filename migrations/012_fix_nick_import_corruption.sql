PRAGMA foreign_keys = OFF;

-- Migration 012: Fix corrupted nick V1 import data caused by last_insert_rowid() in multi-row VALUES
-- Deletes all session_logs/sets for nick imported by migration 004, then reimports correctly

-- Step 1: Delete all imported history for nick (2026-04-17 to 2026-05-10)
DELETE FROM session_sets WHERE session_log_id IN (
  SELECT id FROM session_logs WHERE athlete_id = 'nick'
    AND session_date >= '2026-04-17' AND session_date <= '2026-05-10'
);
DELETE FROM session_logs WHERE athlete_id = 'nick'
  AND session_date >= '2026-04-17' AND session_date <= '2026-05-10';

-- Step 2: Reimport with safe SELECT-based session_log_id lookups

-- 2026-04-17 | Strength Pull | Conventional Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-17', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Conventional Deadlift'),
  'Conventional Deadlift', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 60, 6 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-17' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 60, 6 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-17' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 60, 6 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-17' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-17 | Strength Pull | Pull Up
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-17', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up'),
  'Pull Up', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 10, 6 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-17' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 10, 5 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-17' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 10, 4 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-17' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-17 | Strength Pull | T-Bar Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-17', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'T-Bar Row'),
  'T-Bar Row', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 20, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-17' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 20, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-17' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 20, 8 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-17' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-17 | Strength Pull | Hammer Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-17', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Hammer Curl'),
  'Hammer Curl', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 15, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-17' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 15, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-17' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 15, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-17' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-17 | Strength Pull | Leg Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-17', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Leg Raise'),
  'Leg Raise', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 4 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-17' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-19 | Volume Push | Chest Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-19', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Press'),
  'Chest Press', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-19' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 55, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-19' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-19 | Volume Push | Chest Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-19', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Press'),
  'Chest Press', 'last set too heavy';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-19' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 55, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-19' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 60, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-19' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 70, 7 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-19' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-19 | Volume Push | Incline Dumbbell Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-19', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Dumbbell Press'),
  'Incline Dumbbell Press', 'Pulled back weight on last set to get more volume';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 15, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-19' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 15, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-19' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 12.5, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-19' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-24 | Strength Pull | Conventional Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-24', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Conventional Deadlift'),
  'Conventional Deadlift', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 80, 5 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-24' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 80, 4 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-24' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 60, 4 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-24' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-24 | Strength Pull | Pull Up
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-24', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up'),
  'Pull Up', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-24' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 7 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-24' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 9 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-24' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-24 | Strength Pull | T-Bar Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-24', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'T-Bar Row'),
  'T-Bar Row', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 7 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-24' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 6 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-24' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 30, 6 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-24' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-24 | Strength Pull | Hammer Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-24', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Hammer Curl'),
  'Hammer Curl', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 10, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-24' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 10, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-24' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 10, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-24' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-24 | Strength Pull | Leg Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-24', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Leg Raise'),
  'Leg Raise', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 8 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-24' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 8 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-24' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 8 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-24' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-26 | Volume Push | Chest Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-26', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Press'),
  'Chest Press', 'Failed on 7th rep second and third set, too heavy';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 60, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-26' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 60, 6 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-26' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 60, 6 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-26' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-26 | Volume Push | Incline Dumbbell Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-26', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Dumbbell Press'),
  'Incline Dumbbell Press', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 15, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-26' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 15, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-26' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 15, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-26' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-26 | Volume Push | Chest Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-26', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Fly'),
  'Chest Fly', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-26' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 25, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-26' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 25, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-26' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-26 | Volume Push | Lateral Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-26', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lateral Raise'),
  'Lateral Raise', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 7.5, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-26' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 7.5, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-26' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 7.5, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-26' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-26 | Volume Push | Skull Crusher
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-26', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Skull Crusher'),
  'Skull Crusher', 'Last set was practicing form';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 44, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-26' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 44, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-26' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 22, 8 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-26' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-27 | Volume Pull | Bent Over Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-27', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bent Over Row'),
  'Bent Over Row', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 40, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-27' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 50, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-27' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 60, 8 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-27' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-27 | Volume Pull | Pull Up (Pronated)
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-27', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up (Pronated)'),
  'Pull Up (Pronated)', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 9 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-27' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 5 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-27' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 6 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-27' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-27 | Volume Pull | Rear Delt Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-27', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Rear Delt Fly'),
  'Rear Delt Fly', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 25, 15 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-27' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 25, 15 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-27' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 25, 15 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-27' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-29 | Strength Legs | High Bar Squat
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-29', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'High Bar Squat'),
  'High Bar Squat', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 60, 8 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-29' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 60, 8 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-29' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 60, 8 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-29' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-29 | Strength Legs | Stiff Leg Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-04-29', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Stiff Leg Deadlift'),
  'Stiff Leg Deadlift', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 60, 6 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-29' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 60, 6 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-29' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 40, 8 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-04-29' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-01 | Strength Pull | Conventional Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-01', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Conventional Deadlift'),
  'Conventional Deadlift', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 60, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-01' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 70, 6 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-01' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 70, 6 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-01' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-01 | Strength Pull | Pull Up
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-01', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up'),
  'Pull Up', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-01' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-01' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 7 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-01' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-01 | Strength Pull | T-Bar Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-01', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'T-Bar Row'),
  'T-Bar Row', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 20, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-01' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 20, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-01' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 20, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-01' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-01 | Strength Pull | Hammer Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-01', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Hammer Curl'),
  'Hammer Curl', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 12.5, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-01' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 12.5, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-01' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 12.5, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-01' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-01 | Strength Pull | Leg Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-01', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Leg Raise'),
  'Leg Raise', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-01' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 7 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-01' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 7 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-01' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-03 | Volume Push | Chest Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-03', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Press'),
  'Chest Press', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-03' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 50, 9 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-03' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 50, 8 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-03' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-03 | Volume Push | Incline Dumbbell Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-03', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Dumbbell Press'),
  'Incline Dumbbell Press', '17.5 was too heavy on last set';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 15, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-03' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 17.5, 8 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-03' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 17.5, 5 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-03' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-03 | Volume Push | Chest Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-03', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Fly'),
  'Chest Fly', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-03' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-03' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 30, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-03' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-03 | Volume Push | Lateral Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-03', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lateral Raise'),
  'Lateral Raise', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 7.5, 15 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-03' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 7.5, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-03' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 7.5, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-03' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-04 | Volume Pull | Bent Over Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-04', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bent Over Row'),
  'Bent Over Row', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 60, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-04' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 60, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-04' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 60, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-04' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-04 | Volume Pull | Pull Up (Pronated)
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-04', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up (Pronated)'),
  'Pull Up (Pronated)', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-04' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-04' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 8 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-04' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-04 | Volume Pull | Low Cable Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-04', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Low Cable Row'),
  'Low Cable Row', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-04' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-04' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 30, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-04' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-04 | Volume Pull | Rear Delt Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-04', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Rear Delt Fly'),
  'Rear Delt Fly', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 15 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-04' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 15 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-04' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 30, 15 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-04' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-04 | Volume Pull | Shrugs
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-04', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Shrugs'),
  'Shrugs', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 60, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-04' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 60, 15 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-04' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 60, 15 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-04' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-04 | Volume Pull | Lat Pullover
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-04', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lat Pullover'),
  'Lat Pullover', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-04' AND exercise_name='Lat Pullover'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-04' AND exercise_name='Lat Pullover'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 30, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-04' AND exercise_name='Lat Pullover'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-06 | Strength Legs | High Bar Squat
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-06', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'High Bar Squat'),
  'High Bar Squat', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 70, 6 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-06' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 70, 7 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-06' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 70, 7 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-06' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-06 | Strength Legs | Stiff Leg Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-06', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Stiff Leg Deadlift'),
  'Stiff Leg Deadlift', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 8 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-06' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 50, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-06' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 50, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-06' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-06 | Strength Legs | Back Extension
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-06', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Back Extension'),
  'Back Extension', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-06' AND exercise_name='Back Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-06' AND exercise_name='Back Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-06' AND exercise_name='Back Extension'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-08 | Strength Pull | Conventional Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-08', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Conventional Deadlift'),
  'Conventional Deadlift', 'Focus on reset in bottom position';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 80, 6 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-08' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 80, 6 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-08' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 80, 7 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-08' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-08 | Strength Pull | Pull Up
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-08', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up'),
  'Pull Up', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-08' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-08' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-08' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-08 | Strength Pull | T-Bar Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-08', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'T-Bar Row'),
  'T-Bar Row', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 25, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-08' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 25, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-08' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 25, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-08' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-10 | Volume Push | Chest Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-10', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Press'),
  'Chest Press', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 60, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-10' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 60, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-10' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 60, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-10' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-10 | Volume Push | Incline Dumbbell Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-10', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Dumbbell Press'),
  'Incline Dumbbell Press', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 17.5, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-10' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 17.5, 9 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-10' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 17.5, 9 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-10' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-10 | Volume Push | Chest Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-10', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Fly'),
  'Chest Fly', 'Stay at same weight 1 more week then go up, focus on form';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 35, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-10' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 35, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-10' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 35, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-10' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-10 | Volume Push | Lateral Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-10', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lateral Raise'),
  'Lateral Raise', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 10, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-10' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 10, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-10' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 10, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-10' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-10 | Volume Push | Skull Crusher
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'nick', '2026-05-10', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Skull Crusher'),
  'Skull Crusher', NULL;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 15, 12 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-10' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 20, 8 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-10' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 20, 10 FROM session_logs
  WHERE athlete_id='nick' AND session_date='2026-05-10' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
