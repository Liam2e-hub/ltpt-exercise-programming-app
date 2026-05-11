import { useState, useEffect } from 'react'
import { useAuth } from '../context/AuthContext'
import Nav from '../components/Nav'

const API = import.meta.env.VITE_WORKER_URL

const DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

const SESSION_TYPES = [
  'Strength Legs',
  'Strength Push',
  'Strength Pull',
  'Volume Legs',
  'Volume Push',
  'Volume Pull',
  'Abs & Arms',
  'Rest',
]

const SESSION_COLOURS = {
  'Strength Legs': 'bg-orange-900 text-orange-300 border-orange-800',
  'Strength Push': 'bg-blue-900 text-blue-300 border-blue-800',
  'Strength Pull': 'bg-purple-900 text-purple-300 border-purple-800',
  'Volume Legs':   'bg-yellow-900 text-yellow-300 border-yellow-800',
  'Volume Push':   'bg-cyan-900 text-cyan-300 border-cyan-800',
  'Volume Pull':   'bg-indigo-900 text-indigo-300 border-indigo-800',
  'Abs & Arms':    'bg-pink-900 text-pink-300 border-pink-800',
  'Rest':          'bg-zinc-800 text-zinc-500 border-zinc-700',
}

export default function Schedule() {
  const { athlete } = useAuth()
  const [schedule, setSchedule] = useState(
    DAYS.map((day, i) => ({ day, session: 'Rest', display_order: i }))
  )
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [saved, setSaved] = useState(false)
  const [picker, setPicker] = useState(null) // day index or null

  useEffect(() => {
    fetch(`${API}/schedule?athleteId=${athlete.id}`)
      .then(r => r.json())
      .then(data => {
        if (data.schedule?.length) {
          // Map returned rows back to full 7-day array
          const map = {}
          for (const row of data.schedule) map[row.day] = row.session || 'Rest'
          setSchedule(DAYS.map((day, i) => ({ day, session: map[day] ?? 'Rest', display_order: i })))
        }
      })
      .finally(() => setLoading(false))
  }, [])

  function selectSession(dayIndex, session) {
    setSchedule(prev => prev.map((d, i) => i === dayIndex ? { ...d, session } : d))
    setPicker(null)
    setSaved(false)
  }

  async function handleSave() {
    setSaving(true)
    setSaved(false)
    try {
      const res = await fetch(`${API}/schedule`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          athleteId: athlete.id,
          days: schedule.map(d => ({ day: d.day, session: d.session === 'Rest' ? null : d.session })),
        }),
      })
      if (res.ok) setSaved(true)
    } catch {
      // silent
    } finally {
      setSaving(false)
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
      <div className="px-4 pt-10 mb-4 flex items-center justify-between">
        <div>
          <h1 className="text-xl font-bold">Schedule</h1>
          <p className="text-zinc-500 text-sm mt-0.5">Tap a day to change its session</p>
        </div>
        <button
          onClick={handleSave}
          disabled={saving}
          className={`px-4 py-2 rounded-xl text-sm font-semibold transition-colors disabled:opacity-50 ${
            saved ? 'bg-green-700 text-white' : 'bg-blue-600 text-white hover:bg-blue-700'
          }`}
        >
          {saving ? 'Saving...' : saved ? 'Saved' : 'Save'}
        </button>
      </div>

      <div className="px-4 flex flex-col gap-2">
        {schedule.map((d, i) => {
          const colour = SESSION_COLOURS[d.session] || SESSION_COLOURS['Rest']
          return (
            <button
              key={d.day}
              onClick={() => setPicker(i)}
              className={`flex items-center justify-between px-4 py-3.5 rounded-2xl border transition-colors text-left ${colour}`}
            >
              <span className="font-medium text-sm w-24">{d.day}</span>
              <span className="text-sm">{d.session}</span>
              <span className="text-xs opacity-50 ml-2">▼</span>
            </button>
          )
        })}
      </div>

      <Nav />

      {/* Session picker bottom sheet */}
      {picker !== null && (
        <div className="fixed inset-0 z-50 flex flex-col">
          <div className="flex-1 bg-black/60" onClick={() => setPicker(null)} />
          <div className="bg-zinc-900 rounded-t-2xl">
            <div className="flex items-center justify-between px-4 pt-4 pb-3 border-b border-zinc-800">
              <p className="font-semibold">{DAYS[picker]}</p>
              <button onClick={() => setPicker(null)} className="text-zinc-500 text-2xl leading-none">×</button>
            </div>
            <div className="flex flex-col px-4 py-3 gap-2 pb-8">
              {SESSION_TYPES.map(type => {
                const active = schedule[picker]?.session === type
                const colour = SESSION_COLOURS[type]
                return (
                  <button
                    key={type}
                    onClick={() => selectSession(picker, type)}
                    className={`flex items-center justify-between px-4 py-3 rounded-xl border text-left transition-colors ${
                      active ? colour : 'bg-zinc-800 border-zinc-700 text-zinc-300'
                    }`}
                  >
                    <span className="text-sm font-medium">{type}</span>
                    {active && <span className="text-xs opacity-70">✓</span>}
                  </button>
                )
              })}
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
