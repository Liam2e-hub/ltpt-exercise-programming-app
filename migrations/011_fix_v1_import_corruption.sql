PRAGMA foreign_keys = OFF;

-- Migration 011: Fix corrupted V1 import data caused by last_insert_rowid() in multi-row VALUES
-- Deletes all session_logs/sets for liam imported by migration 003, then reimports correctly

-- Step 1: Delete all imported history for liam (2026-03-17 to 2026-05-11)
DELETE FROM session_sets WHERE session_log_id IN (
  SELECT id FROM session_logs WHERE athlete_id = 'liam'
    AND session_date >= '2026-03-17' AND session_date <= '2026-05-11'
);
DELETE FROM session_logs WHERE athlete_id = 'liam'
  AND session_date >= '2026-03-17' AND session_date <= '2026-05-11';

-- Step 2: Reimport with safe SELECT-based session_log_id lookups

-- 2026-05-11 | Volume Pull | Lat Pullover
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-11', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lat Pullover'),
  'Lat Pullover', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-11' AND exercise_name='Lat Pullover'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 50, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-11' AND exercise_name='Lat Pullover'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 50, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-11' AND exercise_name='Lat Pullover'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-11 | Volume Pull | Shrugs
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-11', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Shrugs'),
  'Shrugs', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 13 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-11' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-11' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 90, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-11' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-11 | Volume Pull | Rear Delt Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-11', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Rear Delt Fly'),
  'Rear Delt Fly', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 56, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-11' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 56, 13 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-11' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 56, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-11' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-11 | Volume Pull | Low Cable Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-11', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Low Cable Row'),
  'Low Cable Row', 'Pronated - belt on last 2 sets';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 65, 14 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-11' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 65, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-11' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 65, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-11' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-11 | Volume Pull | Pull Up (Pronated)
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-11', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up (Pronated)'),
  'Pull Up (Pronated)', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 10, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-11' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 10, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-11' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-11' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-11 | Volume Pull | Bent Over Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-11', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bent Over Row'),
  'Bent Over Row', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-11' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-11' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-11' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-10 | Volume Push | Skull Crusher
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-10', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Skull Crusher'),
  'Skull Crusher', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 35, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-10' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 35, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-10' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 35, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-10' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-10 | Volume Push | Lateral Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-10', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lateral Raise'),
  'Lateral Raise', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 15, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-10' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 15, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-10' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 15, 14 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-10' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-10 | Volume Push | Chest Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-10', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Fly'),
  'Chest Fly', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 70, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-10' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 70, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-10' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 70, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-10' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-10 | Volume Push | Incline Dumbbell Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-10', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Dumbbell Press'),
  'Incline Dumbbell Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-10' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-10' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 30, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-10' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-10 | Volume Push | Chest Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-10', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Press'),
  'Chest Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-10' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-10' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-10' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-08 | Strength Pull | Hammer Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-08', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Hammer Curl'),
  'Hammer Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 22.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-08' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 22.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-08' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 22.5, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-08' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-08 | Strength Pull | T-Bar Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-08', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'T-Bar Row'),
  'T-Bar Row', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 55, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-08' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 55, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-08' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 55, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-08' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-08 | Strength Pull | Pull Up
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-08', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up'),
  'Pull Up', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-08' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-08' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-08' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-08 | Strength Pull | Conventional Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-08', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Conventional Deadlift'),
  'Conventional Deadlift', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 170, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-08' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 170, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-08' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 170, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-08' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-07 | Strength Push | Chest Fly Bent Over
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-07', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Fly Bent Over'),
  'Chest Fly Bent Over', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 16, 20 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-07' AND exercise_name='Chest Fly Bent Over'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-07 | Strength Push | DeadBug
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-07', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'DeadBug'),
  'DeadBug', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 9, 20 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-07' AND exercise_name='DeadBug'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 9, 20 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-07' AND exercise_name='DeadBug'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 9, 16 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-07' AND exercise_name='DeadBug'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-07 | Strength Push | Tricep Pushdown
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-07', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Tricep Pushdown'),
  'Tricep Pushdown', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 40, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-07' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 35, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-07' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 35, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-07' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-07 | Strength Push | Bench Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-07', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bench Press'),
  'Bench Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 35, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-07' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 35, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-07' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 35, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-07' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-07 | Strength Push | Overhead Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-07', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Overhead Press'),
  'Overhead Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 60, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-07' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 60, 5 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-07' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 60, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-07' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-07 | Strength Push | Incline Bench Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-07', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Bench Press'),
  'Incline Bench Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 85, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-07' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 85, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-07' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 85, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-07' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-06 | Strength Legs | Plate Elevated Close Stance Squat
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-06', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Plate Elevated Close Stance Squat'),
  'Plate Elevated Close Stance Squat', 'Single leg extension';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-06' AND exercise_name='Plate Elevated Close Stance Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 50, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-06' AND exercise_name='Plate Elevated Close Stance Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 50, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-06' AND exercise_name='Plate Elevated Close Stance Squat'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-06 | Strength Legs | Stiff Leg Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-06', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Stiff Leg Deadlift'),
  'Stiff Leg Deadlift', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 110, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-06' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 110, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-06' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 90, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-06' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-06 | Strength Legs | High Bar Squat
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-06', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'High Bar Squat'),
  'High Bar Squat', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 140, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-06' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 120, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-06' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 120, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-06' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-05 | Abs & Arms | Leg Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-05', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Leg Raise'),
  'Leg Raise', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-05' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-05' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-05 | Abs & Arms | Preacher Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-05', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Preacher Curl'),
  'Preacher Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 25, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-05' AND exercise_name='Preacher Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 25, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-05' AND exercise_name='Preacher Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 25, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-05' AND exercise_name='Preacher Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-05 | Abs & Arms | Single Arm Tricep Extension
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-05', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Single Arm Tricep Extension'),
  'Single Arm Tricep Extension', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 10, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-05' AND exercise_name='Single Arm Tricep Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 10, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-05' AND exercise_name='Single Arm Tricep Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 10, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-05' AND exercise_name='Single Arm Tricep Extension'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-05 | Abs & Arms | Bicep Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-05', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bicep Curl'),
  'Bicep Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 17.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-05' AND exercise_name='Bicep Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 17.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-05' AND exercise_name='Bicep Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 17.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-05' AND exercise_name='Bicep Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-05 | Abs & Arms | Dips
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-05', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Dips'),
  'Dips', 'Arms were tingiling in forearm so stopped';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 10, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-05' AND exercise_name='Dips'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 10, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-05' AND exercise_name='Dips'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 10, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-05' AND exercise_name='Dips'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-05 | Abs & Arms | Ab Roller
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-05', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Ab Roller'),
  'Ab Roller', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-05' AND exercise_name='Ab Roller'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-05' AND exercise_name='Ab Roller'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-05' AND exercise_name='Ab Roller'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-04 | Volume Pull | Lat Pullover
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-04', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lat Pullover'),
  'Lat Pullover', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-04' AND exercise_name='Lat Pullover'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 50, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-04' AND exercise_name='Lat Pullover'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 50, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-04' AND exercise_name='Lat Pullover'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-04 | Volume Pull | Shrugs
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-04', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Shrugs'),
  'Shrugs', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-04' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-04' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-04' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-04 | Volume Pull | Rear Delt Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-04', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Rear Delt Fly'),
  'Rear Delt Fly', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 56, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-04' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 56, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-04' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 56, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-04' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-04 | Volume Pull | Low Cable Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-04', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Low Cable Row'),
  'Low Cable Row', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 65, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-04' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 65, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-04' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 65, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-04' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-04 | Volume Pull | Pull Up (Pronated)
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-04', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up (Pronated)'),
  'Pull Up (Pronated)', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-04' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-04' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-04' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-04 | Volume Pull | Bent Over Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-04', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bent Over Row'),
  'Bent Over Row', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-04' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-04' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-04' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-03 | Volume Push | Skull Crusher
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-03', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Skull Crusher'),
  'Skull Crusher', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 35, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-03' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 35, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-03' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 35, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-03' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-03 | Volume Push | Lateral Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-03', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lateral Raise'),
  'Lateral Raise', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 15, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-03' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 15, 14 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-03' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 15, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-03' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-03 | Volume Push | Chest Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-03', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Fly'),
  'Chest Fly', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 70, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-03' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 70, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-03' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 70, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-03' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-03 | Volume Push | Incline Dumbbell Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-03', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Dumbbell Press'),
  'Incline Dumbbell Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-03' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-03' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 30, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-03' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-03 | Volume Push | Chest Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-03', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Press'),
  'Chest Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-03' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-03' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-03' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-01 | Strength Pull | Leg Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-01', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Leg Raise'),
  'Leg Raise', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-01' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-01' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-01 | Strength Pull | Hammer Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-01', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Hammer Curl'),
  'Hammer Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 22.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-01' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 22.5, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-01' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 22.5, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-01' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-01 | Strength Pull | T-Bar Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-01', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'T-Bar Row'),
  'T-Bar Row', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-01' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 50, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-01' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 50, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-01' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-01 | Strength Pull | Pull Up
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-01', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up'),
  'Pull Up', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-01' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-01' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-01' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;

