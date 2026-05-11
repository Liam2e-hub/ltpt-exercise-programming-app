import { useState } from 'react'
import { useNavigate, Link } from 'react-router-dom'

const API = import.meta.env.VITE_WORKER_URL

const TEMPLATES = [
  {
    id: '3 Day',
    label: '3 Day',
    schedule: [
      { day: 'Mon', session: 'Strength Legs' },
      { day: 'Tue', session: 'Rest' },
      { day: 'Wed', session: 'Volume Push' },
      { day: 'Thu', session: 'Rest' },
      { day: 'Fri', session: 'Volume Pull' },
      { day: 'Sat', session: 'Rest' },
      { day: 'Sun', session: 'Rest' },
    ],
  },
  {
    id: '4 Day',
    label: '4 Day',
    schedule: [
      { day: 'Mon', session: 'Strength Legs' },
      { day: 'Tue', session: 'Rest' },
      { day: 'Wed', session: 'Volume Push' },
      { day: 'Thu', session: 'Rest' },
      { day: 'Fri', session: 'Volume Pull' },
      { day: 'Sat', session: 'Rest' },
      { day: 'Sun', session: 'Abs & Arms' },
    ],
  },
  {
    id: '5 Day',
    label: '5 Day',
    schedule: [
      { day: 'Mon', session: 'Strength Legs' },
      { day: 'Tue', session: 'Volume Push' },
      { day: 'Wed', session: 'Volume Pull' },
      { day: 'Thu', session: 'Rest' },
      { day: 'Fri', session: 'Volume Legs' },
      { day: 'Sat', session: 'Rest' },
      { day: 'Sun', session: 'Strength Push' },
    ],
  },
  {
    id: '6 Day',
    label: '6 Day',
    schedule: [
      { day: 'Mon', session: 'Strength Legs' },
      { day: 'Tue', session: 'Strength Push' },
      { day: 'Wed', session: 'Strength Pull' },
      { day: 'Thu', session: 'Rest' },
      { day: 'Fri', session: 'Volume Push' },
      { day: 'Sat', session: 'Volume Pull' },
      { day: 'Sun', session: 'Abs & Arms' },
    ],
  },
]

const GOALS = [
  'Build strength',
  'Build muscle',
  'Lose fat',
  'Improve fitness',
  'Athletic performance',
]

