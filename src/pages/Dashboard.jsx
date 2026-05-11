// Phase 3 — profile + today session + nav
import { useAuth } from '../context/AuthContext'
import Nav from '../components/Nav'

export default function Dashboard() {
  const { athlete } = useAuth()

  return (
    <div className="min-h-screen flex flex-col pb-20">
      <div className="px-4 pt-8">
        <h1 className="text-xl font-bold">Hey, {athlete?.first_name}</h1>
        <p className="text-zinc-400 text-sm mt-1">Dashboard — Phase 3</p>
      </div>
      <Nav />
    </div>
  )
}