-- 2026-05-01 | Strength Pull | Conventional Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-05-01', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Conventional Deadlift'),
  'Conventional Deadlift', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 170, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-01' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 170, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-01' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 170, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-05-01' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-30 | Strength Push | Tricep Pushdown
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-30', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Tricep Pushdown'),
  'Tricep Pushdown', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 35, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-30' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 35, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-30' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 35, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-30' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-30 | Strength Push | Bench Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-30', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bench Press'),
  'Bench Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 35, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-30' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 35, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-30' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-30' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-30 | Strength Push | Overhead Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-30', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Overhead Press'),
  'Overhead Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 60, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-30' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 60, 5 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-30' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 60, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-30' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-30 | Strength Push | Incline Bench Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-30', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Bench Press'),
  'Incline Bench Press', 'Good form';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 80, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-30' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 80, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-30' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 80, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-30' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-29 | Strength Legs | Back Extension
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-29', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Back Extension'),
  'Back Extension', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 25, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-29' AND exercise_name='Back Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 25, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-29' AND exercise_name='Back Extension'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-29 | Strength Legs | Stiff Leg Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-29', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Stiff Leg Deadlift'),
  'Stiff Leg Deadlift', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 110, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-29' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 110, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-29' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 110, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-29' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-29 | Strength Legs | High Bar Squat
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-29', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'High Bar Squat'),
  'High Bar Squat', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 140, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-29' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 140, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-29' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 140, 3 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-29' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-27 | Volume Pull | Lat Pullover
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-27', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lat Pullover'),
  'Lat Pullover', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 45, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-27' AND exercise_name='Lat Pullover'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 45, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-27' AND exercise_name='Lat Pullover'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 45, 14 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-27' AND exercise_name='Lat Pullover'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-27 | Volume Pull | Shrugs
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-27', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Shrugs'),
  'Shrugs', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-27' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-27' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-27' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-27 | Volume Pull | Pull Up (Pronated)
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-27', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up (Pronated)'),
  'Pull Up (Pronated)', 'Feeling pretty tired today - next week make sure to take proper rest';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-27' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-27' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-27' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-27 | Volume Pull | Bent Over Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-27', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bent Over Row'),
  'Bent Over Row', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-27' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-27' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-27' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-26 | Volume Push | Skull Crusher
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-26', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Skull Crusher'),
  'Skull Crusher', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 35, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-26' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 35, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-26' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 35, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-26' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-26 | Volume Push | Lateral Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-26', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lateral Raise'),
  'Lateral Raise', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 15, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-26' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 15, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-26' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 15, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-26' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-26 | Volume Push | Chest Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-26', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Fly'),
  'Chest Fly', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 63, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-26' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 63, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-26' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 63, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-26' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-26 | Volume Push | Incline Dumbbell Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-26', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Dumbbell Press'),
  'Incline Dumbbell Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-26' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-26' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 30, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-26' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-26 | Volume Push | Chest Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-26', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Press'),
  'Chest Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-26' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-26' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-26' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-24 | Strength Pull | Conventional Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-24', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Conventional Deadlift'),
  'Conventional Deadlift', 'Deload';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 140, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-24' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 140, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-24' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-23 | Strength Push | Chest Fly Bent Over
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-23', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Fly Bent Over'),
  'Chest Fly Bent Over', 'Deload';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 0 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-23' AND exercise_name='Chest Fly Bent Over'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-23 | Strength Push | DeadBug
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-23', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'DeadBug'),
  'DeadBug', 'Deload';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 0 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-23' AND exercise_name='DeadBug'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-23 | Strength Push | Tricep Pushdown
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-23', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Tricep Pushdown'),
  'Tricep Pushdown', 'Deload';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-23' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-23' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 30, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-23' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-23 | Strength Push | Bench Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-23', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bench Press'),
  'Bench Press', 'Deload';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-23' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-23' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 30, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-23' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-23 | Strength Push | Overhead Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-23', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Overhead Press'),
  'Overhead Press', 'Deload';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-23' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 50, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-23' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 50, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-23' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-23 | Strength Push | Incline Bench Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-23', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Bench Press'),
  'Incline Bench Press', 'Deload';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 85, 5 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-23' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 70, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-23' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 70, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-23' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-20 | Volume Pull | Bent Over Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-20', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bent Over Row'),
  'Bent Over Row', 'Felt sick before today’s workout - not great form';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-20' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-20' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-20' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-19 | Volume Push | Skull Crusher
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-19', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Skull Crusher'),
  'Skull Crusher', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 30, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-19 | Volume Push | Lateral Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-19', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lateral Raise'),
  'Lateral Raise', 'Felt heavy today';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 15, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 15, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 15, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-19 | Volume Push | Chest Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-19', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Fly'),
  'Chest Fly', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 63, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 63, 13 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 63, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Chest Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-19 | Volume Push | Incline Dumbbell Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-19', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Dumbbell Press'),
  'Incline Dumbbell Press', 'Last set last 2 reps assisted';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-19 | Volume Push | Chest Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-19', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Press'),
  'Chest Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 90, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 95, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 95, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 95, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-19 | Volume Push | Chest Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-19', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Press'),
  'Chest Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 90, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 95, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 95, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 95, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-19 | Volume Push | Chest Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-19', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Press'),
  'Chest Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 90, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 95, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 95, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-19' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-17 | Abs & Arms | Bicep Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-17', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bicep Curl'),
  'Bicep Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 17.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Bicep Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 20, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Bicep Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 20, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Bicep Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-17 | Abs & Arms | Leg Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-17', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Leg Raise'),
  'Leg Raise', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-17 | Abs & Arms | Crunch
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-17', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Crunch'),
  'Crunch', 'Bodyweight';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Crunch'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Crunch'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Crunch'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-17 | Abs & Arms | Dips
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-17', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Dips'),
  'Dips', '+10kg';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 10, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Dips'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 10, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Dips'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 10, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Dips'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-17 | Abs & Arms | Preacher Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-17', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Preacher Curl'),
  'Preacher Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 22.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Preacher Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 22.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Preacher Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 22.5, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Preacher Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-17 | Abs & Arms | Single Arm Tricep Extension
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-17', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Single Arm Tricep Extension'),
  'Single Arm Tricep Extension', 'Potentially fatigued from previous heavy delt work';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 10, 14 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Single Arm Tricep Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 10, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Single Arm Tricep Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 10, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Single Arm Tricep Extension'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-17 | Strength Pull | Leg Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-17', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Leg Raise'),
  'Leg Raise', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-17 | Strength Pull | Hammer Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-17', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Hammer Curl'),
  'Hammer Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 22.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 22.5, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 22.5, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-17 | Strength Pull | T-Bar Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-17', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'T-Bar Row'),
  'T-Bar Row', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 50, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 50, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-17 | Strength Pull | Pull Up
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-17', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up'),
  'Pull Up', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 10, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 10, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 10, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-17 | Strength Pull | Conventional Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-17', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Conventional Deadlift'),
  'Conventional Deadlift', 'Wrong rep range to start';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 160, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 160, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 170, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-17' AND exercise_name='Conventional Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-16 | Strength Pull | Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-16', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Deadlift'),
  'Deadlift', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 160, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-16' AND exercise_name='Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 170, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-16' AND exercise_name='Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 170, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-16' AND exercise_name='Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-16 | Strength Pull | T-Bar Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-16', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'T-Bar Row'),
  'T-Bar Row', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-16' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 50, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-16' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 50, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-16' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-16 | Strength Pull | Hammer Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-16', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Hammer Curl'),
  'Hammer Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 22.5, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-16' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 22.5, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-16' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 22.5, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-16' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-16 | Strength Pull | Pull Up
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-16', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up'),
  'Pull Up', '+10kg added';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 10, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-16' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 10, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-16' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 10, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-16' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-15 | Strength Push | Tricep Pushdown
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-15', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Tricep Pushdown'),
  'Tricep Pushdown', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 35, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-15' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 35, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-15' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 35, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-15' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-15 | Strength Push | Bench Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-15', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bench Press'),
  'Bench Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 35, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-15' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 35, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-15' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 35, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-15' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-15 | Strength Push | Deadbug
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-15', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Deadbug'),
  'Deadbug', 'Proper form';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 7.5, 20 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-15' AND exercise_name='Deadbug'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 7.5, 20 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-15' AND exercise_name='Deadbug'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-15 | Strength Push | Overhead Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-15', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Overhead Press'),
  'Overhead Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 60, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-15' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 60, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-15' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 60, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-15' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-15 | Strength Push | Incline Bench Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-15', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Bench Press'),
  'Incline Bench Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 85, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-15' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 85, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-15' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 85, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-15' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-15 | Strength Push | Cable Fly Upright
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-15', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Cable Fly Upright'),
  'Cable Fly Upright', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 25, 20 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-15' AND exercise_name='Cable Fly Upright'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 16 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-15' AND exercise_name='Cable Fly Upright'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-14 | Strength Legs | Back Extension
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-14', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Back Extension'),
  'Back Extension', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 25, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-14' AND exercise_name='Back Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 25, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-14' AND exercise_name='Back Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 25, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-14' AND exercise_name='Back Extension'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-14 | Strength Legs | High Bar Squat
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-14', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'High Bar Squat'),
  'High Bar Squat', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 140, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-14' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 140, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-14' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 140, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-14' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-14 | Strength Legs | Stiff Leg Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-14', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Stiff Leg Deadlift'),
  'Stiff Leg Deadlift', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-14' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 110, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-14' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 110, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-14' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-14 | Strength Legs | Rope Crunch
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-14', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Rope Crunch'),
  'Rope Crunch', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 75, 19 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-14' AND exercise_name='Rope Crunch'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 75, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-14' AND exercise_name='Rope Crunch'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 75, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-14' AND exercise_name='Rope Crunch'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-14 | Strength Legs | Plate Elevated Close Stance Squat
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-14', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Plate Elevated Close Stance Squat'),
  'Plate Elevated Close Stance Squat', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 80, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-14' AND exercise_name='Plate Elevated Close Stance Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 80, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-14' AND exercise_name='Plate Elevated Close Stance Squat'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-13 | Abs & Arms | Crunch
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-13', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Crunch'),
  'Crunch', 'Bodyweight';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-13' AND exercise_name='Crunch'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-13' AND exercise_name='Crunch'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 13 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-13' AND exercise_name='Crunch'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-13 | Abs & Arms | Leg Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-13', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Leg Raise'),
  'Leg Raise', 'Elbow supported to eliminate grip. First set toe to bar, 2nd and 3rd past horizontal';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-13' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-13' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-13' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-13 | Abs & Arms | Bicep Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-13', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bicep Curl'),
  'Bicep Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 17.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-13' AND exercise_name='Bicep Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 17.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-13' AND exercise_name='Bicep Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 17.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-13' AND exercise_name='Bicep Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-13 | Abs & Arms | Single Arm Tricep Extension
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-13', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Single Arm Tricep Extension'),
  'Single Arm Tricep Extension', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 10, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-13' AND exercise_name='Single Arm Tricep Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 10, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-13' AND exercise_name='Single Arm Tricep Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 10, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-13' AND exercise_name='Single Arm Tricep Extension'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-13 | Abs & Arms | Dips
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-13', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Dips'),
  'Dips', '+10kg';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 10, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-13' AND exercise_name='Dips'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 10, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-13' AND exercise_name='Dips'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 10, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-13' AND exercise_name='Dips'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-13 | Abs & Arms | Preacher Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-13', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Preacher Curl'),
  'Preacher Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 22.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-13' AND exercise_name='Preacher Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 22.5, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-13' AND exercise_name='Preacher Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 22.5, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-13' AND exercise_name='Preacher Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-12 | Volume Pull | Shrugs
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-12', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Shrugs'),
  'Shrugs', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 13 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-12 | Volume Pull | Pull Up (Pronated)
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-12', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up (Pronated)'),
  'Pull Up (Pronated)', 'Bodyweight';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-12 | Volume Pull | Low Cable Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-12', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Low Cable Row'),
  'Low Cable Row', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 60, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 60, 13 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 60, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 60, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-12 | Volume Pull | Bent Over Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-12', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bent Over Row'),
  'Bent Over Row', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-12 | Volume Pull | Rear Delt Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-12', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Rear Delt Fly'),
  'Rear Delt Fly', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 50, 13 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 50, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-12 | Volume Pull | Lat Pulldown
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-12', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lat Pulldown'),
  'Lat Pulldown', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 60, 16 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Lat Pulldown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 60, 13 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Lat Pulldown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 60, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-12' AND exercise_name='Lat Pulldown'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-11 | Volume Push | Machine Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-11', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Machine Fly'),
  'Machine Fly', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 65, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-11' AND exercise_name='Machine Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 65, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-11' AND exercise_name='Machine Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 65, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-11' AND exercise_name='Machine Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-11 | Volume Push | Incline Dumbbell Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-11', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Dumbbell Press'),
  'Incline Dumbbell Press', 'Cramped on first bit, had to reset, lost energy';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 27.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-11' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-11' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 32.5, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-11' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 32.5, 5 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-11' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-11 | Volume Push | Chest Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-11', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Press'),
  'Chest Press', 'New machine at different gym';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 85, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-11' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 85, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-11' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 85, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-11' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 85, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-11' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-11 | Volume Push | Lateral Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-11', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lateral Raise'),
  'Lateral Raise', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 15, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-11' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 15, 13 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-11' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 15, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-11' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-11 | Volume Push | Skull Crusher
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-11', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Skull Crusher'),
  'Skull Crusher', 'Skull crusher felt shit — moved to BW dips. Skull crusher 2 sets of 12 @ 30kg, 2 sets BW dips 10,8 reps';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-11' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-11' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 30, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-11' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 30, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-11' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-09 | Strength Pull | T-Bar Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-09', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'T-Bar Row'),
  'T-Bar Row', 'New gym — did single arm bent over rows 45kg instead';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 45, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-09' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 45, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-09' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 45, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-09' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-09 | Strength Pull | Hammer Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-09', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Hammer Curl'),
  'Hammer Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 22.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-09' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 22.5, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-09' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 22.5, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-09' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-09 | Strength Pull | Pull Up
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-09', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up'),
  'Pull Up', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-09' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 10, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-09' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 10, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-09' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-09 | Strength Pull | Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-09', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Deadlift'),
  'Deadlift', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 160, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-09' AND exercise_name='Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 160, 5 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-09' AND exercise_name='Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 160, 5 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-09' AND exercise_name='Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-08 | Strength Push | Bench Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-08', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bench Press'),
  'Bench Press', 'Wraps a little tight on last set';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-08' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 35, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-08' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 35, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-08' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-08 | Strength Push | Overhead Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-08', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Overhead Press'),
  'Overhead Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 55, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-08' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 55, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-08' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 55, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-08' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-08 | Strength Push | Incline Bench Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-08', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Bench Press'),
  'Incline Bench Press', 'Had a spotter for last 2 sets';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 85, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-08' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 85, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-08' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 85, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-08' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-08 | Strength Push | Tricep Pushdown
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-08', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Tricep Pushdown'),
  'Tricep Pushdown', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 35, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-08' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 35, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-08' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 35, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-08' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-08 | Strength Push | Deadbug
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-08', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Deadbug'),
  'Deadbug', 'Proper form pressing lower back into mat';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 7.5, 20 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-08' AND exercise_name='Deadbug'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 7.5, 18 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-08' AND exercise_name='Deadbug'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-08 | Strength Push | Cable Fly Upright
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-08', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Cable Fly Upright'),
  'Cable Fly Upright', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 20, 20 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-08' AND exercise_name='Cable Fly Upright'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 25, 16 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-08' AND exercise_name='Cable Fly Upright'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 25, 16 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-08' AND exercise_name='Cable Fly Upright'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-07 | Strength Legs | Rope Crunch
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-07', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Rope Crunch'),
  'Rope Crunch', 'Did 2 sets bodyweight dead hangs ~90sec each + 2 sets walking lunges 30 reps';

