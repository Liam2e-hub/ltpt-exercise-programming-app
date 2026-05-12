-- Migration: Import Nick Somma training history into LTPT V3 D1
-- Generated from Notion CSV export. Do not run twice unless converted to idempotent form.
PRAGMA foreign_keys = OFF;

-- nick__2026-04-17__strength-pull__conventional-deadlift | Conventional Deadlift — Strength Pull — 17 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-17',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Conventional Deadlift'),
  'Conventional Deadlift',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 60, 6),
  (last_insert_rowid(), 2, 60, 6),
  (last_insert_rowid(), 3, 60, 6);

-- nick__2026-04-17__strength-pull__pull-up | Pull Up — Strength Pull — 17 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-17',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up'),
  'Pull Up',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 10, 6),
  (last_insert_rowid(), 2, 10, 5),
  (last_insert_rowid(), 3, 10, 4);

-- nick__2026-04-17__strength-pull__t-bar-row | T-Bar Row — Strength Pull — 17 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-17',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'T-Bar Row'),
  'T-Bar Row',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 20, 12),
  (last_insert_rowid(), 2, 20, 10),
  (last_insert_rowid(), 3, 20, 8);

-- nick__2026-04-17__strength-pull__hammer-curl | Hammer Curl — Strength Pull — 17 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-17',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Hammer Curl'),
  'Hammer Curl',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 15, 10),
  (last_insert_rowid(), 2, 15, 10),
  (last_insert_rowid(), 3, 15, 10);

-- nick__2026-04-17__strength-pull__leg-raise | Leg Raise — Strength Pull — 17 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-17',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Leg Raise'),
  'Leg Raise',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 0, 4);

-- nick__2026-04-19__volume-push__chest-press | Chest Press — Volume Push — 19 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-19',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Press'),
  'Chest Press',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 50, 12),
  (last_insert_rowid(), 2, 55, 10);

-- nick__2026-04-19__volume-push__chest-press__2 | Chest Press — Volume Push — 19 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-19',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Press'),
  'Chest Press',
  'last set too heavy'
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 50, 12),
  (last_insert_rowid(), 2, 55, 10),
  (last_insert_rowid(), 3, 60, 10),
  (last_insert_rowid(), 4, 70, 7);

-- nick__2026-04-19__volume-push__incline-press | Incline Press — Volume Push — 19 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-19',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Press'),
  'Incline Press',
  'Pulled back weight on last set to get more volume'
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 15, 12),
  (last_insert_rowid(), 2, 15, 12),
  (last_insert_rowid(), 3, 12.5, 12);

-- nick__2026-04-24__strength-pull__conventional-deadlift | Conventional Deadlift — Strength Pull — 24 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-24',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Conventional Deadlift'),
  'Conventional Deadlift',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 80, 5),
  (last_insert_rowid(), 2, 80, 4),
  (last_insert_rowid(), 3, 60, 4);

-- nick__2026-04-24__strength-pull__pull-up | Pull Up — Strength Pull — 24 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-24',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up'),
  'Pull Up',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 7),
  (last_insert_rowid(), 3, 0, 9);

-- nick__2026-04-24__strength-pull__t-bar-row | T-Bar Row — Strength Pull — 24 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-24',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'T-Bar Row'),
  'T-Bar Row',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 30, 7),
  (last_insert_rowid(), 2, 30, 6),
  (last_insert_rowid(), 3, 30, 6);

-- nick__2026-04-24__strength-pull__hammer-curl | Hammer Curl — Strength Pull — 24 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-24',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Hammer Curl'),
  'Hammer Curl',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 10, 12),
  (last_insert_rowid(), 2, 10, 12),
  (last_insert_rowid(), 3, 10, 12);

-- nick__2026-04-24__strength-pull__leg-raise | Leg Raise — Strength Pull — 24 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-24',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Leg Raise'),
  'Leg Raise',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 0, 8),
  (last_insert_rowid(), 2, 0, 8),
  (last_insert_rowid(), 3, 0, 8);

