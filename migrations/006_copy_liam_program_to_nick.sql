-- Migration: Copy Liam's exercise program to Nick
-- Copies all active athlete_program rows from liam to nick.
-- INSERT OR IGNORE skips any that already exist for nick.
PRAGMA foreign_keys = OFF;

INSERT OR IGNORE INTO athlete_program (athlete_id, exercise_id, session, goal_reps, goal_weight_kg, sets, display_order, active)
SELECT 'nick', exercise_id, session, goal_reps, goal_weight_kg, sets, display_order, active
FROM athlete_program
WHERE athlete_id = 'liam' AND active = 1;