-- 2026-04-07 | Strength Legs | Stiff Leg Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-07', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Stiff Leg Deadlift'),
  'Stiff Leg Deadlift', 'Lower back so fucking tight!!!';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-07' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-07' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-07' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-07 | Strength Legs | Plate Elevated Close Stance Squat
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-07', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Plate Elevated Close Stance Squat'),
  'Plate Elevated Close Stance Squat', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 60, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-07' AND exercise_name='Plate Elevated Close Stance Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 80, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-07' AND exercise_name='Plate Elevated Close Stance Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 80, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-07' AND exercise_name='Plate Elevated Close Stance Squat'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-07 | Strength Legs | Back Extension
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-07', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Back Extension'),
  'Back Extension', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 25, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-07' AND exercise_name='Back Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 25, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-07' AND exercise_name='Back Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 25, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-07' AND exercise_name='Back Extension'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-07 | Strength Legs | High Bar Squat
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-07', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'High Bar Squat'),
  'High Bar Squat', 'No knee compression. Lost balance and stood too long with weight — lost confidence in last rep';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 140, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-07' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 140, 3 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-07' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 140, 3 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-07' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-06 | Abs & Arms | Bicep Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-06', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bicep Curl'),
  'Bicep Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 17.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-06' AND exercise_name='Bicep Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 17.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-06' AND exercise_name='Bicep Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 17.5, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-06' AND exercise_name='Bicep Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-06 | Abs & Arms | Preacher Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-06', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Preacher Curl'),
  'Preacher Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 20, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-06' AND exercise_name='Preacher Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 20, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-06' AND exercise_name='Preacher Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-06 | Abs & Arms | Dips
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-06', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Dips'),
  'Dips', '+10kg';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 10, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-06' AND exercise_name='Dips'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 10, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-06' AND exercise_name='Dips'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 10, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-06' AND exercise_name='Dips'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-06 | Abs & Arms | Leg Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-06', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Leg Raise'),
  'Leg Raise', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-06' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-06' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-06' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 0, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-06' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-06 | Abs & Arms | Single Arm Tricep Extension
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-06', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Single Arm Tricep Extension'),
  'Single Arm Tricep Extension', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 10, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-06' AND exercise_name='Single Arm Tricep Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 10, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-06' AND exercise_name='Single Arm Tricep Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 10, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-06' AND exercise_name='Single Arm Tricep Extension'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-06 | Abs & Arms | Crunch
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-06', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Crunch'),
  'Crunch', 'Ab Wheel Rollout';

