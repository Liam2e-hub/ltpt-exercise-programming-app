import { useMemo, useRef } from 'react'
import { useFrame } from '@react-three/fiber'
import * as THREE from 'three'

// ───────────────────────────────────────────────────────────────────────────
// ROOM — floor, walls, ceiling, mirrors. Camera looks from (+x, +z) corner
// down toward origin, so we render the two "back" walls (−x and −z sides).
// ───────────────────────────────────────────────────────────────────────────

const ROOM_W = 12 // x
const ROOM_D = 8 // z
const ROOM_H = 4 // y
const ROOM_HALF_W = ROOM_W / 2
const ROOM_HALF_D = ROOM_D / 2

function Floor({ theme }) {
  return (
    <group>
      {/* Base rubber floor */}
      <mesh receiveShadow rotation-x={-Math.PI / 2} position={[0, 0, 0]}>
        <planeGeometry args={[ROOM_W, ROOM_D]} />
        <meshStandardMaterial
          color={theme.floor}
          roughness={0.95}
          metalness={0.05}
        />
      </mesh>

      {/* Subtle grid pattern overlaid — thin emissive lines */}
      <gridHelper
        args={[ROOM_W, 24, '#2a3138', '#1a1f24']}
        position={[0, 0.001, 0]}
      />

      {/* Workout zone "rug" inset — slightly lighter, suggests training mat */}
      <mesh receiveShadow rotation-x={-Math.PI / 2} position={[0, 0.002, 0]}>
        <planeGeometry args={[ROOM_W - 2, ROOM_D - 2]} />
        <meshStandardMaterial
          color={theme.floor}
          roughness={0.7}
          metalness={0.0}
          transparent
          opacity={0.4}
        />
      </mesh>
    </group>
  )
}

function Walls({ theme }) {
  const wallColor = '#1d242b'
  const trimColor = '#272f37'

  return (
    <group>
      {/* Back wall (−z) */}
      <mesh receiveShadow position={[0, ROOM_H / 2, -ROOM_HALF_D]}>
        <planeGeometry args={[ROOM_W, ROOM_H]} />
        <meshStandardMaterial color={wallColor} roughness={0.92} />
      </mesh>

      {/* Side wall (−x) */}
      <mesh
        receiveShadow
        position={[-ROOM_HALF_W, ROOM_H / 2, 0]}
        rotation-y={Math.PI / 2}
      >
        <planeGeometry args={[ROOM_D, ROOM_H]} />
        <meshStandardMaterial color={wallColor} roughness={0.92} />
      </mesh>

      {/* Floor trim — subtle dark band where walls meet floor */}
      <mesh position={[0, 0.06, -ROOM_HALF_D + 0.01]}>
        <boxGeometry args={[ROOM_W, 0.12, 0.02]} />
        <meshStandardMaterial color={trimColor} roughness={0.7} />
      </mesh>
      <mesh
        position={[-ROOM_HALF_W + 0.01, 0.06, 0]}
        rotation-y={Math.PI / 2}
      >
        <boxGeometry args={[ROOM_D, 0.12, 0.02]} />
        <meshStandardMaterial color={trimColor} roughness={0.7} />
      </mesh>

      {/* Ceiling */}
      <mesh
        receiveShadow
        position={[0, ROOM_H, 0]}
        rotation-x={Math.PI / 2}
      >
        <planeGeometry args={[ROOM_W, ROOM_D]} />
        <meshStandardMaterial color="#161b21" roughness={0.95} />
      </mesh>
    </group>
  )
}

// Full-height mirror on side wall — reflective-ish dark plane with subtle frame.
function Mirror() {
  return (
    <group position={[-ROOM_HALF_W + 0.02, ROOM_H / 2, -1.6]} rotation-y={Math.PI / 2}>
      {/* frame */}
      <mesh>
        <planeGeometry args={[2.8, 3.2]} />
        <meshStandardMaterial color="#06080a" roughness={0.4} />
      </mesh>
      {/* mirror surface */}
      <mesh position={[0, 0, 0.005]}>
        <planeGeometry args={[2.6, 3.0]} />
        <meshStandardMaterial
          color="#1a2128"
          roughness={0.18}
          metalness={0.85}
          envMapIntensity={1}
        />
      </mesh>
      {/* subtle highlight gradient across mirror */}
      <mesh position={[0, 0, 0.006]}>
        <planeGeometry args={[2.6, 3.0]} />
        <meshBasicMaterial
          color="#ffffff"
          transparent
          opacity={0.04}
        />
      </mesh>
    </group>
  )
}

