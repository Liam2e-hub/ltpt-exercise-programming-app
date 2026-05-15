import { useState, useEffect, useCallback, useRef, lazy, Suspense } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import WorkoutOverlayCard from '../components/gym/WorkoutOverlayCard.jsx'
import SessionSummary from '../components/gym/SessionSummary.jsx'
import Nav from '../components/Nav'
import VoiceNoteButton from '../components/VoiceNoteButton'

const GymJourneyScene = lazy(() =>
  import('../components/gym/GymJourneyScene.jsx').then(m => ({ default: m.GymJourneyScene }))
)

const API = import.meta.env.VITE_WORKER_URL

export default function Workout() {
  const { athlete } = useAuth()
  const navigate = useNavigate()
  const today = new Date().toISOString().split('T')[0]

  // ─── Data loading ────────────────────────────────────────────────────────
  const [data, setData] = useState(null)
  const [loading, setLoading] = useState(true)
  const [fetchError, setFetchError] = useState('')

  useEffect(() => {
    fetch(`${API}/workout?athleteId=${athlete.id}&date=${today}`)
      .then(r => r.json())
      .then(d => setData(d))
      .catch(() => setFetchError('Failed to load workout — check your connection'))
      .finally(() => setLoading(false))
  }, [])

  // ─── Session state ────────────────────────────────────────────────────────
  const [currentIndex, setCurrentIndex] = useState(0)
  const [todayLogs, setTodayLogs] = useState({})  // { [exerciseId]: { logId, sets, notes } }
  const [showSummary, setShowSummary] = useState(false)

  // Initialise todayLogs from fetched data once available
  useEffect(() => {
    if (data?.todayLogs) setTodayLogs(data.todayLogs)
  }, [data])

  // ─── Animation control ───────────────────────────────────────────────────
  // animateTo.trigger increments each time we want to start a walk animation.
  // index is the destination. GymJourneyScene watches for trigger changes.
  const [animateTo, setAnimateTo] = useState(null)
  const [isAnimating, setIsAnimating] = useState(false)
  const triggerRef = useRef(0)

  const handleAnimationDone = useCallback(() => {
    setIsAnimating(false)
  }, [])

  // ─── Card slide state ────────────────────────────────────────────────────
  const [slideDirection, setSlideDirection] = useState(null)

  function slideToIndex(newIndex, direction) {
    if (isAnimating) return
    const outDir = direction === 'forward' ? 'out-left' : 'out-right'
    const inDir  = direction === 'forward' ? 'in-right' : 'in-left'

    setSlideDirection(outDir)
    setTimeout(() => {
      setCurrentIndex(newIndex)
      setSlideDirection(inDir)
      setTimeout(() => setSlideDirection(null), 300)
    }, 220)
  }

  // ─── Navigation (arrow buttons — no log required) ───────────────────────
  function handleNavigate(dir) {
    if (isAnimating) return
    const exercises = data?.exercises ?? []
    if (dir === 'prev' && currentIndex > 0) {
      const next = currentIndex - 1
      setIsAnimating(true)
      setAnimateTo({ index: next, trigger: ++triggerRef.current })
      slideToIndex(next, 'backward')
    } else if (dir === 'next' && currentIndex < exercises.length - 1) {
      const next = currentIndex + 1
      setIsAnimating(true)
      setAnimateTo({ index: next, trigger: ++triggerRef.current })
      slideToIndex(next, 'forward')
    }
  }

  // ─── Log handler — saves to DB and triggers walk animation ──────────────
  function handleLog(exerciseId, logId, sets, notes) {
    // Update local logs state
    setTodayLogs(prev => ({
      ...prev,
      [exerciseId]: { logId, sets, notes },
    }))

    const exercises = data?.exercises ?? []
    const isLast = currentIndex >= exercises.length - 1

    if (isLast) {
      // Final exercise — trigger completion animation then show summary
      setIsAnimating(true)
      setAnimateTo({ index: currentIndex, trigger: ++triggerRef.current })
      // Summary shown after animation completes (via onAnimationDone callback)
      // We store a flag so we know to show summary when animation ends
      pendingSummaryRef.current = true
    } else {
      // Walk to next station
      const next = currentIndex + 1
      setIsAnimating(true)
      setAnimateTo({ index: next, trigger: ++triggerRef.current })
      slideToIndex(next, 'forward')
    }
  }

  const pendingSummaryRef = useRef(false)

  const handleAnimationDoneWithSummary = useCallback(() => {
    setIsAnimating(false)
    if (pendingSummaryRef.current) {
      pendingSummaryRef.current = false
      setShowSummary(true)
    }
  }, [])

  // ─── Loading / error states ──────────────────────────────────────────────
  if (loading) {
    return (
      <div className="fixed inset-0 bg-zinc-950 flex items-center justify-center">
        <p className="text-zinc-500 text-sm">Loading workout…</p>
      </div>
    )
  }

  if (fetchError) {
    return (
      <div className="fixed inset-0 bg-zinc-950 flex flex-col items-center justify-center gap-3 px-6">
        <p className="text-red-400 text-sm text-center">{fetchError}</p>
        <button onClick={() => window.location.reload()} className="text-sm text-blue-400">Retry</button>
      </div>
    )
  }

  // ─── Rest day ────────────────────────────────────────────────────────────
  if (data?.isRestDay) {
    return (
      <div className="fixed inset-0 bg-zinc-950 flex flex-col">
        <button
          onClick={() => navigate('/dashboard')}
          className="flex items-center gap-2.5 px-4 pt-5 pb-1 active:opacity-70"
        >
          <svg width="36" height="14" viewBox="0 0 36 14" fill="none">
            <rect x="0" y="1" width="5" height="12" rx="1.5" fill="#3b82f6"/>
            <rect x="5" y="3" width="3" height="8" rx="1" fill="#60a5fa"/>
            <rect x="8" y="6" width="20" height="2" rx="0.5" fill="#93c5fd"/>
            <rect x="28" y="3" width="3" height="8" rx="1" fill="#60a5fa"/>
            <rect x="31" y="1" width="5" height="12" rx="1.5" fill="#3b82f6"/>
          </svg>
          <span className="text-sm font-black tracking-tight text-white">LTPT</span>
        </button>
        <div className="flex-1 flex flex-col items-center justify-center text-center px-4">
          <p className="text-5xl mb-4">🛌</p>
          <p className="text-lg font-semibold text-white">Rest Day</p>
          <p className="text-zinc-500 text-sm mt-1">Recovery is part of the program.</p>
        </div>
        <VoiceNoteButton />
        <Nav />
      </div>
    )
  }

  // ─── No exercises ────────────────────────────────────────────────────────
  if (!data?.exercises?.length) {
    return (
      <div className="fixed inset-0 bg-zinc-950 flex flex-col pb-24">
        <div className="flex-1 flex flex-col items-center justify-center text-center px-4">
          <p className="text-zinc-500 text-sm">No exercises in this session.</p>
          <p className="text-zinc-600 text-xs mt-1">Add some via Profile → Exercise Program.</p>
        </div>
        <VoiceNoteButton />
        <Nav />
      </div>
    )
  }

  const exercises = data.exercises
  const activeExercise = exercises[currentIndex]
  const existingLog = todayLogs[activeExercise?.exerciseId] ?? null

  // ─── Main gym view ───────────────────────────────────────────────────────
  return (
    <div className="fixed inset-0 bg-zinc-950 flex flex-col overflow-hidden">

      {/* 3D scene — fills all available space above the overlay card */}
      <div className="flex-1 relative min-h-0">
        <Suspense fallback={<div className="w-full h-full bg-zinc-900" />}>
          <GymJourneyScene
            exercises={exercises}
            currentIndex={currentIndex}
            animateTo={animateTo}
            onAnimationDone={handleAnimationDoneWithSummary}
          />
        </Suspense>

        {/* Session summary overlay */}
        {showSummary && (
          <SessionSummary
            exercises={exercises}
            todayLogs={todayLogs}
            session={data.session}
          />
        )}
      </div>

      {/* Exercise card overlay — anchored to bottom, above Nav */}
      {!showSummary && activeExercise && (
        <div className="flex-shrink-0 overflow-hidden" style={{ paddingBottom: 'env(safe-area-inset-bottom)' }}>
          <WorkoutOverlayCard
            key={activeExercise.exerciseId}
            exercise={activeExercise}
            athleteId={athlete.id}
            sessionDate={today}
            session={data.session}
            existingLog={existingLog}
            isAnimating={isAnimating}
            slideDirection={slideDirection}
            onLog={handleLog}
            onNavigate={handleNavigate}
            stationIndex={currentIndex}
            totalStations={exercises.length}
          />
        </div>
      )}

      <VoiceNoteButton />
      <Nav />
    </div>
  )
}
