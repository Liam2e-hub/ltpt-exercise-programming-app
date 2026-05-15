import { useFrame } from '@react-three/fiber'
import { useRef } from 'react'
import { EQUIPMENT } from '../../data/gymStations.js'

// ─── Shared materials / colors ──────────────────────────────────────────────
const METAL_DARK = '#1a1f25'
const METAL_MID = '#2a3138'
const METAL_LIGHT = '#3a434b'
const RUBBER = '#0c0f12'
const PAD_RED = '#a02828'
const WOOD = '#5c3a1e'
const WOOD_DARK = '#3d2613'
const PLATE_RED = '#c0392b'
const PLATE_BLUE = '#2563eb'
const PLATE_YELLOW = '#e8a93b'
const PLATE_BLACK = '#0a0d10'

// ─── Reusable primitives ────────────────────────────────────────────────────

function MetalBox({ size, position = [0, 0, 0], rotation = [0, 0, 0], color = METAL_DARK }) {
  return (
    <mesh castShadow receiveShadow position={position} rotation={rotation}>
      <boxGeometry args={size} />
      <meshStandardMaterial color={color} roughness={0.55} metalness={0.4} />
    </mesh>
  )
}

function MetalCyl({ args, position = [0, 0, 0], rotation = [0, 0, 0], color = METAL_LIGHT }) {
  return (
    <mesh castShadow receiveShadow position={position} rotation={rotation}>
      <cylinderGeometry args={args} />
      <meshStandardMaterial color={color} roughness={0.32} metalness={0.7} />
    </mesh>
  )
}

// A loaded barbell — bar oriented along its local X axis, plates at both ends.
function LoadedBarbell({ length = 1.9, plateColor = PLATE_RED, plateRadius = 0.22, plateThickness = 0.06, smallPlate = true }) {
  const sleeveLen = 0.22
  const barRadius = 0.022
  const collarRadius = 0.05
  const halfLen = length / 2

  return (
    <group rotation={[0, 0, Math.PI / 2]}>
      {/* main bar shaft */}
      <mesh castShadow>
        <cylinderGeometry args={[barRadius, barRadius, length, 14]} />
        <meshStandardMaterial color="#b7bcc2" roughness={0.32} metalness={0.85} />
      </mesh>
      {/* knurling rings — subtle bands */}
      <mesh position={[0, 0.05, 0]}>
        <cylinderGeometry args={[barRadius + 0.001, barRadius + 0.001, 0.12, 14]} />
        <meshStandardMaterial color="#8a9099" roughness={0.85} metalness={0.5} />
      </mesh>
      <mesh position={[0, -0.05, 0]}>
        <cylinderGeometry args={[barRadius + 0.001, barRadius + 0.001, 0.12, 14]} />
        <meshStandardMaterial color="#8a9099" roughness={0.85} metalness={0.5} />
      </mesh>

      {[-1, 1].map((sign) => (
        <group key={sign} position={[0, sign * halfLen, 0]}>
          {/* sleeve */}
          <mesh castShadow position={[0, -sign * sleeveLen * 0.4, 0]}>
            <cylinderGeometry args={[0.038, 0.038, sleeveLen, 14]} />
            <meshStandardMaterial color="#7a8088" roughness={0.4} metalness={0.7} />
          </mesh>
          {/* big plate */}
          <mesh castShadow position={[0, -sign * 0.1, 0]}>
            <cylinderGeometry args={[plateRadius, plateRadius, plateThickness, 28]} />
            <meshStandardMaterial color={plateColor} roughness={0.6} metalness={0.1} />
          </mesh>
          {/* second smaller plate (visible width) */}
          {smallPlate && (
            <mesh castShadow position={[0, -sign * 0.17, 0]}>
              <cylinderGeometry args={[plateRadius - 0.05, plateRadius - 0.05, 0.04, 22]} />
              <meshStandardMaterial color={PLATE_BLACK} roughness={0.78} />
            </mesh>
          )}
          {/* collar/clip */}
          <mesh castShadow position={[0, -sign * 0.21, 0]}>
            <cylinderGeometry args={[collarRadius, collarRadius, 0.04, 14]} />
            <meshStandardMaterial color={METAL_DARK} roughness={0.5} metalness={0.6} />
          </mesh>
        </group>
      ))}
    </group>
  )
}