-- 2026-04-05 | Volume Pull | Rear Delt Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-05', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Rear Delt Fly'),
  'Rear Delt Fly', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 49, 13 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 49, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 49, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-05 | Volume Pull | Pull Up (Pronated)
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-05', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up (Pronated)'),
  'Pull Up (Pronated)', 'Very tired';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-05 | Volume Pull | Bent Over Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-05', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bent Over Row'),
  'Bent Over Row', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-05 | Volume Pull | Lat Pulldown
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-05', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lat Pulldown'),
  'Lat Pulldown', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 55, 13 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Lat Pulldown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 55, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Lat Pulldown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 55, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Lat Pulldown'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-05 | Volume Pull | Low Cable Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-05', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Low Cable Row'),
  'Low Cable Row', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 55, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 55, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 55, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 55, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-05 | Volume Pull | Shrugs
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-05', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Shrugs'),
  'Shrugs', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-05' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-04 | Volume Push | Machine Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-04', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Machine Fly'),
  'Machine Fly', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 65, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-04' AND exercise_name='Machine Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 65, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-04' AND exercise_name='Machine Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 65, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-04' AND exercise_name='Machine Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-04 | Volume Push | Lateral Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-04', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lateral Raise'),
  'Lateral Raise', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 15, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-04' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 15, 13 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-04' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 15, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-04' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-04 | Volume Push | Skull Crusher
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-04', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Skull Crusher'),
  'Skull Crusher', 'Elbows painful — switched to cable pushdown with rope 25kg';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 25, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-04' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 25, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-04' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 25, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-04' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-04 | Volume Push | Incline Dumbbell Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-04', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Dumbbell Press'),
  'Incline Dumbbell Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 27.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-04' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 27.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-04' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 27.5, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-04' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 27.5, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-04' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-04 | Volume Push | Chest Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-04', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Press'),
  'Chest Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 85, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-04' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 85, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-04' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 85, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-04' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 85, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-04' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-02 | Strength Pull | Pull Up
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-02', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up'),
  'Pull Up', 'Bodyweight';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-02' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-02' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-02' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-02 | Strength Pull | Hammer Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-02', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Hammer Curl'),
  'Hammer Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 22.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-02' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 22.5, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-02' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 22.5, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-02' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-02 | Strength Pull | T-Bar Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-02', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'T-Bar Row'),
  'T-Bar Row', 'Low grip';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-02' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 50, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-02' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 50, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-02' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-02 | Strength Pull | Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-02', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Deadlift'),
  'Deadlift', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 160, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-02' AND exercise_name='Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 160, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-02' AND exercise_name='Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 160, 5 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-02' AND exercise_name='Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-01 | Strength Push | Cable Fly Upright
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-01', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Cable Fly Upright'),
  'Cable Fly Upright', '20 either side';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 20, 20 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-01' AND exercise_name='Cable Fly Upright'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 20, 20 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-01' AND exercise_name='Cable Fly Upright'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 20, 20 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-01' AND exercise_name='Cable Fly Upright'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-01 | Strength Push | Tricep Pushdown
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-01', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Tricep Pushdown'),
  'Tricep Pushdown', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 35, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-01' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 35, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-01' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 35, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-01' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-01 | Strength Push | Bench Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-01', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bench Press'),
  'Bench Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-01' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-01' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 30, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-01' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-01 | Strength Push | Deadbug
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-01', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Deadbug'),
  'Deadbug', '7.5kg each hand, better form';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 7.5, 20 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-01' AND exercise_name='Deadbug'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 7.5, 20 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-01' AND exercise_name='Deadbug'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-01 | Strength Push | Incline Bench Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-01', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Bench Press'),
  'Incline Bench Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 85, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-01' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 85, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-01' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 85, 5 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-01' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-04-01 | Strength Push | Overhead Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-04-01', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Overhead Press'),
  'Overhead Press', 'Half rep on last set';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-01' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 55, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-01' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 55, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-04-01' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-31 | Strength Legs | Stiff Leg Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-31', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Stiff Leg Deadlift'),
  'Stiff Leg Deadlift', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-31' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-31' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 5 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-31' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-31 | Strength Legs | High Bar Squat
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-31', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'High Bar Squat'),
  'High Bar Squat', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 140, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-31' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 140, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-31' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 140, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-31' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-31 | Strength Legs | Plate Elevated Close Stance Squat
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-31', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Plate Elevated Close Stance Squat'),
  'Plate Elevated Close Stance Squat', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 80, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-31' AND exercise_name='Plate Elevated Close Stance Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 80, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-31' AND exercise_name='Plate Elevated Close Stance Squat'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-31 | Strength Legs | Back Extension
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-31', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Back Extension'),
  'Back Extension', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 25, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-31' AND exercise_name='Back Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 25, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-31' AND exercise_name='Back Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 25, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-31' AND exercise_name='Back Extension'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-31 | Strength Legs | Rope Crunch
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-31', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Rope Crunch'),
  'Rope Crunch', 'Skipped';