-- nick__2026-04-26__volume-push__chest-press | Chest Press — Volume Push — 26 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-26',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Press'),
  'Chest Press',
  'Failed on 7th rep second and third set, too heavy'
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 60, 10),
  (last_insert_rowid(), 2, 60, 6),
  (last_insert_rowid(), 3, 60, 6);

-- nick__2026-04-26__volume-push__incline-press | Incline Press — Volume Push — 26 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-26',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Press'),
  'Incline Press',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 15, 12),
  (last_insert_rowid(), 2, 15, 12),
  (last_insert_rowid(), 3, 15, 12);

-- nick__2026-04-26__volume-push__chest-fly | Chest Fly — Volume Push — 26 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-26',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Fly'),
  'Chest Fly',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 30, 10),
  (last_insert_rowid(), 2, 25, 12),
  (last_insert_rowid(), 3, 25, 12);

-- nick__2026-04-26__volume-push__lateral-raise | Lateral Raise — Volume Push — 26 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-26',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Lateral Raise'),
  'Lateral Raise',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 7.5, 12),
  (last_insert_rowid(), 2, 7.5, 12),
  (last_insert_rowid(), 3, 7.5, 12);

-- nick__2026-04-26__volume-push__skull-crusher | Skull Crusher — Volume Push — 26 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-26',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Skull Crusher'),
  'Skull Crusher',
  'Last set was practicing form'
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 44, 12),
  (last_insert_rowid(), 2, 44, 12),
  (last_insert_rowid(), 3, 22, 8);

-- nick__2026-04-27__volume-pull__bent-over-row | Bent Over Row — Volume Pull — 27 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-27',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Bent Over Row'),
  'Bent Over Row',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 40, 12),
  (last_insert_rowid(), 2, 50, 12),
  (last_insert_rowid(), 3, 60, 8);

-- nick__2026-04-27__volume-pull__pull-up-pronated | Pull Up (Pronated) — Volume Pull — 27 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-27',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up (Pronated)'),
  'Pull Up (Pronated)',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 0, 9),
  (last_insert_rowid(), 2, 0, 5),
  (last_insert_rowid(), 3, 0, 6);

-- nick__2026-04-27__volume-pull__rear-delt-fly | Rear Delt Fly — Volume Pull — 27 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-27',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Rear Delt Fly'),
  'Rear Delt Fly',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 25, 15),
  (last_insert_rowid(), 2, 25, 15),
  (last_insert_rowid(), 3, 25, 15);

-- nick__2026-04-29__strength-legs__high-bar-squat | High Bar Squat — Strength Legs — 29 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-29',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'High Bar Squat'),
  'High Bar Squat',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 60, 8),
  (last_insert_rowid(), 2, 60, 8),
  (last_insert_rowid(), 3, 60, 8);

-- nick__2026-04-29__strength-legs__stiff-leg-deadlift | Stiff Leg Deadlift — Strength Legs — 29 Apr 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-04-29',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Stiff Leg Deadlift'),
  'Stiff Leg Deadlift',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 60, 6),
  (last_insert_rowid(), 2, 60, 6),
  (last_insert_rowid(), 3, 40, 8);

-- nick__2026-05-01__strength-pull__conventional-deadlift | Conventional Deadlift — Strength Pull — 1 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-01',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Conventional Deadlift'),
  'Conventional Deadlift',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 60, 10),
  (last_insert_rowid(), 2, 70, 6),
  (last_insert_rowid(), 3, 70, 6);

-- nick__2026-05-01__strength-pull__pull-up | Pull Up — Strength Pull — 1 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-01',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up'),
  'Pull Up',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 10),
  (last_insert_rowid(), 3, 0, 7);

