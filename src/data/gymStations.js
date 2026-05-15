// Physical slots in the gym — up to 6 stations, used in order based on session length.
export const STATION_SLOTS = [
  { id: 0, position: [-3.6, 0, -1.9], facing: Math.PI },
  { id: 1, position: [0,    0, -1.9], facing: Math.PI },
  { id: 2, position: [3.6,  0, -1.9], facing: Math.PI },
  { id: 3, position: [-3.6, 0,  1.9], facing: 0 },
  { id: 4, position: [0,    0,  1.9], facing: 0 },
  { id: 5, position: [3.6,  0,  1.9], facing: 0 },
]

export const EQUIPMENT = {
  SQUAT_RACK:        'squat-rack',
  BENCH:             'bench',
  DEADLIFT_PLATFORM: 'deadlift-platform',
  CABLE_TOWER:       'cable-tower',
  PULL_UP_BAR:       'pull-up-bar',
  DUMBBELL_AREA:     'dumbbell-area',
  LEG_MACHINE:       'leg-machine',
  FLOOR_MAT:         'floor-mat',
}

// Maps DB exercise IDs to equipment types — IDs match the production exercises table.
const EXERCISE_EQUIPMENT_MAP = {
  1:   EQUIPMENT.SQUAT_RACK,
  2:   EQUIPMENT.DEADLIFT_PLATFORM,
  3:   EQUIPMENT.LEG_MACHINE,
  4:   EQUIPMENT.LEG_MACHINE,
  5:   EQUIPMENT.LEG_MACHINE,
  6:   EQUIPMENT.FLOOR_MAT,
  7:   EQUIPMENT.LEG_MACHINE,
  8:   EQUIPMENT.BENCH,
  9:   EQUIPMENT.BENCH,
  10:  EQUIPMENT.SQUAT_RACK,
  11:  EQUIPMENT.DUMBBELL_AREA,
  12:  EQUIPMENT.CABLE_TOWER,
  13:  EQUIPMENT.CABLE_TOWER,
  14:  EQUIPMENT.BENCH,
  15:  EQUIPMENT.DEADLIFT_PLATFORM,
  16:  EQUIPMENT.DEADLIFT_PLATFORM,
  17:  EQUIPMENT.PULL_UP_BAR,
  18:  EQUIPMENT.CABLE_TOWER,
  19:  EQUIPMENT.CABLE_TOWER,
  20:  EQUIPMENT.CABLE_TOWER,
  21:  EQUIPMENT.DUMBBELL_AREA,
  22:  EQUIPMENT.DUMBBELL_AREA,
  23:  EQUIPMENT.BENCH,
  24:  EQUIPMENT.FLOOR_MAT,
  26:  EQUIPMENT.CABLE_TOWER,
  27:  EQUIPMENT.BENCH,
  28:  EQUIPMENT.PULL_UP_BAR,
  29:  EQUIPMENT.CABLE_TOWER,
  30:  EQUIPMENT.BENCH,
  31:  EQUIPMENT.DUMBBELL_AREA,
  32:  EQUIPMENT.BENCH,
  33:  EQUIPMENT.FLOOR_MAT,
  34:  EQUIPMENT.BENCH,
  35:  EQUIPMENT.LEG_MACHINE,
  36:  EQUIPMENT.CABLE_TOWER,
  37:  EQUIPMENT.PULL_UP_BAR,
  38:  EQUIPMENT.FLOOR_MAT,
  39:  EQUIPMENT.BENCH,
  40:  EQUIPMENT.PULL_UP_BAR,
  241: EQUIPMENT.SQUAT_RACK,
  242: EQUIPMENT.DEADLIFT_PLATFORM,
  243: EQUIPMENT.SQUAT_RACK,
  244: EQUIPMENT.FLOOR_MAT,
  245: EQUIPMENT.CABLE_TOWER,
  246: EQUIPMENT.BENCH,
  248: EQUIPMENT.BENCH,
  250: EQUIPMENT.FLOOR_MAT,
  251: EQUIPMENT.BENCH,
  252: EQUIPMENT.DEADLIFT_PLATFORM,
  254: EQUIPMENT.DEADLIFT_PLATFORM,
}

// Build runtime stations from LTPT exercises array (from GET /workout).
// Capped at STATION_SLOTS.length (6). If session has more than 6 exercises,
// extras are placed at position [0,0,0] with FLOOR_MAT as fallback.
export function buildStations(exercises) {
  return exercises.map((ex, i) => {
    const slot = STATION_SLOTS[i] ?? { id: i, position: [0, 0, 0], facing: 0 }
    const equipment = EXERCISE_EQUIPMENT_MAP[ex.exerciseId] ?? EQUIPMENT.FLOOR_MAT
    return {
      ...slot,
      exerciseId: ex.exerciseId,
      label: ex.exerciseName,
      equipment,
    }
  })
}

export const themes = {
  whoop:   { id: 'whoop',   accent: '#00ff9b', accentDim: '#0a8a5d', bg: '#101418', floor: '#1a1f24' },
  strava:  { id: 'strava',  accent: '#fc4c02', accentDim: '#8a2a01', bg: '#10100c', floor: '#221d18' },
  peloton: { id: 'peloton', accent: '#df1c2c', accentDim: '#7a0f18', bg: '#0f0d10', floor: '#1d181d' },
  ice:     { id: 'ice',     accent: '#7dd3fc', accentDim: '#0c4a6e', bg: '#0e1822', floor: '#162130' },
}

export const DEFAULT_THEME = themes.whoop

export const DEFAULT_AVATAR = {
  skin: '#e8b48b',
  top: '#0d1117',
  shorts: '#1f2937',
  hair: '#1a1209',
  shoes: '#ffffff',
}