-- 2026-03-30 | Abs & Arms | Preacher Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-30', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Preacher Curl'),
  'Preacher Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 20, 14 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-30' AND exercise_name='Preacher Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 20, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-30' AND exercise_name='Preacher Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 20, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-30' AND exercise_name='Preacher Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-30 | Abs & Arms | Bicep Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-30', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bicep Curl'),
  'Bicep Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 17.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-30' AND exercise_name='Bicep Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 17.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-30' AND exercise_name='Bicep Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 17.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-30' AND exercise_name='Bicep Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-30 | Abs & Arms | Leg Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-30', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Leg Raise'),
  'Leg Raise', 'Full range';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-30' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-30' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-30' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-30 | Abs & Arms | Dips
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-30', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Dips'),
  'Dips', '+10kg';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 10, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-30' AND exercise_name='Dips'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 10, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-30' AND exercise_name='Dips'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-30 | Abs & Arms | Crunch
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-30', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Crunch'),
  'Crunch', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 25, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-30' AND exercise_name='Crunch'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 25, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-30' AND exercise_name='Crunch'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-30 | Abs & Arms | Single Arm Tricep Extension
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-30', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Single Arm Tricep Extension'),
  'Single Arm Tricep Extension', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 10, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-30' AND exercise_name='Single Arm Tricep Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 10, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-30' AND exercise_name='Single Arm Tricep Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 10, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-30' AND exercise_name='Single Arm Tricep Extension'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-29 | Volume Pull | Lat Pulldown
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-29', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lat Pulldown'),
  'Lat Pulldown', 'Skipped';