-- nick__2026-05-01__strength-pull__t-bar-row | T-Bar Row — Strength Pull — 1 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-01',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'T-Bar Row'),
  'T-Bar Row',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 20, 12),
  (last_insert_rowid(), 2, 20, 12),
  (last_insert_rowid(), 3, 20, 12);

-- nick__2026-05-01__strength-pull__hammer-curl | Hammer Curl — Strength Pull — 1 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-01',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Hammer Curl'),
  'Hammer Curl',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 12.5, 12),
  (last_insert_rowid(), 2, 12.5, 12),
  (last_insert_rowid(), 3, 12.5, 12);

-- nick__2026-05-01__strength-pull__leg-raise | Leg Raise — Strength Pull — 1 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-01',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Leg Raise'),
  'Leg Raise',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 7),
  (last_insert_rowid(), 3, 0, 7);

-- nick__2026-05-03__volume-push__chest-press | Chest Press — Volume Push — 3 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-03',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Press'),
  'Chest Press',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 50, 12),
  (last_insert_rowid(), 2, 50, 9),
  (last_insert_rowid(), 3, 50, 8);

-- nick__2026-05-03__volume-push__incline-press | Incline Press — Volume Push — 3 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-03',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Press'),
  'Incline Press',
  '17.5 was too heavy on last set'
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 15, 12),
  (last_insert_rowid(), 2, 17.5, 8),
  (last_insert_rowid(), 3, 17.5, 5);

-- nick__2026-05-03__volume-push__chest-fly | Chest Fly — Volume Push — 3 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-03',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Fly'),
  'Chest Fly',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 30, 12),
  (last_insert_rowid(), 2, 30, 12),
  (last_insert_rowid(), 3, 30, 12);

-- nick__2026-05-03__volume-push__lateral-raise | Lateral Raise — Volume Push — 3 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-03',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Lateral Raise'),
  'Lateral Raise',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 7.5, 15),
  (last_insert_rowid(), 2, 7.5, 12),
  (last_insert_rowid(), 3, 7.5, 12);

-- nick__2026-05-04__volume-pull__bent-over-row | Bent Over Row — Volume Pull — 4 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-04',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Bent Over Row'),
  'Bent Over Row',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 60, 10),
  (last_insert_rowid(), 2, 60, 10),
  (last_insert_rowid(), 3, 60, 10);

-- nick__2026-05-04__volume-pull__pull-up-pronated | Pull Up (Pronated) — Volume Pull — 4 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-04',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up (Pronated)'),
  'Pull Up (Pronated)',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 10),
  (last_insert_rowid(), 3, 0, 8);

-- nick__2026-05-04__volume-pull__low-cable-row | Low Cable Row — Volume Pull — 4 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-04',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Low Cable Row'),
  'Low Cable Row',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 30, 12),
  (last_insert_rowid(), 2, 30, 12),
  (last_insert_rowid(), 3, 30, 12);

-- nick__2026-05-04__volume-pull__rear-delt-fly | Rear Delt Fly — Volume Pull — 4 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-04',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Rear Delt Fly'),
  'Rear Delt Fly',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 30, 15),
  (last_insert_rowid(), 2, 30, 15),
  (last_insert_rowid(), 3, 30, 15);

-- nick__2026-05-04__volume-pull__shrugs | Shrugs — Volume Pull — 4 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-04',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Shrugs'),
  'Shrugs',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 60, 12),
  (last_insert_rowid(), 2, 60, 15),
  (last_insert_rowid(), 3, 60, 15);

-- nick__2026-05-04__volume-pull__lat-pullover | Lat Pullover — Volume Pull — 4 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-04',
  'Volume Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Lat Pullover'),
  'Lat Pullover',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 30, 12),
  (last_insert_rowid(), 2, 30, 12),
  (last_insert_rowid(), 3, 30, 12);

