import { useNavigate } from 'react-router-dom'

function progressionMarker(current, previous) {
  if (!current || !previous) return null
  const maxCurrent = Math.max(...current.map(s => (s.weight_kg ?? 0) * (s.reps ?? 0)))
  const maxPrevious = Math.max(...previous.map(s => (s.weight_kg ?? 0) * (s.reps ?? 0)))
  if (maxCurrent > maxPrevious) return 'up'
  if (maxCurrent < maxPrevious) return 'down'
  return 'same'
}

function bestSet(sets) {
  if (!sets?.length) return null
  return sets.reduce((best, s) => {
    const vol = (s.weight_kg ?? 0) * (s.reps ?? 0)
    const bestVol = (best.weight_kg ?? 0) * (best.reps ?? 0)
    return vol > bestVol ? s : best
  }, sets[0])
}

function MarkerBadge({ direction }) {
  if (direction === 'up') return (
    <span className="text-xs font-bold text-green-400 bg-green-900/50 px-2 py-0.5 rounded-full">↑ PR</span>
  )
  if (direction === 'down') return (
    <span className="text-xs font-bold text-rose-400 bg-rose-900/40 px-2 py-0.5 rounded-full">↓</span>
  )
  if (direction === 'same') return (
    <span className="text-xs font-bold text-zinc-400 bg-zinc-800 px-2 py-0.5 rounded-full">→</span>
  )
  return null
}

export default function SessionSummary({ exercises, todayLogs, session }) {
  const navigate = useNavigate()

  return (
    <div className="absolute inset-0 z-30 flex flex-col bg-zinc-950/95 backdrop-blur-sm">

      {/* Header */}
      <div className="px-5 pt-10 pb-4 text-center">
        <p className="text-4xl mb-3">🔥</p>
        <h1 className="text-2xl font-black text-white tracking-tight">Session Complete</h1>
        <p className="text-zinc-400 text-sm mt-1">{session}</p>
      </div>

      {/* Exercise list */}
      <div className="flex-1 overflow-y-auto px-4 pb-4">
        <div className="flex flex-col gap-3">
          {exercises.map((ex) => {
            const log = todayLogs[ex.exerciseId]
            const logSets = log?.sets ?? []
            const prevSets = ex.lastPerformance?.sets ?? []
            const marker = progressionMarker(logSets, prevSets)
            const best = bestSet(logSets)
            const prevBest = bestSet(prevSets)

            return (
              <div key={ex.exerciseId} className="bg-zinc-900 rounded-2xl px-4 py-3 border border-zinc-800">
                <div className="flex items-start justify-between gap-2 mb-2">
                  <div className="flex-1 min-w-0">
                    <p className="font-semibold text-sm text-white leading-tight">{ex.exerciseName}</p>
                    <p className="text-xs text-zinc-500 mt-0.5">{logSets.length} sets logged</p>
                  </div>
                  {marker && <MarkerBadge direction={marker} />}
                </div>

                {/* This session sets */}
                {logSets.length > 0 && (
                  <div className="flex flex-wrap gap-1.5 mb-2">
                    {logSets.map(s => (
                      <span
                        key={s.set_number}
                        className="text-xs bg-blue-950/60 text-blue-300 border border-blue-900/40 px-2 py-1 rounded-lg"
                      >
                        {s.weight_kg ?? '—'} kg × {s.reps ?? '—'}
                      </span>
                    ))}
                  </div>
                )}

                {/* vs last session */}
                {prevBest && best && (
                  <div className="flex items-center gap-2 text-xs text-zinc-500">
                    <span>Last: {prevBest.weight_kg ?? '—'} kg × {prevBest.reps ?? '—'}</span>
                    {marker === 'up' && best && (
                      <span className="text-green-400">
                        +{(((best.weight_kg ?? 0) * (best.reps ?? 0)) - ((prevBest.weight_kg ?? 0) * (prevBest.reps ?? 0))).toFixed(0)} vol
                      </span>
                    )}
                  </div>
                )}

                {!log && (
                  <p className="text-xs text-zinc-600 italic">Not logged this session</p>
                )}
              </div>
            )
          })}
        </div>
      </div>

      {/* CTA */}
      <div className="px-4 pb-10 pt-3 flex flex-col gap-2">
        <button
          onClick={() => navigate('/dashboard')}
          className="w-full rounded-xl py-3.5 bg-blue-600 font-bold text-sm text-white active:bg-blue-700"
        >
          Back to Dashboard
        </button>
        <button
          onClick={() => navigate('/progress')}
          className="w-full rounded-xl py-3 bg-zinc-800 font-medium text-sm text-zinc-300 active:bg-zinc-700"
        >
          View Progress →
        </button>
      </div>
    </div>
  )
}
