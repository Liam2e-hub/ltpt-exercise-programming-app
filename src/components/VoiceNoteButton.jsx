import { useState, useRef, useCallback } from 'react'

const LTABLE_WORKER = 'https://ltable-worker.me-7b3.workers.dev'
const LTABLE_PROJECT_ID = '2a6a2d18-89fd-4b17-8d41-1d93443487a9'

const STATE = { IDLE: 'idle', RECORDING: 'recording', PROCESSING: 'processing', SENT: 'sent' }

export default function VoiceNoteButton() {
  const [state, setState] = useState(STATE.IDLE)
  const [toast, setToast] = useState(null)
  const [textMode, setTextMode] = useState(false)
  const [textNote, setTextNote] = useState('')
  const mediaRecorder = useRef(null)
  const chunks = useRef([])

  const showToast = (message, type = 'success') => {
    setToast({ message, type })
    setTimeout(() => setToast(null), 3000)
  }

  const startRecording = useCallback(async () => {
    if (!navigator.mediaDevices?.getUserMedia) {
      setTextMode(true)
      return
    }
    try {
      const stream = await navigator.mediaDevices.getUserMedia({ audio: true })
      const recorder = new MediaRecorder(stream)
      chunks.current = []
      recorder.ondataavailable = (e) => { if (e.data.size > 0) chunks.current.push(e.data) }
      recorder.onstop = async () => {
        stream.getTracks().forEach((t) => t.stop())
        setState(STATE.PROCESSING)
        const blob = new Blob(chunks.current, { type: 'audio/webm' })
        await submitAudio(blob)
      }
      recorder.start()
      mediaRecorder.current = recorder
      setState(STATE.RECORDING)
    } catch {
      setTextMode(true)
    }
  }, [])

  const stopRecording = useCallback(() => {
    mediaRecorder.current?.stop()
  }, [])

  const submitAudio = async (blob) => {
    try {
      const reader = new FileReader()
      reader.onload = async () => {
        const base64 = reader.result.split(',')[1]
        await postNote({ audio_base64: base64, page_context: window.location.pathname, user_agent: navigator.userAgent, project_id: LTABLE_PROJECT_ID })
      }
      reader.readAsDataURL(blob)
    } catch {
      setState(STATE.IDLE)
      showToast('Failed to send voice note', 'error')
    }
  }

  const submitText = async () => {
    if (!textNote.trim()) return
    setState(STATE.PROCESSING)
    await postNote({ transcription: textNote.trim(), page_context: window.location.pathname, user_agent: navigator.userAgent, project_id: LTABLE_PROJECT_ID })
    setTextNote('')
    setTextMode(false)
  }

  const postNote = async (payload) => {
    try {
      const apiKey = import.meta.env.VITE_LTABLE_API_KEY
      const res = await fetch(`${LTABLE_WORKER}/voice`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          ...(apiKey ? { Authorization: `ApiKey ${apiKey}` } : {}),
        },
        body: JSON.stringify(payload),
      })
      if (!res.ok) throw new Error('Server error')
      setState(STATE.SENT)
      showToast('Voice note sent')
      setTimeout(() => setState(STATE.IDLE), 2000)
    } catch {
      setState(STATE.IDLE)
      showToast('Failed to send voice note', 'error')
    }
  }

  const handleClick = () => {
    if (state === STATE.IDLE) startRecording()
    else if (state === STATE.RECORDING) stopRecording()
  }

  const icons = {
    [STATE.IDLE]: (
      <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
        <path d="M12 1a4 4 0 0 1 4 4v6a4 4 0 0 1-8 0V5a4 4 0 0 1 4-4zm-1 16.93A8.001 8.001 0 0 1 4 10H2a10 10 0 0 0 9 9.93V22h2v-2.07A10 10 0 0 0 22 10h-2a8 8 0 0 1-7 7.93z" />
      </svg>
    ),
    [STATE.RECORDING]: (
      <span className="w-3 h-3 rounded-full bg-red-400 animate-pulse" />
    ),
    [STATE.PROCESSING]: (
      <svg className="w-5 h-5 animate-spin" fill="none" viewBox="0 0 24 24">
        <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
        <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v8H4z" />
      </svg>
    ),
    [STATE.SENT]: (
      <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
      </svg>
    ),
  }

  const buttonColors = {
    [STATE.IDLE]: 'bg-indigo-600 hover:bg-indigo-500 active:bg-indigo-700',
    [STATE.RECORDING]: 'bg-red-600 hover:bg-red-500 active:bg-red-700',
    [STATE.PROCESSING]: 'bg-zinc-700 cursor-not-allowed',
    [STATE.SENT]: 'bg-green-700',
  }

  return (
    <>
      {/* Toast */}
      {toast && (
        <div className={`fixed top-4 left-1/2 -translate-x-1/2 z-50 px-4 py-2 rounded-xl text-sm font-medium shadow-lg transition-all ${
          toast.type === 'error' ? 'bg-red-900 text-red-200' : 'bg-zinc-800 text-zinc-100'
        }`}>
          {toast.message}
        </div>
      )}

      {/* Text fallback panel — sits above the nav + button */}
      {textMode && (
        <div className="fixed bottom-36 right-4 z-40 bg-zinc-900 border border-zinc-700 rounded-2xl p-4 shadow-xl w-72">
          <p className="text-xs text-zinc-400 mb-2">Type your note</p>
          <textarea
            className="w-full bg-zinc-800 text-zinc-100 text-sm rounded-xl p-2.5 resize-none border border-zinc-700 focus:outline-none focus:ring-1 focus:ring-indigo-500"
            rows={3}
            value={textNote}
            onChange={(e) => setTextNote(e.target.value)}
            placeholder="Leave a note..."
            autoFocus
          />
          <div className="flex gap-2 mt-2">
            <button
              onClick={submitText}
              disabled={state === STATE.PROCESSING}
              className="flex-1 px-3 py-1.5 bg-indigo-600 hover:bg-indigo-500 text-white text-xs rounded-lg transition-colors disabled:opacity-50"
            >
              Send
            </button>
            <button
              onClick={() => { setTextMode(false); setTextNote('') }}
              className="px-3 py-1.5 bg-zinc-700 hover:bg-zinc-600 text-zinc-300 text-xs rounded-lg transition-colors"
            >
              Cancel
            </button>
          </div>
        </div>
      )}

      {/* Floating button — bottom-20 clears the fixed Nav */}
      <div className="fixed bottom-20 right-4 z-40 flex flex-col items-end gap-2">
        {state === STATE.IDLE && !textMode && (
          <button
            onClick={() => setTextMode(true)}
            className="text-xs text-zinc-500 hover:text-zinc-300 transition-colors"
          >
            type instead
          </button>
        )}
        <button
          onClick={handleClick}
          disabled={state === STATE.PROCESSING || state === STATE.SENT}
          className={`w-12 h-12 rounded-full flex items-center justify-center text-white shadow-lg transition-colors ${buttonColors[state]}`}
          title={state === STATE.IDLE ? 'Record voice note' : state === STATE.RECORDING ? 'Stop recording' : ''}
        >
          {icons[state]}
        </button>
      </div>
    </>
  )
}
