-- ============================================================
-- LTPT V3 - V1 Training History Import
-- Generated from normalized Notion staging CSVs
-- session_logs rows: 228
-- session_sets rows: 659
-- IMPORTANT: Run against preview/local D1 first, then production.
-- ============================================================

PRAGMA foreign_keys = OFF;
BEGIN TRANSACTION;

-- 2026-05-11 | Volume Pull | Lat Pullover | liam__2026-05-11__volume-pull__lat-pullover
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-11',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Lat Pullover'),
  'Lat Pullover',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 50, 15),
  (last_insert_rowid(), 2, 50, 12),
  (last_insert_rowid(), 3, 50, 10);

-- 2026-05-11 | Volume Pull | Shrugs | liam__2026-05-11__volume-pull__shrugs
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-11',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Shrugs'),
  'Shrugs',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 13),
  (last_insert_rowid(), 2, 100, 12),
  (last_insert_rowid(), 3, 90, 11);

-- 2026-05-11 | Volume Pull | Rear Delt Fly | liam__2026-05-11__volume-pull__rear-delt-fly
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-11',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Rear Delt Fly'),
  'Rear Delt Fly',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 56, 15),
  (last_insert_rowid(), 2, 56, 13),
  (last_insert_rowid(), 3, 56, 11);

-- 2026-05-11 | Volume Pull | Low Cable Row | liam__2026-05-11__volume-pull__low-cable-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-11',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Low Cable Row'),
  'Low Cable Row',
  'Pronated - belt on last 2 sets'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 65, 14),
  (last_insert_rowid(), 2, 65, 12),
  (last_insert_rowid(), 3, 65, 10);

-- 2026-05-11 | Volume Pull | Pull Up (Pronated) | liam__2026-05-11__volume-pull__pull-up-pronated
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-11',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up (Pronated)'),
  'Pull Up (Pronated)',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 10, 9),
  (last_insert_rowid(), 2, 10, 7),
  (last_insert_rowid(), 3, 0, 7);

-- 2026-05-11 | Volume Pull | Bent Over Row | liam__2026-05-11__volume-pull__bent-over-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-11',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Bent Over Row'),
  'Bent Over Row',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 10),
  (last_insert_rowid(), 2, 100, 10),
  (last_insert_rowid(), 3, 100, 10);

-- 2026-05-10 | Volume Push | Skull Crusher | liam__2026-05-10__volume-push__skull-crusher
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-10',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Skull Crusher'),
  'Skull Crusher',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 35, 11),
  (last_insert_rowid(), 2, 35, 10),
  (last_insert_rowid(), 3, 35, 7);

-- 2026-05-10 | Volume Push | Lateral Raise | liam__2026-05-10__volume-push__lateral-raise
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-10',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Lateral Raise'),
  'Lateral Raise',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 15, 15),
  (last_insert_rowid(), 2, 15, 12),
  (last_insert_rowid(), 3, 15, 14);

-- 2026-05-10 | Volume Push | Chest Fly | liam__2026-05-10__volume-push__chest-fly
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-10',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Fly'),
  'Chest Fly',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 70, 12),
  (last_insert_rowid(), 2, 70, 12),
  (last_insert_rowid(), 3, 70, 12);

-- 2026-05-10 | Volume Push | Incline Press | liam__2026-05-10__volume-push__incline-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-10',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Press'),
  'Incline Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 30, 12),
  (last_insert_rowid(), 2, 30, 12),
  (last_insert_rowid(), 3, 30, 11);

-- 2026-05-10 | Volume Push | Chest Press | liam__2026-05-10__volume-push__chest-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-10',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Press'),
  'Chest Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 12),
  (last_insert_rowid(), 2, 100, 9),
  (last_insert_rowid(), 3, 100, 8);

-- 2026-05-08 | Strength Pull | Hammer Curl | liam__2026-05-08__strength-pull__hammer-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-08',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Hammer Curl'),
  'Hammer Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 22.5, 12),
  (last_insert_rowid(), 2, 22.5, 12),
  (last_insert_rowid(), 3, 22.5, 10);

-- 2026-05-08 | Strength Pull | T-Bar Row | liam__2026-05-08__strength-pull__t-bar-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-08',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'T-Bar Row'),
  'T-Bar Row',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 55, 11),
  (last_insert_rowid(), 2, 55, 9),
  (last_insert_rowid(), 3, 55, 8);

-- 2026-05-08 | Strength Pull | Pull Up | liam__2026-05-08__strength-pull__pull-up
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-08',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up'),
  'Pull Up',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 10),
  (last_insert_rowid(), 3, 0, 10);

-- 2026-05-08 | Strength Pull | Conventional Deadlift | liam__2026-05-08__strength-pull__conventional-deadlift
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-08',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Conventional Deadlift'),
  'Conventional Deadlift',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 170, 4),
  (last_insert_rowid(), 2, 170, 4),
  (last_insert_rowid(), 3, 170, 4);

-- 2026-05-07 | Strength Push | Chest Fly Bent Over | liam__2026-05-07__strength-push__chest-fly-bent-over
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-07',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Fly Bent Over'),
  'Chest Fly Bent Over',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 16, 20),
  (last_insert_rowid(), 2, 30, NULL);

-- 2026-05-07 | Strength Push | DeadBug | liam__2026-05-07__strength-push__deadbug
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-07',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'DeadBug'),
  'DeadBug',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 9, 20),
  (last_insert_rowid(), 2, 9, 20),
  (last_insert_rowid(), 3, 9, 16);

-- 2026-05-07 | Strength Push | Tricep Pushdown | liam__2026-05-07__strength-push__tricep-pushdown
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-07',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Tricep Pushdown'),
  'Tricep Pushdown',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 40, 8),
  (last_insert_rowid(), 2, 35, 10),
  (last_insert_rowid(), 3, 35, 8);

-- 2026-05-07 | Strength Push | Bench Press | liam__2026-05-07__strength-push__bench-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-07',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Bench Press'),
  'Bench Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 35, 8),
  (last_insert_rowid(), 2, 35, 7),
  (last_insert_rowid(), 3, 35, 6);

-- 2026-05-07 | Strength Push | Overhead Press | liam__2026-05-07__strength-push__overhead-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-07',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Overhead Press'),
  'Overhead Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 60, 6),
  (last_insert_rowid(), 2, 60, 5),
  (last_insert_rowid(), 3, 60, 6);

-- 2026-05-07 | Strength Push | Incline Bench Press | liam__2026-05-07__strength-push__incline-bench-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-07',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Bench Press'),
  'Incline Bench Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 85, 7),
  (last_insert_rowid(), 2, 85, 6),
  (last_insert_rowid(), 3, 85, 6);

-- 2026-05-06 | Strength Legs | Plate Elevated Close Stance Squat | liam__2026-05-06__strength-legs__plate-elevated-close-stance-squat
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-06',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Plate Elevated Close Stance Squat'),
  'Plate Elevated Close Stance Squat',
  'Single leg extension'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 50, 12),
  (last_insert_rowid(), 2, 50, 12),
  (last_insert_rowid(), 3, 50, 12);

-- 2026-05-06 | Strength Legs | Stiff Leg Deadlift | liam__2026-05-06__strength-legs__stiff-leg-deadlift
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-06',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Stiff Leg Deadlift'),
  'Stiff Leg Deadlift',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 110, 8),
  (last_insert_rowid(), 2, 110, 8),
  (last_insert_rowid(), 3, 90, 8);

-- 2026-05-06 | Strength Legs | High Bar Squat | liam__2026-05-06__strength-legs__high-bar-squat
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-06',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'High Bar Squat'),
  'High Bar Squat',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 140, 4),
  (last_insert_rowid(), 2, 120, 8),
  (last_insert_rowid(), 3, 120, 6);

-- 2026-05-05 | Abs & Arms | Leg Raise | liam__2026-05-05__abs-and-arms__leg-raise
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-05',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Leg Raise'),
  'Leg Raise',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 12),
  (last_insert_rowid(), 2, 0, 10);

-- 2026-05-05 | Abs & Arms | Preacher Curl | liam__2026-05-05__abs-and-arms__preacher-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-05',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Preacher Curl'),
  'Preacher Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 25, 10),
  (last_insert_rowid(), 2, 25, 9),
  (last_insert_rowid(), 3, 25, 6);

-- 2026-05-05 | Abs & Arms | Single Arm Tricep Extension | liam__2026-05-05__abs-and-arms__single-arm-tricep-extension
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-05',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Single Arm Tricep Extension'),
  'Single Arm Tricep Extension',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 10, 10),
  (last_insert_rowid(), 2, 10, 10),
  (last_insert_rowid(), 3, 10, 9);

-- 2026-05-05 | Abs & Arms | Bicep Curl | liam__2026-05-05__abs-and-arms__bicep-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-05',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Bicep Curl'),
  'Bicep Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 17.5, 12),
  (last_insert_rowid(), 2, 17.5, 12),
  (last_insert_rowid(), 3, 17.5, 12);

