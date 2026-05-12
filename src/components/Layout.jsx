import { useNavigate } from 'react-router-dom'
import Nav from './Nav'

export default function Layout({ children }) {
  const navigate = useNavigate()

  return (
    <div className="min-h-screen flex flex-col pb-24">
      {/* Compact brand bar — taps to Home */}
      <button
        onClick={() => navigate('/dashboard')}
        className="flex items-center gap-2.5 px-4 pt-5 pb-1 active:opacity-70 transition-opacity w-full"
      >
        <svg width="36" height="14" viewBox="0 0 36 14" fill="none" xmlns="http://www.w3.org/2000/svg">
          <rect x="0" y="1" width="5" height="12" rx="1.5" fill="#3b82f6"/>
          <rect x="5" y="3" width="3" height="8" rx="1" fill="#60a5fa"/>
          <rect x="8" y="6" width="20" height="2" rx="0.5" fill="#93c5fd"/>
          <rect x="28" y="3" width="3" height="8" rx="1" fill="#60a5fa"/>
          <rect x="31" y="1" width="5" height="12" rx="1.5" fill="#3b82f6"/>
        </svg>
        <div className="flex items-baseline gap-2">
          <span className="text-sm font-black tracking-tight text-white">LTPT</span>
          <span className="text-xs text-zinc-500 tracking-wide">Exercise Programming</span>
        </div>
      </button>
      {children}
      <Nav />
    </div>
  )
}
