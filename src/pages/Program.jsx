import { useState, useEffect, useMemo } from 'react'
import { useAuth } from '../context/AuthContext'
import Nav from '../components/Nav'

const API = import.meta.env.VITE_WORKER_URL

const SESSION_TYPES = [
  'Strength Legs',
  'Strength Push',
  'Strength Pull',
  'Volume Legs',
  'Volume Push',
  'Volume Pull',
  'Abs & Arms',
]

export default function Program() {
  const { athlete } = useAuth()
  const [program, setProgram] = useState([])
  const [library, setLibrary] = useState([])
  const [loading, setLoading] = useState(true)
  const [addSheet, setAddSheet] = useState(null) // session name or null
  const [search, setSearch] = useState('')
  const [selected, setSelected] = useState(null) // exercise object
  const [goalSets, setGoalSets] = useState('')
  const [goalReps, setGoalReps] = useState('')
  const [goalWeight, setGoalWeight] = useState('')
  const [addLoading, setAddLoading] = useState(false)
  const [addError, setAddError] = useState('')

  useEffect(() => {
    Promise.all([
      fetch(`${API}/program?athleteId=${athlete.id}`).then(r => r.json()),
      fetch(`${API}/exercises`).then(r => r.json()),
    ]).then(([prog, lib]) => {
      setProgram(prog.program || [])
      setLibrary(lib.exercises || [])
    }).finally(() => setLoading(false))
  }, [])

  // Group program by session, preserving display_order
  const bySession = useMemo(() => {
    const map = {}
    for (const s of SESSION_TYPES) map[s] = []
    for (const row of program) {
      if (map[row.session]) map[row.session].push(row)
    }
    for (const s of SESSION_TYPES) map[s].sort((a, b) => a.display_order - b.display_order)
    return map
  }, [program])

  // Exercises already in the selected session (to grey them out)
  const inSession = useMemo(() => {
    if (!addSheet) return new Set()
    return new Set(bySession[addSheet]?.map(r => r.exercise_id))
  }, [addSheet, bySession])

  const filtered = useMemo(() => {
    if (!search.trim()) return library
    const q = search.toLowerCase()
    return library.filter(e =>
      e.exercise_name.toLowerCase().includes(q) ||
      e.equipment?.toLowerCase().includes(q) ||
      e.session_category?.toLowerCase().includes(q)
    )
  }, [search, library])

  function openAdd(session) {
    setAddSheet(session)
    setSearch('')
    setSelected(null)
    setGoalSets('')
    setGoalReps('')
    setGoalWeight('')
    setAddError('')
  }

  function selectExercise(ex) {
    setSelected(ex)
    setGoalSets(String(ex.default_sets || ''))
    setGoalReps(ex.default_reps || '')
    setGoalWeight(String(ex.default_weight_kg || ''))
  }

  async function handleAdd() {
    if (!selected || !addSheet) return
    setAddLoading(true)
    setAddError('')
    try {
      const res = await fetch(`${API}/program/exercise`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          athleteId: athlete.id,
          exerciseId: selected.id,
          session: addSheet,
          goalReps: goalReps || null,
          goalWeightKg: goalWeight ? parseFloat(goalWeight) : null,
          sets: goalSets ? parseInt(goalSets) : null,
        }),
      })
      const data = await res.json()
      if (!res.ok) { setAddError(data.error || 'Failed to add'); return }

      // Refresh program
      const prog = await fetch(`${API}/program?athleteId=${athlete.id}`).then(r => r.json())
      setProgram(prog.program || [])
      setAddSheet(null)
    } catch {
      setAddError('Connection error')
    } finally {
      setAddLoading(false)
    }
  }

  async function handleRemove(id) {
    try {
      await fetch(`${API}/program/exercise/${id}`, { method: 'DELETE' })
      setProgram(prev => prev.filter(r => r.id !== id))
    } catch {
      // silent — exercise stays in UI if delete fails
    }
  }

  async function handleReorder(session, fromIndex, toIndex) {
    const sessionExercises = [...bySession[session]]
    const [moved] = sessionExercises.splice(fromIndex, 1)
    sessionExercises.splice(toIndex, 0, moved)
    const orderedIds = sessionExercises.map(e => e.id)

    // Optimistic update
    setProgram(prev => {
      const rest = prev.filter(r => r.session !== session)
      const updated = sessionExercises.map((e, i) => ({ ...e, display_order: i }))
      return [...rest, ...updated]
    })

    try {
      await fetch(`${API}/program/reorder`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ athleteId: athlete.id, session, orderedIds }),
      })
    } catch {
      // silent
    }
  }

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <p className="text-zinc-500">Loading...</p>
      </div>
    )
  }

  return (
    <div className="min-h-screen flex flex-col pb-24">
      <div className="px-4 pt-10 mb-4">
        <h1 className="text-xl font-bold">Program</h1>
        <p className="text-zinc-500 text-sm mt-0.5">Add exercises to each session</p>
      </div>

      <div className="px-4 flex flex-col gap-4">
        {SESSION_TYPES.map(session => {
          const exercises = bySession[session]
          return (
            <div key={session} className="bg-zinc-900 border border-zinc-800 rounded-2xl overflow-hidden">
              {/* Session header */}
              <div className="flex items-center justify-between px-4 py-3 border-b border-zinc-800">
                <p className="font-semibold text-sm">{session}</p>
                <button
                  onClick={() => openAdd(session)}
                  className="text-blue-400 text-sm font-medium"
                >
                  + Add
                </button>
              </div>

              {/* Exercise list */}
              {exercises.length === 0 ? (
                <p className="text-zinc-600 text-xs px-4 py-3">No exercises</p>
              ) : (
                <div>
                  {exercises.map((ex, i) => (
                    <div
                      key={ex.id}
                      className="flex items-center gap-2 px-4 py-3 border-b border-zinc-800 last:border-0"
                    >
                      {/* Reorder buttons */}
                      <div className="flex flex-col gap-0.5 flex-shrink-0">
                        <button
                          disabled={i === 0}
                          onClick={() => handleReorder(session, i, i - 1)}
                          className="text-zinc-600 disabled:opacity-20 text-xs leading-none py-0.5"
                        >
                          ▲
                        </button>
                        <button
                          disabled={i === exercises.length - 1}
                          onClick={() => handleReorder(session, i, i + 1)}
                          className="text-zinc-600 disabled:opacity-20 text-xs leading-none py-0.5"
                        >
                          ▼
                        </button>
                      </div>

                      {/* Exercise info */}
                      <div className="flex-1 min-w-0">
                        <p className="text-sm font-medium truncate">{ex.exercise_name}</p>
                        <p className="text-xs text-zinc-500">
                          {ex.sets || '—'} sets &middot; {ex.goal_reps || '—'} reps{ex.goal_weight_kg ? ` · ${ex.goal_weight_kg} kg` : ''}
                        </p>
                      </div>

                      {/* Remove */}
                      <button
                        onClick={() => handleRemove(ex.id)}
                        className="text-zinc-600 text-lg leading-none flex-shrink-0 pl-2 active:text-red-400"
                      >
                        ×
                      </button>
                    </div>
                  ))}
                </div>
              )}
            </div>
          )
        })}
      </div>

      <Nav />

      {/* Add exercise bottom sheet */}
      {addSheet && (
        <div className="fixed inset-0 z-50 flex flex-col">
          <div className="flex-1 bg-black/60" onClick={() => setAddSheet(null)} />
          <div className="bg-zinc-900 rounded-t-2xl max-h-[80vh] flex flex-col">
            <div className="flex items-center justify-between px-4 pt-4 pb-3 border-b border-zinc-800">
              <div>
                <p className="font-semibold">Add exercise</p>
                <p className="text-xs text-zinc-500">{addSheet}</p>
              </div>
              <button onClick={() => setAddSheet(null)} className="text-zinc-500 text-2xl leading-none">×</button>
            </div>

            {!selected ? (
              // Search + list
              <div className="flex flex-col flex-1 overflow-hidden">
                <div className="px-4 py-3">
                  <input
                    type="search"
                    placeholder="Search exercises..."
                    value={search}
                    onChange={e => setSearch(e.target.value)}
                    autoFocus
                    className="w-full bg-zinc-800 rounded-xl px-4 py-2.5 text-sm text-white placeholder-zinc-500 focus:outline-none focus:ring-1 focus:ring-blue-500"
                  />
                </div>
                <div className="overflow-y-auto flex-1 px-4 pb-4">
                  {filtered.map(ex => {
                    const alreadyIn = inSession.has(ex.id)
                    return (
                      <button
                        key={ex.id}
                        disabled={alreadyIn}
                        onClick={() => selectExercise(ex)}
                        className={`w-full text-left px-3 py-3 rounded-xl mb-1.5 transition-colors ${
                          alreadyIn
                            ? 'opacity-40 cursor-not-allowed'
                            : 'bg-zinc-800 active:bg-zinc-700'
                        }`}
                      >
                        <p className="text-sm font-medium">{ex.exercise_name}</p>
                        <p className="text-xs text-zinc-500 mt-0.5">
                          {ex.session_category} &middot; {ex.equipment}
                          {ex.default_reps ? ` · ${ex.default_reps} reps` : ''}
                        </p>
                      </button>
                    )
                  })}
                </div>
              </div>
            ) : (
              // Goal inputs
              <div className="px-4 py-4 flex flex-col gap-4">
                <div className="flex items-center justify-between">
                  <div>
                    <p className="font-semibold">{selected.exercise_name}</p>
                    <p className="text-xs text-zinc-500">{selected.equipment}</p>
                  </div>
                  <button onClick={() => setSelected(null)} className="text-blue-400 text-sm">
                    Change
                  </button>
                </div>

                <div className="grid grid-cols-3 gap-3">
                  <div>
                    <label className="text-xs text-zinc-400 mb-1 block">Sets</label>
                    <input
                      type="number"
                      inputMode="numeric"
                      value={goalSets}
                      onChange={e => setGoalSets(e.target.value)}
                      placeholder="3"
                      className="w-full bg-zinc-800 rounded-xl px-3 py-2.5 text-sm text-white focus:outline-none focus:ring-1 focus:ring-blue-500"
                    />
                  </div>
                  <div>
                    <label className="text-xs text-zinc-400 mb-1 block">Reps</label>
                    <input
                      type="text"
                      value={goalReps}
                      onChange={e => setGoalReps(e.target.value)}
                      placeholder="8-10"
                      className="w-full bg-zinc-800 rounded-xl px-3 py-2.5 text-sm text-white focus:outline-none focus:ring-1 focus:ring-blue-500"
                    />
                  </div>
                  <div>
                    <label className="text-xs text-zinc-400 mb-1 block">Weight kg</label>
                    <input
                      type="number"
                      inputMode="decimal"
                      value={goalWeight}
                      onChange={e => setGoalWeight(e.target.value)}
                      placeholder="0"
                      className="w-full bg-zinc-800 rounded-xl px-3 py-2.5 text-sm text-white focus:outline-none focus:ring-1 focus:ring-blue-500"
                    />
                  </div>
                </div>

                {addError && <p className="text-red-400 text-xs">{addError}</p>}

                <button
                  onClick={handleAdd}
                  disabled={addLoading}
                  className="w-full bg-blue-600 hover:bg-blue-700 disabled:opacity-50 rounded-xl py-3 font-semibold text-sm"
                >
                  {addLoading ? 'Adding...' : 'Add to program'}
                </button>
              </div>
            )}
          </div>
        </div>
      )}
    </div>
  )
}