-- 2026-05-05 | Abs & Arms | Dips | liam__2026-05-05__abs-and-arms__dips
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-05',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Dips'),
  'Dips',
  'Arms were tingiling in forearm so stopped'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 10, 9),
  (last_insert_rowid(), 2, 10, 8),
  (last_insert_rowid(), 3, 10, 4);

-- 2026-05-05 | Abs & Arms | Ab Roller | liam__2026-05-05__abs-and-arms__ab-roller
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-05',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Ab Roller'),
  'Ab Roller',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 15),
  (last_insert_rowid(), 2, 0, 15),
  (last_insert_rowid(), 3, 0, 15);

-- 2026-05-04 | Volume Pull | Lat Pullover | liam__2026-05-04__volume-pull__lat-pullover
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-04',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Lat Pullover'),
  'Lat Pullover',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 50, 15),
  (last_insert_rowid(), 2, 50, 15),
  (last_insert_rowid(), 3, 50, 15);

-- 2026-05-04 | Volume Pull | Shrugs | liam__2026-05-04__volume-pull__shrugs
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-04',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Shrugs'),
  'Shrugs',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 15),
  (last_insert_rowid(), 2, 100, 15),
  (last_insert_rowid(), 3, 100, 12);

-- 2026-05-04 | Volume Pull | Rear Delt Fly | liam__2026-05-04__volume-pull__rear-delt-fly
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-04',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Rear Delt Fly'),
  'Rear Delt Fly',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 56, 15),
  (last_insert_rowid(), 2, 56, 12),
  (last_insert_rowid(), 3, 56, 11);

-- 2026-05-04 | Volume Pull | Low Cable Row | liam__2026-05-04__volume-pull__low-cable-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-04',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Low Cable Row'),
  'Low Cable Row',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 65, 12),
  (last_insert_rowid(), 2, 65, 12),
  (last_insert_rowid(), 3, 65, 12);

-- 2026-05-04 | Volume Pull | Pull Up (Pronated) | liam__2026-05-04__volume-pull__pull-up-pronated
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-04',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up (Pronated)'),
  'Pull Up (Pronated)',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 9),
  (last_insert_rowid(), 3, 0, 7);

-- 2026-05-04 | Volume Pull | Bent Over Row | liam__2026-05-04__volume-pull__bent-over-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-04',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Bent Over Row'),
  'Bent Over Row',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 12),
  (last_insert_rowid(), 2, 100, 10),
  (last_insert_rowid(), 3, 100, 7);

-- 2026-05-03 | Volume Push | Skull Crusher | liam__2026-05-03__volume-push__skull-crusher
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-03',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Skull Crusher'),
  'Skull Crusher',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 35, 12),
  (last_insert_rowid(), 2, 35, 10),
  (last_insert_rowid(), 3, 35, 10);

-- 2026-05-03 | Volume Push | Lateral Raise | liam__2026-05-03__volume-push__lateral-raise
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-03',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Lateral Raise'),
  'Lateral Raise',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 15, 15),
  (last_insert_rowid(), 2, 15, 14),
  (last_insert_rowid(), 3, 15, 11);

-- 2026-05-03 | Volume Push | Chest Fly | liam__2026-05-03__volume-push__chest-fly
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-03',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Fly'),
  'Chest Fly',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 70, 12),
  (last_insert_rowid(), 2, 70, 12),
  (last_insert_rowid(), 3, 70, 10);

-- 2026-05-03 | Volume Push | Incline Press | liam__2026-05-03__volume-push__incline-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-03',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Press'),
  'Incline Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 30, 12),
  (last_insert_rowid(), 2, 30, 12),
  (last_insert_rowid(), 3, 30, 10);

-- 2026-05-03 | Volume Push | Chest Press | liam__2026-05-03__volume-push__chest-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-03',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Press'),
  'Chest Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 12),
  (last_insert_rowid(), 2, 100, 11),
  (last_insert_rowid(), 3, 100, 10);

-- 2026-05-01 | Strength Pull | Leg Raise | liam__2026-05-01__strength-pull__leg-raise
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-01',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Leg Raise'),
  'Leg Raise',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 12),
  (last_insert_rowid(), 2, 0, 12);

-- 2026-05-01 | Strength Pull | Hammer Curl | liam__2026-05-01__strength-pull__hammer-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-01',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Hammer Curl'),
  'Hammer Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 22.5, 12),
  (last_insert_rowid(), 2, 22.5, 11),
  (last_insert_rowid(), 3, 22.5, 10);

-- 2026-05-01 | Strength Pull | T-Bar Row | liam__2026-05-01__strength-pull__t-bar-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-01',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'T-Bar Row'),
  'T-Bar Row',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 50, 12),
  (last_insert_rowid(), 2, 50, 12),
  (last_insert_rowid(), 3, 50, 10);

-- 2026-05-01 | Strength Pull | Pull Up | liam__2026-05-01__strength-pull__pull-up
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-01',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up'),
  'Pull Up',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 9),
  (last_insert_rowid(), 3, 0, 8);

-- 2026-05-01 | Strength Pull | Conventional Deadlift | liam__2026-05-01__strength-pull__conventional-deadlift
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-05-01',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Conventional Deadlift'),
  'Conventional Deadlift',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 170, 4),
  (last_insert_rowid(), 2, 170, 4),
  (last_insert_rowid(), 3, 170, 4);

-- 2026-04-30 | Strength Push | Tricep Pushdown | liam__2026-04-30__strength-push__tricep-pushdown
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-30',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Tricep Pushdown'),
  'Tricep Pushdown',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 35, 10),
  (last_insert_rowid(), 2, 35, 9),
  (last_insert_rowid(), 3, 35, 8);

-- 2026-04-30 | Strength Push | Bench Press | liam__2026-04-30__strength-push__bench-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-30',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Bench Press'),
  'Bench Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 35, 8),
  (last_insert_rowid(), 2, 35, 8),
  (last_insert_rowid(), 3, 30, 12);

-- 2026-04-30 | Strength Push | Overhead Press | liam__2026-04-30__strength-push__overhead-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-30',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Overhead Press'),
  'Overhead Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 60, 6),
  (last_insert_rowid(), 2, 60, 5),
  (last_insert_rowid(), 3, 60, 4);

-- 2026-04-30 | Strength Push | Incline Bench Press | liam__2026-04-30__strength-push__incline-bench-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-30',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Bench Press'),
  'Incline Bench Press',
  'Good form'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 80, 7),
  (last_insert_rowid(), 2, 80, 7),
  (last_insert_rowid(), 3, 80, 7);

-- 2026-04-29 | Strength Legs | Back Extension | liam__2026-04-29__strength-legs__back-extension
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-29',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Back Extension'),
  'Back Extension',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 25, 8),
  (last_insert_rowid(), 2, 25, 8);

-- 2026-04-29 | Strength Legs | Stiff Leg Deadlift | liam__2026-04-29__strength-legs__stiff-leg-deadlift
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-29',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Stiff Leg Deadlift'),
  'Stiff Leg Deadlift',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 110, 10),
  (last_insert_rowid(), 2, 110, 10),
  (last_insert_rowid(), 3, 110, 10);

-- 2026-04-29 | Strength Legs | High Bar Squat | liam__2026-04-29__strength-legs__high-bar-squat
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-29',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'High Bar Squat'),
  'High Bar Squat',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 140, 4),
  (last_insert_rowid(), 2, 140, 4),
  (last_insert_rowid(), 3, 140, 3);

-- 2026-04-27 | Volume Pull | Lat Pullover | liam__2026-04-27__volume-pull__lat-pullover
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-27',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Lat Pullover'),
  'Lat Pullover',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 45, 15),
  (last_insert_rowid(), 2, 45, 15),
  (last_insert_rowid(), 3, 45, 14);

-- 2026-04-27 | Volume Pull | Shrugs | liam__2026-04-27__volume-pull__shrugs
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-27',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Shrugs'),
  'Shrugs',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 15),
  (last_insert_rowid(), 2, 100, 15),
  (last_insert_rowid(), 3, 100, 15);

-- 2026-04-27 | Volume Pull | Pull Up (Pronated) | liam__2026-04-27__volume-pull__pull-up-pronated
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-27',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up (Pronated)'),
  'Pull Up (Pronated)',
  'Feeling pretty tired today - next week make sure to take proper rest'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 8),
  (last_insert_rowid(), 3, 0, 6);

-- 2026-04-27 | Volume Pull | Bent Over Row | liam__2026-04-27__volume-pull__bent-over-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-27',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Bent Over Row'),
  'Bent Over Row',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 10),
  (last_insert_rowid(), 2, 100, 10),
  (last_insert_rowid(), 3, 100, 8);