-- 2026-03-29 | Volume Pull | Pull Up (Pronated)
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-29', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up (Pronated)'),
  'Pull Up (Pronated)', 'Bodyweight';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-29' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-29' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-29' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-29 | Volume Pull | Rear Delt Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-29', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Rear Delt Fly'),
  'Rear Delt Fly', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 42, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-29' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 49, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-29' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 49, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-29' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-29 | Volume Pull | Shrugs
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-29', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Shrugs'),
  'Shrugs', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-29' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-29' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-29' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-29 | Volume Pull | Low Cable Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-29', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Low Cable Row'),
  'Low Cable Row', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 55, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-29' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 55, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-29' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 55, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-29' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-29 | Volume Pull | Bent Over Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-29', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bent Over Row'),
  'Bent Over Row', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-29' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-29' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-29' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-28 | Volume Push | Machine Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-28', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Machine Fly'),
  'Machine Fly', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 63, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-28' AND exercise_name='Machine Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 63, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-28' AND exercise_name='Machine Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 63, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-28' AND exercise_name='Machine Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-28 | Volume Push | Skull Crusher
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-28', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Skull Crusher'),
  'Skull Crusher', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-28' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-28' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-28' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-28 | Volume Push | Incline Dumbbell Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-28', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Dumbbell Press'),
  'Incline Dumbbell Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 25, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-28' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 25, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-28' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 25, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-28' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 25, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-28' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-28 | Volume Push | Lateral Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-28', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lateral Raise'),
  'Lateral Raise', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 15, 13 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-28' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 15, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-28' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 15, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-28' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-28 | Volume Push | Chest Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-28', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Press'),
  'Chest Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 85, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-28' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 85, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-28' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 85, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-28' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 85, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-28' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-26 | Strength Pull | Hammer Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-26', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Hammer Curl'),
  'Hammer Curl', '';

