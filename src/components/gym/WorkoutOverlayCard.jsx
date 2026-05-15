import { useState, useEffect, useRef } from 'react'

const API = import.meta.env.VITE_WORKER_URL

// Build the initial sets state for an exercise.
// If already logged today: pre-fill with saved values.
// If not logged: empty fields with last session's values as placeholder text.
function buildSets(exercise, existingLog) {
  if (existingLog?.sets?.length) {
    return existingLog.sets.map(s => ({
      set_number: s.set_number,
      weight_kg: s.weight_kg ?? '',
      reps: s.reps ?? '',
    }))
  }
  const count = exercise.goal?.sets || 3
  return Array.from({ length: count }, (_, i) => ({
    set_number: i + 1,
    weight_kg: '',
    reps: '',
  }))
}

// Derive per-set placeholder text from lastPerformance.
// Returns array of { weight_kg, reps } placeholder strings.
function buildPlaceholders(exercise, existingLog) {
  if (existingLog?.sets?.length) return []
  const lastSets = exercise.lastPerformance?.sets || []
  const count = exercise.goal?.sets || 3
  return Array.from({ length: count }, (_, i) => {
    const prev = lastSets[i] ?? lastSets[lastSets.length - 1]
    return {
      weight_kg: prev?.weight_kg != null ? String(prev.weight_kg) : '',
      reps: prev?.reps != null ? String(prev.reps) : '',
    }
  })
}

