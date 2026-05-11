const CORS_HEADERS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, PATCH, DELETE, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type',
}

function json(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'Content-Type': 'application/json', ...CORS_HEADERS },
  })
}

function notFound() {
  return json({ error: 'Not found' }, 404)
}

function methodNotAllowed() {
  return json({ error: 'Method not allowed' }, 405)
}

// SHA-256 hash (Worker-native)
async function sha256(str) {
  const buf = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(str))
  return Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join('')
}

export default {
  async fetch(request, env) {
    const url = new URL(request.url)
    const { pathname } = url
    const method = request.method

    if (method === 'OPTIONS') {
      return new Response(null, { headers: CORS_HEADERS })
    }

    // Route dispatch
    if (pathname === '/signup' && method === 'POST') return handleSignup(request, env)
    if (pathname === '/auth' && method === 'POST') return handleAuth(request, env)
    if (pathname === '/dashboard' && method === 'GET') return handleDashboard(request, env, url)
    if (pathname === '/workout' && method === 'GET') return handleWorkout(request, env, url)
    if (pathname === '/log' && method === 'POST') return handleLogCreate(request, env)
    if (pathname.match(/^\/log\/\d+$/) && method === 'PATCH') return handleLogUpdate(request, env, pathname)
    if (pathname === '/program' && method === 'GET') return handleProgramGet(request, env, url)
    if (pathname === '/program/exercise' && method === 'POST') return handleProgramAdd(request, env)
    if (pathname.match(/^\/program\/exercise\/\d+$/) && method === 'DELETE') return handleProgramDelete(request, env, pathname)
    if (pathname === '/program/reorder' && method === 'PATCH') return handleProgramReorder(request, env)
    if (pathname === '/schedule' && method === 'GET') return handleScheduleGet(request, env, url)
    if (pathname === '/schedule' && method === 'PUT') return handleSchedulePut(request, env)
    if (pathname === '/exercises' && method === 'GET') return handleExercises(request, env)
    if (pathname === '/exercises' && method === 'POST') return handleExercisesCreate(request, env)
    if (pathname === '/progress' && method === 'GET') return handleProgress(request, env, url)
    if (pathname === '/nutrition' && method === 'GET') return handleNutritionGet(request, env, url)
    if (pathname === '/nutrition' && method === 'POST') return handleNutritionPost(request, env)
    if (pathname === '/meals' && method === 'GET') return handleMealsGet(request, env, url)
    if (pathname === '/meals' && method === 'POST') return handleMealsPost(request, env)
    if (pathname.match(/^\/meals\/\d+$/) && method === 'DELETE') return handleMealsDelete(request, env, pathname)

    return notFound()
  },
}

// POST /signup
// Body: { athleteId, firstName, pin, age, heightCm, weightKg, email, mainGoal, templateId }
async function handleSignup(request, env) {
  const body = await request.json()
  const { athleteId, firstName, pin, age, heightCm, weightKg, email, mainGoal, templateId } = body

  if (!athleteId || !firstName || !pin || !templateId) {
    return json({ error: 'Missing required fields' }, 400)
  }

  const hashedPin = await sha256(pin)
  const today = new Date().toISOString().split('T')[0]

  try {
    // Create athlete
    await env.DB.prepare(
      `INSERT INTO athletes (id, first_name, pin, age, height_cm, weight_kg, email, main_goal, date_started)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`
    ).bind(athleteId, firstName, hashedPin, age ?? null, heightCm ?? null, weightKg ?? null, email ?? null, mainGoal ?? null, today).run()

    // Seed schedule from template
    const templateDays = await env.DB.prepare(
      `SELECT ptd.day, ptd.session
       FROM program_template_days ptd
       JOIN program_templates pt ON ptd.template_id = pt.id
       WHERE pt.name = ?`
    ).bind(templateId).all()

    const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
    for (let i = 0; i < days.length; i++) {
      const day = days[i]
      const row = templateDays.results.find(r => r.day === day)
      const session = row?.session === 'Rest' ? null : (row?.session ?? null)
      await env.DB.prepare(
        `INSERT INTO schedules (athlete_id, day, session, display_order) VALUES (?, ?, ?, ?)`
      ).bind(athleteId, day, session, i).run()
    }

    return json({ success: true, athleteId })
  } catch (err) {
    if (err.message?.includes('UNIQUE')) return json({ error: 'Athlete ID already taken' }, 409)
    return json({ error: 'Signup failed' }, 500)
  }
}

