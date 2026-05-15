import { Canvas, useFrame, useThree } from '@react-three/fiber'
import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import * as THREE from 'three'

import { buildStations, DEFAULT_THEME, DEFAULT_AVATAR } from '../../data/gymStations.js'
import { Environment } from './Environment.jsx'
import { Stations } from './Stations.jsx'
import { Avatar } from './Avatar.jsx'

const WALK_DURATION = 1.55
const CELEBRATION_DURATION = 1.1
const FINAL_CELEBRATION_DURATION = 2.2
const AVATAR_Y = 0.0

const easeInOutCubic = (t) =>
  t < 0.5 ? 4 * t * t * t : 1 - Math.pow(-2 * t + 2, 3) / 2

const clamp01 = (v) => Math.min(1, Math.max(0, v))

function FollowCamera({ targetPosition, isMobile }) {
  const { camera } = useThree()
  const target = useRef(new THREE.Vector3())
  const lookTarget = useRef(new THREE.Vector3())
  const desiredPos = useRef(new THREE.Vector3())

  const offset = useMemo(() => {
    return isMobile
      ? new THREE.Vector3(3.6, 3.1, 4.4)
      : new THREE.Vector3(4.8, 3.6, 5.6)
  }, [isMobile])

  useEffect(() => {
    camera.fov = isMobile ? 38 : 34
    camera.near = 0.1
    camera.far = 100
    camera.position.copy(new THREE.Vector3(...targetPosition).add(offset))
    camera.lookAt(...targetPosition)
    camera.updateProjectionMatrix()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [camera, isMobile])

  useFrame((_, delta) => {
    target.current.set(...targetPosition)
    desiredPos.current.copy(target.current).add(offset)
    const k = Math.min(1, delta * 3.0)
    camera.position.lerp(desiredPos.current, k)
    lookTarget.current.set(targetPosition[0], targetPosition[1] + 0.9, targetPosition[2])
    camera.lookAt(lookTarget.current)
  })

  return null
}

function SceneContents({
  theme,
  avatarConfig,
  stations,
  animationState,
  visualPosition,
  avatarHeading,
  moveProgress,
  activeStationIndex,
  isMobile,
}) {
  const activeStation = stations[activeStationIndex] ?? stations[0]
  return (
    <>
      <color attach="background" args={[theme.bg]} />
      <fog attach="fog" args={[theme.bg, 10, 24]} />
      <FollowCamera
        targetPosition={[visualPosition.x, visualPosition.y, visualPosition.z]}
        isMobile={isMobile}
      />
      <Environment theme={theme} activeStationPosition={activeStation.position} />
      <Stations stations={stations} />
      <Avatar
        position={visualPosition}
        heading={avatarHeading}
        animationState={animationState}
        moveProgress={moveProgress}
        config={avatarConfig}
      />
    </>
  )
}

// ─── Main exported component ────────────────────────────────────────────────
// Props:
//   exercises        — array from GET /workout (exerciseId, exerciseName, ...)
//   currentIndex     — controlled index of the active station
//   animateTo        — { index, trigger } — increment trigger to start walk animation
//   onAnimationDone  — called when walk+settle completes
//   theme            — optional theme object
//   avatarConfig     — optional avatar colours

export function GymJourneyScene({
  exercises,
  currentIndex,
  animateTo,
  onAnimationDone,
  theme = DEFAULT_THEME,
  avatarConfig = DEFAULT_AVATAR,
}) {
  const stations = useMemo(() => buildStations(exercises), [exercises])

  const safeIndex = Math.min(stations.length - 1, Math.max(0, currentIndex))

  const [animationState, setAnimationState] = useState('idle')
  const [visualPosition, setVisualPosition] = useState(() => {
    const [x, , z] = stations[safeIndex].position
    return new THREE.Vector3(x, AVATAR_Y, z)
  })
  const [avatarHeading, setAvatarHeading] = useState(stations[safeIndex].facing ?? 0)
  const [moveProgress, setMoveProgress] = useState(0)
  const animationFrameRef = useRef(null)
  const visualIndexRef = useRef(safeIndex)
  const prevAnimateTo = useRef(animateTo)

  const [isMobile, setIsMobile] = useState(() =>
    typeof window !== 'undefined' ? window.innerWidth < 760 : true,
  )
  useEffect(() => {
    const onResize = () => setIsMobile(window.innerWidth < 760)
    window.addEventListener('resize', onResize)
    return () => window.removeEventListener('resize', onResize)
  }, [])

  useEffect(() => {
    return () => {
      if (animationFrameRef.current) cancelAnimationFrame(animationFrameRef.current)
    }
  }, [])

  const runTimedAnimation = useCallback((duration, onTick) => {
    return new Promise((resolve) => {
      const startedAt = performance.now()
      const tick = (now) => {
        const progress = clamp01((now - startedAt) / (duration * 1000))
        onTick(easeInOutCubic(progress), progress)
        if (progress < 1) {
          animationFrameRef.current = requestAnimationFrame(tick)
          return
        }
        resolve()
      }
      animationFrameRef.current = requestAnimationFrame(tick)
    })
  }, [])

  // Snap position immediately (no animation) when index changes without a trigger
  useEffect(() => {
    if (animationState !== 'idle') return
    const idx = Math.min(stations.length - 1, Math.max(0, currentIndex))
    const [x, , z] = stations[idx].position
    visualIndexRef.current = idx
    setVisualPosition(new THREE.Vector3(x, AVATAR_Y, z))
    setAvatarHeading(stations[idx].facing ?? 0)
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [currentIndex])

  // Triggered walk animation — fires when animateTo.trigger increments
  useEffect(() => {
    if (!animateTo) return
    if (prevAnimateTo.current?.trigger === animateTo.trigger) return
    prevAnimateTo.current = animateTo

    const toIndex = Math.min(stations.length - 1, Math.max(0, animateTo.index))
    const fromIndex = visualIndexRef.current

    if (fromIndex === toIndex) {
      onAnimationDone?.()
      return
    }

    const isLastStation = animateTo.index >= stations.length - 1
    const runAnimation = async () => {
      // Celebrate at current station after logging
      setAnimationState('celebrating')
      setMoveProgress(0)
      await runTimedAnimation(isLastStation ? FINAL_CELEBRATION_DURATION : CELEBRATION_DURATION, () => {})

      if (isLastStation) {
        setAnimationState('completed')
        onAnimationDone?.()
        return
      }

      // Walk to next station
      const from = stations[fromIndex]
      const to = stations[toIndex]
      const fromVec = new THREE.Vector3(from.position[0], AVATAR_Y, from.position[2])
      const toVec = new THREE.Vector3(to.position[0], AVATAR_Y, to.position[2])

      const dx = toVec.x - fromVec.x
      const dz = toVec.z - fromVec.z
      const walkHeading = Math.atan2(dx, dz)
      setAvatarHeading(walkHeading)
      setAnimationState('walking')

      await runTimedAnimation(WALK_DURATION, (eased, raw) => {
        setMoveProgress(raw)
        setVisualPosition(fromVec.clone().lerp(toVec, eased))
      })

      visualIndexRef.current = toIndex
      setMoveProgress(0)
      setVisualPosition(toVec)
      setAvatarHeading(to.facing ?? walkHeading)
      setAnimationState('idle')
      onAnimationDone?.()
    }

    runAnimation()
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [animateTo])

  return (
    <Canvas
      shadows
      dpr={[1, 2]}
      camera={{ fov: 38, position: [4, 3, 5], near: 0.1, far: 100 }}
      gl={{ antialias: true, powerPreference: 'high-performance' }}
      style={{ width: '100%', height: '100%' }}
    >
      <SceneContents
        theme={theme}
        avatarConfig={avatarConfig}
        stations={stations}
        animationState={animationState}
        visualPosition={visualPosition}
        avatarHeading={avatarHeading}
        moveProgress={moveProgress}
        activeStationIndex={visualIndexRef.current}
        isMobile={isMobile}
      />
    </Canvas>
  )
}

export { DEFAULT_THEME, DEFAULT_AVATAR }
