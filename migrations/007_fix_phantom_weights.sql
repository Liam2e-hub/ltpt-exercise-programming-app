-- Fix phantom 100kg weights in session_sets
-- Root cause: blank weight fields in V1 Notion import (migration 003) defaulted to 100kg
-- Safe fix: NULL out weight_kg = 100 for Bodyweight exercises only
-- For barbell/cable/machine exercises at 100kg, manual review is needed (open issue #4 partial fix)
-- Run the audit query after this migration to see any remaining 100kg values:
--   SELECT e.exercise_name, sl.athlete_id, COUNT(*) as sets
--   FROM session_sets ss
--   JOIN session_logs sl ON ss.session_log_id = sl.id
--   JOIN exercises e ON sl.exercise_id = e.id
--   WHERE ss.weight_kg = 100
--   GROUP BY e.exercise_name, sl.athlete_id
--   ORDER BY e.exercise_name;

PRAGMA foreign_keys = OFF;

UPDATE session_sets
SET weight_kg = NULL
WHERE weight_kg = 100
  AND session_log_id IN (
    SELECT sl.id
    FROM session_logs sl
    JOIN exercises e ON sl.exercise_id = e.id
    WHERE e.equipment = 'Bodyweight'
  );
