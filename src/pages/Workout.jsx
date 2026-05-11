// Phase 3 — exercise cards, per-exercise log + update, previous performance panel
import Nav from '../components/Nav'

export default function Workout() {
  return (
    <div className="min-h-screen flex flex-col pb-20">
      <div className="px-4 pt-8">
        <h1 className="text-xl font-bold">Today's Workout</h1>
        <p className="text-zinc-400 text-sm mt-1">Phase 3</p>
      </div>
      <Nav />
    </div>
  )
}