// POST /auth
// Body: { athleteId, pin }
async function handleAuth(request, env) {
  const { athleteId, pin } = await request.json()
  if (!athleteId || !pin) return json({ error: 'Missing fields' }, 400)

  const hashedPin = await sha256(pin)
  const athlete = await env.DB.prepare(
    `SELECT id, first_name, age, height_cm, weight_kg, email, main_goal, date_started
     FROM athletes WHERE id = ? AND pin = ? AND active = 1`
  ).bind(athleteId, hashedPin).first()

  if (!athlete) return json({ error: 'Invalid credentials' }, 401)

  // Refresh athlete cache
  await env.LTPT_V3_CACHE.put(`athlete:${athleteId}`, JSON.stringify(athlete), { expirationTtl: 86400 })

  return json({ athlete })
}

// GET /dashboard?athleteId=liam&date=YYYY-MM-DD
async function handleDashboard(request, env, url) {
  const athleteId = url.searchParams.get('athleteId')
  const date = url.searchParams.get('date') || new Date().toISOString().split('T')[0]
  if (!athleteId) return json({ error: 'Missing athleteId' }, 400)

  const athlete = await env.DB.prepare(
    `SELECT id, first_name, age, height_cm, weight_kg, main_goal FROM athletes WHERE id = ? AND active = 1`
  ).bind(athleteId).first()
  if (!athlete) return json({ error: 'Athlete not found' }, 404)

  const dayName = new Date(date + 'T12:00:00').toLocaleDateString('en-AU', { weekday: 'long' })
  const scheduleRow = await env.DB.prepare(
    `SELECT session FROM schedules WHERE athlete_id = ? AND day = ?`
  ).bind(athleteId, dayName).first()

  const nutrition = await env.DB.prepare(
    `SELECT COALESCE(SUM(calories),0) as calories, COALESCE(SUM(protein_g),0) as protein_g,
            COALESCE(SUM(carbs_g),0) as carbs_g, COALESCE(SUM(fat_g),0) as fat_g
     FROM nutrition_logs WHERE athlete_id = ? AND log_date = ?`
  ).bind(athleteId, date).first()

  return json({
    athlete,
    today: {
      date,
      day: dayName,
      session: scheduleRow?.session ?? null,
      isRestDay: !scheduleRow?.session,
    },
    nutrition,
  })
}