// Loose dumbbell — for the dumbbell rack
function Dumbbell({ position = [0, 0, 0], rotation = [0, 0, Math.PI / 2], headRadius = 0.085, headWidth = 0.13, handleLen = 0.28 }) {
  return (
    <group position={position} rotation={rotation}>
      <mesh castShadow>
        <cylinderGeometry args={[0.028, 0.028, handleLen, 12]} />
        <meshStandardMaterial color="#9aa1a8" roughness={0.45} metalness={0.7} />
      </mesh>
      {[-1, 1].map((sign) => (
        <mesh key={sign} castShadow position={[0, sign * (handleLen / 2 + headWidth / 2 - 0.01), 0]}>
          <cylinderGeometry args={[headRadius, headRadius, headWidth, 14]} />
          <meshStandardMaterial color={METAL_DARK} roughness={0.6} metalness={0.4} />
        </mesh>
      ))}
    </group>
  )
}

// ─── STATION 1: SQUAT RACK ──────────────────────────────────────────────────
// Full power rack: 4 uprights, top crossbeams, J-hooks, safety arms, loaded
// barbell resting on J-hooks. Plate tree behind. User side faces local −z.

function SquatRack() {
  const W = 1.4 // width between uprights (x)
  const D = 1.0 // depth between uprights (z)
  const H = 2.1 // upright height

  return (
    <group position={[0, 0, 0.4]}>
      {/* uprights */}
      {[
        [-W / 2, 0, -D / 2],
        [W / 2, 0, -D / 2],
        [-W / 2, 0, D / 2],
        [W / 2, 0, D / 2],
      ].map((p, i) => (
        <MetalBox key={i} size={[0.1, H, 0.1]} position={[p[0], H / 2, p[2]]} color={METAL_DARK} />
      ))}

      {/* top crossbeams — front, back, two sides */}
      <MetalBox size={[W + 0.1, 0.1, 0.1]} position={[0, H - 0.05, -D / 2]} />
      <MetalBox size={[W + 0.1, 0.1, 0.1]} position={[0, H - 0.05, D / 2]} />
      <MetalBox size={[0.1, 0.1, D]} position={[-W / 2, H - 0.05, 0]} />
      <MetalBox size={[0.1, 0.1, D]} position={[W / 2, H - 0.05, 0]} />

      {/* J-hooks — small angled brackets on front uprights at chest height */}
      {[-1, 1].map((sign) => (
        <group key={sign} position={[sign * (W / 2 - 0.05), 1.4, -D / 2 + 0.08]}>
          <MetalBox size={[0.06, 0.18, 0.06]} color={'#0a0d10'} />
          <MetalBox size={[0.06, 0.06, 0.18]} position={[0, 0.06, 0.1]} color={'#0a0d10'} />
        </group>
      ))}

      {/* safety arms — horizontal bars across, hip height */}
      <MetalBox size={[W + 0.05, 0.05, 0.06]} position={[0, 1.0, -D / 2 + 0.05]} color={'#7a1f1f'} />

      {/* loaded barbell sitting on J-hooks */}
      <group position={[0, 1.45, -D / 2 + 0.05]}>
        <LoadedBarbell length={1.85} plateColor={PLATE_RED} smallPlate />
      </group>

      {/* plate tree behind */}
      <group position={[0, 0, D / 2 + 0.5]}>
        <MetalBox size={[0.08, 1.5, 0.08]} position={[0, 0.75, 0]} color={METAL_MID} />
        <MetalBox size={[0.7, 0.05, 0.05]} position={[0, 0.04, 0]} color={METAL_MID} />
        {[0.45, 0.85, 1.2].map((y, i) => (
          <group key={y}>
            {/* peg */}
            <mesh castShadow position={[0, y, 0]} rotation={[Math.PI / 2, 0, 0]}>
              <cylinderGeometry args={[0.022, 0.022, 0.6, 10]} />
              <meshStandardMaterial color={METAL_LIGHT} metalness={0.7} roughness={0.4} />
            </mesh>
            {/* plates stacked on each side */}
            {[-0.18, 0.18].map((zp) => (
              <mesh key={zp} castShadow position={[0, y, zp]} rotation={[Math.PI / 2, 0, 0]}>
                <cylinderGeometry args={[0.18 - i * 0.02, 0.18 - i * 0.02, 0.05, 22]} />
                <meshStandardMaterial color={i === 0 ? PLATE_RED : i === 1 ? PLATE_BLUE : PLATE_BLACK} roughness={0.65} />
              </mesh>
            ))}
          </group>
        ))}
      </group>
    </group>
  )
}

