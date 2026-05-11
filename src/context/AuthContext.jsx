import { createContext, useContext, useState } from 'react'

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

  function login(athleteObj) {
    sessionStorage.setItem('ltpt_athlete', JSON.stringify(athleteObj))
    setAthlete(athleteObj)
  }

  function logout() {
    sessionStorage.removeItem('ltpt_athlete')
    setAthlete(null)
  }

  return (
    <AuthContext.Provider value={{ athlete, login, logout }}>
      {children}
    </AuthContext.Provider>
  )
}

export function useAuth() {
  return useContext(AuthContext)
}