// GET /workout?athleteId=liam&date=YYYY-MM-DD
async function handleWorkout(request, env, url) {
  const athleteId = url.searchParams.get('athleteId')
  const date = url.searchParams.get('date') || new Date().toISOString().split('T')[0]
  if (!athleteId) return json({ error: 'Missing athleteId' }, 400)

  const cacheKey = `workout:${athleteId}:${date}`
  const cached = await env.LTPT_V3_CACHE.get(cacheKey, { type: 'json' })
  if (cached) return json(cached)

  const dayName = new Date(date + 'T12:00:00').toLocaleDateString('en-AU', { weekday: 'long' })
  const scheduleRow = await env.DB.prepare(
    `SELECT session FROM schedules WHERE athlete_id = ? AND day = ?`
  ).bind(athleteId, dayName).first()

  if (!scheduleRow?.session) {
    const result = { session: null, isRestDay: true, exercises: [] }
    await env.LTPT_V3_CACHE.put(cacheKey, JSON.stringify(result), { expirationTtl: 86400 })
    return json(result)
  }

  const session = scheduleRow.session
  const programRows = await env.DB.prepare(
    `SELECT ap.id as program_id, ap.goal_reps, ap.goal_weight_kg, ap.sets, ap.display_order,
            e.id as exercise_id, e.exercise_name, e.session_category, e.equipment,
            e.default_reps, e.default_weight_kg, e.default_sets, e.notes as coaching_notes
     FROM athlete_program ap
     JOIN exercises e ON ap.exercise_id = e.id
     WHERE ap.athlete_id = ? AND ap.session = ? AND ap.active = 1
     ORDER BY ap.display_order ASC`
  ).bind(athleteId, session).all()

  const exercises = []
  for (const row of programRows.results) {
    // Most recent previous log for this exercise
    const lastLog = await env.DB.prepare(
      `SELECT sl.id, sl.session_date, sl.notes,
              json_group_array(json_object('set_number', ss.set_number, 'weight_kg', ss.weight_kg, 'reps', ss.reps)) as sets
       FROM session_logs sl
       JOIN session_sets ss ON ss.session_log_id = sl.id
       WHERE sl.athlete_id = ? AND sl.exercise_id = ? AND sl.session_date < ?
       GROUP BY sl.id
       ORDER BY sl.session_date DESC
       LIMIT 1`
    ).bind(athleteId, row.exercise_id, date).first()

    exercises.push({
      programId: row.program_id,
      exerciseId: row.exercise_id,
      exerciseName: row.exercise_name,
      category: row.session_category,
      equipment: row.equipment,
      coachingNotes: row.coaching_notes,
      goal: {
        sets: row.sets ?? row.default_sets,
        reps: row.goal_reps ?? row.default_reps,
        weightKg: row.goal_weight_kg ?? row.default_weight_kg,
      },
      lastPerformance: lastLog
        ? {
            logId: lastLog.id,
            date: lastLog.session_date,
            notes: lastLog.notes,
            sets: JSON.parse(lastLog.sets),
          }
        : null,
    })
  }

  // Today's already-logged exercises — keyed by exercise_id so the UI can show logged state on load
  const todayLogRows = await env.DB.prepare(
    `SELECT sl.id, sl.exercise_id, sl.notes,
            json_group_array(json_object('set_number', ss.set_number, 'weight_kg', ss.weight_kg, 'reps', ss.reps)) as sets
     FROM session_logs sl
     JOIN session_sets ss ON ss.session_log_id = sl.id
     WHERE sl.athlete_id = ? AND sl.session_date = ?
     GROUP BY sl.id`
  ).bind(athleteId, date).all()

  const todayLogs = {}
  for (const log of todayLogRows.results) {
    todayLogs[log.exercise_id] = {
      logId: log.id,
      notes: log.notes,
      sets: JSON.parse(log.sets),
    }
  }

  const result = { session, isRestDay: false, exercises, todayLogs }
  await env.LTPT_V3_CACHE.put(cacheKey, JSON.stringify(result), { expirationTtl: 86400 })
  return json(result)
}

// POST /log
// Body: { athleteId, sessionDate, session, exerciseId, exerciseName, notes, sets: [{set_number, weight_kg, reps}] }
async function handleLogCreate(request, env) {
  const body = await request.json()
  const { athleteId, sessionDate, session, exerciseId, exerciseName, notes, sets } = body
  if (!athleteId || !sessionDate || !session || !exerciseId || !exerciseName || !sets?.length) {
    return json({ error: 'Missing required fields' }, 400)
  }

  const logResult = await env.DB.prepare(
    `INSERT INTO session_logs (athlete_id, session_date, session, exercise_id, exercise_name, notes)
     VALUES (?, ?, ?, ?, ?, ?)`
  ).bind(athleteId, sessionDate, session, exerciseId, exerciseName, notes ?? null).run()

  const logId = logResult.meta.last_row_id
  for (const s of sets) {
    await env.DB.prepare(
      `INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES (?, ?, ?, ?)`
    ).bind(logId, s.set_number, s.weight_kg ?? null, s.reps ?? null).run()
  }

  await env.LTPT_V3_CACHE.delete(`workout:${athleteId}:${sessionDate}`)
  return json({ success: true, logId })
}