// ─── STATION 2: BENCH PRESS ─────────────────────────────────────────────────

function BenchPress() {
  return (
    <group position={[0, 0, 0.3]}>
      {/* bench legs / supports — A-frame underneath */}
      <MetalBox size={[0.45, 0.35, 0.08]} position={[0, 0.18, -0.55]} color={METAL_DARK} />
      <MetalBox size={[0.45, 0.35, 0.08]} position={[0, 0.18, 0.55]} color={METAL_DARK} />
      {/* center rail */}
      <MetalBox size={[0.08, 0.08, 1.3]} position={[0, 0.42, 0]} color={METAL_DARK} />

      {/* bench pad — red leather */}
      <mesh castShadow position={[0, 0.5, 0]}>
        <boxGeometry args={[0.4, 0.1, 1.3]} />
        <meshStandardMaterial color={PAD_RED} roughness={0.55} />
      </mesh>
      {/* pad seam */}
      <mesh position={[0, 0.555, 0]}>
        <boxGeometry args={[0.41, 0.005, 1.31]} />
        <meshStandardMaterial color="#0a0d10" />
      </mesh>

      {/* uprights at head end */}
      {[-1, 1].map((sign) => (
        <MetalBox key={sign} size={[0.09, 1.3, 0.09]} position={[sign * 0.55, 0.65, 0.78]} color={METAL_DARK} />
      ))}
      {/* J-hook tops */}
      {[-1, 1].map((sign) => (
        <group key={sign} position={[sign * 0.55, 1.18, 0.78]}>
          <MetalBox size={[0.07, 0.06, 0.16]} position={[0, 0.04, -0.06]} color="#0a0d10" />
        </group>
      ))}

      {/* base feet */}
      <MetalBox size={[0.8, 0.08, 0.6]} position={[0, 0.04, 0.78]} color={METAL_DARK} />

      {/* loaded barbell on uprights */}
      <group position={[0, 1.22, 0.78]}>
        <LoadedBarbell length={1.7} plateColor={PLATE_BLUE} smallPlate />
      </group>
    </group>
  )
}

// ─── STATION 3: DEADLIFT PLATFORM ───────────────────────────────────────────

function DeadliftPlatform() {
  return (
    <group position={[0, 0, 0.4]}>
      {/* rubber side strips */}
      <mesh receiveShadow position={[-0.7, 0.04, 0]}>
        <boxGeometry args={[0.5, 0.08, 1.4]} />
        <meshStandardMaterial color={RUBBER} roughness={0.95} />
      </mesh>
      <mesh receiveShadow position={[0.7, 0.04, 0]}>
        <boxGeometry args={[0.5, 0.08, 1.4]} />
        <meshStandardMaterial color={RUBBER} roughness={0.95} />
      </mesh>

      {/* wood center */}
      <mesh receiveShadow position={[0, 0.04, 0]}>
        <boxGeometry args={[1.0, 0.085, 1.4]} />
        <meshStandardMaterial color={WOOD} roughness={0.7} />
      </mesh>
      {/* wood plank seams */}
      {[-0.33, 0, 0.33].map((x) => (
        <mesh key={x} position={[x, 0.085, 0]}>
          <boxGeometry args={[0.01, 0.002, 1.4]} />
          <meshStandardMaterial color={WOOD_DARK} />
        </mesh>
      ))}

      {/* barbell with bumper plates on floor */}
      <group position={[0, 0.31, 0]}>
        <LoadedBarbell length={2.1} plateColor={PLATE_RED} plateRadius={0.28} plateThickness={0.08} smallPlate={false} />
      </group>

      {/* chalk bowl on side */}
      <group position={[1.05, 0.1, -0.5]}>
        <mesh castShadow>
          <cylinderGeometry args={[0.12, 0.1, 0.08, 16]} />
          <meshStandardMaterial color="#2a2f35" roughness={0.85} />
        </mesh>
        <mesh position={[0, 0.045, 0]}>
          <cylinderGeometry args={[0.1, 0.1, 0.01, 16]} />
          <meshStandardMaterial color="#e6e2dc" roughness={1} />
        </mesh>
      </group>
    </group>
  )
}

