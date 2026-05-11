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
      <h1 className="text-2xl font-bold mb-2">LTPT</h1>
      {signedUp && (
        <p className="text-green-400 text-sm mb-6 text-center">Account created — log in to continue</p>
      )}
      {!signedUp && <div className="mb-6" />}
      <form onSubmit={handleSubmit} className="w-full max-w-sm flex flex-col gap-4">
        <input
          type="text"
          placeholder="Athlete ID"
          value={athleteId}
          onChange={e => setAthleteId(e.target.value)}
          autoCapitalize="none"
          required
          className="bg-zinc-800 rounded-lg px-4 py-3 text-white placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <input
          type="password"
          inputMode="numeric"
          placeholder="PIN"
          value={pin}
          onChange={e => setPin(e.target.value)}
          maxLength={4}
          required
          className="bg-zinc-800 rounded-lg px-4 py-3 text-white placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        {error && <p className="text-red-400 text-sm">{error}</p>}
        <button
          type="submit"
          disabled={loading}
          className="bg-blue-600 hover:bg-blue-700 disabled:opacity-50 rounded-lg py-3 font-semibold"
        >
          {loading ? 'Logging in…' : 'Log in'}
        </button>
        <p className="text-center text-zinc-500 text-sm">
          New athlete? <Link to="/signup" className="text-blue-400">Sign up</Link>
        </p>
      </form>
    </div>
  )
}