// PATCH /log/:id
// Body: { notes, sets: [{set_number, weight_kg, reps}] }
async function handleLogUpdate(request, env, pathname) {
  const id = parseInt(pathname.split('/')[2])
  const body = await request.json()
  const { notes, sets } = body
  if (!sets?.length) return json({ error: 'Missing sets' }, 400)

  const log = await env.DB.prepare(`SELECT athlete_id, session_date FROM session_logs WHERE id = ?`).bind(id).first()
  if (!log) return json({ error: 'Log not found' }, 404)

  await env.DB.prepare(`DELETE FROM session_sets WHERE session_log_id = ?`).bind(id).run()
  for (const s of sets) {
    await env.DB.prepare(
      `INSERT INTO session_sets (session_log_id, set_number, weight_kg, reps) VALUES (?, ?, ?, ?)`
    ).bind(id, s.set_number, s.weight_kg ?? null, s.reps ?? null).run()
  }
  await env.DB.prepare(`UPDATE session_logs SET notes = ? WHERE id = ?`).bind(notes ?? null, id).run()
  await env.LTPT_V3_CACHE.delete(`workout:${log.athlete_id}:${log.session_date}`)

  return json({ success: true })
}

// GET /program?athleteId=liam
async function handleProgramGet(request, env, url) {
  const athleteId = url.searchParams.get('athleteId')
  if (!athleteId) return json({ error: 'Missing athleteId' }, 400)

  const rows = await env.DB.prepare(
    `SELECT ap.id, ap.session, ap.goal_reps, ap.goal_weight_kg, ap.sets, ap.display_order, ap.active,
            e.id as exercise_id, e.exercise_name, e.session_category, e.equipment
     FROM athlete_program ap
     JOIN exercises e ON ap.exercise_id = e.id
     WHERE ap.athlete_id = ? AND ap.active = 1
     ORDER BY ap.session, ap.display_order ASC`
  ).bind(athleteId).all()

  return json({ program: rows.results })
}

// POST /program/exercise
// Body: { athleteId, exerciseId, session, goalReps, goalWeightKg, sets }
async function handleProgramAdd(request, env) {
  const body = await request.json()
  const { athleteId, exerciseId, session, goalReps, goalWeightKg, sets } = body
  if (!athleteId || !exerciseId || !session) return json({ error: 'Missing required fields' }, 400)

  const maxOrder = await env.DB.prepare(
    `SELECT COALESCE(MAX(display_order), -1) as max FROM athlete_program WHERE athlete_id = ? AND session = ?`
  ).bind(athleteId, session).first()

  // Restore soft-deleted row if it exists
  const existing = await env.DB.prepare(
    `SELECT id FROM athlete_program WHERE athlete_id = ? AND exercise_id = ? AND session = ?`
  ).bind(athleteId, exerciseId, session).first()

  if (existing) {
    await env.DB.prepare(
      `UPDATE athlete_program SET active = 1, goal_reps = ?, goal_weight_kg = ?, sets = ? WHERE id = ?`
    ).bind(goalReps ?? null, goalWeightKg ?? null, sets ?? null, existing.id).run()
  } else {
    await env.DB.prepare(
      `INSERT INTO athlete_program (athlete_id, exercise_id, session, goal_reps, goal_weight_kg, sets, display_order)
       VALUES (?, ?, ?, ?, ?, ?, ?)`
    ).bind(athleteId, exerciseId, session, goalReps ?? null, goalWeightKg ?? null, sets ?? null, maxOrder.max + 1).run()
  }

  // Invalidate today's workout cache for all dates (simple: delete by prefix isn't available, rely on natural expiry)
  return json({ success: true })
}

// DELETE /program/exercise/:id
async function handleProgramDelete(request, env, pathname) {
  const id = parseInt(pathname.split('/')[3])
  const row = await env.DB.prepare(`SELECT athlete_id FROM athlete_program WHERE id = ?`).bind(id).first()
  if (!row) return json({ error: 'Not found' }, 404)

  await env.DB.prepare(`UPDATE athlete_program SET active = 0 WHERE id = ?`).bind(id).run()
  return json({ success: true })
}