// ─── STATION 4: CABLE MACHINE ───────────────────────────────────────────────

function CableMachine() {
  return (
    <group position={[0, 0, 0.5]}>
      {/* base */}
      <MetalBox size={[1.5, 0.12, 0.7]} position={[0, 0.06, 0.15]} color={METAL_DARK} />

      {/* two vertical posts */}
      {[-1, 1].map((sign) => (
        <MetalBox key={sign} size={[0.12, 2.4, 0.12]} position={[sign * 0.7, 1.2, 0.4]} color={METAL_DARK} />
      ))}
      {/* top crossbeam */}
      <MetalBox size={[1.55, 0.14, 0.14]} position={[0, 2.35, 0.4]} color={METAL_DARK} />

      {/* weight stack housing */}
      <group position={[0, 0, 0.4]}>
        <MetalBox size={[0.5, 1.4, 0.32]} position={[0, 0.78, 0]} color="#0e1216" />
        {/* plates stacked — horizontal lines */}
        {Array.from({ length: 10 }).map((_, i) => (
          <mesh key={i} position={[0, 0.2 + i * 0.12, 0.17]}>
            <boxGeometry args={[0.42, 0.1, 0.005]} />
            <meshStandardMaterial color="#3a434b" roughness={0.65} metalness={0.4} />
          </mesh>
        ))}
        {/* pin */}
        <mesh castShadow position={[0.22, 0.55, 0.17]} rotation={[0, 0, Math.PI / 2]}>
          <cylinderGeometry args={[0.015, 0.015, 0.08, 8]} />
          <meshStandardMaterial color="#c0392b" metalness={0.6} />
        </mesh>
        {/* glass/screen on top */}
        <mesh position={[0, 1.55, 0.17]}>
          <boxGeometry args={[0.32, 0.18, 0.02]} />
          <meshStandardMaterial color="#0a0d10" emissive="#1b6a3a" emissiveIntensity={0.3} />
        </mesh>
      </group>

      {/* pulley wheel at top */}
      <mesh castShadow position={[0, 2.25, 0.4]} rotation={[0, 0, Math.PI / 2]}>
        <cylinderGeometry args={[0.06, 0.06, 0.05, 16]} />
        <meshStandardMaterial color={METAL_LIGHT} metalness={0.7} roughness={0.4} />
      </mesh>

      {/* cable */}
      <mesh position={[0, 1.55, 0.4]}>
        <cylinderGeometry args={[0.006, 0.006, 1.4, 6]} />
        <meshStandardMaterial color="#2a2f35" />
      </mesh>

      {/* D-handle */}
      <group position={[0, 0.8, 0.4]}>
        <mesh castShadow>
          <torusGeometry args={[0.08, 0.012, 6, 16]} />
          <meshStandardMaterial color={METAL_LIGHT} metalness={0.7} roughness={0.4} />
        </mesh>
        <mesh castShadow position={[0, -0.07, 0]} rotation={[0, 0, Math.PI / 2]}>
          <cylinderGeometry args={[0.022, 0.022, 0.14, 12]} />
          <meshStandardMaterial color="#0a0d10" roughness={0.7} />
        </mesh>
      </group>
    </group>
  )
}

// ─── STATION 5: TREADMILL ───────────────────────────────────────────────────

