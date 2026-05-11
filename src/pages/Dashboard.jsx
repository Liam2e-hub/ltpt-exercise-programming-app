import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import Nav from '../components/Nav'

const API = import.meta.env.VITE_WORKER_URL

export default function Dashboard() {
  const { athlete, logout } = useAuth()
  const navigate = useNavigate()
  const [data, setData] = useState(null)
  const [loading, setLoading] = useState(true)
  const today = new Date().toISOString().split('T')[0]

  useEffect(() => {
    fetch(`${API}/dashboard?athleteId=${athlete.id}&date=${today}`)
      .then(r => r.json())
      .then(d => setData(d))
      .finally(() => setLoading(false))
  }, [])

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <p className="text-zinc-500">Loading...</p>
      </div>
    )
  }

  const todayData = data?.today
  const nutrition = data?.nutrition

  return (
    <div className="min-h-screen flex flex-col pb-24 px-4 pt-10">

      {/* Header */}
      <div className="flex items-start justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold">Hey, {athlete.first_name}</h1>
          <p className="text-zinc-400 text-sm mt-0.5">
            {todayData?.day} &middot; {new Date(today + 'T12:00:00').toLocaleDateString('en-AU', { day: 'numeric', month: 'short' })}
          </p>
        </div>
        <button onClick={logout} className="text-zinc-500 text-sm pt-1">Log out</button>
      </div>

      {/* Today's session */}
      <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-4 mb-3">
        <p className="text-xs text-zinc-500 uppercase tracking-wide mb-2">Today</p>
        {todayData?.isRestDay ? (
          <div className="flex items-center gap-3">
            <span className="text-2xl">🛌</span>
            <div>
              <p className="font-semibold text-zinc-300">Rest Day</p>
              <p className="text-xs text-zinc-500">Recovery is part of the program</p>
            </div>
          </div>
        ) : (
          <>
            <p className="text-lg font-semibold mb-3">{todayData?.session}</p>
            <button
              onClick={() => navigate('/workout')}
              className="w-full bg-blue-600 hover:bg-blue-700 active:bg-blue-800 rounded-xl py-3 font-semibold text-sm transition-colors"
            >
              Start Workout
            </button>
          </>
        )}
      </div>

      {/* Nutrition summary */}
      <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-4 mb-3">
        <p className="text-xs text-zinc-500 uppercase tracking-wide mb-3">Nutrition today</p>
        <div className="grid grid-cols-4 gap-2 text-center">
          {[
            { label: 'kcal', value: Math.round(nutrition?.calories ?? 0) },
            { label: 'protein', value: `${Math.round(nutrition?.protein_g ?? 0)}g` },
            { label: 'carbs', value: `${Math.round(nutrition?.carbs_g ?? 0)}g` },
            { label: 'fat', value: `${Math.round(nutrition?.fat_g ?? 0)}g` },
          ].map(({ label, value }) => (
            <div key={label}>
              <p className="text-xl font-bold tabular-nums">{value}</p>
              <p className="text-xs text-zinc-500 mt-0.5">{label}</p>
            </div>
          ))}
        </div>
      </div>

      {/* Profile snippet */}
      <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-4">
        <p className="text-xs text-zinc-500 uppercase tracking-wide mb-3">Profile</p>
        <div className="flex flex-wrap gap-4">
          {athlete.weight_kg && (
            <div>
              <p className="font-semibold">{athlete.weight_kg} kg</p>
              <p className="text-xs text-zinc-500">Weight</p>
            </div>
          )}
          {athlete.age && (
            <div>
              <p className="font-semibold">{athlete.age}</p>
              <p className="text-xs text-zinc-500">Age</p>
            </div>
          )}
          {athlete.main_goal && (
            <div>
              <p className="font-semibold text-sm">{athlete.main_goal}</p>
              <p className="text-xs text-zinc-500">Goal</p>
            </div>
          )}
        </div>
      </div>

      <Nav />
    </div>
  )
}