// PATCH /program/reorder
// Body: { athleteId, session, orderedIds: [id, id, ...] }
async function handleProgramReorder(request, env) {
  const { athleteId, session, orderedIds } = await request.json()
  if (!athleteId || !session || !orderedIds?.length) return json({ error: 'Missing fields' }, 400)

  for (let i = 0; i < orderedIds.length; i++) {
    await env.DB.prepare(
      `UPDATE athlete_program SET display_order = ? WHERE id = ? AND athlete_id = ? AND session = ?`
    ).bind(i, orderedIds[i], athleteId, session).run()
  }
  return json({ success: true })
}

// GET /schedule?athleteId=liam
async function handleScheduleGet(request, env, url) {
  const athleteId = url.searchParams.get('athleteId')
  if (!athleteId) return json({ error: 'Missing athleteId' }, 400)

  const rows = await env.DB.prepare(
    `SELECT day, session, display_order FROM schedules WHERE athlete_id = ? ORDER BY display_order ASC`
  ).bind(athleteId).all()

  return json({ schedule: rows.results })
}

// PUT /schedule
// Body: { athleteId, days: [{day, session}] }
async function handleSchedulePut(request, env) {
  const { athleteId, days } = await request.json()
  if (!athleteId || !days?.length) return json({ error: 'Missing fields' }, 400)

  for (let i = 0; i < days.length; i++) {
    const { day, session } = days[i]
    await env.DB.prepare(
      `INSERT INTO schedules (athlete_id, day, session, display_order)
       VALUES (?, ?, ?, ?)
       ON CONFLICT(athlete_id, day) DO UPDATE SET session = excluded.session, display_order = excluded.display_order`
    ).bind(athleteId, day, session ?? null, i).run()
  }
  return json({ success: true })
}

// GET /exercises
async function handleExercises(request, env) {
  const cached = await env.LTPT_V3_CACHE.get('exercises:all', { type: 'json' })
  if (cached) return json(cached)

  const rows = await env.DB.prepare(
    `SELECT id, exercise_name, session_category, equipment, default_reps, default_weight_kg, default_sets, notes
     FROM exercises ORDER BY exercise_name ASC`
  ).all()

  const result = { exercises: rows.results }
  await env.LTPT_V3_CACHE.put('exercises:all', JSON.stringify(result), { expirationTtl: 604800 }) // 7 days
  return json(result)
}

// POST /exercises
// Body: { exerciseName, sessionCategory, equipment, defaultReps, defaultWeightKg, defaultSets, notes }
async function handleExercisesCreate(request, env) {
  const body = await request.json()
  const { exerciseName, sessionCategory, equipment, defaultReps, defaultWeightKg, defaultSets, notes } = body
  if (!exerciseName?.trim()) return json({ error: 'Exercise name is required' }, 400)

  try {
    const result = await env.DB.prepare(
      `INSERT INTO exercises (exercise_name, session_category, equipment, default_reps, default_weight_kg, default_sets, notes)
       VALUES (?, ?, ?, ?, ?, ?, ?)`
    ).bind(
      exerciseName.trim(),
      sessionCategory || null,
      equipment || null,
      defaultReps || null,
      defaultWeightKg ? parseFloat(defaultWeightKg) : null,
      defaultSets ? parseInt(defaultSets) : null,
      notes?.trim() || null
    ).run()

    // Invalidate exercise library cache so next GET /exercises picks up the new entry
    await env.LTPT_V3_CACHE.delete('exercises:all')

    return json({ success: true, id: result.meta.last_row_id })
  } catch (err) {
    if (err.message?.includes('UNIQUE')) return json({ error: 'An exercise with that name already exists' }, 409)
    return json({ error: 'Failed to create exercise' }, 500)
  }
}