function Treadmill() {
  const beltRef = useRef()
  useFrame(({ clock }) => {
    if (beltRef.current) {
      // subtle belt material offset for "running" look
      beltRef.current.material.map?.offset.set(0, -clock.getElapsedTime() * 0.2)
    }
  })

  return (
    <group position={[0, 0, 0.5]}>
      {/* base / deck */}
      <MetalBox size={[0.95, 0.16, 1.6]} position={[0, 0.08, 0]} color={METAL_DARK} />

      {/* belt */}
      <mesh ref={beltRef} position={[0, 0.165, 0.0]}>
        <boxGeometry args={[0.7, 0.005, 1.5]} />
        <meshStandardMaterial color={RUBBER} roughness={0.95} />
      </mesh>
      {/* belt tread lines */}
      {Array.from({ length: 8 }).map((_, i) => (
        <mesh key={i} position={[0, 0.169, -0.65 + i * 0.18]}>
          <boxGeometry args={[0.68, 0.002, 0.005]} />
          <meshStandardMaterial color="#1f262d" />
        </mesh>
      ))}

      {/* side rails */}
      {[-1, 1].map((sign) => (
        <group key={sign}>
          <MetalBox size={[0.08, 0.5, 1.4]} position={[sign * 0.5, 0.4, 0.0]} color={METAL_DARK} />
          {/* top of rail */}
          <MetalBox size={[0.1, 0.04, 1.4]} position={[sign * 0.5, 0.66, 0.0]} color={METAL_MID} />
        </group>
      ))}

      {/* console post — rising from front */}
      <MetalBox size={[1.0, 0.06, 0.08]} position={[0, 0.7, 0.78]} color={METAL_DARK} />
      {[-1, 1].map((sign) => (
        <MetalBox key={sign} size={[0.06, 0.6, 0.06]} position={[sign * 0.45, 1.0, 0.78]} color={METAL_DARK} />
      ))}
      {/* console body */}
      <group position={[0, 1.35, 0.78]} rotation={[-0.1, 0, 0]}>
        <MetalBox size={[0.95, 0.55, 0.08]} color="#0e1216" />
        {/* screen */}
        <mesh position={[0, 0.04, 0.045]}>
          <planeGeometry args={[0.78, 0.36]} />
          <meshStandardMaterial color="#020405" emissive="#0c3a24" emissiveIntensity={0.6} />
        </mesh>
        {/* glowing display "stats" — three lit pixel lines */}
        {[0.06, -0.02, -0.1].map((y, i) => (
          <mesh key={i} position={[-0.2 + i * 0.05, y, 0.046]}>
            <planeGeometry args={[0.32 - i * 0.04, 0.04]} />
            <meshBasicMaterial color="#22f08a" />
          </mesh>
        ))}
        {/* handle below */}
        <mesh position={[0, -0.32, 0.05]}>
          <boxGeometry args={[0.9, 0.05, 0.04]} />
          <meshStandardMaterial color={METAL_MID} metalness={0.6} roughness={0.4} />
        </mesh>
      </group>
    </group>
  )
}

// ─── STATION 6: DUMBBELL RACK ───────────────────────────────────────────────

function DumbbellRack() {
  return (
    <group position={[0, 0, 0.4]}>
      {/* A-frame side panels */}
      {[-1, 1].map((sign) => (
        <group key={sign} position={[sign * 0.95, 0, 0]}>
          <MetalBox size={[0.04, 0.1, 1.0]} position={[0, 0.05, 0]} color={METAL_DARK} />
          <MetalBox size={[0.04, 1.05, 0.04]} position={[0, 0.55, -0.46]} color={METAL_DARK} />
          <MetalBox size={[0.04, 0.6, 0.04]} position={[0, 0.32, 0.46]} color={METAL_DARK} />
          <MetalBox
            size={[0.04, 1.1, 0.04]}
            position={[0, 0.55, 0]}
            rotation={[0.45, 0, 0]}
            color={METAL_DARK}
          />
        </group>
      ))}

      {/* shelves — 3 tiers sloping down toward user (toward -z) */}
      {[
        { y: 0.95, z: -0.42, size: 0.85 },
        { y: 0.66, z: -0.18, size: 0.95 },
        { y: 0.36, z: 0.1, size: 1.05 },
      ].map((row, rowIdx) => (
        <group key={rowIdx}>
          {/* shelf surface */}
          <MetalBox
            size={[1.86, 0.04, row.size]}
            position={[0, row.y, row.z]}
            color="#11161b"
          />
          {/* lip at the front (toward user, -z) so weights don't roll off */}
          <MetalBox
            size={[1.86, 0.05, 0.03]}
            position={[0, row.y + 0.04, row.z - row.size / 2 + 0.015]}
            color={METAL_LIGHT}
          />

          {/* pairs of dumbbells — 4 pairs across, sized largest on bottom */}
          {[-0.65, -0.2, 0.25, 0.7].map((x, i) => {
            const baseHead = 0.075 + (2 - rowIdx) * 0.018 - i * 0.005
            return (
              <group key={i} position={[x, row.y + 0.04 + baseHead, row.z]}>
                <Dumbbell
                  headRadius={baseHead}
                  headWidth={0.11 + (2 - rowIdx) * 0.02}
                  handleLen={0.22}
                />
              </group>
            )
          })}
        </group>
      ))}
    </group>
  )
}