export default function Signup() {
  const navigate = useNavigate()
  const [step, setStep] = useState(1)
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(false)

  const [form, setForm] = useState({
    athleteId: '',
    firstName: '',
    pin: '',
    confirmPin: '',
    age: '',
    heightCm: '',
    weightKg: '',
    email: '',
    mainGoal: '',
    templateId: '',
  })

  function set(field, value) {
    setForm(f => ({ ...f, [field]: value }))
    setError('')
  }

  function validateStep1() {
    if (!form.firstName.trim()) return 'First name is required'
    if (!form.athleteId.trim()) return 'Athlete ID is required'
    if (!/^[a-z0-9_-]+$/.test(form.athleteId)) return 'Athlete ID: lowercase letters, numbers, hyphens only'
    if (form.pin.length !== 4 || !/^\d{4}$/.test(form.pin)) return 'PIN must be exactly 4 digits'
    if (form.pin !== form.confirmPin) return 'PINs do not match'
    return null
  }

  function validateStep2() {
    if (form.age && (isNaN(form.age) || form.age < 10 || form.age > 100)) return 'Enter a valid age'
    if (form.heightCm && (isNaN(form.heightCm) || form.heightCm < 100 || form.heightCm > 250)) return 'Enter a valid height (cm)'
    if (form.weightKg && (isNaN(form.weightKg) || form.weightKg < 30 || form.weightKg > 300)) return 'Enter a valid weight (kg)'
    return null
  }

  function validateStep3() {
    if (!form.templateId) return 'Select a program template'
    return null
  }

  function nextStep() {
    let err = null
    if (step === 1) err = validateStep1()
    if (step === 2) err = validateStep2()
    if (err) { setError(err); return }
    setError('')
    setStep(s => s + 1)
  }

  async function handleSubmit() {
    const err = validateStep3()
    if (err) { setError(err); return }
    setLoading(true)
    setError('')
    try {
      const res = await fetch(`${API}/signup`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          athleteId: form.athleteId.trim().toLowerCase(),
          firstName: form.firstName.trim(),
          pin: form.pin,
          age: form.age ? parseInt(form.age) : null,
          heightCm: form.heightCm ? parseFloat(form.heightCm) : null,
          weightKg: form.weightKg ? parseFloat(form.weightKg) : null,
          email: form.email.trim() || null,
          mainGoal: form.mainGoal || null,
          templateId: form.templateId,
        }),
      })
      const data = await res.json()
      if (!res.ok) {
        setError(data.error || 'Signup failed')
        return
      }
      navigate('/login', { state: { signedUp: true, athleteId: form.athleteId } })
    } catch {
      setError('Connection error — try again')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="min-h-screen flex flex-col px-6 pt-12 pb-8">
      <h1 className="text-2xl font-bold mb-2">Create Account</h1>

      {/* Step indicator */}
      <div className="flex gap-2 mb-8">
        {[1, 2, 3].map(n => (
          <div
            key={n}
            className={`h-1 flex-1 rounded-full transition-colors ${n <= step ? 'bg-blue-500' : 'bg-zinc-700'}`}
          />
        ))}
      </div>

      {step === 1 && <StepAccount form={form} set={set} />}
      {step === 2 && <StepMetrics form={form} set={set} />}
      {step === 3 && <StepTemplate form={form} set={set} />}

      {error && <p className="text-red-400 text-sm mt-4">{error}</p>}

      <div className="flex gap-3 mt-6">
        {step > 1 && (
          <button
            onClick={() => { setStep(s => s - 1); setError('') }}
            className="flex-1 bg-zinc-800 rounded-lg py-3 font-semibold"
          >
            Back
          </button>
        )}
        {step < 3 ? (
          <button
            onClick={nextStep}
            className="flex-1 bg-blue-600 hover:bg-blue-700 rounded-lg py-3 font-semibold"
          >
            Next
          </button>
        ) : (
          <button
            onClick={handleSubmit}
            disabled={loading}
            className="flex-1 bg-blue-600 hover:bg-blue-700 disabled:opacity-50 rounded-lg py-3 font-semibold"
          >
            {loading ? 'Creating account...' : 'Create Account'}
          </button>
        )}
      </div>

      {step === 1 && (
        <p className="text-center text-zinc-500 text-sm mt-4">
          Already have an account? <Link to="/login" className="text-blue-400">Log in</Link>
        </p>
      )}
    </div>
  )
}

function StepAccount({ form, set }) {
  return (
    <div className="flex flex-col gap-4">
      <div>
        <label className="text-xs text-zinc-400 mb-1 block">First name</label>
        <input
          type="text"
          placeholder="Liam"
          value={form.firstName}
          onChange={e => set('firstName', e.target.value)}
          className="w-full bg-zinc-800 rounded-lg px-4 py-3 text-white placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>
      <div>
        <label className="text-xs text-zinc-400 mb-1 block">Athlete ID</label>
        <input
          type="text"
          placeholder="liam"
          value={form.athleteId}
          onChange={e => set('athleteId', e.target.value.toLowerCase().replace(/[^a-z0-9_-]/g, ''))}
          autoCapitalize="none"
          className="w-full bg-zinc-800 rounded-lg px-4 py-3 text-white placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <p className="text-xs text-zinc-500 mt-1">Lowercase letters, numbers, hyphens. Used to log in.</p>
      </div>
      <div>
        <label className="text-xs text-zinc-400 mb-1 block">PIN (4 digits)</label>
        <input
          type="password"
          inputMode="numeric"
          placeholder="----"
          value={form.pin}
          onChange={e => set('pin', e.target.value.replace(/\D/g, '').slice(0, 4))}
          maxLength={4}
          className="w-full bg-zinc-800 rounded-lg px-4 py-3 text-white placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>
      <div>
        <label className="text-xs text-zinc-400 mb-1 block">Confirm PIN</label>
        <input
          type="password"
          inputMode="numeric"
          placeholder="----"
          value={form.confirmPin}
          onChange={e => set('confirmPin', e.target.value.replace(/\D/g, '').slice(0, 4))}
          maxLength={4}
          className="w-full bg-zinc-800 rounded-lg px-4 py-3 text-white placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>
    </div>
  )
}

