// Phase 2 — multi-step signup wizard (account → metrics → template selection)
import { Link } from 'react-router-dom'

export default function Signup() {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center px-6">
      <h1 className="text-2xl font-bold mb-4">Create Account</h1>
      <p className="text-zinc-400 text-sm mb-8">Signup wizard — Phase 2</p>
      <Link to="/login" className="text-blue-400 text-sm">Back to login</Link>
    </div>
  )
}