-- 2026-04-26 | Volume Push | Skull Crusher | liam__2026-04-26__volume-push__skull-crusher
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-26',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Skull Crusher'),
  'Skull Crusher',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 35, 12),
  (last_insert_rowid(), 2, 35, 12),
  (last_insert_rowid(), 3, 35, 12);

-- 2026-04-26 | Volume Push | Lateral Raise | liam__2026-04-26__volume-push__lateral-raise
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-26',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Lateral Raise'),
  'Lateral Raise',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 15, 12),
  (last_insert_rowid(), 2, 15, 12),
  (last_insert_rowid(), 3, 15, 10);

-- 2026-04-26 | Volume Push | Chest Fly | liam__2026-04-26__volume-push__chest-fly
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-26',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Fly'),
  'Chest Fly',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 63, 12),
  (last_insert_rowid(), 2, 63, 12),
  (last_insert_rowid(), 3, 63, 12);

-- 2026-04-26 | Volume Push | Incline Press | liam__2026-04-26__volume-push__incline-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-26',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Press'),
  'Incline Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 30, 10),
  (last_insert_rowid(), 2, 30, 8),
  (last_insert_rowid(), 3, 30, 8);

-- 2026-04-26 | Volume Push | Chest Press | liam__2026-04-26__volume-push__chest-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-26',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Press'),
  'Chest Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 11),
  (last_insert_rowid(), 2, 100, 9),
  (last_insert_rowid(), 3, 100, 8);

-- 2026-04-24 | Strength Pull | Conventional Deadlift | liam__2026-04-24__strength-pull__conventional-deadlift
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-24',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Conventional Deadlift'),
  'Conventional Deadlift',
  'Deload'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 140, 9),
  (last_insert_rowid(), 2, 140, 9);

-- 2026-04-23 | Strength Push | Chest Fly Bent Over | liam__2026-04-23__strength-push__chest-fly-bent-over
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-23',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Fly Bent Over'),
  'Chest Fly Bent Over',
  'Deload'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 0);

-- 2026-04-23 | Strength Push | DeadBug | liam__2026-04-23__strength-push__deadbug
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-23',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'DeadBug'),
  'DeadBug',
  'Deload'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 0);

-- 2026-04-23 | Strength Push | Tricep Pushdown | liam__2026-04-23__strength-push__tricep-pushdown
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-23',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Tricep Pushdown'),
  'Tricep Pushdown',
  'Deload'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 30, 10),
  (last_insert_rowid(), 2, 30, 10),
  (last_insert_rowid(), 3, 30, 10);

-- 2026-04-23 | Strength Push | Bench Press | liam__2026-04-23__strength-push__bench-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-23',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Bench Press'),
  'Bench Press',
  'Deload'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 30, 10),
  (last_insert_rowid(), 2, 30, 10),
  (last_insert_rowid(), 3, 30, 8);

-- 2026-04-23 | Strength Push | Overhead Press | liam__2026-04-23__strength-push__overhead-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-23',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Overhead Press'),
  'Overhead Press',
  'Deload'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 50, 10),
  (last_insert_rowid(), 2, 50, 8),
  (last_insert_rowid(), 3, 50, 8);

-- 2026-04-23 | Strength Push | Incline Bench Press | liam__2026-04-23__strength-push__incline-bench-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-23',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Bench Press'),
  'Incline Bench Press',
  'Deload'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 85, 5),
  (last_insert_rowid(), 2, 70, 8),
  (last_insert_rowid(), 3, 70, 8);

-- 2026-04-20 | Volume Pull | Bent Over Row | liam__2026-04-20__volume-pull__bent-over-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-20',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Bent Over Row'),
  'Bent Over Row',
  'Felt sick before today’s workout - not great form'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 10),
  (last_insert_rowid(), 2, 100, 10),
  (last_insert_rowid(), 3, 100, 6);

-- 2026-04-19 | Volume Push | Skull Crusher | liam__2026-04-19__volume-push__skull-crusher
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-19',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Skull Crusher'),
  'Skull Crusher',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 30, 12),
  (last_insert_rowid(), 2, 30, 12),
  (last_insert_rowid(), 3, 30, 8);

-- 2026-04-19 | Volume Push | Lateral Raise | liam__2026-04-19__volume-push__lateral-raise
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-19',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Lateral Raise'),
  'Lateral Raise',
  'Felt heavy today'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 15, 15),
  (last_insert_rowid(), 2, 15, 12),
  (last_insert_rowid(), 3, 15, 10);

-- 2026-04-19 | Volume Push | Chest Fly | liam__2026-04-19__volume-push__chest-fly
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-19',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Fly'),
  'Chest Fly',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 63, 15),
  (last_insert_rowid(), 2, 63, 13),
  (last_insert_rowid(), 3, 63, 12);

-- 2026-04-19 | Volume Push | Incline Press | liam__2026-04-19__volume-push__incline-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-19',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Press'),
  'Incline Press',
  'Last set last 2 reps assisted'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 30, 12),
  (last_insert_rowid(), 2, 30, 12),
  (last_insert_rowid(), 3, 30, 12);

-- 2026-04-19 | Volume Push | Chest Press | liam__2026-04-19__volume-push__chest-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-19',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Press'),
  'Chest Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 90, 12),
  (last_insert_rowid(), 2, 95, 12),
  (last_insert_rowid(), 3, 95, 12),
  (last_insert_rowid(), 4, 95, 10);

-- 2026-04-19 | Volume Push | Chest Press | liam__2026-04-19__volume-push__chest-press__2
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-19',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Press'),
  'Chest Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 90, 12),
  (last_insert_rowid(), 2, 95, 12),
  (last_insert_rowid(), 3, 95, 12),
  (last_insert_rowid(), 4, 95, 10);

-- 2026-04-19 | Volume Push | Chest Press | liam__2026-04-19__volume-push__chest-press__3
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-19',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Press'),
  'Chest Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 90, 12),
  (last_insert_rowid(), 2, 95, 12),
  (last_insert_rowid(), 3, 95, 12);

-- 2026-04-17 | Abs & Arms | Bicep Curl | liam__2026-04-17__abs-and-arms__bicep-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-17',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Bicep Curl'),
  'Bicep Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 17.5, 12),
  (last_insert_rowid(), 2, 20, 9),
  (last_insert_rowid(), 3, 20, 8);

-- 2026-04-17 | Abs & Arms | Leg Raise | liam__2026-04-17__abs-and-arms__leg-raise
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-17',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Leg Raise'),
  'Leg Raise',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 10),
  (last_insert_rowid(), 3, 0, 9);

-- 2026-04-17 | Abs & Arms | Crunch | liam__2026-04-17__abs-and-arms__crunch
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-17',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Crunch'),
  'Crunch',
  'Bodyweight'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 15),
  (last_insert_rowid(), 2, 0, 15),
  (last_insert_rowid(), 3, 0, 12);

-- 2026-04-17 | Abs & Arms | Dips | liam__2026-04-17__abs-and-arms__dips
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-17',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Dips'),
  'Dips',
  '+10kg'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 10, 10),
  (last_insert_rowid(), 2, 10, 10),
  (last_insert_rowid(), 3, 10, 6);

-- 2026-04-17 | Abs & Arms | Preacher Curl | liam__2026-04-17__abs-and-arms__preacher-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-17',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Preacher Curl'),
  'Preacher Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 22.5, 12),
  (last_insert_rowid(), 2, 22.5, 12),
  (last_insert_rowid(), 3, 22.5, 11);

-- 2026-04-17 | Abs & Arms | Single Arm Tricep Extension | liam__2026-04-17__abs-and-arms__single-arm-tricep-extension
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-17',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Single Arm Tricep Extension'),
  'Single Arm Tricep Extension',
  'Potentially fatigued from previous heavy delt work'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 10, 14),
  (last_insert_rowid(), 2, 10, 10),
  (last_insert_rowid(), 3, 10, 6);

-- 2026-04-17 | Strength Pull | Leg Raise | liam__2026-04-17__strength-pull__leg-raise
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-17',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Leg Raise'),
  'Leg Raise',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 10),
  (last_insert_rowid(), 3, 0, 8);

-- 2026-04-17 | Strength Pull | Hammer Curl | liam__2026-04-17__strength-pull__hammer-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-17',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Hammer Curl'),
  'Hammer Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 22.5, 12),
  (last_insert_rowid(), 2, 22.5, 9),
  (last_insert_rowid(), 3, 22.5, 8);

-- 2026-04-17 | Strength Pull | T-Bar Row | liam__2026-04-17__strength-pull__t-bar-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-17',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'T-Bar Row'),
  'T-Bar Row',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 50, 11),
  (last_insert_rowid(), 2, 50, 10),
  (last_insert_rowid(), 3, 50, 9);

-- 2026-04-17 | Strength Pull | Pull Up | liam__2026-04-17__strength-pull__pull-up
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-17',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up'),
  'Pull Up',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 10, 7),
  (last_insert_rowid(), 2, 10, 7),
  (last_insert_rowid(), 3, 10, 6);

