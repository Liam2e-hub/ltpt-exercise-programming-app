import { useState } from 'react'
import { useNavigate, useLocation, Link } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'

const API = import.meta.env.VITE_WORKER_URL

export default function Login() {
  const { login } = useAuth()
  const navigate = useNavigate()
  const location = useLocation()
  const signedUp = location.state?.signedUp
  const [athleteId, setAthleteId] = useState(location.state?.athleteId || '')
  const [pin, setPin] = useState('')
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(false)

  async function handleSubmit(e) {
    e.preventDefault()
    setError('')
    setLoading(true)
    try {
      const res = await fetch(`${API}/auth`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ athleteId: athleteId.trim().toLowerCase(), pin }),
      })
      const data = await res.json()
      if (!res.ok) {
        setError(data.error || 'Invalid credentials')
        return
      }
      login(data.athlete)
      navigate('/dashboard')
    } catch {
      setError('Connection error — try again')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="min-h-screen flex flex-col items-center justify-center px-6">

      {/* Logo */}
      <div className="flex flex-col items-center mb-8">
        <svg width="96" height="24" viewBox="0 0 96 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <rect x="0" y="2" width="11" height="20" rx="3" fill="#3b82f6"/>
          <rect x="11" y="5.5" width="7" height="13" rx="2" fill="#60a5fa"/>
          <rect x="18" y="10.5" width="60" height="3" rx="1" fill="#93c5fd"/>
          <rect x="78" y="5.5" width="7" height="13" rx="2" fill="#60a5fa"/>
          <rect x="85" y="2" width="11" height="20" rx="3" fill="#3b82f6"/>
        </svg>
        <h1 className="text-6xl font-black tracking-tighter mt-4 bg-gradient-to-b from-white to-zinc-400 bg-clip-text text-transparent">
          LTPT
        </h1>
        <p className="text-xs text-zinc-500 tracking-[0.22em] uppercase mt-2">Exercise Programming</p>
      </div>

      {signedUp && (
        <p className="text-green-400 text-sm mb-5 text-center">Account created — log in to continue</p>
      )}
      {!signedUp && <div className="mb-5" />}

      <form onSubmit={handleSubmit} className="w-full max-w-sm flex flex-col gap-4">
        <input
          type="text"
          placeholder="Athlete ID"
          value={athleteId}
          onChange={e => setAthleteId(e.target.value)}
          autoCapitalize="none"
          required
          className="bg-zinc-800 rounded-xl px-4 py-3.5 text-white placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <input
          type="password"
          inputMode="numeric"
          placeholder="PIN"
          value={pin}
          onChange={e => setPin(e.target.value)}
          maxLength={4}
          required
          className="bg-zinc-800 rounded-xl px-4 py-3.5 text-white placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        {error && <p className="text-red-400 text-sm">{error}</p>}
        <button
          type="submit"
          disabled={loading}
          className="bg-blue-600 hover:bg-blue-700 active:bg-blue-800 disabled:opacity-50 rounded-xl py-3.5 font-bold text-sm transition-colors"
        >
          {loading ? 'Logging in…' : 'Log in'}
        </button>
        <p className="text-center text-zinc-500 text-sm">
          New athlete? <Link to="/signup" className="text-blue-400 font-medium">Sign up</Link>
        </p>
      </form>
    </div>
  )
}
