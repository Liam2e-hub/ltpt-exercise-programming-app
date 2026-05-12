import { createContext, useContext, useState, useEffect } from 'react'

const AuthContext = createContext(null)

export function AuthProvider({ children }) {
  const [athlete, setAthlete] = useState(() => {
    try {
      const stored = sessionStorage.getItem('ltpt_athlete')
      return stored ? JSON.parse(stored) : null
    } catch {
      return null
    }
  })

  const [theme, setTheme] = useState(() => localStorage.getItem('ltpt_theme') || 'dark')

  useEffect(() => {
    const root = document.documentElement
    if (theme === 'light') {
      root.classList.add('light')
    } else {
      root.classList.remove('light')
    }
    localStorage.setItem('ltpt_theme', theme)
  }, [theme])

  function login(athleteObj) {
    sessionStorage.setItem('ltpt_athlete', JSON.stringify(athleteObj))
    setAthlete(athleteObj)
  }

  function logout() {
    sessionStorage.removeItem('ltpt_athlete')
    setAthlete(null)
  }

  function updateAthlete(updated) {
    sessionStorage.setItem('ltpt_athlete', JSON.stringify(updated))
    setAthlete(updated)
  }

  function toggleTheme() {
    setTheme(t => t === 'dark' ? 'light' : 'dark')
  }

  return (
    <AuthContext.Provider value={{ athlete, login, logout, updateAthlete, theme, toggleTheme }}>
      {children}
    </AuthContext.Provider>
  )
}

export function useAuth() {
  return useContext(AuthContext)
}