-- 2026-04-17 | Strength Pull | Conventional Deadlift | liam__2026-04-17__strength-pull__conventional-deadlift
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-17',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Conventional Deadlift'),
  'Conventional Deadlift',
  'Wrong rep range to start'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 160, 4),
  (last_insert_rowid(), 2, 160, 4),
  (last_insert_rowid(), 3, 170, 4);

-- 2026-04-16 | Strength Pull | Deadlift | liam__2026-04-16__strength-pull__deadlift
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-16',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Deadlift'),
  'Deadlift',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 160, 4),
  (last_insert_rowid(), 2, 170, 4),
  (last_insert_rowid(), 3, 170, 4);

-- 2026-04-16 | Strength Pull | T-Bar Row | liam__2026-04-16__strength-pull__t-bar-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-16',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'T-Bar Row'),
  'T-Bar Row',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 50, 12),
  (last_insert_rowid(), 2, 50, 11),
  (last_insert_rowid(), 3, 50, 10);

-- 2026-04-16 | Strength Pull | Hammer Curl | liam__2026-04-16__strength-pull__hammer-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-16',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Hammer Curl'),
  'Hammer Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 22.5, 11),
  (last_insert_rowid(), 2, 22.5, 10),
  (last_insert_rowid(), 3, 22.5, 10);

-- 2026-04-16 | Strength Pull | Pull Up | liam__2026-04-16__strength-pull__pull-up
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-16',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up'),
  'Pull Up',
  '+10kg added'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 10, 7),
  (last_insert_rowid(), 2, 10, 7),
  (last_insert_rowid(), 3, 10, 6);

-- 2026-04-15 | Strength Push | Tricep Pushdown | liam__2026-04-15__strength-push__tricep-pushdown
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-15',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Tricep Pushdown'),
  'Tricep Pushdown',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 35, 10),
  (last_insert_rowid(), 2, 35, 9),
  (last_insert_rowid(), 3, 35, 8);

-- 2026-04-15 | Strength Push | Bench Press | liam__2026-04-15__strength-push__bench-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-15',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Bench Press'),
  'Bench Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 35, 9),
  (last_insert_rowid(), 2, 35, 7),
  (last_insert_rowid(), 3, 35, 7);

-- 2026-04-15 | Strength Push | Deadbug | liam__2026-04-15__strength-push__deadbug
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-15',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Deadbug'),
  'Deadbug',
  'Proper form'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 7.5, 20),
  (last_insert_rowid(), 2, 7.5, 20);

-- 2026-04-15 | Strength Push | Overhead Press | liam__2026-04-15__strength-push__overhead-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-15',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Overhead Press'),
  'Overhead Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 60, 7),
  (last_insert_rowid(), 2, 60, 7),
  (last_insert_rowid(), 3, 60, 6);

-- 2026-04-15 | Strength Push | Incline Bench Press | liam__2026-04-15__strength-push__incline-bench-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-15',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Bench Press'),
  'Incline Bench Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 85, 8),
  (last_insert_rowid(), 2, 85, 7),
  (last_insert_rowid(), 3, 85, 7);

-- 2026-04-15 | Strength Push | Cable Fly Upright | liam__2026-04-15__strength-push__cable-fly-upright
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-15',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Cable Fly Upright'),
  'Cable Fly Upright',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 25, 20),
  (last_insert_rowid(), 2, 30, 16);

-- 2026-04-14 | Strength Legs | Back Extension | liam__2026-04-14__strength-legs__back-extension
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-14',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Back Extension'),
  'Back Extension',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 25, 10),
  (last_insert_rowid(), 2, 25, 10),
  (last_insert_rowid(), 3, 25, 6);

-- 2026-04-14 | Strength Legs | High Bar Squat | liam__2026-04-14__strength-legs__high-bar-squat
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-14',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'High Bar Squat'),
  'High Bar Squat',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 140, 4),
  (last_insert_rowid(), 2, 140, 4),
  (last_insert_rowid(), 3, 140, 4);

-- 2026-04-14 | Strength Legs | Stiff Leg Deadlift | liam__2026-04-14__strength-legs__stiff-leg-deadlift
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-14',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Stiff Leg Deadlift'),
  'Stiff Leg Deadlift',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 10),
  (last_insert_rowid(), 2, 110, 8),
  (last_insert_rowid(), 3, 110, 8);

-- 2026-04-14 | Strength Legs | Rope Crunch | liam__2026-04-14__strength-legs__rope-crunch
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-14',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Rope Crunch'),
  'Rope Crunch',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 75, 19),
  (last_insert_rowid(), 2, 75, 11),
  (last_insert_rowid(), 3, 75, 9);

-- 2026-04-14 | Strength Legs | Plate Elevated Close Stance Squat | liam__2026-04-14__strength-legs__plate-elevated-close-stance-squat
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-14',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Plate Elevated Close Stance Squat'),
  'Plate Elevated Close Stance Squat',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 80, 12),
  (last_insert_rowid(), 2, 80, 10);

-- 2026-04-13 | Abs & Arms | Crunch | liam__2026-04-13__abs-and-arms__crunch
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-13',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Crunch'),
  'Crunch',
  'Bodyweight'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 15),
  (last_insert_rowid(), 2, 0, 15),
  (last_insert_rowid(), 3, 0, 13);

-- 2026-04-13 | Abs & Arms | Leg Raise | liam__2026-04-13__abs-and-arms__leg-raise
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-13',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Leg Raise'),
  'Leg Raise',
  'Elbow supported to eliminate grip. First set toe to bar, 2nd and 3rd past horizontal'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 9),
  (last_insert_rowid(), 3, 0, 8);

-- 2026-04-13 | Abs & Arms | Bicep Curl | liam__2026-04-13__abs-and-arms__bicep-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-13',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Bicep Curl'),
  'Bicep Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 17.5, 12),
  (last_insert_rowid(), 2, 17.5, 12),
  (last_insert_rowid(), 3, 17.5, 12);

-- 2026-04-13 | Abs & Arms | Single Arm Tricep Extension | liam__2026-04-13__abs-and-arms__single-arm-tricep-extension
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-13',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Single Arm Tricep Extension'),
  'Single Arm Tricep Extension',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 10, 12),
  (last_insert_rowid(), 2, 10, 10),
  (last_insert_rowid(), 3, 10, 8);

-- 2026-04-13 | Abs & Arms | Dips | liam__2026-04-13__abs-and-arms__dips
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-13',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Dips'),
  'Dips',
  '+10kg'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 10, 9),
  (last_insert_rowid(), 2, 10, 9),
  (last_insert_rowid(), 3, 10, 8);

-- 2026-04-13 | Abs & Arms | Preacher Curl | liam__2026-04-13__abs-and-arms__preacher-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-13',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Preacher Curl'),
  'Preacher Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 22.5, 12),
  (last_insert_rowid(), 2, 22.5, 11),
  (last_insert_rowid(), 3, 22.5, 8);

-- 2026-04-12 | Volume Pull | Shrugs | liam__2026-04-12__volume-pull__shrugs
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-12',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Shrugs'),
  'Shrugs',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 15),
  (last_insert_rowid(), 2, 100, 13),
  (last_insert_rowid(), 3, 100, 12);

-- 2026-04-12 | Volume Pull | Pull Up (Pronated) | liam__2026-04-12__volume-pull__pull-up-pronated
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-12',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up (Pronated)'),
  'Pull Up (Pronated)',
  'Bodyweight'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 9),
  (last_insert_rowid(), 3, 0, 8);

-- 2026-04-12 | Volume Pull | Low Cable Row | liam__2026-04-12__volume-pull__low-cable-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-12',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Low Cable Row'),
  'Low Cable Row',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 60, 15),
  (last_insert_rowid(), 2, 60, 13),
  (last_insert_rowid(), 3, 60, 12),
  (last_insert_rowid(), 4, 60, 10);

-- 2026-04-12 | Volume Pull | Bent Over Row | liam__2026-04-12__volume-pull__bent-over-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-12',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Bent Over Row'),
  'Bent Over Row',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 10),
  (last_insert_rowid(), 2, 100, 10),
  (last_insert_rowid(), 3, 100, 10);

-- 2026-04-12 | Volume Pull | Rear Delt Fly | liam__2026-04-12__volume-pull__rear-delt-fly
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-12',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Rear Delt Fly'),
  'Rear Delt Fly',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 50, 15),
  (last_insert_rowid(), 2, 50, 13),
  (last_insert_rowid(), 3, 50, 12);

-- 2026-04-12 | Volume Pull | Lat Pulldown | liam__2026-04-12__volume-pull__lat-pulldown
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-12',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Lat Pulldown'),
  'Lat Pulldown',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 60, 16),
  (last_insert_rowid(), 2, 60, 13),
  (last_insert_rowid(), 3, 60, 12);

