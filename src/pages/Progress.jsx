import { useState, useEffect } from 'react'
import { useAuth } from '../context/AuthContext'
import Layout from '../components/Layout'
import {
  ResponsiveContainer,
  LineChart, Line,
  BarChart, Bar,
  XAxis, YAxis,
  CartesianGrid, Tooltip,
} from 'recharts'

const API = import.meta.env.VITE_WORKER_URL

function fmt(dateStr) {
  const [, m, d] = dateStr.split('-')
  const months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
  return `${parseInt(d)} ${months[parseInt(m) - 1]}`
}

export default function Progress() {
  const { athlete } = useAuth()
  const [exercises, setExercises] = useState([])
  const [selectedId, setSelectedId] = useState('')
  const [data, setData] = useState(null)
  const [loading, setLoading] = useState(false)
  const [loadingEx, setLoadingEx] = useState(true)

  useEffect(() => {
    fetch(`${API}/progress/exercises?athleteId=${athlete.id}`)
      .then(r => r.json())
      .then(d => {
        setExercises(d.exercises || [])
        if (d.exercises?.length) setSelectedId(String(d.exercises[0].exercise_id))
      })
      .finally(() => setLoadingEx(false))
  }, [])

  useEffect(() => {
    if (!selectedId) return
    setLoading(true)
    setData(null)
    fetch(`${API}/progress?athleteId=${athlete.id}&exerciseId=${selectedId}`)
      .then(r => r.json())
      .then(d => setData(d))
      .finally(() => setLoading(false))
  }, [selectedId])

  const chartData = (data?.timeSeries || []).map(r => ({
    date: fmt(r.session_date),
    raw: r.session_date,
    max_weight: r.max_weight,
    volume: Math.round(r.total_volume),
  }))

  const history = [...chartData].reverse()

  return (
    <Layout>
    <div className="px-4 pt-4 pb-4">
      <h1 className="text-xl font-bold mb-4">Progress</h1>

      {/* Exercise selector */}
      {loadingEx ? (
        <div className="h-10 bg-zinc-800 rounded-xl animate-pulse mb-6" />
      ) : (
        <select
          value={selectedId}
          onChange={e => setSelectedId(e.target.value)}
          className="w-full bg-zinc-900 border border-zinc-700 rounded-xl px-4 py-3 text-sm text-white mb-6 appearance-none"
        >
          {exercises.map(ex => (
            <option key={ex.exercise_id} value={ex.exercise_id}>
              {ex.exercise_name}
            </option>
          ))}
        </select>
      )}

      {loading && (
        <div className="flex flex-col gap-3">
          {[1,2,3].map(i => <div key={i} className="h-40 bg-zinc-800 rounded-2xl animate-pulse" />)}
        </div>
      )}

      {!loading && data && (
        <>
          {/* PR badge */}
          {data.pr && (
            <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-4 mb-4 flex items-center justify-between">
              <div>
                <p className="text-xs text-zinc-500 uppercase tracking-wide mb-1">All-time PR</p>
                <p className="text-3xl font-bold">{data.pr.weight} <span className="text-lg text-zinc-400">kg</span></p>
                <p className="text-xs text-zinc-500 mt-1">{fmt(data.pr.date)}</p>
              </div>
              <span className="text-4xl">🏆</span>
            </div>
          )}

          {chartData.length === 0 && (
            <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-6 text-center text-zinc-500 text-sm mb-4">
              No data logged for this exercise yet.
            </div>
          )}

          {chartData.length > 0 && (
            <>
              {/* Max weight chart */}
              <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-4 mb-4">
                <p className="text-xs text-zinc-500 uppercase tracking-wide mb-4">Max Weight (kg)</p>
                <ResponsiveContainer width="100%" height={160}>
                  <LineChart data={chartData} margin={{ top: 4, right: 8, left: -20, bottom: 0 }}>
                    <CartesianGrid strokeDasharray="3 3" stroke="#27272a" />
                    <XAxis dataKey="date" tick={{ fontSize: 10, fill: '#71717a' }} tickLine={false} axisLine={false} interval="preserveStartEnd" />
                    <YAxis tick={{ fontSize: 10, fill: '#71717a' }} tickLine={false} axisLine={false} />
                    <Tooltip
                      contentStyle={{ background: '#18181b', border: '1px solid #3f3f46', borderRadius: 8, fontSize: 12 }}
                      labelStyle={{ color: '#a1a1aa' }}
                      formatter={v => [`${v} kg`, 'Max weight']}
                    />
                    <Line type="monotone" dataKey="max_weight" stroke="#3b82f6" strokeWidth={2} dot={{ r: 3, fill: '#3b82f6' }} activeDot={{ r: 5 }} />
                  </LineChart>
                </ResponsiveContainer>
              </div>

              {/* Volume chart */}
              <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-4 mb-4">
                <p className="text-xs text-zinc-500 uppercase tracking-wide mb-4">Volume (kg × reps)</p>
                <ResponsiveContainer width="100%" height={160}>
                  <BarChart data={chartData} margin={{ top: 4, right: 8, left: -20, bottom: 0 }}>
                    <CartesianGrid strokeDasharray="3 3" stroke="#27272a" />
                    <XAxis dataKey="date" tick={{ fontSize: 10, fill: '#71717a' }} tickLine={false} axisLine={false} interval="preserveStartEnd" />
                    <YAxis tick={{ fontSize: 10, fill: '#71717a' }} tickLine={false} axisLine={false} />
                    <Tooltip
                      contentStyle={{ background: '#18181b', border: '1px solid #3f3f46', borderRadius: 8, fontSize: 12 }}
                      labelStyle={{ color: '#a1a1aa' }}
                      formatter={v => [`${v} kg·reps`, 'Volume']}
                    />
                    <Bar dataKey="volume" fill="#6366f1" radius={[4, 4, 0, 0]} />
                  </BarChart>
                </ResponsiveContainer>
              </div>

              {/* Session history */}
              <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-4 mb-4">
                <p className="text-xs text-zinc-500 uppercase tracking-wide mb-3">Session History</p>
                <div className="flex flex-col gap-2">
                  {history.map(row => (
                    <div key={row.raw} className="flex items-center justify-between py-2 border-b border-zinc-800 last:border-0">
                      <div>
                        <p className="text-sm font-medium">{fmt(row.raw)}</p>
                      </div>
                      <div className="text-right">
                        <p className="text-sm font-semibold">{row.max_weight} kg</p>
                        <p className="text-xs text-zinc-500">{row.volume} vol</p>
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            </>
          )}
        </>
      )}

    </div>
    </Layout>
  )
}