-- nick__2026-05-06__strength-legs__high-bar-squat | High Bar Squat — Strength Legs — 6 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-06',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'High Bar Squat'),
  'High Bar Squat',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 70, 6),
  (last_insert_rowid(), 2, 70, 7),
  (last_insert_rowid(), 3, 70, 7);

-- nick__2026-05-06__strength-legs__stiff-leg-deadlift | Stiff Leg Deadlift — Strength Legs — 6 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-06',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Stiff Leg Deadlift'),
  'Stiff Leg Deadlift',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 50, 8),
  (last_insert_rowid(), 2, 50, 12),
  (last_insert_rowid(), 3, 50, 12);

-- nick__2026-05-06__strength-legs__back-extension | Back Extension — Strength Legs — 6 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-06',
  'Strength Legs',
  (SELECT id FROM exercises WHERE exercise_name = 'Back Extension'),
  'Back Extension',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 0, 12),
  (last_insert_rowid(), 2, 0, 12),
  (last_insert_rowid(), 3, 0, 12);

-- nick__2026-05-08__strength-pull__conventional-deadlift | Conventional Deadlift — Strength Pull — 8 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-08',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Conventional Deadlift'),
  'Conventional Deadlift',
  'Focus on reset in bottom position'
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 80, 6),
  (last_insert_rowid(), 2, 80, 6),
  (last_insert_rowid(), 3, 80, 7);

-- nick__2026-05-08__strength-pull__pull-up | Pull Up — Strength Pull — 8 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-08',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'Pull Up'),
  'Pull Up',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 0, 10),
  (last_insert_rowid(), 2, 0, 10),
  (last_insert_rowid(), 3, 0, 10);

-- nick__2026-05-08__strength-pull__t-bar-row | T-Bar Row — Strength Pull — 8 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-08',
  'Strength Pull',
  (SELECT id FROM exercises WHERE exercise_name = 'T-Bar Row'),
  'T-Bar Row',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 25, 12),
  (last_insert_rowid(), 2, 25, 12),
  (last_insert_rowid(), 3, 25, 12);

-- nick__2026-05-10__volume-push__chest-press | Chest Press — Volume Push — 10 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-10',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Press'),
  'Chest Press',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 60, 10),
  (last_insert_rowid(), 2, 60, 10),
  (last_insert_rowid(), 3, 60, 10);

-- nick__2026-05-10__volume-push__incline-press | Incline Press — Volume Push — 10 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-10',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Incline Press'),
  'Incline Press',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 17.5, 12),
  (last_insert_rowid(), 2, 17.5, 9),
  (last_insert_rowid(), 3, 17.5, 9);

-- nick__2026-05-10__volume-push__chest-fly | Chest Fly — Volume Push — 10 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-10',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Chest Fly'),
  'Chest Fly',
  'Stay at same weight 1 more week then go up, focus on form'
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 35, 12),
  (last_insert_rowid(), 2, 35, 12),
  (last_insert_rowid(), 3, 35, 12);

-- nick__2026-05-10__volume-push__lateral-raise | Lateral Raise — Volume Push — 10 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-10',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Lateral Raise'),
  'Lateral Raise',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 10, 12),
  (last_insert_rowid(), 2, 10, 12),
  (last_insert_rowid(), 3, 10, 12);

-- nick__2026-05-10__volume-push__skull-crusher | Skull Crusher — Volume Push — 10 May 2026
INSERT INTO session_logs (
  athlete_id,
  session_date,
  session,
  exercise_id,
  exercise_name,
  notes
)
VALUES (
  'nick',
  '2026-05-10',
  'Volume Push',
  (SELECT id FROM exercises WHERE exercise_name = 'Skull Crusher'),
  'Skull Crusher',
  NULL
);

INSERT INTO session_sets (
  session_log_id,
  set_number,
  weight_kg,
  reps
)
VALUES
  (last_insert_rowid(), 1, 15, 12),
  (last_insert_rowid(), 2, 20, 8),
  (last_insert_rowid(), 3, 20, 10);