-- 2026-04-11 | Volume Push | Machine Fly | liam__2026-04-11__volume-push__machine-fly
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-11',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Machine Fly'),
  'Machine Fly',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 65, 12),
  (last_insert_rowid(), 2, 65, 12),
  (last_insert_rowid(), 3, 65, 11);

-- 2026-04-11 | Volume Push | Incline Press | liam__2026-04-11__volume-push__incline-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-11',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Press'),
  'Incline Press',
  'Cramped on first bit, had to reset, lost energy'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 27.5, 12),
  (last_insert_rowid(), 2, 30, 12),
  (last_insert_rowid(), 3, 32.5, 11),
  (last_insert_rowid(), 4, 32.5, 5);

-- 2026-04-11 | Volume Push | Machine Press | liam__2026-04-11__volume-push__machine-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-11',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Machine Press'),
  'Machine Press',
  'New machine at different gym'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 85, 12),
  (last_insert_rowid(), 2, 85, 10),
  (last_insert_rowid(), 3, 85, 10),
  (last_insert_rowid(), 4, 85, 10);

-- 2026-04-11 | Volume Push | Lateral Raise | liam__2026-04-11__volume-push__lateral-raise
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-11',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Lateral Raise'),
  'Lateral Raise',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 15, 15),
  (last_insert_rowid(), 2, 15, 13),
  (last_insert_rowid(), 3, 15, 12);

-- 2026-04-11 | Volume Push | Skull Crusher | liam__2026-04-11__volume-push__skull-crusher
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-11',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Skull Crusher'),
  'Skull Crusher',
  'Skull crusher felt shit — moved to BW dips. Skull crusher 2 sets of 12 @ 30kg, 2 sets BW dips 10,8 reps'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 30, 12),
  (last_insert_rowid(), 2, 30, 12),
  (last_insert_rowid(), 3, 30, 10),
  (last_insert_rowid(), 4, 30, 8);

-- 2026-04-09 | Strength Pull | T-Bar Row | liam__2026-04-09__strength-pull__t-bar-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-09',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'T-Bar Row'),
  'T-Bar Row',
  'New gym — did single arm bent over rows 45kg instead'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 45, 12),
  (last_insert_rowid(), 2, 45, 12),
  (last_insert_rowid(), 3, 45, 10);

-- 2026-04-09 | Strength Pull | Hammer Curl | liam__2026-04-09__strength-pull__hammer-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-09',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Hammer Curl'),
  'Hammer Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 22.5, 12),
  (last_insert_rowid(), 2, 22.5, 9),
  (last_insert_rowid(), 3, 22.5, 9);

-- 2026-04-09 | Strength Pull | Pull Up | liam__2026-04-09__strength-pull__pull-up
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-09',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up'),
  'Pull Up',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 10, 8),
  (last_insert_rowid(), 3, 10, 7);

-- 2026-04-09 | Strength Pull | Deadlift | liam__2026-04-09__strength-pull__deadlift
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-09',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Deadlift'),
  'Deadlift',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 160, 6),
  (last_insert_rowid(), 2, 160, 5),
  (last_insert_rowid(), 3, 160, 5);

-- 2026-04-08 | Strength Push | Bench Press | liam__2026-04-08__strength-push__bench-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-08',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Bench Press'),
  'Bench Press',
  'Wraps a little tight on last set'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 30, 10),
  (last_insert_rowid(), 2, 35, 8),
  (last_insert_rowid(), 3, 35, 6);

-- 2026-04-08 | Strength Push | Overhead Press | liam__2026-04-08__strength-push__overhead-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-08',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Overhead Press'),
  'Overhead Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 55, 8),
  (last_insert_rowid(), 2, 55, 8),
  (last_insert_rowid(), 3, 55, 8);

-- 2026-04-08 | Strength Push | Incline Bench Press | liam__2026-04-08__strength-push__incline-bench-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-08',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Bench Press'),
  'Incline Bench Press',
  'Had a spotter for last 2 sets'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 85, 7),
  (last_insert_rowid(), 2, 85, 7),
  (last_insert_rowid(), 3, 85, 7);

-- 2026-04-08 | Strength Push | Tricep Pushdown | liam__2026-04-08__strength-push__tricep-pushdown
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-08',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Tricep Pushdown'),
  'Tricep Pushdown',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 35, 10),
  (last_insert_rowid(), 2, 35, 9),
  (last_insert_rowid(), 3, 35, 8);

-- 2026-04-08 | Strength Push | Deadbug | liam__2026-04-08__strength-push__deadbug
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-08',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Deadbug'),
  'Deadbug',
  'Proper form pressing lower back into mat'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 7.5, 20),
  (last_insert_rowid(), 2, 7.5, 18);

-- 2026-04-08 | Strength Push | Cable Fly Upright | liam__2026-04-08__strength-push__cable-fly-upright
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-08',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Cable Fly Upright'),
  'Cable Fly Upright',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 20, 20),
  (last_insert_rowid(), 2, 25, 16),
  (last_insert_rowid(), 3, 25, 16);

-- 2026-04-07 | Strength Legs | Rope Crunch | liam__2026-04-07__strength-legs__rope-crunch
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-07',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Rope Crunch'),
  'Rope Crunch',
  'Did 2 sets bodyweight dead hangs ~90sec each + 2 sets walking lunges 30 reps'
);
-- No set rows for this log (skipped/no work recorded).

-- 2026-04-07 | Strength Legs | Stiff Leg Deadlift | liam__2026-04-07__strength-legs__stiff-leg-deadlift
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-07',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Stiff Leg Deadlift'),
  'Stiff Leg Deadlift',
  'Lower back so fucking tight!!!'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 10),
  (last_insert_rowid(), 2, 100, 10),
  (last_insert_rowid(), 3, 100, 8);

-- 2026-04-07 | Strength Legs | Plate Elevated Close Stance Squat | liam__2026-04-07__strength-legs__plate-elevated-close-stance-squat
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-07',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Plate Elevated Close Stance Squat'),
  'Plate Elevated Close Stance Squat',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 60, 15),
  (last_insert_rowid(), 2, 80, 12),
  (last_insert_rowid(), 3, 80, 12);

-- 2026-04-07 | Strength Legs | Back Extension | liam__2026-04-07__strength-legs__back-extension
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-07',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Back Extension'),
  'Back Extension',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 25, 10),
  (last_insert_rowid(), 2, 25, 8),
  (last_insert_rowid(), 3, 25, 8);

-- 2026-04-07 | Strength Legs | High Bar Squat | liam__2026-04-07__strength-legs__high-bar-squat
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-07',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'High Bar Squat'),
  'High Bar Squat',
  'No knee compression. Lost balance and stood too long with weight — lost confidence in last rep'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 140, 4),
  (last_insert_rowid(), 2, 140, 3),
  (last_insert_rowid(), 3, 140, 3);

-- 2026-04-06 | Abs & Arms | Bicep Curl | liam__2026-04-06__abs-and-arms__bicep-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-06',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Bicep Curl'),
  'Bicep Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 17.5, 12),
  (last_insert_rowid(), 2, 17.5, 12),
  (last_insert_rowid(), 3, 17.5, 10);

-- 2026-04-06 | Abs & Arms | Preacher Curl | liam__2026-04-06__abs-and-arms__preacher-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-06',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Preacher Curl'),
  'Preacher Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 20, 12),
  (last_insert_rowid(), 2, 20, 11);

-- 2026-04-06 | Abs & Arms | Dips | liam__2026-04-06__abs-and-arms__dips
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-06',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Dips'),
  'Dips',
  '+10kg'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 10, 7),
  (last_insert_rowid(), 2, 10, 7),
  (last_insert_rowid(), 3, 10, 7);

-- 2026-04-06 | Abs & Arms | Leg Raise | liam__2026-04-06__abs-and-arms__leg-raise
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-06',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Leg Raise'),
  'Leg Raise',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 9),
  (last_insert_rowid(), 3, 0, 10),
  (last_insert_rowid(), 4, 0, 9);

-- 2026-04-06 | Abs & Arms | Single Arm Tricep Extension | liam__2026-04-06__abs-and-arms__single-arm-tricep-extension
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-06',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Single Arm Tricep Extension'),
  'Single Arm Tricep Extension',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 10, 10),
  (last_insert_rowid(), 2, 10, 10),
  (last_insert_rowid(), 3, 10, 8);

-- 2026-04-06 | Abs & Arms | Crunch | liam__2026-04-06__abs-and-arms__crunch
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-06',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Crunch'),
  'Crunch',
  'Ab Wheel Rollout'
);
-- No set rows for this log (skipped/no work recorded).

-- 2026-04-05 | Volume Pull | Rear Delt Fly | liam__2026-04-05__volume-pull__rear-delt-fly
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-05',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Rear Delt Fly'),
  'Rear Delt Fly',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 49, 13),
  (last_insert_rowid(), 2, 49, 12),
  (last_insert_rowid(), 3, 49, 12);

