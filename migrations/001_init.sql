-- LTPT V3 — Initial schema
-- Run: wrangler d1 execute ltpt-v3-db --file=./migrations/001_init.sql --remote

-- ─── Tables ─────────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS athletes (
  id           TEXT PRIMARY KEY,
  first_name   TEXT NOT NULL,
  pin          TEXT NOT NULL,
  age          INTEGER,
  height_cm    REAL,
  weight_kg    REAL,
  email        TEXT,
  main_goal    TEXT,
  date_started TEXT,
  active       INTEGER DEFAULT 1,
  created_at   TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS exercises (
  id                INTEGER PRIMARY KEY AUTOINCREMENT,
  exercise_name     TEXT NOT NULL UNIQUE,
  session_category  TEXT,
  equipment         TEXT,
  default_reps      TEXT,
  default_weight_kg REAL,
  default_sets      INTEGER,
  notes             TEXT,
  icon_url          TEXT,
  created_at        TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS athlete_program (
  id             INTEGER PRIMARY KEY AUTOINCREMENT,
  athlete_id     TEXT NOT NULL REFERENCES athletes(id) ON DELETE CASCADE,
  exercise_id    INTEGER NOT NULL REFERENCES exercises(id) ON DELETE CASCADE,
  session        TEXT NOT NULL,
  goal_reps      TEXT,
  goal_weight_kg REAL,
  sets           INTEGER,
  display_order  INTEGER,
  active         INTEGER DEFAULT 1,
  UNIQUE(athlete_id, exercise_id, session)
);

CREATE TABLE IF NOT EXISTS schedules (
  id            INTEGER PRIMARY KEY AUTOINCREMENT,
  athlete_id    TEXT NOT NULL REFERENCES athletes(id) ON DELETE CASCADE,
  day           TEXT NOT NULL,
  session       TEXT,
  display_order INTEGER,
  UNIQUE(athlete_id, day)
);

CREATE TABLE IF NOT EXISTS session_logs (
  id            INTEGER PRIMARY KEY AUTOINCREMENT,
  athlete_id    TEXT NOT NULL REFERENCES athletes(id),
  session_date  TEXT NOT NULL,
  session       TEXT NOT NULL,
  exercise_id   INTEGER REFERENCES exercises(id) ON DELETE SET NULL,
  exercise_name TEXT NOT NULL,
  notes         TEXT,
  created_at    TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS session_sets (
  id             INTEGER PRIMARY KEY AUTOINCREMENT,
  session_log_id INTEGER NOT NULL REFERENCES session_logs(id) ON DELETE CASCADE,
  set_number     INTEGER NOT NULL,
  weight_kg      REAL,
  reps           INTEGER
);

CREATE TABLE IF NOT EXISTS nutrition_logs (
  id         INTEGER PRIMARY KEY AUTOINCREMENT,
  athlete_id TEXT NOT NULL REFERENCES athletes(id) ON DELETE CASCADE,
  log_date   TEXT NOT NULL,
  meal_type  TEXT,
  meal_name  TEXT,
  calories   INTEGER,
  protein_g  REAL,
  carbs_g    REAL,
  fat_g      REAL,
  notes      TEXT,
  created_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS regular_meals (
  id         INTEGER PRIMARY KEY AUTOINCREMENT,
  athlete_id TEXT NOT NULL REFERENCES athletes(id) ON DELETE CASCADE,
  meal_name  TEXT NOT NULL,
  meal_type  TEXT,
  calories   INTEGER,
  protein_g  REAL,
  carbs_g    REAL,
  fat_g      REAL,
  notes      TEXT
);

CREATE TABLE IF NOT EXISTS program_templates (
  id   INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  days INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS program_template_days (
  id          INTEGER PRIMARY KEY AUTOINCREMENT,
  template_id INTEGER NOT NULL REFERENCES program_templates(id) ON DELETE CASCADE,
  day         TEXT NOT NULL,
  session     TEXT
);

-- ─── Indexes ─────────────────────────────────────────────────────────────────

CREATE INDEX IF NOT EXISTS idx_session_logs_athlete_date ON session_logs(athlete_id, session_date);
CREATE INDEX IF NOT EXISTS idx_session_logs_exercise ON session_logs(exercise_id);
CREATE INDEX IF NOT EXISTS idx_session_sets_log ON session_sets(session_log_id);
CREATE INDEX IF NOT EXISTS idx_athlete_program_athlete ON athlete_program(athlete_id, session, active);
CREATE INDEX IF NOT EXISTS idx_schedules_athlete ON schedules(athlete_id, day);
CREATE INDEX IF NOT EXISTS idx_nutrition_logs_athlete_date ON nutrition_logs(athlete_id, log_date);

-- ─── Seed: Program Templates ─────────────────────────────────────────────────

INSERT OR IGNORE INTO program_templates (name, days) VALUES
  ('3 Day', 3),
  ('4 Day', 4),
  ('5 Day', 5),
  ('6 Day', 6);

-- 3 Day: Strength Legs / Volume Push / Volume Pull
INSERT OR IGNORE INTO program_template_days (template_id, day, session) VALUES
  (1, 'Monday',    'Strength Legs'),
  (1, 'Tuesday',   'Rest'),
  (1, 'Wednesday', 'Volume Push'),
  (1, 'Thursday',  'Rest'),
  (1, 'Friday',    'Volume Pull'),
  (1, 'Saturday',  'Rest'),
  (1, 'Sunday',    'Rest');

-- 4 Day: adds Abs & Arms on Sunday
INSERT OR IGNORE INTO program_template_days (template_id, day, session) VALUES
  (2, 'Monday',    'Strength Legs'),
  (2, 'Tuesday',   'Rest'),
  (2, 'Wednesday', 'Volume Push'),
  (2, 'Thursday',  'Rest'),
  (2, 'Friday',    'Volume Pull'),
  (2, 'Saturday',  'Rest'),
  (2, 'Sunday',    'Abs & Arms');

-- 5 Day
INSERT OR IGNORE INTO program_template_days (template_id, day, session) VALUES
  (3, 'Monday',    'Strength Legs'),
  (3, 'Tuesday',   'Volume Push'),
  (3, 'Wednesday', 'Volume Pull'),
  (3, 'Thursday',  'Rest'),
  (3, 'Friday',    'Volume Legs'),
  (3, 'Saturday',  'Rest'),
  (3, 'Sunday',    'Strength Push');

-- 6 Day
INSERT OR IGNORE INTO program_template_days (template_id, day, session) VALUES
  (4, 'Monday',    'Strength Legs'),
  (4, 'Tuesday',   'Strength Push'),
  (4, 'Wednesday', 'Strength Pull'),
  (4, 'Thursday',  'Rest'),
  (4, 'Friday',    'Volume Push'),
  (4, 'Saturday',  'Volume Pull'),
  (4, 'Sunday',    'Abs & Arms');

-- ─── Seed: Global Exercise Library ───────────────────────────────────────────
-- Admin-managed. Add more via:
-- wrangler d1 execute ltpt-v3-db --command="INSERT INTO exercises ..." --remote

INSERT OR IGNORE INTO exercises (exercise_name, session_category, equipment, default_reps, default_weight_kg, default_sets, notes) VALUES
  -- Strength Legs
  ('Barbell Back Squat',       'Compound',  'Barbell',    '4-6',  100, 4, 'Brace core, chest up, drive knees out. Aim for hip crease below parallel.'),
  ('Romanian Deadlift',        'Compound',  'Barbell',    '6-8',  80,  4, 'Hinge at hips, slight knee bend. Bar stays close, feel hamstring stretch at bottom.'),
  ('Leg Press',                'Compound',  'Machine',    '8-10', 120, 3, 'Feet hip-width. Full range — don''t lock knees at top.'),
  ('Leg Curl',                 'Isolation', 'Machine',    '10-12',40,  3, 'Control the negative. Full range of motion.'),
  ('Leg Extension',            'Isolation', 'Machine',    '12-15',35,  3, 'Squeeze at top. Control the eccentric.'),
  ('Walking Lunges',           'Compound',  'Dumbbell',   '10-12',20,  3, 'Step long enough that front shin stays vertical.'),
  ('Calf Raise',               'Isolation', 'Machine',    '15-20',60,  4, 'Full range — all the way up and all the way down. Pause at bottom stretch.'),

  -- Strength Push
  ('Barbell Bench Press',      'Compound',  'Barbell',    '4-6',  80,  4, 'Retract scapula, slight arch. Bar to lower chest. Drive feet into floor.'),
  ('Incline Dumbbell Press',   'Compound',  'Dumbbell',   '6-8',  30,  3, '30-45 degree incline. Elbows at ~75 degrees. Full range.'),
  ('Overhead Press',           'Compound',  'Barbell',    '4-6',  50,  4, 'Brace hard, glutes tight. Bar clears chin then push head through.'),
  ('Lateral Raise',            'Isolation', 'Dumbbell',   '12-15',10,  4, 'Slight forward lean. Lead with elbows. Don''t shrug.'),
  ('Cable Fly',                'Isolation', 'Cable',      '12-15',15,  3, 'Arms slightly bent. Feel stretch at bottom, squeeze at top.'),
  ('Tricep Pushdown',          'Isolation', 'Cable',      '12-15',20,  3, 'Elbows pinned to sides. Full extension at bottom.'),
  ('Skull Crusher',            'Isolation', 'Barbell',    '10-12',30,  3, 'Elbows stay vertical. Lower bar to forehead or behind head.'),

  -- Strength Pull
  ('Deadlift',                 'Compound',  'Barbell',    '3-5',  120, 4, 'Neutral spine. Bar over mid-foot. Drive floor away. Lock out hips at top.'),
  ('Barbell Row',              'Compound',  'Barbell',    '6-8',  70,  4, 'Hinge ~45 degrees. Pull bar to lower chest. Squeeze shoulder blades.'),
  ('Pull Up',                  'Compound',  'Bodyweight', '6-10', 0,   4, 'Dead hang start. Pull elbows to hips. Full range — chin clears bar.'),
  ('Lat Pulldown',             'Compound',  'Cable',      '8-10', 60,  3, 'Slight lean back. Pull bar to upper chest. Squeeze lats at bottom.'),
  ('Cable Row',                'Compound',  'Cable',      '10-12',50,  3, 'Chest up, slight lean back. Elbows tight to body.'),
  ('Face Pull',                'Accessory', 'Cable',      '15-20',15,  3, 'High anchor. Pull to face, external rotate at end. Great for shoulder health.'),
  ('Bicep Curl',               'Isolation', 'Dumbbell',   '10-12',14,  3, 'No swinging. Full range — full extension at bottom.'),
  ('Hammer Curl',              'Isolation', 'Dumbbell',   '10-12',16,  3, 'Neutral grip. Control the eccentric.'),

  -- Volume Push
  ('Dumbbell Bench Press',     'Compound',  'Dumbbell',   '8-12', 28,  4, 'Full range. Controlled descent. Squeeze at top.'),
  ('Push Up',                  'Compound',  'Bodyweight', '15-20',0,   3, 'Full range. Core tight. Elbows at ~45 degrees.'),
  ('Dumbbell Lateral Raise',   'Isolation', 'Dumbbell',   '15-20',8,   4, 'Lead with elbows. Don''t shrug.'),
  ('Cable Tricep Kickback',    'Isolation', 'Cable',      '12-15',10,  3, 'Upper arm parallel to floor. Full extension.'),

  -- Volume Pull
  ('Dumbbell Row',             'Compound',  'Dumbbell',   '10-12',32,  4, 'Knee and hand on bench. Pull to hip. Squeeze lat at top.'),
  ('Chin Up',                  'Compound',  'Bodyweight', '8-12', 0,   3, 'Supinated grip. Full range. Controlled negative.'),
  ('Straight Arm Pulldown',    'Isolation', 'Cable',      '12-15',25,  3, 'Arms straight throughout. Drive hands to hips. Feel the lat stretch.'),
  ('Preacher Curl',            'Isolation', 'Barbell',    '10-12',25,  3, 'Full extension at bottom. No cheating — pad locks upper arm.'),

  -- Volume Legs
  ('Goblet Squat',             'Compound',  'Kettlebell', '12-15',24,  3, 'Hold KB at chest. Sit between knees. Chest up.'),
  ('Bulgarian Split Squat',    'Compound',  'Dumbbell',   '10-12',18,  3, 'Rear foot elevated. Front shin vertical. Drive through heel.'),
  ('Nordic Curl',              'Compound',  'Bodyweight', '6-8',  0,   3, 'Slow eccentric. Catch yourself and push back up.'),
  ('Hip Thrust',               'Compound',  'Barbell',    '10-12',80,  4, 'Bench at shoulder blade height. Drive through heels. Squeeze glutes at top.'),
  ('Seated Calf Raise',        'Isolation', 'Machine',    '15-20',30,  4, 'Full range. Pause at stretch.'),

  -- Abs & Arms
  ('Cable Crunch',             'Isolation', 'Cable',      '15-20',20,  3, 'Kneel facing machine. Crunch down, not forward. Feel the abs.'),
  ('Hanging Leg Raise',        'Isolation', 'Bodyweight', '12-15',0,   3, 'Dead hang start. Raise legs to parallel or higher. Control the negative.'),
  ('Plank',                    'Accessory', 'Bodyweight', '60s',  0,   3, 'Neutral spine. Squeeze everything. Don''t let hips drop.'),
  ('Incline Curl',             'Isolation', 'Dumbbell',   '10-12',12,  3, 'Arm hangs fully extended. Full range. Great for long head of bicep.'),
  ('Tricep Dip',               'Compound',  'Bodyweight', '10-15',0,   3, 'Upright torso for tricep focus. Full lockout at top.');