// GET /progress?athleteId=liam&exerciseId=5
async function handleProgress(request, env, url) {
  const athleteId = url.searchParams.get('athleteId')
  const exerciseId = url.searchParams.get('exerciseId')
  if (!athleteId || !exerciseId) return json({ error: 'Missing params' }, 400)

  const rows = await env.DB.prepare(
    `SELECT sl.session_date, sl.session,
            MAX(ss.weight_kg) as max_weight,
            SUM(ss.weight_kg * ss.reps) as total_volume
     FROM session_logs sl
     JOIN session_sets ss ON ss.session_log_id = sl.id
     WHERE sl.athlete_id = ? AND sl.exercise_id = ?
     GROUP BY sl.session_date
     ORDER BY sl.session_date ASC`
  ).bind(athleteId, exerciseId).all()

  const timeSeries = rows.results
  const pr = timeSeries.reduce((best, row) => (!best || row.max_weight > best.weight) ? { weight: row.max_weight, date: row.session_date } : best, null)

  return json({ timeSeries, pr })
}

// GET /nutrition?athleteId=liam&date=YYYY-MM-DD
async function handleNutritionGet(request, env, url) {
  const athleteId = url.searchParams.get('athleteId')
  const date = url.searchParams.get('date') || new Date().toISOString().split('T')[0]
  if (!athleteId) return json({ error: 'Missing athleteId' }, 400)

  const rows = await env.DB.prepare(
    `SELECT id, meal_type, meal_name, calories, protein_g, carbs_g, fat_g, notes, created_at
     FROM nutrition_logs WHERE athlete_id = ? AND log_date = ? ORDER BY created_at ASC`
  ).bind(athleteId, date).all()

  const totals = await env.DB.prepare(
    `SELECT COALESCE(SUM(calories),0) as calories, COALESCE(SUM(protein_g),0) as protein_g,
            COALESCE(SUM(carbs_g),0) as carbs_g, COALESCE(SUM(fat_g),0) as fat_g
     FROM nutrition_logs WHERE athlete_id = ? AND log_date = ?`
  ).bind(athleteId, date).first()

  return json({ entries: rows.results, totals })
}

// POST /nutrition
// Body: { athleteId, logDate, mealType, mealName, calories, proteinG, carbsG, fatG, notes }
async function handleNutritionPost(request, env) {
  const body = await request.json()
  const { athleteId, logDate, mealType, mealName, calories, proteinG, carbsG, fatG, notes } = body
  if (!athleteId || !logDate) return json({ error: 'Missing required fields' }, 400)

  const result = await env.DB.prepare(
    `INSERT INTO nutrition_logs (athlete_id, log_date, meal_type, meal_name, calories, protein_g, carbs_g, fat_g, notes)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`
  ).bind(athleteId, logDate, mealType ?? null, mealName ?? null, calories ?? null, proteinG ?? null, carbsG ?? null, fatG ?? null, notes ?? null).run()

  return json({ success: true, id: result.meta.last_row_id })
}

// GET /meals?athleteId=liam
async function handleMealsGet(request, env, url) {
  const athleteId = url.searchParams.get('athleteId')
  if (!athleteId) return json({ error: 'Missing athleteId' }, 400)

  const rows = await env.DB.prepare(
    `SELECT id, meal_name, meal_type, calories, protein_g, carbs_g, fat_g, notes
     FROM regular_meals WHERE athlete_id = ? ORDER BY meal_name ASC`
  ).bind(athleteId).all()

  return json({ meals: rows.results })
}

// POST /meals
// Body: { athleteId, mealName, mealType, calories, proteinG, carbsG, fatG, notes }
async function handleMealsPost(request, env) {
  const body = await request.json()
  const { athleteId, mealName, mealType, calories, proteinG, carbsG, fatG, notes } = body
  if (!athleteId || !mealName) return json({ error: 'Missing required fields' }, 400)

  const result = await env.DB.prepare(
    `INSERT INTO regular_meals (athlete_id, meal_name, meal_type, calories, protein_g, carbs_g, fat_g, notes)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?)`
  ).bind(athleteId, mealName, mealType ?? null, calories ?? null, proteinG ?? null, carbsG ?? null, fatG ?? null, notes ?? null).run()

  return json({ success: true, id: result.meta.last_row_id })
}

// DELETE /meals/:id
async function handleMealsDelete(request, env, pathname) {
  const id = parseInt(pathname.split('/')[2])
  await env.DB.prepare(`DELETE FROM regular_meals WHERE id = ?`).bind(id).run()
  return json({ success: true })
}
