import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import Nav from '../components/Nav'

const API = import.meta.env.VITE_WORKER_URL

const SESSION_ABBREV = {
  'Strength Legs': 'S.Legs',
  'Strength Push': 'S.Push',
  'Strength Pull': 'S.Pull',
  'Volume Legs':   'V.Legs',
  'Volume Push':   'V.Push',
  'Volume Pull':   'V.Pull',
  'Abs & Arms':    'Abs',
}

function getMondayOf(dateStr) {
  const d = new Date(dateStr + 'T12:00:00')
  const day = d.getDay()
  const diff = day === 0 ? -6 : 1 - day
  d.setDate(d.getDate() + diff)
  return d.toISOString().split('T')[0]
}

function fmtDate(dateStr) {
  const [, m, dd] = dateStr.split('-')
  const months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
  return `${parseInt(dd)} ${months[parseInt(m) - 1]}`
}

function buildWeeks(recentSessions) {
  const today = new Date()
  today.setHours(12, 0, 0, 0)
  const day = today.getDay()
  const monday = new Date(today)
  monday.setDate(today.getDate() - (day === 0 ? 6 : day - 1))

  const weeks = []
  for (let i = 0; i < 10; i++) {
    const start = new Date(monday)
    start.setDate(monday.getDate() - i * 7)
    const startStr = start.toISOString().split('T')[0]
    const end = new Date(start)
    end.setDate(start.getDate() + 6)
    const endStr = end.toISOString().split('T')[0]
    weeks.push({ start: startStr, end: endStr, sessions: [] })
  }

  for (const s of recentSessions) {
    const weekStart = getMondayOf(s.session_date)
    const week = weeks.find(w => w.start === weekStart)
    if (week) week.sessions.push(s)
  }

  return weeks
}

export default function Dashboard() {
  const { athlete } = useAuth()
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
  const recentSessions = data?.recentSessions || []
  const weeks = buildWeeks(recentSessions)

  const workoutComplete =
    !todayData?.isRestDay &&
    todayData?.totalExercises > 0 &&
    todayData?.loggedExercises >= todayData?.totalExercises

  return (
    <div className="min-h-screen flex flex-col pb-24 px-4">

      {/* Full-size logo */}
      <div className="flex flex-col items-center pt-8 pb-6">
        <svg width="88" height="22" viewBox="0 0 88 22" fill="none" xmlns="http://www.w3.org/2000/svg">
          <rect x="0" y="2" width="10" height="18" rx="2.5" fill="#3b82f6"/>
          <rect x="10" y="5" width="6" height="12" rx="1.5" fill="#60a5fa"/>
          <rect x="16" y="9.5" width="56" height="3" rx="1" fill="#93c5fd"/>
          <rect x="72" y="5" width="6" height="12" rx="1.5" fill="#60a5fa"/>
          <rect x="78" y="2" width="10" height="18" rx="2.5" fill="#3b82f6"/>
        </svg>
        <h1 className="text-5xl font-black tracking-tighter mt-3 bg-gradient-to-b from-white to-zinc-400 bg-clip-text text-transparent">
          LTPT
        </h1>
        <p className="text-xs text-zinc-500 tracking-[0.22em] uppercase mt-1.5">Exercise Programming</p>
      </div>

      {/* Greeting */}
      <div className="flex items-center justify-between mb-4">
        <div>
          <p className="text-lg font-bold">Hey, {athlete.first_name} 👋</p>
          <p className="text-zinc-400 text-sm mt-0.5">
            {todayData?.day} &middot; {new Date(today + 'T12:00:00').toLocaleDateString('en-AU', { day: 'numeric', month: 'short' })}
          </p>
        </div>
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
            {workoutComplete ? (
              <div className="bg-gradient-to-r from-green-900/60 to-emerald-900/60 border border-green-800 rounded-xl px-4 py-3 flex items-center gap-3">
                <span className="text-2xl">🔥</span>
                <div>
                  <p className="font-bold text-green-300 text-sm">Good work today — you smashed it!</p>
                  <p className="text-xs text-green-500 mt-0.5">
                    {todayData.loggedExercises}/{todayData.totalExercises} exercises logged
                  </p>
                </div>
              </div>
            ) : (
              <div>
                <button
                  onClick={() => navigate('/workout')}
                  className="w-full bg-blue-600 hover:bg-blue-700 active:bg-blue-800 rounded-xl py-3 font-semibold text-sm transition-colors"
                >
                  Start Workout
                </button>
                {todayData?.loggedExercises > 0 && (
                  <p className="text-xs text-zinc-500 text-center mt-2">
                    {todayData.loggedExercises}/{todayData.totalExercises} logged
                  </p>
                )}
              </div>
            )}
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

      {/* Profile card — tappable, navigates to /profile */}
      <button
        onClick={() => navigate('/profile')}
        className="w-full bg-zinc-900 border border-zinc-800 rounded-2xl p-4 mb-3 text-left active:opacity-80 transition-opacity"
      >
        <div className="flex items-center justify-between mb-3">
          <p className="text-xs text-zinc-500 uppercase tracking-wide">Profile</p>
          <span className="text-xs text-blue-400 font-medium">Edit →</span>
        </div>
        <div className="flex items-center gap-4">
          <div className="w-14 h-14 rounded-full bg-gradient-to-br from-blue-500 to-indigo-600 flex items-center justify-center flex-shrink-0 shadow-lg">
            <span className="text-xl font-black text-white">{athlete.first_name?.[0]?.toUpperCase()}</span>
          </div>
          <div className="flex flex-wrap gap-x-6 gap-y-2">
            {athlete.weight_kg && (
              <div>
                <p className="text-lg font-bold">{athlete.weight_kg} <span className="text-sm text-zinc-400 font-normal">kg</span></p>
                <p className="text-xs text-zinc-500">Weight</p>
              </div>
            )}
            {athlete.age && (
              <div>
                <p className="text-lg font-bold">{athlete.age}</p>
                <p className="text-xs text-zinc-500">Age</p>
              </div>
            )}
            {athlete.main_goal && (
              <div>
                <p className="text-sm font-semibold leading-tight">{athlete.main_goal}</p>
                <p className="text-xs text-zinc-500">Goal</p>
              </div>
            )}
          </div>
        </div>
      </button>

      {/* Training history — last 10 weeks */}
      <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-4 mb-3">
        <p className="text-xs text-zinc-500 uppercase tracking-wide mb-3">Training History — Last 10 Weeks</p>
        {recentSessions.length === 0 ? (
          <p className="text-xs text-zinc-600 text-center py-4">No training data yet</p>
        ) : (
          <div className="flex flex-col gap-0.5">
            {weeks.map((week, i) => (
              <div
                key={week.start}
                className={`flex items-start justify-between py-2.5 ${i < weeks.length - 1 ? 'border-b border-zinc-800' : ''}`}
              >
                <p className="text-xs text-zinc-500 w-16 flex-shrink-0 pt-0.5">{fmtDate(week.start)}</p>
                {week.sessions.length === 0 ? (
                  <p className="text-xs text-zinc-700 flex-1 text-right">—</p>
                ) : (
                  <div className="flex flex-wrap gap-1 justify-end flex-1">
                    {week.sessions.map(s => (
                      <span
                        key={s.session_date + s.session}
                        className="text-xs bg-zinc-800 text-zinc-300 px-2 py-0.5 rounded-md"
                      >
                        {SESSION_ABBREV[s.session] || s.session}
                      </span>
                    ))}
                  </div>
                )}
              </div>
            ))}
          </div>
        )}
      </div>

      <Nav />
    </div>
  )
}
