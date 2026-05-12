-- Migration: Add exercises missing from initial seed that appear in V1 import data
-- Safe to re-run: INSERT OR IGNORE skips existing names.
PRAGMA foreign_keys = OFF;

-- Nick Somma exercises not in 001_init.sql seed
INSERT OR IGNORE INTO exercises (exercise_name, session_category, equipment, default_reps, default_weight_kg, default_sets, notes) VALUES
  ('Conventional Deadlift',  'Compound',  'Barbell',    '3-5',  120, 4, 'Conventional stance. Bar over mid-foot, neutral spine. Drive floor away, lock hips at top.'),
  ('T-Bar Row',              'Compound',  'Barbell',    '8-10', 40,  3, 'Chest supported or bent over. Pull to lower chest. Squeeze shoulder blades.'),
  ('Leg Raise',              'Isolation', 'Bodyweight', '12-15',0,   3, 'Legs straight or slightly bent. Control the eccentric. Do not swing.'),
  ('Chest Press',            'Compound',  'Machine',    '8-12', 60,  3, 'Machine chest press. Full range, elbows track at 75 degrees.'),
  ('Incline Press',          'Compound',  'Dumbbell',   '8-10', 30,  3, '30-45 degree incline. Elbows at 75 degrees. Full range of motion.'),
  ('Chest Fly',              'Isolation', 'Machine',    '12-15',25,  3, 'Machine or cable. Arms slightly bent. Feel stretch at bottom, squeeze at top.'),
  ('Bent Over Row',          'Compound',  'Barbell',    '6-8',  60,  3, 'Hinge 45 degrees. Bar to lower chest. Retract shoulder blades at top.'),
  ('Pull Up (Pronated)',     'Compound',  'Bodyweight', '6-10', 0,   3, 'Overhand/pronated grip. Dead hang start. Pull elbows to hips. Chin clears bar.'),
  ('Rear Delt Fly',          'Isolation', 'Dumbbell',   '15-20',10,  3, 'Hinge forward, slight bend in elbows. Lead with elbows, squeeze rear delts.'),
  ('High Bar Squat',         'Compound',  'Barbell',    '4-6',  80,  4, 'Bar on traps. More upright torso than low bar. Drive knees out, hip crease below parallel.'),
  ('Stiff Leg Deadlift',     'Compound',  'Barbell',    '8-10', 60,  3, 'Minimal knee bend. Hinge at hips, feel hamstring stretch. Bar stays close to legs.'),
  ('Back Extension',         'Accessory', 'Bodyweight', '12-15',0,   3, 'Control the movement. Squeeze glutes at top. Do not hyperextend.'),
  ('Low Cable Row',          'Compound',  'Cable',      '10-12',40,  3, 'Low anchor. Chest up, slight lean back. Elbows tight to body. Full stretch at front.'),
  ('Shrugs',                 'Isolation', 'Barbell',    '12-15',60,  3, 'Straight up and down. Hold at top 1 second. Do not roll shoulders.'),
  ('Lat Pullover',           'Isolation', 'Cable',      '12-15',25,  3, 'Arms straight or slight bend. Stretch overhead, pull to hips. Feel lats throughout.');

-- Liam Toohey exercises with NULL exercise_id in V1 import
INSERT OR IGNORE INTO exercises (exercise_name, session_category, equipment, default_reps, default_weight_kg, default_sets, notes) VALUES
  ('Cable Fly Upright',      'Isolation', 'Cable',      '12-15',15,  3, 'High anchor, arms slightly bent. Fly in front of body. Squeeze chest at centre.'),
  ('Crunch',                 'Isolation', 'Bodyweight', '15-20',0,   3, 'Feet flat on floor. Focus on spinal flexion — lift shoulder blades, not neck.'),
  ('Deadbug',                'Accessory', 'Bodyweight', '10-12',0,   3, 'Lower back pressed to floor. Extend opposite arm and leg simultaneously. Control the movement.'),
  ('Machine Fly',            'Isolation', 'Machine',    '12-15',30,  3, 'Arms slightly bent. Feel chest stretch at full open. Squeeze at centre.'),
  ('Machine Press',          'Compound',  'Machine',    '8-12', 60,  3, 'Machine chest press. Adjust seat so handles are at mid-chest. Full range.');

-- Fix all NULL exercise_ids across all athletes in one pass.
-- Matches session_logs rows where exercise_name exactly matches a row in exercises.
UPDATE session_logs
SET exercise_id = (SELECT id FROM exercises WHERE exercise_name = session_logs.exercise_name)
WHERE exercise_id IS NULL;
