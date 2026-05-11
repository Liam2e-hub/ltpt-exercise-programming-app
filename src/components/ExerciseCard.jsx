import { useState } from 'react'

const API = import.meta.env.VITE_WORKER_URL

function buildDefaultSets(exercise, initialLog) {
  // If logged today, restore those values
  if (initialLog?.sets?.length) {
    return initialLog.sets.map(s => ({
      set_number: s.set_number,
      weight_kg: s.weight_kg ?? '',
      reps: s.reps ?? '',
    }))
  }
  const count = exercise.goal.sets || 3
  const lastSets = exercise.lastPerformance?.sets || []
  return Array.from({ length: count }, (_, i) => {
    const prev = lastSets[i] ?? lastSets[lastSets.length - 1]
    return {
      set_number: i + 1,
      weight_kg: prev?.weight_kg ?? exercise.goal.weightKg ?? '',
      reps: prev?.reps ?? '',
    }
  })
}

export default function ExerciseCard({ exercise, athleteId, sessionDate, session, initialLog }) {
  const [expanded, setExpanded] = useState(false)
  const [sets, setSets] = useState(() => buildDefaultSets(exercise, initialLog))
  const [notes, setNotes] = useState(initialLog?.notes || '')
  const [logged, setLogged] = useState(!!initialLog)
  const [logId, setLogId] = useState(initialLog?.logId || null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

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
      setExpanded(false)
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
      setExpanded(false)
    } catch {
      setError('Connection error — try again')
    } finally {
      setLoading(false)
    }
  }

  const { goal, lastPerformance, coachingNotes, exerciseName, category, equipment } = exercise

  return (
    <div className={`rounded-2xl border transition-colors ${logged ? 'border-green-800 bg-zinc-900' : 'border-zinc-800 bg-zinc-900'}`}>

      {/* Header — always visible, tap to expand */}
      <button
        className="w-full flex items-center justify-between px-4 py-3.5 text-left"
        onClick={() => setExpanded(e => !e)}
      >
        <div className="flex-1 min-w-0 pr-3">
          <div className="flex items-center gap-2 flex-wrap">
            <p className="font-semibold text-sm">{exerciseName}</p>
            {logged && (
              <span className="text-xs bg-green-900 text-green-400 px-1.5 py-0.5 rounded-md flex-shrink-0">
                Logged
              </span>
            )}
          </div>
          <p className="text-xs text-zinc-500 mt-0.5">
            {goal.sets} sets &middot; {goal.reps} reps
            {goal.weightKg ? ` · ${goal.weightKg} kg` : ''}
            {equipment ? ` · ${equipment}` : ''}
          </p>
        </div>
        <span className="text-zinc-600 text-xs flex-shrink-0">{expanded ? '▲' : '▼'}</span>
      </button>

      {/* Expanded body */}
      {expanded && (
        <div className="border-t border-zinc-800 px-4 pt-4 pb-4">

          {/* Last performance */}
          <div className="mb-4">
            <p className="text-xs text-zinc-500 mb-1.5">
              {lastPerformance ? `Last: ${lastPerformance.date}` : 'No previous performance'}
            </p>
            {lastPerformance && (
              <div className="flex flex-wrap gap-1.5">
                {lastPerformance.sets.map(s => (
                  <span
                    key={s.set_number}
                    className="text-xs bg-zinc-800 text-zinc-300 px-2 py-1 rounded-lg"
                  >
                    {s.weight_kg ?? '—'} kg × {s.reps ?? '—'}
                  </span>
                ))}
              </div>
            )}
          </div>

          {/* Coaching notes */}
          {coachingNotes && (
            <div className="bg-zinc-800 rounded-xl px-3 py-2.5 mb-4">
              <p className="text-xs text-zinc-400 leading-relaxed">{coachingNotes}</p>
            </div>
          )}

          {/* Set inputs */}
          <div className="mb-3">
            <div className="grid grid-cols-[28px_1fr_1fr] gap-2 mb-1.5 px-1">
              <span className="text-xs text-zinc-600"></span>
              <span className="text-xs text-zinc-500">kg</span>
              <span className="text-xs text-zinc-500">Reps</span>
            </div>
            <div className="flex flex-col gap-2">
              {sets.map((s, i) => (
                <div key={i} className="grid grid-cols-[28px_1fr_1fr] gap-2 items-center">
                  <span className="text-xs text-zinc-600 text-center font-medium">{i + 1}</span>
                  <input
                    type="number"
                    inputMode="decimal"
                    placeholder="0"
                    value={s.weight_kg}
                    onChange={e => updateSet(i, 'weight_kg', e.target.value)}
                    className="bg-zinc-800 rounded-xl px-3 py-2.5 text-sm text-white focus:outline-none focus:ring-1 focus:ring-blue-500 w-full"
                  />
                  <input
                    type="number"
                    inputMode="numeric"
                    placeholder={typeof goal.reps === 'string' ? goal.reps.split('-')[0] : '0'}
                    value={s.reps}
                    onChange={e => updateSet(i, 'reps', e.target.value)}
                    className="bg-zinc-800 rounded-xl px-3 py-2.5 text-sm text-white focus:outline-none focus:ring-1 focus:ring-blue-500 w-full"
                  />
                </div>
              ))}
            </div>
          </div>

          {/* Add / remove set */}
          <div className="flex gap-2 mb-4">
            <button
              onClick={addSet}
              className="text-xs text-blue-400 bg-zinc-800 px-3 py-1.5 rounded-lg active:opacity-70"
            >
              + Set
            </button>
            {sets.length > 1 && (
              <button
                onClick={removeSet}
                className="text-xs text-zinc-500 bg-zinc-800 px-3 py-1.5 rounded-lg active:opacity-70"
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
            className="w-full bg-zinc-800 rounded-xl px-3 py-2.5 text-sm text-white placeholder-zinc-600 focus:outline-none focus:ring-1 focus:ring-blue-500 resize-none mb-4"
          />

          {error && <p className="text-red-400 text-xs mb-3">{error}</p>}

          {/* Log / Update */}
          <button
            onClick={logged ? handleUpdate : handleLog}
            disabled={loading}
            className={`w-full rounded-xl py-3 font-semibold text-sm transition-colors disabled:opacity-50 ${
              logged
                ? 'bg-zinc-700 hover:bg-zinc-600 active:bg-zinc-500'
                : 'bg-blue-600 hover:bg-blue-700 active:bg-blue-800'
            }`}
          >
            {loading ? '...' : logged ? 'Update' : 'Log'}
          </button>
        </div>
      )}
    </div>
  )
}