function StepMetrics({ form, set }) {
  return (
    <div className="flex flex-col gap-4">
      <p className="text-zinc-400 text-sm">Optional — used for your profile. Skip any you prefer not to share.</p>
      <div className="grid grid-cols-2 gap-3">
        <div>
          <label className="text-xs text-zinc-400 mb-1 block">Age</label>
          <input
            type="number"
            inputMode="numeric"
            placeholder="25"
            value={form.age}
            onChange={e => set('age', e.target.value)}
            className="w-full bg-zinc-800 rounded-lg px-4 py-3 text-white placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>
        <div>
          <label className="text-xs text-zinc-400 mb-1 block">Height (cm)</label>
          <input
            type="number"
            inputMode="decimal"
            placeholder="180"
            value={form.heightCm}
            onChange={e => set('heightCm', e.target.value)}
            className="w-full bg-zinc-800 rounded-lg px-4 py-3 text-white placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>
      </div>
      <div>
        <label className="text-xs text-zinc-400 mb-1 block">Weight (kg)</label>
        <input
          type="number"
          inputMode="decimal"
          placeholder="85"
          value={form.weightKg}
          onChange={e => set('weightKg', e.target.value)}
          className="w-full bg-zinc-800 rounded-lg px-4 py-3 text-white placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>
      <div>
        <label className="text-xs text-zinc-400 mb-1 block">Email</label>
        <input
          type="email"
          inputMode="email"
          placeholder="liam@example.com"
          value={form.email}
          onChange={e => set('email', e.target.value)}
          className="w-full bg-zinc-800 rounded-lg px-4 py-3 text-white placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>
      <div>
        <label className="text-xs text-zinc-400 mb-1 block">Main goal</label>
        <div className="flex flex-col gap-2">
          {GOALS.map(g => (
            <button
              key={g}
              type="button"
              onClick={() => set('mainGoal', g)}
              className={`text-left px-4 py-3 rounded-lg text-sm font-medium border transition-colors ${
                form.mainGoal === g
                  ? 'bg-blue-600 border-blue-500 text-white'
                  : 'bg-zinc-800 border-zinc-700 text-zinc-300'
              }`}
            >
              {g}
            </button>
          ))}
        </div>
      </div>
    </div>
  )
}

function StepTemplate({ form, set }) {
  return (
    <div className="flex flex-col gap-4">
      <p className="text-zinc-400 text-sm">Choose your starting program. You can change it anytime in the Schedule manager.</p>
      <div className="flex flex-col gap-3">
        {TEMPLATES.map(t => (
          <button
            key={t.id}
            type="button"
            onClick={() => set('templateId', t.id)}
            className={`text-left px-4 py-3 rounded-lg border transition-colors ${
              form.templateId === t.id
                ? 'bg-blue-600 border-blue-500'
                : 'bg-zinc-800 border-zinc-700'
            }`}
          >
            <p className="font-semibold mb-2">{t.label}</p>
            <div className="grid grid-cols-7 gap-1">
              {t.schedule.map(({ day, session }) => (
                <div key={day} className="text-center">
                  <p className="text-xs text-zinc-400">{day}</p>
                  <p className={`text-xs mt-0.5 font-medium leading-tight ${session === 'Rest' ? 'text-zinc-500' : 'text-white'}`}>
                    {session === 'Rest' ? 'Rest' : session.split(' ').map((w, i) => (
                      <span key={i} className="block">{w}</span>
                    ))}
                  </p>
                </div>
              ))}
            </div>
          </button>
        ))}
      </div>
    </div>
  )
}