// ─── STATION 7: PULL-UP / DIP STATION ───────────────────────────────────────

function PullUpStation() {
  return (
    <group position={[0, 0, 0.4]}>
      {/* base plates */}
      {[-1, 1].map((sign) => (
        <MetalBox key={sign} size={[0.4, 0.06, 0.4]} position={[sign * 0.7, 0.03, 0]} />
      ))}
      {/* vertical posts */}
      {[-1, 1].map((sign) => (
        <MetalBox key={sign} size={[0.1, 2.5, 0.1]} position={[sign * 0.7, 1.25, 0]} color={METAL_DARK} />
      ))}
      {/* main pull-up bar */}
      <mesh castShadow position={[0, 2.5, 0]} rotation={[0, 0, Math.PI / 2]}>
        <cylinderGeometry args={[0.035, 0.035, 1.4, 14]} />
        <meshStandardMaterial color="#b7bcc2" roughness={0.32} metalness={0.85} />
      </mesh>
      {/* knurling */}
      {[-0.32, 0.32].map((x) => (
        <mesh key={x} position={[x, 2.5, 0]} rotation={[0, 0, Math.PI / 2]}>
          <cylinderGeometry args={[0.037, 0.037, 0.15, 14]} />
          <meshStandardMaterial color="#8a9099" roughness={0.85} metalness={0.5} />
        </mesh>
      ))}
      {/* neutral grip handles at top */}
      {[-1, 1].map((sign) => (
        <mesh key={sign} castShadow position={[sign * 0.55, 2.5, 0.18]} rotation={[Math.PI / 2, 0, 0]}>
          <cylinderGeometry args={[0.026, 0.026, 0.28, 12]} />
          <meshStandardMaterial color="#b7bcc2" roughness={0.32} metalness={0.85} />
        </mesh>
      ))}
      {/* parallel dip bars */}
      {[-1, 1].map((sign) => (
        <group key={sign}>
          <mesh castShadow position={[sign * 0.5, 1.25, 0.28]} rotation={[Math.PI / 2, 0, 0]}>
            <cylinderGeometry args={[0.03, 0.03, 0.5, 12]} />
            <meshStandardMaterial color="#b7bcc2" roughness={0.32} metalness={0.85} />
          </mesh>
          <MetalBox size={[0.06, 0.1, 0.06]} position={[sign * 0.5, 1.2, 0.05]} color={METAL_DARK} />
        </group>
      ))}
      {/* top brand panel */}
      <mesh position={[0, 2.7, 0]}>
        <boxGeometry args={[0.7, 0.18, 0.06]} />
        <meshStandardMaterial color="#0e1216" roughness={0.7} />
      </mesh>
    </group>
  )
}

// ─── STATION 8: LEG MACHINE (press / curl / extension / calf) ───────────────

function LegMachine() {
  return (
    <group position={[0, 0, 0.5]}>
      {/* base */}
      <MetalBox size={[1.5, 0.08, 1.2]} position={[0, 0.04, 0]} />
      {/* seat column */}
      <MetalBox size={[0.5, 0.5, 0.5]} position={[0, 0.3, -0.3]} />
      {/* seat */}
      <mesh castShadow position={[0, 0.55, -0.3]}>
        <boxGeometry args={[0.6, 0.1, 0.5]} />
        <meshStandardMaterial color={PAD_RED} roughness={0.55} />
      </mesh>
      {/* back rest */}
      <mesh castShadow position={[0, 0.95, -0.55]} rotation={[-0.2, 0, 0]}>
        <boxGeometry args={[0.6, 0.8, 0.12]} />
        <meshStandardMaterial color={PAD_RED} roughness={0.55} />
      </mesh>
      {/* leg roller arms */}
      <MetalBox size={[0.06, 0.5, 0.5]} position={[-0.45, 0.55, 0.4]} color={METAL_DARK} />
      <MetalBox size={[0.06, 0.5, 0.5]} position={[ 0.45, 0.55, 0.4]} color={METAL_DARK} />
      {/* leg roller pad */}
      <mesh castShadow position={[0, 0.55, 0.55]} rotation={[0, 0, Math.PI / 2]}>
        <cylinderGeometry args={[0.075, 0.075, 0.95, 14]} />
        <meshStandardMaterial color={PAD_RED} roughness={0.6} />
      </mesh>
      {/* weight stack side */}
      <group position={[0.85, 0, -0.15]}>
        <MetalBox size={[0.36, 1.5, 0.36]} position={[0, 0.75, 0]} color="#0e1216" />
        {Array.from({ length: 9 }).map((_, i) => (
          <mesh key={i} position={[0, 0.2 + i * 0.13, 0.19]}>
            <boxGeometry args={[0.3, 0.11, 0.005]} />
            <meshStandardMaterial color="#3a434b" roughness={0.65} metalness={0.4} />
          </mesh>
        ))}
        <mesh castShadow position={[0.2, 0.59, 0.19]} rotation={[0, 0, Math.PI / 2]}>
          <cylinderGeometry args={[0.015, 0.015, 0.07, 8]} />
          <meshStandardMaterial color="#c0392b" metalness={0.6} />
        </mesh>
      </group>
      {/* connecting rod */}
      <mesh castShadow position={[0.55, 0.55, 0.15]} rotation={[0, 0, -0.3]}>
        <cylinderGeometry args={[0.022, 0.022, 0.6, 10]} />
        <meshStandardMaterial color={METAL_LIGHT} metalness={0.7} roughness={0.4} />
      </mesh>
    </group>
  )
}