-- 2026-03-26 | Strength Pull | Pull Up
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-26', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up'),
  'Pull Up', 'Strict';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-26' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-26' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-26' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-26 | Strength Pull | T-Bar Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-26', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'T-Bar Row'),
  'T-Bar Row', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-26' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 50, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-26' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 50, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-26' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-26 | Strength Pull | Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-26', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Deadlift'),
  'Deadlift', 'Fast reps, too tired';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 140, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-26' AND exercise_name='Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 140, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-26' AND exercise_name='Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-25 | Strength Push | Bench Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-25', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bench Press'),
  'Bench Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-25' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-25' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-25 | Strength Push | Incline Bench Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-25', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Bench Press'),
  'Incline Bench Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 80, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-25' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 80, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-25' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 80, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-25' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-25 | Strength Push | Tricep Pushdown
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-25', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Tricep Pushdown'),
  'Tricep Pushdown', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 35, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-25' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 35, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-25' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 35, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-25' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-25 | Strength Push | Overhead Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-25', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Overhead Press'),
  'Overhead Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-25' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 50, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-25' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 50, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-25' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-25 | Strength Push | Deadbug
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-25', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Deadbug'),
  'Deadbug', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 20, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-25' AND exercise_name='Deadbug'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 20, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-25' AND exercise_name='Deadbug'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 20, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-25' AND exercise_name='Deadbug'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-24 | Strength Legs | Stiff Leg Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-24', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Stiff Leg Deadlift'),
  'Stiff Leg Deadlift', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-24' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-24' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-24' AND exercise_name='Stiff Leg Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-24 | Strength Legs | Plate Elevated Close Stance Squat
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-24', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Plate Elevated Close Stance Squat'),
  'Plate Elevated Close Stance Squat', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 60, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-24' AND exercise_name='Plate Elevated Close Stance Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 80, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-24' AND exercise_name='Plate Elevated Close Stance Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 80, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-24' AND exercise_name='Plate Elevated Close Stance Squat'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-24 | Strength Legs | High Bar Squat
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-24', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'High Bar Squat'),
  'High Bar Squat', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 130, 5 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-24' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 135, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-24' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 135, 4 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-24' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-24 | Strength Legs | Rope Crunch
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-24', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Rope Crunch'),
  'Rope Crunch', 'Skipped';

