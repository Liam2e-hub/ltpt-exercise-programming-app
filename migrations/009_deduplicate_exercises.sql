-- Migration 009: Deduplicate exercises
-- Merges confirmed duplicate pairs introduced during V1 history import.
-- For each pair: remaps athlete_program + session_logs FKs, then deletes the duplicate row.
-- Conflict-safe: if the canonical exercise already exists in the same athlete/session slot,
-- the duplicate athlete_program row is deleted rather than remapped (avoids UNIQUE violation).
-- Safe to re-run: subselects return NULL when target name is already gone, UPDATE/DELETE no-ops.
--
-- NOTE: Updated to use exercise_base.name lookups after migration 010 removed
-- exercise_name from the exercises table. Requires 010 to have run first.
PRAGMA foreign_keys = OFF;

-- ============================================================
-- Pair 1: 'Machine Press' (Machine) → canonical: 'Chest Press' (Machine)
-- Both entered during separate V1 imports for Liam and Nick.
-- ============================================================
UPDATE athlete_program
SET exercise_id = (SELECT e.id FROM exercises e JOIN exercise_base eb ON eb.id = e.base_id WHERE eb.name = 'Chest Press')
WHERE exercise_id = (SELECT e.id FROM exercises e JOIN exercise_base eb ON eb.id = e.base_id WHERE eb.name = 'Machine Press')
  AND NOT EXISTS (
    SELECT 1 FROM athlete_program ap2
    WHERE ap2.athlete_id  = athlete_program.athlete_id
      AND ap2.session     = athlete_program.session
      AND ap2.exercise_id = (SELECT e.id FROM exercises e JOIN exercise_base eb ON eb.id = e.base_id WHERE eb.name = 'Chest Press')
  );

DELETE FROM athlete_program
WHERE exercise_id = (SELECT e.id FROM exercises e JOIN exercise_base eb ON eb.id = e.base_id WHERE eb.name = 'Machine Press');

UPDATE session_logs
SET exercise_id   = (SELECT e.id FROM exercises e JOIN exercise_base eb ON eb.id = e.base_id WHERE eb.name = 'Chest Press'),
    exercise_name = 'Chest Press'
WHERE exercise_id = (SELECT e.id FROM exercises e JOIN exercise_base eb ON eb.id = e.base_id WHERE eb.name = 'Machine Press');

DELETE FROM exercises
WHERE base_id = (SELECT id FROM exercise_base WHERE name = 'Machine Press');

DELETE FROM exercise_base WHERE name = 'Machine Press';

-- ============================================================
-- Pair 2: 'Incline Press' (Dumbbell) → canonical: 'Incline Dumbbell Press' (Dumbbell)
-- 'Incline Press' entered for Nick; 'Incline Dumbbell Press' already in seed.
-- ============================================================
UPDATE athlete_program
SET exercise_id = (SELECT e.id FROM exercises e JOIN exercise_base eb ON eb.id = e.base_id WHERE eb.name = 'Incline Dumbbell Press')
WHERE exercise_id = (SELECT e.id FROM exercises e JOIN exercise_base eb ON eb.id = e.base_id WHERE eb.name = 'Incline Press')
  AND NOT EXISTS (
    SELECT 1 FROM athlete_program ap2
    WHERE ap2.athlete_id  = athlete_program.athlete_id
      AND ap2.session     = athlete_program.session
      AND ap2.exercise_id = (SELECT e.id FROM exercises e JOIN exercise_base eb ON eb.id = e.base_id WHERE eb.name = 'Incline Dumbbell Press')
  );

DELETE FROM athlete_program
WHERE exercise_id = (SELECT e.id FROM exercises e JOIN exercise_base eb ON eb.id = e.base_id WHERE eb.name = 'Incline Press');

UPDATE session_logs
SET exercise_id   = (SELECT e.id FROM exercises e JOIN exercise_base eb ON eb.id = e.base_id WHERE eb.name = 'Incline Dumbbell Press'),
    exercise_name = 'Incline Dumbbell Press'
WHERE exercise_id = (SELECT e.id FROM exercises e JOIN exercise_base eb ON eb.id = e.base_id WHERE eb.name = 'Incline Press');

DELETE FROM exercises
WHERE base_id = (SELECT id FROM exercise_base WHERE name = 'Incline Press');

DELETE FROM exercise_base WHERE name = 'Incline Press';

-- ============================================================
-- Pair 3: 'Dumbbell Lateral Raise' (Dumbbell) → canonical: 'Lateral Raise' (Dumbbell)
-- Both in the original seed — 'Lateral Raise' in Strength Push, 'Dumbbell Lateral Raise'
-- in Volume Push. Same movement, same equipment, different names.
-- ============================================================
UPDATE athlete_program
SET exercise_id = (SELECT e.id FROM exercises e JOIN exercise_base eb ON eb.id = e.base_id WHERE eb.name = 'Lateral Raise')
WHERE exercise_id = (SELECT e.id FROM exercises e JOIN exercise_base eb ON eb.id = e.base_id WHERE eb.name = 'Dumbbell Lateral Raise')
  AND NOT EXISTS (
    SELECT 1 FROM athlete_program ap2
    WHERE ap2.athlete_id  = athlete_program.athlete_id
      AND ap2.session     = athlete_program.session
      AND ap2.exercise_id = (SELECT e.id FROM exercises e JOIN exercise_base eb ON eb.id = e.base_id WHERE eb.name = 'Lateral Raise')
  );

DELETE FROM athlete_program
WHERE exercise_id = (SELECT e.id FROM exercises e JOIN exercise_base eb ON eb.id = e.base_id WHERE eb.name = 'Dumbbell Lateral Raise');

UPDATE session_logs
SET exercise_id   = (SELECT e.id FROM exercises e JOIN exercise_base eb ON eb.id = e.base_id WHERE eb.name = 'Lateral Raise'),
    exercise_name = 'Lateral Raise'
WHERE exercise_id = (SELECT e.id FROM exercises e JOIN exercise_base eb ON eb.id = e.base_id WHERE eb.name = 'Dumbbell Lateral Raise');

DELETE FROM exercises
WHERE base_id = (SELECT id FROM exercise_base WHERE name = 'Dumbbell Lateral Raise');

DELETE FROM exercise_base WHERE name = 'Dumbbell Lateral Raise';

PRAGMA foreign_keys = ON;