// Framed wall art / posters on the back wall.
function WallArt({ theme }) {
  const artPositions = [
    { x: -2.4, color: theme.accent },
    { x: 0, color: '#9aa3ad' },
    { x: 2.4, color: theme.accent },
  ]
  return (
    <group position={[0, 2.4, -ROOM_HALF_D + 0.04]}>
      {artPositions.map((p, i) => (
        <group key={i} position={[p.x, 0, 0]}>
          {/* frame */}
          <mesh>
            <planeGeometry args={[1.1, 1.5]} />
            <meshStandardMaterial color="#06080a" roughness={0.5} />
          </mesh>
          {/* inset art */}
          <mesh position={[0, 0, 0.003]}>
            <planeGeometry args={[1.0, 1.4]} />
            <meshStandardMaterial
              color={p.color}
              roughness={0.6}
              emissive={p.color}
              emissiveIntensity={i === 1 ? 0.0 : 0.05}
              transparent
              opacity={i === 1 ? 0.9 : 0.7}
            />
          </mesh>
        </group>
      ))}
    </group>
  )
}

// Recessed linear ceiling lights — emissive panels.
function CeilingLights({ theme }) {
  const positions = [
    [-3.6, -1.5],
    [0, -1.5],
    [3.6, -1.5],
    [-3.6, 1.5],
    [0, 1.5],
    [3.6, 1.5],
  ]
  return (
    <group position={[0, ROOM_H - 0.02, 0]}>
      {positions.map(([x, z], i) => (
        <mesh key={i} rotation-x={Math.PI / 2} position={[x, 0, z]}>
          <planeGeometry args={[1.4, 0.16]} />
          <meshBasicMaterial color="#ffffff" />
        </mesh>
      ))}
    </group>
  )
}

// Stylized potted plant — pot + leafy mass made of overlapping spheres.
function Plant({ position, scale = 1 }) {
  return (
    <group position={position} scale={scale}>
      {/* pot */}
      <mesh castShadow receiveShadow position={[0, 0.25, 0]}>
        <cylinderGeometry args={[0.28, 0.22, 0.5, 16]} />
        <meshStandardMaterial color="#2b3036" roughness={0.85} />
      </mesh>
      {/* rim */}
      <mesh position={[0, 0.5, 0]}>
        <torusGeometry args={[0.28, 0.02, 8, 24]} />
        <meshStandardMaterial color="#0f1316" roughness={0.6} />
      </mesh>
      {/* leaves — clustered spheres */}
      {[
        { p: [0, 0.85, 0], s: 0.42, c: '#2a4d2e' },
        { p: [0.22, 0.95, 0.06], s: 0.3, c: '#356536' },
        { p: [-0.18, 1.0, -0.05], s: 0.28, c: '#284228' },
        { p: [0.04, 1.18, 0.04], s: 0.26, c: '#3a6e3a' },
        { p: [-0.1, 1.1, 0.15], s: 0.24, c: '#2f5532' },
      ].map((leaf, i) => (
        <mesh key={i} castShadow position={leaf.p}>
          <sphereGeometry args={[leaf.s, 12, 10]} />
          <meshStandardMaterial color={leaf.c} roughness={0.85} />
        </mesh>
      ))}
    </group>
  )
}

// ───────────────────────────────────────────────────────────────────────────
// ACTIVE STATION GLOW — emissive ring on the floor + colored point light
// that smoothly translates to the active station.
// ───────────────────────────────────────────────────────────────────────────

