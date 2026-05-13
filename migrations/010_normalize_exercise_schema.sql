-- Migration 010: Normalize exercise schema
-- Introduces exercise_base (the movement concept) and restructures exercises as
-- equipment variants of a base. UNIQUE constraint moves from exercise_name alone
-- to (base_id, equipment), preventing the same movement/equipment combo from being
-- entered twice regardless of what name was used.
--
-- IMPORTANT: Run migration 009 (deduplicate) BEFORE this migration.
-- IMPORTANT: Deploy the updated Worker (which JOINs exercise_base) AFTER this migration runs.
--            If the old Worker is still deployed, exercise queries will still work because
--            exercise.id values are preserved and the old Worker does not reference exercise_base.
--            Once the new Worker deploys it requires exercise_base to exist.
--
-- What this migration does NOT change:
--   - exercises.id values — all FK references in athlete_program and session_logs are preserved
--   - session_logs.exercise_name snapshot column — historical names are untouched
--   - All other tables (athletes, session_logs, session_sets, nutrition_logs, etc.)
PRAGMA foreign_keys = OFF;

-- ============================================================
-- Step 1: Create exercise_base
-- Populated 1:1 from existing exercises, using the same id values.
-- This means exercise_base.id = exercises.id for all existing entries,
-- making base_id trivial to populate without a lookup join.
-- ============================================================
CREATE TABLE IF NOT EXISTS exercise_base (
  id               INTEGER PRIMARY KEY,
  name             TEXT    NOT NULL UNIQUE,
  session_category TEXT,
  notes            TEXT,
  created_at       TEXT DEFAULT (datetime('now'))
);

INSERT OR IGNORE INTO exercise_base (id, name, session_category, notes, created_at)
SELECT id, exercise_name, session_category, notes, created_at
FROM exercises;

-- ============================================================
-- Step 2: Recreate exercises with the new schema
-- SQLite does not support DROP CONSTRAINT, so we recreate the table.
-- exercises_new uses the same id values so all FKs in athlete_program
-- and session_logs remain valid after rename.
-- ============================================================
CREATE TABLE exercises_new (
  id                INTEGER PRIMARY KEY,
  base_id           INTEGER NOT NULL REFERENCES exercise_base(id) ON DELETE CASCADE,
  equipment         TEXT    NOT NULL DEFAULT 'Bodyweight',
  default_reps      TEXT,
  default_weight_kg REAL,
  default_sets      INTEGER,
  icon_url          TEXT,
  created_at        TEXT DEFAULT (datetime('now')),
  UNIQUE(base_id, equipment)
);

INSERT INTO exercises_new (id, base_id, equipment, default_reps, default_weight_kg, default_sets, icon_url, created_at)
SELECT
  e.id,
  e.id                              AS base_id,   -- exercise_base.id = exercises.id (1:1 mapping above)
  COALESCE(e.equipment, 'Bodyweight') AS equipment,
  e.default_reps,
  e.default_weight_kg,
  e.default_sets,
  e.icon_url,
  e.created_at
FROM exercises e;

-- ============================================================
-- Step 3: Swap tables
-- ============================================================
DROP TABLE exercises;
ALTER TABLE exercises_new RENAME TO exercises;

-- Fix autoincrement sequence so new rows continue from the current max id
UPDATE sqlite_sequence SET name = 'exercises' WHERE name = 'exercises_new';

-- ============================================================
-- Step 4: Recreate indexes
-- ============================================================
CREATE INDEX IF NOT EXISTS idx_session_logs_exercise    ON session_logs(exercise_id);
CREATE INDEX IF NOT EXISTS idx_athlete_program_athlete  ON athlete_program(athlete_id, session, active);

PRAGMA foreign_keys = ON;