// ─── STATION 9: FLOOR MAT (bodyweight / floor exercises) ────────────────────

function FloorMat() {
  return (
    <group position={[0, 0, 0.5]}>
      {/* mat */}
      <mesh receiveShadow position={[0, 0.018, 0]}>
        <boxGeometry args={[1.7, 0.035, 0.8]} />
        <meshStandardMaterial color="#3a5d70" roughness={0.95} />
      </mesh>
      <mesh position={[0, 0.037, 0]}>
        <boxGeometry args={[1.65, 0.002, 0.75]} />
        <meshStandardMaterial color="#28404f" roughness={1} />
      </mesh>
      {[-0.78, 0.78].map((x) => (
        <mesh key={x} position={[x, 0.038, 0]}>
          <boxGeometry args={[0.04, 0.001, 0.78]} />
          <meshStandardMaterial color="#1a2d36" />
        </mesh>
      ))}
      {/* kettlebell */}
      <group position={[1.1, 0.13, -0.32]}>
        <mesh castShadow>
          <sphereGeometry args={[0.13, 16, 14]} />
          <meshStandardMaterial color={METAL_DARK} roughness={0.7} metalness={0.5} />
        </mesh>
        <mesh castShadow position={[0, 0.13, 0]}>
          <torusGeometry args={[0.07, 0.02, 6, 14, Math.PI]} />
          <meshStandardMaterial color={METAL_DARK} roughness={0.7} metalness={0.5} />
        </mesh>
      </group>
      {/* foam roller */}
      <mesh castShadow position={[-1.05, 0.085, -0.32]} rotation={[0, 0, Math.PI / 2]}>
        <cylinderGeometry args={[0.085, 0.085, 0.4, 14]} />
        <meshStandardMaterial color="#7a3a3a" roughness={0.9} />
      </mesh>
    </group>
  )
}

// ─── STATION WRAPPER ────────────────────────────────────────────────────────

const EQUIPMENT_COMPONENTS = {
  [EQUIPMENT.SQUAT_RACK]:        SquatRack,
  [EQUIPMENT.BENCH]:             BenchPress,
  [EQUIPMENT.DEADLIFT_PLATFORM]: DeadliftPlatform,
  [EQUIPMENT.CABLE_TOWER]:       CableMachine,
  [EQUIPMENT.PULL_UP_BAR]:       PullUpStation,
  [EQUIPMENT.DUMBBELL_AREA]:     DumbbellRack,
  [EQUIPMENT.LEG_MACHINE]:       LegMachine,
  [EQUIPMENT.FLOOR_MAT]:         FloorMat,
}

function GymStation({ station }) {
  const StationModel = EQUIPMENT_COMPONENTS[station.equipment] || SquatRack
  return (
    <group position={station.position} rotation-y={station.facing}>
      <StationModel />
    </group>
  )
}

export function Stations({ stations }) {
  return (
    <>
      {stations.map((s) => (
        <GymStation key={s.id} station={s} />
      ))}
    </>
  )
}
