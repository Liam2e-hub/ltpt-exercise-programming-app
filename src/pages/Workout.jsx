import { useState, useEffect } from 'react'
import { useAuth } from '../context/AuthContext'
import Nav from '../components/Nav'
import ExerciseCard from '../components/ExerciseCard'

const API = import.meta.env.VITE_WORKER_URL

export default function Workout() {
  const { athlete } = useAuth()
  const [data, setData] = useState(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const today = new Date().toISOString().split('T')[0]

  useEffect(() => {
    fetch(`${API}/workout?athleteId=${athlete.id}&date=${today}`)
      .then(r => r.json())
      .then(d => setData(d))
      .catch(() => setError('Failed to load workout — check your connection'))
      .finally(() => setLoading(false))
  }, [])

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <p className="text-zinc-500">Loading...</p>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center px-6 gap-3">
        <p className="text-red-400 text-sm text-center">{error}</p>
        <button
          onClick={() => window.location.reload()}
          className="text-sm text-blue-400"
        >
          Retry
        </button>
      </div>
    )
  }

  if (data?.isRestDay) {
    return (
      <div className="min-h-screen flex flex-col pb-24">
        <div className="px-4 pt-10 mb-2">
          <h1 className="text-xl font-bold">Workout</h1>
        </div>
        <div className="flex-1 flex flex-col items-center justify-center px-4 text-center">
          <p className="text-5xl mb-4">🛌</p>
          <p className="text-lg font-semibold">Rest Day</p>
          <p className="text-zinc-500 text-sm mt-1">Recovery is part of the program.</p>
        </div>
        <Nav />
      </div>
    )
  }

  const loggedCount = data?.exercises.filter(e => data.todayLogs?.[e.exerciseId]).length ?? 0
  const totalCount = data?.exercises.length ?? 0

  return (
    <div className="min-h-screen flex flex-col pb-24">
      <div className="px-4 pt-10 mb-1">
        <h1 className="text-xl font-bold">Workout</h1>
        <div className="flex items-baseline gap-2 mt-0.5">
          <p className="text-zinc-400 text-sm">{data?.session}</p>
          {totalCount > 0 && (
            <p className="text-xs text-zinc-600">{loggedCount}/{totalCount} logged</p>
          )}
        </div>
      </div>

      <div className="px-4 pt-3 flex flex-col gap-3">
        {data?.exercises.map(exercise => (
          <ExerciseCard
            key={exercise.exerciseId}
            exercise={exercise}
            athleteId={athlete.id}
            sessionDate={today}
            session={data.session}
            initialLog={data.todayLogs?.[exercise.exerciseId] ?? null}
          />
        ))}

        {totalCount === 0 && (
          <div className="flex flex-col items-center justify-center py-16 text-center">
            <p className="text-zinc-500 text-sm">No exercises in this session.</p>
            <p className="text-zinc-600 text-xs mt-1">Add some in the Program manager.</p>
          </div>
        )}
      </div>

      <Nav />
    </div>
  )
}