-- 2026-04-05 | Volume Pull | Pull Up (Pronated) | liam__2026-04-05__volume-pull__pull-up-pronated
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-05',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up (Pronated)'),
  'Pull Up (Pronated)',
  'Very tired'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 9),
  (last_insert_rowid(), 3, 0, 7);

-- 2026-04-05 | Volume Pull | Bent Over Row | liam__2026-04-05__volume-pull__bent-over-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-05',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Bent Over Row'),
  'Bent Over Row',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 10),
  (last_insert_rowid(), 2, 100, 10),
  (last_insert_rowid(), 3, 100, 10);

-- 2026-04-05 | Volume Pull | Lat Pulldown | liam__2026-04-05__volume-pull__lat-pulldown
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-05',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Lat Pulldown'),
  'Lat Pulldown',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 55, 13),
  (last_insert_rowid(), 2, 55, 12),
  (last_insert_rowid(), 3, 55, 12);

-- 2026-04-05 | Volume Pull | Low Cable Row | liam__2026-04-05__volume-pull__low-cable-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-05',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Low Cable Row'),
  'Low Cable Row',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 55, 15),
  (last_insert_rowid(), 2, 55, 15),
  (last_insert_rowid(), 3, 55, 15),
  (last_insert_rowid(), 4, 55, 12);

-- 2026-04-05 | Volume Pull | Shrugs | liam__2026-04-05__volume-pull__shrugs
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-05',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Shrugs'),
  'Shrugs',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 15),
  (last_insert_rowid(), 2, 100, 12),
  (last_insert_rowid(), 3, 100, 10);

-- 2026-04-04 | Volume Push | Machine Fly | liam__2026-04-04__volume-push__machine-fly
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-04',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Machine Fly'),
  'Machine Fly',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 65, 12),
  (last_insert_rowid(), 2, 65, 12),
  (last_insert_rowid(), 3, 65, 10);

-- 2026-04-04 | Volume Push | Lateral Raise | liam__2026-04-04__volume-push__lateral-raise
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-04',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Lateral Raise'),
  'Lateral Raise',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 15, 15),
  (last_insert_rowid(), 2, 15, 13),
  (last_insert_rowid(), 3, 15, 11);

-- 2026-04-04 | Volume Push | Skull Crusher | liam__2026-04-04__volume-push__skull-crusher
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-04',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Skull Crusher'),
  'Skull Crusher',
  'Elbows painful — switched to cable pushdown with rope 25kg'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 25, 12),
  (last_insert_rowid(), 2, 25, 12),
  (last_insert_rowid(), 3, 25, 12);

-- 2026-04-04 | Volume Push | Incline Press | liam__2026-04-04__volume-push__incline-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-04',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Press'),
  'Incline Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 27.5, 12),
  (last_insert_rowid(), 2, 27.5, 12),
  (last_insert_rowid(), 3, 27.5, 10),
  (last_insert_rowid(), 4, 27.5, 9);

-- 2026-04-04 | Volume Push | Machine Press | liam__2026-04-04__volume-push__machine-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-04',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Machine Press'),
  'Machine Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 85, 12),
  (last_insert_rowid(), 2, 85, 12),
  (last_insert_rowid(), 3, 85, 12),
  (last_insert_rowid(), 4, 85, 12);

-- 2026-04-02 | Strength Pull | Pull Up | liam__2026-04-02__strength-pull__pull-up
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-02',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up'),
  'Pull Up',
  'Bodyweight'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 10),
  (last_insert_rowid(), 3, 0, 8);

-- 2026-04-02 | Strength Pull | Hammer Curl | liam__2026-04-02__strength-pull__hammer-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-02',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Hammer Curl'),
  'Hammer Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 22.5, 12),
  (last_insert_rowid(), 2, 22.5, 10),
  (last_insert_rowid(), 3, 22.5, 9);

-- 2026-04-02 | Strength Pull | T-Bar Row | liam__2026-04-02__strength-pull__t-bar-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-02',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'T-Bar Row'),
  'T-Bar Row',
  'Low grip'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 50, 12),
  (last_insert_rowid(), 2, 50, 11),
  (last_insert_rowid(), 3, 50, 10);

-- 2026-04-02 | Strength Pull | Deadlift | liam__2026-04-02__strength-pull__deadlift
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-02',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Deadlift'),
  'Deadlift',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 160, 6),
  (last_insert_rowid(), 2, 160, 6),
  (last_insert_rowid(), 3, 160, 5);

-- 2026-04-01 | Strength Push | Cable Fly Upright | liam__2026-04-01__strength-push__cable-fly-upright
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-01',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Cable Fly Upright'),
  'Cable Fly Upright',
  '20 either side'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 20, 20),
  (last_insert_rowid(), 2, 20, 20),
  (last_insert_rowid(), 3, 20, 20);

-- 2026-04-01 | Strength Push | Tricep Pushdown | liam__2026-04-01__strength-push__tricep-pushdown
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-01',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Tricep Pushdown'),
  'Tricep Pushdown',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 35, 8),
  (last_insert_rowid(), 2, 35, 8),
  (last_insert_rowid(), 3, 35, 8);

-- 2026-04-01 | Strength Push | Bench Press | liam__2026-04-01__strength-push__bench-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-01',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Bench Press'),
  'Bench Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 30, 10),
  (last_insert_rowid(), 2, 30, 10),
  (last_insert_rowid(), 3, 30, 9);

-- 2026-04-01 | Strength Push | Deadbug | liam__2026-04-01__strength-push__deadbug
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-01',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Deadbug'),
  'Deadbug',
  '7.5kg each hand, better form'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 7.5, 20),
  (last_insert_rowid(), 2, 7.5, 20);

-- 2026-04-01 | Strength Push | Incline Bench Press | liam__2026-04-01__strength-push__incline-bench-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-01',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Bench Press'),
  'Incline Bench Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 85, 7),
  (last_insert_rowid(), 2, 85, 6),
  (last_insert_rowid(), 3, 85, 5);

-- 2026-04-01 | Strength Push | Overhead Press | liam__2026-04-01__strength-push__overhead-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-04-01',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Overhead Press'),
  'Overhead Press',
  'Half rep on last set'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 50, 8),
  (last_insert_rowid(), 2, 55, 8),
  (last_insert_rowid(), 3, 55, 6);

-- 2026-03-31 | Strength Legs | Stiff Leg Deadlift | liam__2026-03-31__strength-legs__stiff-leg-deadlift
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-31',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Stiff Leg Deadlift'),
  'Stiff Leg Deadlift',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 10),
  (last_insert_rowid(), 2, 100, 10),
  (last_insert_rowid(), 3, 100, 5);

-- 2026-03-31 | Strength Legs | High Bar Squat | liam__2026-03-31__strength-legs__high-bar-squat
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-31',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'High Bar Squat'),
  'High Bar Squat',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 140, 4),
  (last_insert_rowid(), 2, 140, 4),
  (last_insert_rowid(), 3, 140, 4);

-- 2026-03-31 | Strength Legs | Plate Elevated Close Stance Squat | liam__2026-03-31__strength-legs__plate-elevated-close-stance-squat
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-31',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Plate Elevated Close Stance Squat'),
  'Plate Elevated Close Stance Squat',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 80, 10),
  (last_insert_rowid(), 2, 80, 10);

-- 2026-03-31 | Strength Legs | Back Extension | liam__2026-03-31__strength-legs__back-extension
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-31',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Back Extension'),
  'Back Extension',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 25, 10),
  (last_insert_rowid(), 2, 25, 8),
  (last_insert_rowid(), 3, 25, 6);

-- 2026-03-31 | Strength Legs | Rope Crunch | liam__2026-03-31__strength-legs__rope-crunch
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-31',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Rope Crunch'),
  'Rope Crunch',
  'Skipped'
);
-- No set rows for this log (skipped/no work recorded).

-- 2026-03-30 | Abs & Arms | Preacher Curl | liam__2026-03-30__abs-and-arms__preacher-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-30',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Preacher Curl'),
  'Preacher Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 20, 14),
  (last_insert_rowid(), 2, 20, 11),
  (last_insert_rowid(), 3, 20, 10);

-- 2026-03-30 | Abs & Arms | Bicep Curl | liam__2026-03-30__abs-and-arms__bicep-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-30',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Bicep Curl'),
  'Bicep Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 17.5, 12),
  (last_insert_rowid(), 2, 17.5, 12),
  (last_insert_rowid(), 3, 17.5, 12);

-- 2026-03-30 | Abs & Arms | Leg Raise | liam__2026-03-30__abs-and-arms__leg-raise
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-30',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Leg Raise'),
  'Leg Raise',
  'Full range'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 9),
  (last_insert_rowid(), 2, 0, 9),
  (last_insert_rowid(), 3, 0, 7);

-- 2026-03-30 | Abs & Arms | Dips | liam__2026-03-30__abs-and-arms__dips
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-30',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Dips'),
  'Dips',
  '+10kg'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 10, 9),
  (last_insert_rowid(), 2, 10, 7);

