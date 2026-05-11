import { NavLink } from 'react-router-dom'

const links = [
  { to: '/dashboard', label: 'Home' },
  { to: '/workout', label: 'Workout' },
  { to: '/program', label: 'Program' },
  { to: '/schedule', label: 'Schedule' },
  { to: '/progress', label: 'Progress' },
  { to: '/nutrition', label: 'Nutrition' },
]

export default function Nav() {
  return (
    <nav className="fixed bottom-0 left-0 right-0 bg-zinc-900 border-t border-zinc-800 flex">
      {links.map(({ to, label }) => (
        <NavLink
          key={to}
          to={to}
          className={({ isActive }) =>
            `flex-1 py-3 text-center text-xs font-medium ${
              isActive ? 'text-blue-400' : 'text-zinc-500'
            }`
          }
        >
          {label}
        </NavLink>
      ))}
    </nav>
  )
}
