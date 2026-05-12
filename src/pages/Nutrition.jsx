import { useState, useEffect } from 'react'
import { useAuth } from '../context/AuthContext'
import Layout from '../components/Layout'

const API = import.meta.env.VITE_WORKER_URL

const SECTIONS = [
  { name: 'Breakfast',    icon: '🌅' },
  { name: 'Pre Workout',  icon: '⚡' },
  { name: 'Post Workout', icon: '💪' },
  { name: 'Dinner',       icon: '🍽️' },
  { name: 'Snacks',       icon: '🥜' },
  { name: 'Fluids',       icon: '💧' },
]

function fmt(v) { return v != null ? Math.round(v) : 0 }

function MacroChip({ label, value, unit = 'g' }) {
  return (
    <div className="text-center">
      <p className="text-lg font-bold tabular-nums">{value}{unit === 'kcal' ? '' : unit}</p>
      <p className="text-xs text-zinc-500 mt-0.5">{label}</p>
    </div>
  )
}

export default function Nutrition() {
  const { athlete } = useAuth()
  const todayStr = new Date().toISOString().split('T')[0]

  const [date, setDate] = useState(todayStr)
  const [entries, setEntries] = useState([])
  const [totals, setTotals] = useState({ calories: 0, protein_g: 0, carbs_g: 0, fat_g: 0 })
  const [allMeals, setAllMeals] = useState([])
  const [loadingEntries, setLoadingEntries] = useState(true)

  const [picker, setPicker] = useState(null)

  const [showNewMeal, setShowNewMeal] = useState(false)
  const [newMealSection, setNewMealSection] = useState('Breakfast')
  const [newMealName, setNewMealName] = useState('')
  const [newMealMacros, setNewMealMacros] = useState({ calories: '', protein_g: '', carbs_g: '', fat_g: '' })
  const [estimating, setEstimating] = useState(false)
  const [macrosEstimated, setMacrosEstimated] = useState(false)
  const [saving, setSaving] = useState(false)

  function fetchEntries(d) {
    setLoadingEntries(true)
    fetch(`${API}/nutrition?athleteId=${athlete.id}&date=${d}`)
      .then(r => r.json())
      .then(data => {
        setEntries(data.entries || [])
        setTotals(data.totals || { calories: 0, protein_g: 0, carbs_g: 0, fat_g: 0 })
      })
      .finally(() => setLoadingEntries(false))
  }

  function fetchMeals() {
    fetch(`${API}/meals`)
      .then(r => r.json())
      .then(data => setAllMeals(data.meals || []))
  }

  useEffect(() => { fetchEntries(date) }, [date])
  useEffect(() => { fetchMeals() }, [])

  function changeDate(delta) {
    const d = new Date(date + 'T12:00:00')
    d.setDate(d.getDate() + delta)
    const next = d.toISOString().split('T')[0]
    if (next <= todayStr) setDate(next)
  }

  function fmtDisplayDate(d) {
    if (d === todayStr) return 'Today'
    const yest = new Date(todayStr + 'T12:00:00')
    yest.setDate(yest.getDate() - 1)
    if (d === yest.toISOString().split('T')[0]) return 'Yesterday'
    return new Date(d + 'T12:00:00').toLocaleDateString('en-AU', { weekday: 'short', day: 'numeric', month: 'short' })
  }

  async function handleDeleteEntry(id) {
    await fetch(`${API}/nutrition/${id}`, { method: 'DELETE' })
    fetchEntries(date)
  }

  async function logMealFromLibrary(meal) {
    await fetch(`${API}/nutrition`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        athleteId: athlete.id,
        logDate: date,
        mealType: meal.meal_type,
        mealName: meal.meal_name,
        calories: meal.calories,
        proteinG: meal.protein_g,
        carbsG: meal.carbs_g,
        fatG: meal.fat_g,
      }),
    })
    fetchEntries(date)
    setPicker(null)
  }

  async function estimateMacros() {
    if (!newMealName.trim()) return
    setEstimating(true)
    setMacrosEstimated(false)
    try {
      const res = await fetch(`${API}/nutrition/estimate`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ description: newMealName.trim() }),
      })
      const data = await res.json()
      if (data.calories != null) {
        setNewMealMacros({
          calories: String(data.calories),
          protein_g: String(data.protein_g),
          carbs_g: String(data.carbs_g),
          fat_g: String(data.fat_g),
        })
        setMacrosEstimated(true)
      }
    } finally {
      setEstimating(false)
    }
  }

  async function saveAndLog() {
    if (!newMealName.trim()) return
    setSaving(true)
    try {
      const payload = {
        mealName: newMealName.trim(),
        mealType: newMealSection,
        calories: parseFloat(newMealMacros.calories) || null,
        proteinG: parseFloat(newMealMacros.protein_g) || null,
        carbsG: parseFloat(newMealMacros.carbs_g) || null,
        fatG: parseFloat(newMealMacros.fat_g) || null,
      }
      await fetch(`${API}/meals`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload),
      })
      await fetch(`${API}/nutrition`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ ...payload, athleteId: athlete.id, logDate: date }),
      })
      fetchEntries(date)
      fetchMeals()
      setShowNewMeal(false)
      setNewMealName('')
      setNewMealMacros({ calories: '', protein_g: '', carbs_g: '', fat_g: '' })
      setMacrosEstimated(false)
    } finally {
      setSaving(false)
    }
  }

  function openNewMeal(section) {
    setNewMealSection(section)
    setNewMealName('')
    setNewMealMacros({ calories: '', protein_g: '', carbs_g: '', fat_g: '' })
    setMacrosEstimated(false)
    setPicker(null)
    setShowNewMeal(true)
  }

  const pickerMeals = picker ? allMeals.filter(m => m.meal_type === picker) : []

  return (
    <Layout>
      <div className="px-4 pt-2 pb-4">

        {/* Date navigator */}
        <div className="flex items-center justify-between mb-4">
          <button
            onClick={() => changeDate(-1)}
            className="w-9 h-9 flex items-center justify-center rounded-xl bg-zinc-800 text-zinc-400 active:opacity-70"
          >
            ‹
          </button>
          <p className="text-sm font-semibold">{fmtDisplayDate(date)}</p>
          <button
            onClick={() => changeDate(1)}
            disabled={date >= todayStr}
            className="w-9 h-9 flex items-center justify-center rounded-xl bg-zinc-800 text-zinc-400 disabled:opacity-30 active:opacity-70"
          >
            ›
          </button>
        </div>

        {/* Macro totals */}
        <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-4 mb-3">
          <p className="text-xs text-zinc-500 uppercase tracking-wide mb-3">Daily totals</p>
          <div className="grid grid-cols-4 gap-2 text-center">
            <MacroChip label="kcal" value={fmt(totals?.calories)} unit="kcal" />
            <MacroChip label="protein" value={`${fmt(totals?.protein_g)}g`} unit="" />
            <MacroChip label="carbs" value={`${fmt(totals?.carbs_g)}g`} unit="" />
            <MacroChip label="fat" value={`${fmt(totals?.fat_g)}g`} unit="" />
          </div>
        </div>

        {/* 6 sections */}
        {SECTIONS.map(({ name, icon }) => {
          const sectionEntries = entries.filter(e => e.meal_type === name)
          return (
            <div key={name} className="bg-zinc-900 border border-zinc-800 rounded-2xl p-4 mb-3">
              <div className="flex items-center justify-between mb-2">
                <div className="flex items-center gap-2">
                  <span className="text-base">{icon}</span>
                  <p className="text-sm font-semibold">{name}</p>
                  {sectionEntries.length > 0 && (
                    <span className="text-xs text-zinc-500">
                      {fmt(sectionEntries.reduce((s, e) => s + (e.calories ?? 0), 0))} kcal
                    </span>
                  )}
                </div>
                <button
                  onClick={() => setPicker(name)}
                  className="w-7 h-7 flex items-center justify-center rounded-lg bg-zinc-800 text-zinc-400 hover:text-zinc-200 text-lg leading-none active:opacity-70"
                >
                  +
                </button>
              </div>
              {sectionEntries.length === 0 ? (
                <p className="text-xs text-zinc-700 text-center py-2">No meals logged</p>
              ) : (
                <div className="flex flex-col">
                  {sectionEntries.map((entry, i) => (
                    <div
                      key={entry.id}
                      className={`flex items-center justify-between py-2 ${i > 0 ? 'border-t border-zinc-800' : ''}`}
                    >
                      <div className="flex-1 min-w-0">
                        <p className="text-sm text-zinc-200 truncate">{entry.meal_name}</p>
                        <p className="text-xs text-zinc-500 mt-0.5">
                          {fmt(entry.calories)} kcal · {fmt(entry.protein_g)}P · {fmt(entry.carbs_g)}C · {fmt(entry.fat_g)}F
                        </p>
                      </div>
                      <button
                        onClick={() => handleDeleteEntry(entry.id)}
                        className="ml-3 text-zinc-600 hover:text-rose-400 text-xl leading-none flex-shrink-0 transition-colors"
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

        {/* AI custom meal button */}
        <button
          onClick={() => openNewMeal('Breakfast')}
          className="w-full flex items-center justify-center gap-2 py-3.5 rounded-2xl border border-indigo-800 bg-indigo-950/60 text-indigo-300 font-semibold text-sm active:opacity-80 transition-opacity mb-3"
        >
          <span className="text-base">✨</span>
          Add New Custom Meal
        </button>

      </div>

      {/* Meal library picker — bottom sheet */}
      {picker && (
        <div className="fixed inset-0 z-50 flex flex-col">
          <div className="flex-1 bg-black/60" onClick={() => setPicker(null)} />
          <div className="bg-zinc-900 rounded-t-2xl max-h-[70vh] flex flex-col">
            <div className="flex items-center justify-between px-4 pt-4 pb-3 border-b border-zinc-800 flex-shrink-0">
              <p className="font-semibold">
                {SECTIONS.find(s => s.name === picker)?.icon} {picker}
              </p>
              <button onClick={() => setPicker(null)} className="text-zinc-500 text-2xl leading-none">×</button>
            </div>
            <div className="overflow-y-auto flex-1 px-4 py-3 flex flex-col gap-2 pb-10">
              {pickerMeals.length === 0 ? (
                <div className="text-center py-8">
                  <p className="text-xs text-zinc-600 mb-4">No {picker} meals saved yet</p>
                  <button
                    onClick={() => openNewMeal(picker)}
                    className="text-indigo-400 text-sm font-medium"
                  >
                    ✨ Create one with AI →
                  </button>
                </div>
              ) : (
                <>
                  {pickerMeals.map(meal => (
                    <button
                      key={meal.id}
                      onClick={() => logMealFromLibrary(meal)}
                      className="flex items-center justify-between px-4 py-3 bg-zinc-800 border border-zinc-700 rounded-xl text-left active:opacity-70 transition-opacity"
                    >
                      <div className="flex-1 min-w-0">
                        <p className="text-sm font-medium text-zinc-200 truncate">{meal.meal_name}</p>
                        <p className="text-xs text-zinc-500 mt-0.5">
                          {fmt(meal.calories)} kcal · {fmt(meal.protein_g)}P · {fmt(meal.carbs_g)}C · {fmt(meal.fat_g)}F
                        </p>
                      </div>
                      <span className="text-blue-400 text-sm font-medium ml-3 flex-shrink-0">Log</span>
                    </button>
                  ))}
                  <button
                    onClick={() => openNewMeal(picker)}
                    className="flex items-center justify-center gap-2 py-3 rounded-xl border border-indigo-800/60 bg-indigo-950/40 text-indigo-400 text-sm font-medium mt-1"
                  >
                    <span>✨</span> Add new meal
                  </button>
                </>
              )}
            </div>
          </div>
        </div>
      )}

      {/* New meal with AI — bottom sheet */}
      {showNewMeal && (
        <div className="fixed inset-0 z-50 flex flex-col">
          <div className="flex-1 bg-black/60" onClick={() => setShowNewMeal(false)} />
          <div className="bg-zinc-900 rounded-t-2xl">
            <div className="flex items-center justify-between px-4 pt-4 pb-3 border-b border-zinc-800">
              <div className="flex items-center gap-2">
                <span>✨</span>
                <p className="font-semibold">New Custom Meal</p>
              </div>
              <button onClick={() => setShowNewMeal(false)} className="text-zinc-500 text-2xl leading-none">×</button>
            </div>
            <div className="px-4 py-4 flex flex-col gap-4 pb-10">

              {/* Section selector */}
              <div>
                <p className="text-xs text-zinc-500 mb-2 uppercase tracking-wide">Save to section</p>
                <div className="flex flex-wrap gap-2">
                  {SECTIONS.map(({ name, icon }) => (
                    <button
                      key={name}
                      onClick={() => setNewMealSection(name)}
                      className={`px-3 py-1.5 rounded-lg text-xs font-medium border transition-colors ${
                        newMealSection === name
                          ? 'bg-blue-600 border-blue-500 text-white'
                          : 'bg-zinc-800 border-zinc-700 text-zinc-400'
                      }`}
                    >
                      {icon} {name}
                    </button>
                  ))}
                </div>
              </div>

              {/* Name + estimate button */}
              <div>
                <p className="text-xs text-zinc-500 mb-2 uppercase tracking-wide">Meal name or description</p>
                <div className="flex gap-2">
                  <input
                    className="flex-1 bg-zinc-800 border border-zinc-700 rounded-xl px-3 py-2.5 text-sm text-zinc-200 placeholder-zinc-600 outline-none focus:border-blue-500 transition-colors"
                    placeholder="e.g. 200g chicken breast with rice"
                    value={newMealName}
                    onChange={e => { setNewMealName(e.target.value); setMacrosEstimated(false) }}
                  />
                  <button
                    onClick={estimateMacros}
                    disabled={estimating || !newMealName.trim()}
                    className="px-3 py-2.5 bg-indigo-600 hover:bg-indigo-700 active:bg-indigo-800 disabled:opacity-40 rounded-xl text-sm font-semibold whitespace-nowrap transition-colors"
                  >
                    {estimating ? '...' : '✨ Estimate'}
                  </button>
                </div>
              </div>

              {/* Macro fields */}
              <div>
                <div className="flex items-center justify-between mb-2">
                  <p className="text-xs text-zinc-500 uppercase tracking-wide">Macros</p>
                  {macrosEstimated && (
                    <p className="text-xs text-indigo-400">✨ AI estimated — adjust if needed</p>
                  )}
                </div>
                <div className="grid grid-cols-4 gap-2">
                  {[
                    { key: 'calories',  label: 'kcal' },
                    { key: 'protein_g', label: 'Protein' },
                    { key: 'carbs_g',   label: 'Carbs' },
                    { key: 'fat_g',     label: 'Fat' },
                  ].map(({ key, label }) => (
                    <div key={key}>
                      <p className="text-xs text-zinc-500 mb-1 text-center">{label}</p>
                      <input
                        type="number"
                        inputMode="decimal"
                        className={`w-full bg-zinc-800 border rounded-xl px-2 py-2 text-sm text-zinc-200 outline-none text-center transition-colors ${
                          macrosEstimated ? 'border-indigo-500/50' : 'border-zinc-700 focus:border-blue-500'
                        }`}
                        value={newMealMacros[key]}
                        onChange={e => setNewMealMacros(prev => ({ ...prev, [key]: e.target.value }))}
                        placeholder="0"
                      />
                    </div>
                  ))}
                </div>
              </div>

              <button
                onClick={saveAndLog}
                disabled={saving || !newMealName.trim()}
                className="w-full bg-blue-600 hover:bg-blue-700 active:bg-blue-800 disabled:opacity-40 rounded-xl py-3 font-semibold text-sm transition-colors"
              >
                {saving ? 'Saving...' : 'Save to Library & Log Today'}
              </button>
            </div>
          </div>
        </div>
      )}
    </Layout>
  )
}