-- 2026-03-30 | Abs & Arms | Crunch | liam__2026-03-30__abs-and-arms__crunch
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-30',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Crunch'),
  'Crunch',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 25, 15),
  (last_insert_rowid(), 2, 25, 15);

-- 2026-03-30 | Abs & Arms | Single Arm Tricep Extension | liam__2026-03-30__abs-and-arms__single-arm-tricep-extension
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-30',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Single Arm Tricep Extension'),
  'Single Arm Tricep Extension',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 10, 10),
  (last_insert_rowid(), 2, 10, 10),
  (last_insert_rowid(), 3, 10, 8);

-- 2026-03-29 | Volume Pull | Lat Pulldown | liam__2026-03-29__volume-pull__lat-pulldown
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-29',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Lat Pulldown'),
  'Lat Pulldown',
  'Skipped'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 55, NULL);

-- 2026-03-29 | Volume Pull | Pull Up (Pronated) | liam__2026-03-29__volume-pull__pull-up-pronated
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-29',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up (Pronated)'),
  'Pull Up (Pronated)',
  'Bodyweight'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 9),
  (last_insert_rowid(), 3, 0, 8);

-- 2026-03-29 | Volume Pull | Rear Delt Fly | liam__2026-03-29__volume-pull__rear-delt-fly
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-29',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Rear Delt Fly'),
  'Rear Delt Fly',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 42, 15),
  (last_insert_rowid(), 2, 49, 11),
  (last_insert_rowid(), 3, 49, 10);

-- 2026-03-29 | Volume Pull | Shrugs | liam__2026-03-29__volume-pull__shrugs
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-29',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Shrugs'),
  'Shrugs',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 12),
  (last_insert_rowid(), 2, 100, 10),
  (last_insert_rowid(), 3, 100, 10);

-- 2026-03-29 | Volume Pull | Low Cable Row | liam__2026-03-29__volume-pull__low-cable-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-29',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Low Cable Row'),
  'Low Cable Row',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 55, 12),
  (last_insert_rowid(), 2, 55, 12),
  (last_insert_rowid(), 3, 55, 12);

-- 2026-03-29 | Volume Pull | Bent Over Row | liam__2026-03-29__volume-pull__bent-over-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-29',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Bent Over Row'),
  'Bent Over Row',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 10),
  (last_insert_rowid(), 2, 100, 9),
  (last_insert_rowid(), 3, 100, 8);

-- 2026-03-28 | Volume Push | Machine Fly | liam__2026-03-28__volume-push__machine-fly
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-28',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Machine Fly'),
  'Machine Fly',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 63, 12),
  (last_insert_rowid(), 2, 63, 12),
  (last_insert_rowid(), 3, 63, 10);

-- 2026-03-28 | Volume Push | Skull Crusher | liam__2026-03-28__volume-push__skull-crusher
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-28',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Skull Crusher'),
  'Skull Crusher',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 30, 12),
  (last_insert_rowid(), 2, 30, 12),
  (last_insert_rowid(), 3, 30, 12);

-- 2026-03-28 | Volume Push | Incline Press | liam__2026-03-28__volume-push__incline-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-28',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Press'),
  'Incline Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 25, 12),
  (last_insert_rowid(), 2, 25, 12),
  (last_insert_rowid(), 3, 25, 11),
  (last_insert_rowid(), 4, 25, 10);

-- 2026-03-28 | Volume Push | Lateral Raise | liam__2026-03-28__volume-push__lateral-raise
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-28',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Lateral Raise'),
  'Lateral Raise',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 15, 13),
  (last_insert_rowid(), 2, 15, 12),
  (last_insert_rowid(), 3, 15, 12);

-- 2026-03-28 | Volume Push | Machine Press | liam__2026-03-28__volume-push__machine-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-28',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Machine Press'),
  'Machine Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 85, 12),
  (last_insert_rowid(), 2, 85, 12),
  (last_insert_rowid(), 3, 85, 10),
  (last_insert_rowid(), 4, 85, 9);

-- 2026-03-26 | Strength Pull | Hammer Curl | liam__2026-03-26__strength-pull__hammer-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-26',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Hammer Curl'),
  'Hammer Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 22.5, NULL);

-- 2026-03-26 | Strength Pull | Pull Up | liam__2026-03-26__strength-pull__pull-up
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-26',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up'),
  'Pull Up',
  'Strict'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 10),
  (last_insert_rowid(), 3, 0, 9);

-- 2026-03-26 | Strength Pull | T-Bar Row | liam__2026-03-26__strength-pull__t-bar-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-26',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'T-Bar Row'),
  'T-Bar Row',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 50, 12),
  (last_insert_rowid(), 2, 50, 11),
  (last_insert_rowid(), 3, 50, 10);

-- 2026-03-26 | Strength Pull | Deadlift | liam__2026-03-26__strength-pull__deadlift
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-26',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Deadlift'),
  'Deadlift',
  'Fast reps, too tired'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 140, 7),
  (last_insert_rowid(), 2, 140, 8);

-- 2026-03-25 | Strength Push | Bench Press | liam__2026-03-25__strength-push__bench-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-25',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Bench Press'),
  'Bench Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 30, 8),
  (last_insert_rowid(), 2, 30, 9);

-- 2026-03-25 | Strength Push | Incline Bench Press | liam__2026-03-25__strength-push__incline-bench-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-25',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Bench Press'),
  'Incline Bench Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 80, 8),
  (last_insert_rowid(), 2, 80, 8),
  (last_insert_rowid(), 3, 80, 8);

-- 2026-03-25 | Strength Push | Tricep Pushdown | liam__2026-03-25__strength-push__tricep-pushdown
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-25',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Tricep Pushdown'),
  'Tricep Pushdown',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 35, 8),
  (last_insert_rowid(), 2, 35, 7),
  (last_insert_rowid(), 3, 35, 7);

-- 2026-03-25 | Strength Push | Overhead Press | liam__2026-03-25__strength-push__overhead-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-25',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Overhead Press'),
  'Overhead Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 50, 8),
  (last_insert_rowid(), 2, 50, 8),
  (last_insert_rowid(), 3, 50, 6);

-- 2026-03-25 | Strength Push | Deadbug | liam__2026-03-25__strength-push__deadbug
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-25',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Deadbug'),
  'Deadbug',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 20, 10),
  (last_insert_rowid(), 2, 20, 8),
  (last_insert_rowid(), 3, 20, 7);

-- 2026-03-24 | Strength Legs | Stiff Leg Deadlift | liam__2026-03-24__strength-legs__stiff-leg-deadlift
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-24',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Stiff Leg Deadlift'),
  'Stiff Leg Deadlift',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 10),
  (last_insert_rowid(), 2, 100, 9),
  (last_insert_rowid(), 3, 100, 7);

-- 2026-03-24 | Strength Legs | Plate Elevated Close Stance Squat | liam__2026-03-24__strength-legs__plate-elevated-close-stance-squat
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-24',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Plate Elevated Close Stance Squat'),
  'Plate Elevated Close Stance Squat',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 60, 12),
  (last_insert_rowid(), 2, 80, 10),
  (last_insert_rowid(), 3, 80, 8);

-- 2026-03-24 | Strength Legs | High Bar Squat | liam__2026-03-24__strength-legs__high-bar-squat
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-24',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'High Bar Squat'),
  'High Bar Squat',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 130, 5),
  (last_insert_rowid(), 2, 135, 4),
  (last_insert_rowid(), 3, 135, 4);

-- 2026-03-24 | Strength Legs | Rope Crunch | liam__2026-03-24__strength-legs__rope-crunch
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-24',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Rope Crunch'),
  'Rope Crunch',
  'Skipped'
);
-- No set rows for this log (skipped/no work recorded).

-- 2026-03-23 | Abs & Arms | Bicep Curl | liam__2026-03-23__abs-and-arms__bicep-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-23',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Bicep Curl'),
  'Bicep Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 17.5, 12),
  (last_insert_rowid(), 2, 17.5, 12),
  (last_insert_rowid(), 3, 17.5, 7);

-- 2026-03-23 | Abs & Arms | Single Arm Tricep Extension | liam__2026-03-23__abs-and-arms__single-arm-tricep-extension
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-23',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Single Arm Tricep Extension'),
  'Single Arm Tricep Extension',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 15, 10),
  (last_insert_rowid(), 2, 15, 10);

-- 2026-03-23 | Abs & Arms | Leg Raise | liam__2026-03-23__abs-and-arms__leg-raise
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-23',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Leg Raise'),
  'Leg Raise',
  'Toe to bar — back sore'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 7),
  (last_insert_rowid(), 2, 0, 3),
  (last_insert_rowid(), 3, 0, 3),
  (last_insert_rowid(), 4, 0, 3);