-- 2026-03-23 | Abs & Arms | Bicep Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-23', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bicep Curl'),
  'Bicep Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 17.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Bicep Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 17.5, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Bicep Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 17.5, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Bicep Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-23 | Abs & Arms | Single Arm Tricep Extension
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-23', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Single Arm Tricep Extension'),
  'Single Arm Tricep Extension', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 15, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Single Arm Tricep Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 15, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Single Arm Tricep Extension'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-23 | Abs & Arms | Leg Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-23', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Leg Raise'),
  'Leg Raise', 'Toe to bar — back sore';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 3 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 3 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 0, 3 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Leg Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-23 | Abs & Arms | Crunch
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-23', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Crunch'),
  'Crunch', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 25, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Crunch'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 13 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Crunch'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 20, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Crunch'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 20, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Crunch'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-23 | Abs & Arms | Dips
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-23', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Dips'),
  'Dips', '+10kg';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 10, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Dips'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 10, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Dips'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 10, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Dips'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-23 | Abs & Arms | Preacher Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-23', 'Abs & Arms',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Preacher Curl'),
  'Preacher Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 20, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Preacher Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 20, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Preacher Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 20, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-23' AND exercise_name='Preacher Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-22 | Volume Pull | Rear Delt Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-22', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Rear Delt Fly'),
  'Rear Delt Fly', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 15, 17 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 42, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 42, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Rear Delt Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-22 | Volume Pull | Pull Up (Pronated)
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-22', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up (Pronated)'),
  'Pull Up (Pronated)', 'Bodyweight';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Pull Up (Pronated)'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-22 | Volume Pull | Low Cable Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-22', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Low Cable Row'),
  'Low Cable Row', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 55, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 55, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 55, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 55, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Low Cable Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-22 | Volume Pull | Bent Over Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-22', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bent Over Row'),
  'Bent Over Row', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Bent Over Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-22 | Volume Pull | Lat Pulldown
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-22', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lat Pulldown'),
  'Lat Pulldown', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 17 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Lat Pulldown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 55, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Lat Pulldown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 55, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Lat Pulldown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 55, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Lat Pulldown'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-22 | Volume Pull | Shrugs
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-22', 'Volume Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Shrugs'),
  'Shrugs', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 90, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 90, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 90, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-22' AND exercise_name='Shrugs'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-21 | Volume Push | Incline Dumbbell Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-21', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Dumbbell Press'),
  'Incline Dumbbell Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 25, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-21' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 25, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-21' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 25, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-21' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 25, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-21' AND exercise_name='Incline Dumbbell Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-21 | Volume Push | Chest Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-21', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Chest Press'),
  'Chest Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 80, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-21' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 80, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-21' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 80, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-21' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 80, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-21' AND exercise_name='Chest Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-21 | Volume Push | Skull Crusher
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-21', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Skull Crusher'),
  'Skull Crusher', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-21' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-21' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 30, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-21' AND exercise_name='Skull Crusher'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-21 | Volume Push | Lateral Raise
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-21', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Lateral Raise'),
  'Lateral Raise', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 15, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-21' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 15, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-21' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 15, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-21' AND exercise_name='Lateral Raise'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-21 | Volume Push | Machine Fly
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-21', 'Volume Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Machine Fly'),
  'Machine Fly', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 63, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-21' AND exercise_name='Machine Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 63, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-21' AND exercise_name='Machine Fly'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 63, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-21' AND exercise_name='Machine Fly'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-19 | Strength Pull | Hammer Curl
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-19', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Hammer Curl'),
  'Hammer Curl', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 20, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-19' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 20, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-19' AND exercise_name='Hammer Curl'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-19 | Strength Pull | Pull Up
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-19', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Pull Up'),
  'Pull Up', 'Bodyweight';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-19' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-19' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-19' AND exercise_name='Pull Up'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-19 | Strength Pull | Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-19', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Deadlift'),
  'Deadlift', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 140, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-19' AND exercise_name='Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 140, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-19' AND exercise_name='Deadlift'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 140, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-19' AND exercise_name='Deadlift'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-19 | Strength Pull | T-Bar Row
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-19', 'Strength Pull',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'T-Bar Row'),
  'T-Bar Row', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-19' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 50, 11 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-19' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 50, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-19' AND exercise_name='T-Bar Row'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-18 | Strength Push | Incline Bench Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-18', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Incline Bench Press'),
  'Incline Bench Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 80, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-18' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 80, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-18' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 80, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-18' AND exercise_name='Incline Bench Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-18 | Strength Push | Tricep Pushdown
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-18', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Tricep Pushdown'),
  'Tricep Pushdown', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 35, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-18' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 35, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-18' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 35, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-18' AND exercise_name='Tricep Pushdown'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-18 | Strength Push | Overhead Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-18', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Overhead Press'),
  'Overhead Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 50, 6 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-18' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 40, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-18' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 40, 9 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-18' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 4, 40, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-18' AND exercise_name='Overhead Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-18 | Strength Push | Deadbug
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-18', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Deadbug'),
  'Deadbug', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 25, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-18' AND exercise_name='Deadbug'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 25, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-18' AND exercise_name='Deadbug'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-18 | Strength Push | Bench Press
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-18', 'Strength Push',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Bench Press'),
  'Bench Press', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 25, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-18' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 30, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-18' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 30, 7 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-18' AND exercise_name='Bench Press'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-17 | Strength Legs | High Bar Squat
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-17', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'High Bar Squat'),
  'High Bar Squat', '2 sec pause. RPE 8.8';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 100, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-17' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 100, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-17' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 100, 8 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-17' AND exercise_name='High Bar Squat'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-17 | Strength Legs | Back Extension
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-17', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Back Extension'),
  'Back Extension', 'Bodyweight';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 0, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-17' AND exercise_name='Back Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 0, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-17' AND exercise_name='Back Extension'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 3, 0, 10 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-17' AND exercise_name='Back Extension'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-17 | Strength Legs | Rope Crunch
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-17', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Rope Crunch'),
  'Rope Crunch', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 60, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-17' AND exercise_name='Rope Crunch'
  ORDER BY id DESC LIMIT 1;
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 2, 60, 12 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-17' AND exercise_name='Rope Crunch'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-17 | Strength Legs | Plate Elevated Close Stance Squat
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-17', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Plate Elevated Close Stance Squat'),
  'Plate Elevated Close Stance Squat', '';
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
SELECT id, 1, 60, 15 FROM session_logs
  WHERE athlete_id='liam' AND session_date='2026-03-17' AND exercise_name='Plate Elevated Close Stance Squat'
  ORDER BY id DESC LIMIT 1;

-- 2026-03-17 | Strength Legs | Stiff Leg Deadlift
INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
SELECT 'liam', '2026-03-17', 'Strength Legs',
  (SELECT e.id FROM exercises e JOIN exercise_base eb ON e.base_id = eb.id WHERE eb.name = 'Stiff Leg Deadlift'),
  'Stiff Leg Deadlift', 'Lower back injury — skipped';