function StationGlow({ targetPosition, theme }) {
  const ringRef = useRef()
  const lightRef = useRef()
  const pulseRef = useRef()
  const currentPos = useRef(new THREE.Vector3(...targetPosition))

  useFrame(({ clock }, delta) => {
    const t = clock.getElapsedTime()
    const target = new THREE.Vector3(...targetPosition)
    currentPos.current.lerp(target, Math.min(1, delta * 4))

    if (ringRef.current) {
      ringRef.current.position.x = currentPos.current.x
      ringRef.current.position.z = currentPos.current.z
      const pulse = 1 + Math.sin(t * 2.2) * 0.06
      ringRef.current.scale.set(pulse, pulse, pulse)
      ringRef.current.material.opacity = 0.55 + Math.sin(t * 2.2) * 0.15
    }

    if (pulseRef.current) {
      pulseRef.current.position.x = currentPos.current.x
      pulseRef.current.position.z = currentPos.current.z
      const s = 1 + Math.sin(t * 2.2 + Math.PI / 2) * 0.18
      pulseRef.current.scale.set(s, 1, s)
      pulseRef.current.material.opacity = 0.18 + Math.sin(t * 2.2) * 0.08
    }

    if (lightRef.current) {
      lightRef.current.position.x = currentPos.current.x
      lightRef.current.position.z = currentPos.current.z
      lightRef.current.intensity = 6 + Math.sin(t * 3) * 1.5
    }
  })

  return (
    <group>
      {/* glowing ring on the ground */}
      <mesh
        ref={ringRef}
        rotation-x={-Math.PI / 2}
        position={[0, 0.012, 0]}
      >
        <ringGeometry args={[1.05, 1.22, 64]} />
        <meshBasicMaterial
          color={theme.accent}
          transparent
          opacity={0.5}
          side={THREE.DoubleSide}
          toneMapped={false}
        />
      </mesh>
      {/* softer disc pulse */}
      <mesh
        ref={pulseRef}
        rotation-x={-Math.PI / 2}
        position={[0, 0.008, 0]}
      >
        <circleGeometry args={[1.4, 48]} />
        <meshBasicMaterial
          color={theme.accent}
          transparent
          opacity={0.15}
          side={THREE.DoubleSide}
          toneMapped={false}
        />
      </mesh>
      {/* colored point light following the avatar's station */}
      <pointLight
        ref={lightRef}
        position={[0, 1.3, 0]}
        distance={5}
        decay={2}
        intensity={6}
        color={theme.accent}
      />
    </group>
  )
}

// ───────────────────────────────────────────────────────────────────────────
// LIGHTING RIG — cinematic key + fill + rim using accent color.
// ───────────────────────────────────────────────────────────────────────────

function Lighting({ theme }) {
  return (
    <group>
      <ambientLight intensity={0.55} color="#c0cad4" />
      {/* key — warm, from above-front */}
      <directionalLight
        castShadow
        position={[4, 7, 3]}
        intensity={1.15}
        color="#fff4e1"
        shadow-mapSize-width={2048}
        shadow-mapSize-height={2048}
        shadow-camera-left={-8}
        shadow-camera-right={8}
        shadow-camera-top={8}
        shadow-camera-bottom={-8}
        shadow-camera-near={0.1}
        shadow-camera-far={30}
        shadow-bias={-0.0008}
      />
      {/* fill — cool */}
      <directionalLight
        position={[-5, 4, -2]}
        intensity={0.55}
        color="#7da3c8"
      />
      {/* rim — accent color */}
      <directionalLight
        position={[-2, 3, -6]}
        intensity={0.7}
        color={theme.accent}
      />
      {/* hemisphere lift */}
      <hemisphereLight args={['#5a7088', '#1a1f24', 0.55]} />
      {/* overhead bounce — simulates ceiling lights' diffuse contribution */}
      <pointLight position={[0, 3.6, 0]} intensity={0.6} distance={10} decay={1.5} color="#e8f0ff" />
    </group>
  )
}

// ───────────────────────────────────────────────────────────────────────────
// EXPORT — everything bundled.
// ───────────────────────────────────────────────────────────────────────────

export function Environment({ theme, activeStationPosition }) {
  return (
    <group>
      <Lighting theme={theme} />
      <Floor theme={theme} />
      <Walls theme={theme} />
      <Mirror />
      <WallArt theme={theme} />
      <CeilingLights theme={theme} />

      {/* Plants in the two visible front corners */}
      <Plant position={[ROOM_HALF_W - 0.6, 0, ROOM_HALF_D - 0.6]} scale={1.1} />
      <Plant position={[-ROOM_HALF_W + 0.6, 0, ROOM_HALF_D - 0.6]} scale={0.9} />

      <StationGlow
        targetPosition={activeStationPosition}
        theme={theme}
      />
    </group>
  )
}

export { ROOM_W, ROOM_D, ROOM_H }
