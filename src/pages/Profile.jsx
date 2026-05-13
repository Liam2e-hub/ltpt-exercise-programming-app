import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import Layout from '../components/Layout'

const API = import.meta.env.VITE_WORKER_URL

export default function Profile() {
  const { athlete, logout, updateAthlete, theme, toggleTheme } = useAuth()
  const navigate = useNavigate()

  const [firstName, setFirstName] = useState(athlete.first_name || '')
  const [age, setAge] = useState(athlete.age || '')
  const [heightCm, setHeightCm] = useState(athlete.height_cm || '')
  const [weightKg, setWeightKg] = useState(athlete.weight_kg || '')
  const [email, setEmail] = useState(athlete.email || '')
  const [mainGoal, setMainGoal] = useState(athlete.main_goal || '')
  const [saving, setSaving] = useState(false)
  const [saveMsg, setSaveMsg] = useState('')
  const [error, setError] = useState('')
  const [showInstallModal, setShowInstallModal] = useState(false)
  const [deferredPrompt, setDeferredPrompt] = useState(null)

  const isIOS = /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream
  const isInstalled = window.matchMedia('(display-mode: standalone)').matches || navigator.standalone === true

  useEffect(() => {
    const handler = e => { e.preventDefault(); setDeferredPrompt(e) }
    window.addEventListener('beforeinstallprompt', handler)
    return () => window.removeEventListener('beforeinstallprompt', handler)
  }, [])

  async function handleAndroidInstall() {
    if (!deferredPrompt) return
    deferredPrompt.prompt()
    await deferredPrompt.userChoice
    setDeferredPrompt(null)
  }

  async function handleSave() {
    if (!firstName.trim()) { setError('First name is required'); return }
    setSaving(true)
    setError('')
    setSaveMsg('')
    try {
      const res = await fetch(`${API}/athlete`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          athleteId: athlete.id,
          firstName: firstName.trim(),
          age: age !== '' ? parseInt(age) : null,
          heightCm: heightCm !== '' ? parseFloat(heightCm) : null,
          weightKg: weightKg !== '' ? parseFloat(weightKg) : null,
          email: email.trim() || null,
          mainGoal: mainGoal.trim() || null,
        }),
      })
      const data = await res.json()
      if (!res.ok) { setError(data.error || 'Save failed'); return }
      updateAthlete(data.athlete)
      setSaveMsg('Saved')
      setTimeout(() => setSaveMsg(''), 2000)
    } catch {
      setError('Connection error — try again')
    } finally {
      setSaving(false)
    }
  }

  const inputClass = 'w-full bg-zinc-800 rounded-xl px-4 py-3 text-sm text-white placeholder-zinc-500 focus:outline-none focus:ring-1 focus:ring-blue-500'
  const labelClass = 'block text-xs text-zinc-500 mb-1.5'

  return (
    <Layout>
      <div className="px-4 pt-4 pb-6">

        {/* Header */}
        <div className="flex items-center gap-4 mb-6">
          <div className="w-16 h-16 rounded-full bg-gradient-to-br from-blue-500 to-indigo-600 flex items-center justify-center flex-shrink-0 shadow-lg">
            <span className="text-2xl font-black text-white">{athlete.first_name?.[0]?.toUpperCase()}</span>
          </div>
          <div>
            <h1 className="text-xl font-bold">{athlete.first_name}</h1>
            <p className="text-sm text-zinc-500">@{athlete.id}</p>
          </div>
        </div>

        {/* Details form */}
        <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-4 mb-3">
          <p className="text-xs text-zinc-500 uppercase tracking-wide mb-4">Athlete Details</p>
          <div className="flex flex-col gap-3">
            <div>
              <label className={labelClass}>First Name</label>
              <input
                type="text"
                value={firstName}
                onChange={e => setFirstName(e.target.value)}
                placeholder="First name"
                className={inputClass}
              />
            </div>
            <div className="grid grid-cols-2 gap-3">
              <div>
                <label className={labelClass}>Age</label>
                <input
                  type="number"
                  inputMode="numeric"
                  value={age}
                  onChange={e => setAge(e.target.value)}
                  placeholder="—"
                  className={inputClass}
                />
              </div>
              <div>
                <label className={labelClass}>Height (cm)</label>
                <input
                  type="number"
                  inputMode="decimal"
                  value={heightCm}
                  onChange={e => setHeightCm(e.target.value)}
                  placeholder="—"
                  className={inputClass}
                />
              </div>
            </div>
            <div>
              <label className={labelClass}>Weight (kg)</label>
              <input
                type="number"
                inputMode="decimal"
                value={weightKg}
                onChange={e => setWeightKg(e.target.value)}
                placeholder="—"
                className={inputClass}
              />
            </div>
            <div>
              <label className={labelClass}>Email</label>
              <input
                type="email"
                value={email}
                onChange={e => setEmail(e.target.value)}
                placeholder="—"
                className={inputClass}
              />
            </div>
            <div>
              <label className={labelClass}>Main Goal</label>
              <input
                type="text"
                value={mainGoal}
                onChange={e => setMainGoal(e.target.value)}
                placeholder="e.g. Build strength"
                className={inputClass}
              />
            </div>
          </div>
          {error && <p className="text-red-400 text-xs mt-3">{error}</p>}
          <button
            onClick={handleSave}
            disabled={saving}
            className="w-full mt-4 bg-blue-600 hover:bg-blue-700 active:bg-blue-800 disabled:opacity-50 rounded-xl py-3 font-semibold text-sm transition-colors"
          >
            {saving ? 'Saving…' : saveMsg || 'Save changes'}
          </button>
        </div>

        {/* App settings */}
        <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-4 mb-3">
          <p className="text-xs text-zinc-500 uppercase tracking-wide mb-4">App Settings</p>
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium">Theme</p>
              <p className="text-xs text-zinc-500 mt-0.5">{theme === 'dark' ? 'Dark mode' : 'Light mode'}</p>
            </div>
            <button
              onClick={toggleTheme}
              className={`relative w-12 h-6 rounded-full transition-colors ${theme === 'light' ? 'bg-blue-500' : 'bg-zinc-700'}`}
            >
              <span
                className={`absolute top-0.5 left-0.5 w-5 h-5 bg-white rounded-full shadow transition-transform ${theme === 'light' ? 'translate-x-6' : 'translate-x-0'}`}
              />
            </button>
          </div>

          <div className="flex items-center justify-between mt-4 pt-4 border-t border-zinc-800">
            <div>
              <p className="text-sm font-medium">Add to Home Screen</p>
              <p className="text-xs text-zinc-500 mt-0.5">
                {isInstalled ? 'Running as installed app' : 'Install as an app on your phone'}
              </p>
            </div>
            {isInstalled ? (
              <span className="text-xs text-green-400 font-medium">Installed ✓</span>
            ) : isIOS ? (
              <button
                onClick={() => setShowInstallModal(true)}
                className="text-sm font-semibold text-blue-400 active:opacity-60 transition-opacity"
              >
                How →
              </button>
            ) : deferredPrompt ? (
              <button
                onClick={handleAndroidInstall}
                className="text-sm font-semibold text-blue-400 active:opacity-60 transition-opacity"
              >
                Install →
              </button>
            ) : null}
          </div>
        </div>

        {/* iOS install instructions modal */}
        {showInstallModal && (
          <div
            className="fixed inset-0 z-50 flex items-end bg-black/60"
            onClick={() => setShowInstallModal(false)}
          >
            <div
              className="w-full bg-zinc-900 border-t border-zinc-800 rounded-t-2xl p-6 pb-10"
              onClick={e => e.stopPropagation()}
            >
              <div className="flex items-center justify-between mb-5">
                <h2 className="text-base font-bold">Add to Home Screen</h2>
                <button
                  onClick={() => setShowInstallModal(false)}
                  className="text-sm text-zinc-400 active:opacity-60"
                >
                  Done
                </button>
              </div>
              <p className="text-xs text-zinc-500 mb-5">
                Open this page in <span className="text-white font-medium">Safari</span> to install the app.
              </p>
              {[
                { n: 1, text: 'Tap the Share button at the bottom of Safari (the square with the arrow pointing up)' },
                { n: 2, text: 'Scroll down and tap Add to Home Screen' },
                { n: 3, text: 'Tap Add in the top right corner' },
              ].map(({ n, text }) => (
                <div key={n} className="flex items-start gap-3 mb-4">
                  <span className="w-6 h-6 rounded-full bg-blue-600 text-white text-xs font-bold flex items-center justify-center flex-shrink-0 mt-0.5">
                    {n}
                  </span>
                  <p className="text-sm text-zinc-300 leading-snug">{text}</p>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Program & Schedule */}
        <div className="bg-zinc-900 border border-zinc-800 rounded-2xl p-4 mb-3">
          <p className="text-xs text-zinc-500 uppercase tracking-wide mb-3">Program</p>
          <div className="flex flex-col gap-2">
            <button
              onClick={() => navigate('/program')}
              className="flex items-center justify-between py-2.5 px-3 rounded-xl bg-zinc-800 active:opacity-70 transition-opacity"
            >
              <span className="text-sm font-medium">Exercise Program</span>
              <span className="text-zinc-500 text-xs">→</span>
            </button>
            <button
              onClick={() => navigate('/schedule')}
              className="flex items-center justify-between py-2.5 px-3 rounded-xl bg-zinc-800 active:opacity-70 transition-opacity"
            >
              <span className="text-sm font-medium">Weekly Schedule</span>
              <span className="text-zinc-500 text-xs">→</span>
            </button>
          </div>
        </div>

        {/* Logout */}
        <button
          onClick={logout}
          className="w-full bg-zinc-900 border border-zinc-800 rounded-2xl py-3.5 text-sm font-medium text-red-400 active:opacity-70 transition-opacity"
        >
          Log out
        </button>
      </div>
    </Layout>
  )
}