export default function WorkoutOverlayCard({
  exercise,
  athleteId,
  sessionDate,
  session,
  existingLog,
  isAnimating,
  slideDirection, // 'in-right' | 'in-left' | 'out-right' | 'out-left' | null
  onLog,          // called with logId after successful save
  onNavigate,     // called with direction: 'prev' | 'next'
  stationIndex,
  totalStations,
}) {
  const [sets, setSets] = useState(() => buildSets(exercise, existingLog))
  const [placeholders] = useState(() => buildPlaceholders(exercise, existingLog))
  const [notes, setNotes] = useState(existingLog?.notes || '')
  const [logged, setLogged] = useState(!!existingLog)
  const [logId, setLogId] = useState(existingLog?.logId || null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  // Reset state whenever the exercise changes
  useEffect(() => {
    setSets(buildSets(exercise, existingLog))
    setNotes(existingLog?.notes || '')
    setLogged(!!existingLog)
    setLogId(existingLog?.logId || null)
    setError('')
    setLoading(false)
  }, [exercise.exerciseId, existingLog])

  function updateSet(i, field, value) {
    setSets(prev => prev.map((s, idx) => idx === i ? { ...s, [field]: value } : s))
  }

  function addSet() {
    const last = sets[sets.length - 1]
    setSets(prev => [
      ...prev,
      { set_number: prev.length + 1, weight_kg: last?.weight_kg ?? '', reps: last?.reps ?? '' },
    ])
  }

  function removeSet() {
    if (sets.length <= 1) return
    setSets(prev => prev.slice(0, -1))
  }

  function buildPayloadSets() {
    return sets.map((s, i) => ({
      set_number: i + 1,
      weight_kg: s.weight_kg !== '' ? parseFloat(s.weight_kg) : null,
      reps: s.reps !== '' ? parseInt(s.reps) : null,
    }))
  }

  async function handleLog() {
    setLoading(true)
    setError('')
    try {
      const res = await fetch(`${API}/log`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          athleteId,
          sessionDate,
          session,
          exerciseId: exercise.exerciseId,
          exerciseName: exercise.exerciseName,
          notes: notes.trim() || null,
          sets: buildPayloadSets(),
        }),
      })
      const data = await res.json()
      if (!res.ok) { setError(data.error || 'Failed to log'); return }
      setLogId(data.logId)
      setLogged(true)
      onLog?.(exercise.exerciseId, data.logId, buildPayloadSets(), notes.trim() || null)
    } catch {
      setError('Connection error — try again')
    } finally {
      setLoading(false)
    }
  }

  async function handleUpdate() {
    if (!logId) return
    setLoading(true)
    setError('')
    try {
      const res = await fetch(`${API}/log/${logId}`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          notes: notes.trim() || null,
          sets: buildPayloadSets(),
        }),
      })
      const data = await res.json()
      if (!res.ok) { setError(data.error || 'Failed to update'); return }
      setLogged(true)
      onLog?.(exercise.exerciseId, logId, buildPayloadSets(), notes.trim() || null)
    } catch {
      setError('Connection error — try again')
    } finally {
      setLoading(false)
    }
  }

  const slideClass = {
    'in-right':  'translate-x-0 opacity-100',
    'in-left':   'translate-x-0 opacity-100',
    'out-right': 'translate-x-full opacity-0',
    'out-left':  '-translate-x-full opacity-0',
    null: 'translate-x-0 opacity-100',
  }[slideDirection] ?? 'translate-x-0 opacity-100'

  const { exerciseName, goal, lastPerformance, coachingNotes } = exercise
  const isFirst = stationIndex === 0
  const isLast = stationIndex === totalStations - 1

  return (
    <div
      className={`transition-all duration-300 ease-in-out transform ${slideClass}`}
      style={{ willChange: 'transform, opacity' }}
    >
      {/* Card container */}
      <div className="bg-zinc-900/95 backdrop-blur-sm rounded-t-3xl border-t border-zinc-700 px-4 pt-4 pb-6">

        {/* Nav row: arrows + exercise name + dot indicators */}
        <div className="flex items-center justify-between mb-3">
          <button
            onClick={() => onNavigate('prev')}
            disabled={isFirst || isAnimating}
            className="w-9 h-9 flex items-center justify-center rounded-full bg-zinc-800 text-zinc-300 disabled:opacity-30 active:bg-zinc-700 transition-colors"
          >
            ‹
          </button>

          <div className="flex-1 mx-3 text-center">
            <p className="font-bold text-sm text-white leading-tight">{exerciseName}</p>
            <p className="text-xs text-zinc-500 mt-0.5">
              {goal?.sets} sets · {goal?.reps} reps
              {goal?.weightKg ? ` · ${goal.weightKg} kg` : ''}
            </p>
          </div>

          <button
            onClick={() => onNavigate('next')}
            disabled={isLast || isAnimating}
            className="w-9 h-9 flex items-center justify-center rounded-full bg-zinc-800 text-zinc-300 disabled:opacity-30 active:bg-zinc-700 transition-colors"
          >
            ›
          </button>
        </div>

        {/* Progress dots */}
        <div className="flex justify-center gap-1.5 mb-4">
          {Array.from({ length: totalStations }).map((_, i) => (
            <span
              key={i}
              className={`rounded-full transition-all ${
                i === stationIndex
                  ? 'w-4 h-1.5 bg-blue-500'
                  : i < stationIndex
                  ? 'w-1.5 h-1.5 bg-green-500'
                  : 'w-1.5 h-1.5 bg-zinc-700'
              }`}
            />
          ))}
        </div>

        {/* Last session suggestion */}
        {lastPerformance && !logged && (
          <div className="mb-3 px-1">
            <p className="text-xs text-zinc-500 mb-1.5">Last: {lastPerformance.date}</p>
            <div className="flex flex-wrap gap-1.5">
              {lastPerformance.sets.map(s => (
                <span
                  key={s.set_number}
                  className="text-xs bg-zinc-800 text-zinc-400 px-2 py-1 rounded-lg"
                >
                  {s.weight_kg ?? '—'} kg × {s.reps ?? '—'}
                </span>
              ))}
            </div>
          </div>
        )}

        {/* Logged badge */}
        {logged && (
          <div className="mb-3 flex items-center gap-1.5">
            <span className="text-xs bg-green-900/60 text-green-400 px-2 py-1 rounded-lg font-medium">
              ✓ Logged
            </span>
            <span className="text-xs text-zinc-500">Tap Update to change</span>
          </div>
        )}

        {/* Coaching notes */}
        {coachingNotes && (
          <div className="bg-zinc-800/80 rounded-xl px-3 py-2 mb-3">
            <p className="text-xs text-zinc-400 leading-relaxed">{coachingNotes}</p>
          </div>
        )}

        {/* Set inputs */}
        <div className="mb-3">
          <div className="grid grid-cols-[24px_1fr_1fr] gap-2 mb-1.5 px-0.5">
            <span />
            <span className="text-xs text-zinc-500 text-center">kg</span>
            <span className="text-xs text-zinc-500 text-center">Reps</span>
          </div>
          <div className="flex flex-col gap-2">
            {sets.map((s, i) => (
              <div key={i} className="grid grid-cols-[24px_1fr_1fr] gap-2 items-center">
                <span className="text-xs text-zinc-600 text-center font-medium">{i + 1}</span>
                <input
                  type="number"
                  inputMode="decimal"
                  placeholder={placeholders[i]?.weight_kg || '0'}
                  value={s.weight_kg}
                  onChange={e => updateSet(i, 'weight_kg', e.target.value)}
                  className="bg-zinc-800 rounded-xl px-3 py-2 text-sm text-white placeholder-zinc-500 focus:outline-none focus:ring-1 focus:ring-blue-500 w-full"
                />
                <input
                  type="number"
                  inputMode="numeric"
                  placeholder={placeholders[i]?.reps || (typeof goal?.reps === 'string' ? goal.reps.split('-')[0] : '0')}
                  value={s.reps}
                  onChange={e => updateSet(i, 'reps', e.target.value)}
                  className="bg-zinc-800 rounded-xl px-3 py-2 text-sm text-white placeholder-zinc-500 focus:outline-none focus:ring-1 focus:ring-blue-500 w-full"
                />
              </div>
            ))}
          </div>
        </div>

        {/* Add / remove set */}
        <div className="flex gap-2 mb-3">
          <button
            onClick={addSet}
            className="text-xs text-blue-400 bg-zinc-800 px-3 py-1.5 rounded-lg active:opacity-70"
          >
            + Set
          </button>
          {sets.length > 1 && (
            <button
              onClick={removeSet}
              className="text-xs text-rose-400 bg-zinc-800 px-3 py-1.5 rounded-lg active:opacity-70"
            >
              − Set
            </button>
          )}
        </div>

        {/* Notes */}
        <textarea
          placeholder="Notes (optional)"
          value={notes}
          onChange={e => setNotes(e.target.value)}
          rows={2}
          className="w-full bg-zinc-800 rounded-xl px-3 py-2 text-sm text-white placeholder-zinc-600 focus:outline-none focus:ring-1 focus:ring-blue-500 resize-none mb-3"
        />

        {error && <p className="text-red-400 text-xs mb-2">{error}</p>}

        {/* Log / Update button */}
        <button
          onClick={logged ? handleUpdate : handleLog}
          disabled={loading || isAnimating}
          className={`w-full rounded-xl py-3 font-bold text-sm transition-colors disabled:opacity-50 ${
            logged
              ? 'bg-zinc-700 hover:bg-zinc-600 active:bg-zinc-500 text-white'
              : 'bg-blue-600 hover:bg-blue-700 active:bg-blue-800 text-white'
          }`}
        >
          {loading ? '…' : logged ? 'Update' : isLast ? 'Log & Finish' : 'Log & Next →'}
        </button>
      </div>
    </div>
  )
}
