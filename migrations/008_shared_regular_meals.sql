PRAGMA foreign_keys = OFF;

-- Recreate regular_meals with nullable athlete_id so meals can be shared across all athletes
CREATE TABLE regular_meals_new (
  id        INTEGER PRIMARY KEY AUTOINCREMENT,
  athlete_id TEXT,
  meal_name  TEXT NOT NULL,
  meal_type  TEXT,
  calories   INTEGER,
  protein_g  REAL,
  carbs_g    REAL,
  fat_g      REAL,
  notes      TEXT
);

INSERT INTO regular_meals_new (id, athlete_id, meal_name, meal_type, calories, protein_g, carbs_g, fat_g, notes)
SELECT id, athlete_id, meal_name, meal_type, calories, protein_g, carbs_g, fat_g, notes
FROM regular_meals;

DROP TABLE regular_meals;
ALTER TABLE regular_meals_new RENAME TO regular_meals;

PRAGMA foreign_keys = ON;