-- 2026-03-23 | Abs & Arms | Crunch | liam__2026-03-23__abs-and-arms__crunch
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-23',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Crunch'),
  'Crunch',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 25, 15),
  (last_insert_rowid(), 2, 30, 13),
  (last_insert_rowid(), 3, 20, 11),
  (last_insert_rowid(), 4, 20, 11);

-- 2026-03-23 | Abs & Arms | Dips | liam__2026-03-23__abs-and-arms__dips
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-23',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Dips'),
  'Dips',
  '+10kg'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 10, 8),
  (last_insert_rowid(), 2, 10, 7),
  (last_insert_rowid(), 3, 10, 6);

-- 2026-03-23 | Abs & Arms | Preacher Curl | liam__2026-03-23__abs-and-arms__preacher-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-23',
  'Abs & Arms',
  (SELECT id FROM exercises WHERE exercise_name = 'Preacher Curl'),
  'Preacher Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 20, 15),
  (last_insert_rowid(), 2, 20, 9),
  (last_insert_rowid(), 3, 20, 9);

-- 2026-03-22 | Volume Pull | Rear Delt Fly | liam__2026-03-22__volume-pull__rear-delt-fly
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-22',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Rear Delt Fly'),
  'Rear Delt Fly',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 15, 17),
  (last_insert_rowid(), 2, 30, 15),
  (last_insert_rowid(), 3, 42, 15),
  (last_insert_rowid(), 4, 42, 12);

-- 2026-03-22 | Volume Pull | Pull Up (Pronated) | liam__2026-03-22__volume-pull__pull-up-pronated
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-22',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up (Pronated)'),
  'Pull Up (Pronated)',
  'Bodyweight'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 9),
  (last_insert_rowid(), 3, 0, 7);

-- 2026-03-22 | Volume Pull | Low Cable Row | liam__2026-03-22__volume-pull__low-cable-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-22',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Low Cable Row'),
  'Low Cable Row',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 55, 12),
  (last_insert_rowid(), 2, 55, 12),
  (last_insert_rowid(), 3, 55, 12),
  (last_insert_rowid(), 4, 55, 12);

-- 2026-03-22 | Volume Pull | Bent Over Row | liam__2026-03-22__volume-pull__bent-over-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-22',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Bent Over Row'),
  'Bent Over Row',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 10),
  (last_insert_rowid(), 2, 100, 10),
  (last_insert_rowid(), 3, 100, 8);

-- 2026-03-22 | Volume Pull | Lat Pulldown | liam__2026-03-22__volume-pull__lat-pulldown
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-22',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Lat Pulldown'),
  'Lat Pulldown',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 50, 17),
  (last_insert_rowid(), 2, 55, 12),
  (last_insert_rowid(), 3, 55, 12),
  (last_insert_rowid(), 4, 55, 12);

-- 2026-03-22 | Volume Pull | Shrugs | liam__2026-03-22__volume-pull__shrugs
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-22',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Shrugs'),
  'Shrugs',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 90, 15),
  (last_insert_rowid(), 2, 90, 15),
  (last_insert_rowid(), 3, 90, 12);

-- 2026-03-21 | Volume Push | Incline Press | liam__2026-03-21__volume-push__incline-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-21',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Press'),
  'Incline Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 25, 12),
  (last_insert_rowid(), 2, 25, 12),
  (last_insert_rowid(), 3, 25, 11),
  (last_insert_rowid(), 4, 25, 9);

-- 2026-03-21 | Volume Push | Machine Press | liam__2026-03-21__volume-push__machine-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-21',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Machine Press'),
  'Machine Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 80, 12),
  (last_insert_rowid(), 2, 80, 12),
  (last_insert_rowid(), 3, 80, 12),
  (last_insert_rowid(), 4, 80, 11);

-- 2026-03-21 | Volume Push | Skull Crusher | liam__2026-03-21__volume-push__skull-crusher
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-21',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Skull Crusher'),
  'Skull Crusher',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 30, 12),
  (last_insert_rowid(), 2, 30, 12),
  (last_insert_rowid(), 3, 30, 12);

-- 2026-03-21 | Volume Push | Lateral Raise | liam__2026-03-21__volume-push__lateral-raise
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-21',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Lateral Raise'),
  'Lateral Raise',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 15, 12),
  (last_insert_rowid(), 2, 15, 12),
  (last_insert_rowid(), 3, 15, 10);

-- 2026-03-21 | Volume Push | Machine Fly | liam__2026-03-21__volume-push__machine-fly
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-21',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Machine Fly'),
  'Machine Fly',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 63, 12),
  (last_insert_rowid(), 2, 63, 10),
  (last_insert_rowid(), 3, 63, 10);

-- 2026-03-19 | Strength Pull | Hammer Curl | liam__2026-03-19__strength-pull__hammer-curl
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-19',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Hammer Curl'),
  'Hammer Curl',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 20, 12),
  (last_insert_rowid(), 2, 20, 10);

-- 2026-03-19 | Strength Pull | Pull Up | liam__2026-03-19__strength-pull__pull-up
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-19',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up'),
  'Pull Up',
  'Bodyweight'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 12),
  (last_insert_rowid(), 2, 0, 11),
  (last_insert_rowid(), 3, 0, 9);

-- 2026-03-19 | Strength Pull | Deadlift | liam__2026-03-19__strength-pull__deadlift
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-19',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Deadlift'),
  'Deadlift',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 140, 6),
  (last_insert_rowid(), 2, 140, 6),
  (last_insert_rowid(), 3, 140, 6);

-- 2026-03-19 | Strength Pull | T-Bar Row | liam__2026-03-19__strength-pull__t-bar-row
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-19',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'T-Bar Row'),
  'T-Bar Row',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 50, 12),
  (last_insert_rowid(), 2, 50, 11),
  (last_insert_rowid(), 3, 50, 8);

-- 2026-03-18 | Strength Push | Incline Bench Press | liam__2026-03-18__strength-push__incline-bench-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-18',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Bench Press'),
  'Incline Bench Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 80, 8),
  (last_insert_rowid(), 2, 80, 7),
  (last_insert_rowid(), 3, 80, 6);

-- 2026-03-18 | Strength Push | Tricep Pushdown | liam__2026-03-18__strength-push__tricep-pushdown
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-18',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Tricep Pushdown'),
  'Tricep Pushdown',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 35, 10),
  (last_insert_rowid(), 2, 35, 8),
  (last_insert_rowid(), 3, 35, 7);

-- 2026-03-18 | Strength Push | Overhead Press | liam__2026-03-18__strength-push__overhead-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-18',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Overhead Press'),
  'Overhead Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 50, 6),
  (last_insert_rowid(), 2, 40, 8),
  (last_insert_rowid(), 3, 40, 9),
  (last_insert_rowid(), 4, 40, 8);

-- 2026-03-18 | Strength Push | Deadbug | liam__2026-03-18__strength-push__deadbug
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-18',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Deadbug'),
  'Deadbug',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 25, 10),
  (last_insert_rowid(), 2, 25, 10);

-- 2026-03-18 | Strength Push | Bench Press | liam__2026-03-18__strength-push__bench-press
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-18',
  'Strength Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Bench Press'),
  'Bench Press',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 25, 10),
  (last_insert_rowid(), 2, 30, 8),
  (last_insert_rowid(), 3, 30, 7);

-- 2026-03-17 | Strength Legs | High Bar Squat | liam__2026-03-17__strength-legs__high-bar-squat
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-17',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'High Bar Squat'),
  'High Bar Squat',
  '2 sec pause. RPE 8.8'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 100, 8),
  (last_insert_rowid(), 2, 100, 8),
  (last_insert_rowid(), 3, 100, 8);

-- 2026-03-17 | Strength Legs | Back Extension | liam__2026-03-17__strength-legs__back-extension
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-17',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Back Extension'),
  'Back Extension',
  'Bodyweight'
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 0, 15),
  (last_insert_rowid(), 2, 0, 12),
  (last_insert_rowid(), 3, 0, 10);

-- 2026-03-17 | Strength Legs | Rope Crunch | liam__2026-03-17__strength-legs__rope-crunch
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-17',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Rope Crunch'),
  'Rope Crunch',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 60, 15),
  (last_insert_rowid(), 2, 60, 12);

-- 2026-03-17 | Strength Legs | Plate Elevated Close Stance Squat | liam__2026-03-17__strength-legs__plate-elevated-close-stance-squat
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-17',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Plate Elevated Close Stance Squat'),
  'Plate Elevated Close Stance Squat',
  ''
);
INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps)
VALUES
  (last_insert_rowid(), 1, 60, 15);

-- 2026-03-17 | Strength Legs | Stiff Leg Deadlift | liam__2026-03-17__strength-legs__stiff-leg-deadlift
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'liam',
  '2026-03-17',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Stiff Leg Deadlift'),
  'Stiff Leg Deadlift',
  'Lower back injury — skipped'
);
-- No set rows for this log (skipped/no work recorded).

COMMIT;