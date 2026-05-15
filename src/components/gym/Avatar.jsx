import { useFrame } from '@react-three/fiber'
import { useRef } from 'react'

const clamp01 = (v) => Math.min(1, Math.max(0, v))

// Premium avatar — taller, leaner, with tank + shorts + sneakers + hair.
// Stylized but clearly human-shaped, not a capsule.
//
// Anatomy (in local space, feet at y=0):
//   head:    y≈1.62 (sphere)
//   neck:    y≈1.46
//   torso:   y≈0.95..1.42 (tapered)
//   waist:   y≈0.95
//   hips:    y≈0.92
//   legs:    y≈0.0..0.92
//   shoes:   y≈0.0..0.08
//
// `animationState`:  'idle' | 'walking' | 'celebrating' | 'completed'
// `moveProgress`:    0..1 walk progress (for path lift)
// `heading`:         radians — direction the avatar faces (world Y rotation)

export function Avatar({
  position,
  heading,
  animationState,
  moveProgress = 0,
  config,
}) {
  const groupRef = useRef()
  const torsoRef = useRef()
  const headRef = useRef()
  const headTiltRef = useRef()
  const leftArmRef = useRef()
  const rightArmRef = useRef()
  const leftForearmRef = useRef()
  const rightForearmRef = useRef()
  const leftLegRef = useRef()
  const rightLegRef = useRef()
  const leftKneeRef = useRef()
  const rightKneeRef = useRef()
  const currentHeading = useRef(heading ?? 0)

  useFrame(({ clock }, delta) => {
    if (!groupRef.current) return
    const t = clock.getElapsedTime()

    // smooth-follow position
    groupRef.current.position.x = position.x
    groupRef.current.position.z = position.z

    const isWalking = animationState === 'walking'
    const isCelebrating = animationState === 'celebrating'
    const isCompleted = animationState === 'completed'

    // heading: snap toward target heading with smoothing
    const targetHeading = heading ?? currentHeading.current
    let diff = targetHeading - currentHeading.current
    while (diff > Math.PI) diff -= Math.PI * 2
    while (diff < -Math.PI) diff += Math.PI * 2
    currentHeading.current += diff * Math.min(1, delta * 8)
    groupRef.current.rotation.y = currentHeading.current

    // ─── Body bob / lift ────────────────────────────────────────────────────
    const walk = Math.sin(t * 11)
    const idleBob = Math.sin(t * 2.4) * 0.012
    const walkBob = isWalking ? Math.abs(walk) * 0.06 : 0
    const celebrationBob = isCelebrating ? Math.abs(Math.sin(t * 10)) * 0.18 : 0
    const completionJump = isCompleted ? Math.abs(Math.sin(t * 6)) * 0.32 : 0
    const pathLift = isWalking ? Math.sin(clamp01(moveProgress) * Math.PI) * 0.04 : 0

    groupRef.current.position.y = position.y + idleBob + walkBob + celebrationBob + completionJump + pathLift

    // ─── Torso / head tilt ──────────────────────────────────────────────────
    if (torsoRef.current) {
      if (isWalking) {
        torsoRef.current.rotation.x = walk * 0.04
        torsoRef.current.rotation.z = -walk * 0.03
      } else if (isCelebrating || isCompleted) {
        torsoRef.current.rotation.z = Math.sin(t * 8) * 0.08
        torsoRef.current.rotation.x = 0
      } else {
        torsoRef.current.rotation.x = Math.sin(t * 2) * 0.012
        torsoRef.current.rotation.z = 0
      }
    }

    if (headTiltRef.current) {
      if (isCompleted) {
        headTiltRef.current.rotation.x = -0.15 + Math.sin(t * 6) * 0.04
      } else if (isCelebrating) {
        headTiltRef.current.rotation.x = -0.08
      } else {
        headTiltRef.current.rotation.x = Math.sin(t * 2.4) * 0.02
      }
    }

    // ─── Arms ──────────────────────────────────────────────────────────────
    if (leftArmRef.current && rightArmRef.current) {
      if (isWalking) {
        leftArmRef.current.rotation.x = walk * 0.85
        rightArmRef.current.rotation.x = -walk * 0.85
        leftArmRef.current.rotation.z = 0.12
        rightArmRef.current.rotation.z = -0.12
        if (leftForearmRef.current && rightForearmRef.current) {
          leftForearmRef.current.rotation.x = -0.35 + walk * 0.18
          rightForearmRef.current.rotation.x = -0.35 - walk * 0.18
        }
      } else if (isCelebrating || isCompleted) {
        const lift = isCompleted ? -2.6 : -2.1
        leftArmRef.current.rotation.x = lift + Math.sin(t * 9) * 0.18
        rightArmRef.current.rotation.x = lift - Math.sin(t * 9) * 0.18
        leftArmRef.current.rotation.z = 0.5 + Math.sin(t * 8) * 0.18
        rightArmRef.current.rotation.z = -0.5 - Math.sin(t * 8) * 0.18
        if (leftForearmRef.current && rightForearmRef.current) {
          leftForearmRef.current.rotation.x = -0.6
          rightForearmRef.current.rotation.x = -0.6
        }
      } else {
        const breath = Math.sin(t * 2.2) * 0.05
        leftArmRef.current.rotation.x = breath
        rightArmRef.current.rotation.x = -breath
        leftArmRef.current.rotation.z = 0.18
        rightArmRef.current.rotation.z = -0.18
        if (leftForearmRef.current && rightForearmRef.current) {
          leftForearmRef.current.rotation.x = -0.18
          rightForearmRef.current.rotation.x = -0.18
        }
      }
    }

    // ─── Legs ──────────────────────────────────────────────────────────────
    if (leftLegRef.current && rightLegRef.current) {
      if (isWalking) {
        leftLegRef.current.rotation.x = -walk * 0.65
        rightLegRef.current.rotation.x = walk * 0.65
        if (leftKneeRef.current && rightKneeRef.current) {
          leftKneeRef.current.rotation.x = Math.max(0, walk) * 0.55
          rightKneeRef.current.rotation.x = Math.max(0, -walk) * 0.55
        }
      } else if (isCelebrating || isCompleted) {
        leftLegRef.current.rotation.x = Math.sin(t * 8) * 0.22
        rightLegRef.current.rotation.x = -Math.sin(t * 8) * 0.22
        if (leftKneeRef.current && rightKneeRef.current) {
          leftKneeRef.current.rotation.x = 0.2 + Math.abs(Math.sin(t * 8)) * 0.2
          rightKneeRef.current.rotation.x = 0.2 + Math.abs(Math.sin(t * 8 + 1)) * 0.2
        }
      } else {
        leftLegRef.current.rotation.x = 0
        rightLegRef.current.rotation.x = 0
        if (leftKneeRef.current && rightKneeRef.current) {
          leftKneeRef.current.rotation.x = 0
          rightKneeRef.current.rotation.x = 0
        }
      }
    }
  })

  const { skin, top, shorts, hair, shoes } = config

  return (
    <group ref={groupRef} position={[position.x, position.y, position.z]}>
      {/* HIPS pivot — the torso group rotates around hips for lean/bob */}
      <group ref={torsoRef} position={[0, 0.92, 0]}>
        {/* PELVIS — narrow hip band */}
        <mesh castShadow position={[0, 0, 0]}>
          <boxGeometry args={[0.26, 0.08, 0.18]} />
          <meshStandardMaterial color={shorts} roughness={0.7} />
        </mesh>

        {/* WAIST — narrowest part, just above pelvis (V-taper bottom) */}
        <mesh castShadow position={[0, 0.1, 0]}>
          <capsuleGeometry args={[0.13, 0.06, 8, 16]} />
          <meshStandardMaterial color={top} roughness={0.55} />
        </mesh>

        {/* ABS / midriff — slight widening */}
        <mesh castShadow position={[0, 0.24, 0]} scale={[1.2, 1, 1.05]}>
          <capsuleGeometry args={[0.14, 0.1, 8, 16]} />
          <meshStandardMaterial color={top} roughness={0.55} />
        </mesh>

        {/* CHEST / pecs — much wider, gives the V-taper its top */}
        <mesh castShadow position={[0, 0.4, 0.02]} scale={[1.55, 1, 1.15]}>
          <capsuleGeometry args={[0.15, 0.14, 8, 16]} />
          <meshStandardMaterial color={top} roughness={0.55} />
        </mesh>

        {/* DELTS — broad rounded shoulder caps in skin tone */}
        {[-1, 1].map((sign) => (
          <mesh
            key={sign}
            castShadow
            position={[sign * 0.28, 0.5, 0]}
            scale={[1.05, 0.85, 1.05]}
          >
            <sphereGeometry args={[0.1, 14, 12]} />
            <meshStandardMaterial color={skin} roughness={0.6} />
          </mesh>
        ))}

        {/* TRAPS — bridge between delts */}
        <mesh castShadow position={[0, 0.52, 0]} scale={[1, 0.55, 1]}>
          <sphereGeometry args={[0.13, 14, 10]} />
          <meshStandardMaterial color={skin} roughness={0.6} />
        </mesh>

        {/* NECK */}
        <mesh castShadow position={[0, 0.6, 0]}>
          <cylinderGeometry args={[0.05, 0.06, 0.1, 12]} />
          <meshStandardMaterial color={skin} roughness={0.6} />
        </mesh>

        {/* HEAD group — tilts independently */}
        <group ref={headTiltRef} position={[0, 0.7, 0]}>
          {/* head sphere */}
          <mesh castShadow ref={headRef}>
            <sphereGeometry args={[0.14, 20, 18]} />
            <meshStandardMaterial color={skin} roughness={0.55} />
          </mesh>
          {/* hair cap — top half-sphere */}
          <mesh castShadow position={[0, 0.02, -0.005]}>
            <sphereGeometry args={[0.145, 18, 16, 0, Math.PI * 2, 0, Math.PI / 2.1]} />
            <meshStandardMaterial color={hair} roughness={0.78} />
          </mesh>
          {/* hair tuft / side fade */}
          <mesh castShadow position={[0, -0.01, 0.04]} rotation={[0.3, 0, 0]}>
            <sphereGeometry args={[0.118, 16, 14, 0, Math.PI * 2, 0, Math.PI / 2.5]} />
            <meshStandardMaterial color={hair} roughness={0.78} />
          </mesh>
          {/* eyes — tiny dark spheres */}
          <mesh position={[-0.045, 0.0, 0.12]}>
            <sphereGeometry args={[0.012, 8, 8]} />
            <meshStandardMaterial color="#0a0d10" />
          </mesh>
          <mesh position={[0.045, 0.0, 0.12]}>
            <sphereGeometry args={[0.012, 8, 8]} />
            <meshStandardMaterial color="#0a0d10" />
          </mesh>
          {/* subtle mouth shadow */}
          <mesh position={[0, -0.06, 0.125]}>
            <boxGeometry args={[0.04, 0.005, 0.005]} />
            <meshStandardMaterial color="#3a1f1a" />
          </mesh>
        </group>

        {/* LEFT ARM — rooted at the delt, thicker bicep */}
        <group ref={leftArmRef} position={[-0.3, 0.48, 0]}>
          {/* upper arm (bicep) */}
          <mesh castShadow position={[0, -0.14, 0]}>
            <capsuleGeometry args={[0.058, 0.18, 6, 12]} />
            <meshStandardMaterial color={skin} roughness={0.6} />
          </mesh>
          {/* forearm pivot at elbow */}
          <group ref={leftForearmRef} position={[0, -0.34, 0]}>
            <mesh castShadow position={[0, -0.13, 0]}>
              <capsuleGeometry args={[0.045, 0.18, 6, 12]} />
              <meshStandardMaterial color={skin} roughness={0.6} />
            </mesh>
            {/* hand */}
            <mesh castShadow position={[0, -0.28, 0]}>
              <sphereGeometry args={[0.05, 12, 10]} />
              <meshStandardMaterial color={skin} roughness={0.65} />
            </mesh>
          </group>
        </group>

        {/* RIGHT ARM */}
        <group ref={rightArmRef} position={[0.3, 0.48, 0]}>
          <mesh castShadow position={[0, -0.14, 0]}>
            <capsuleGeometry args={[0.058, 0.18, 6, 12]} />
            <meshStandardMaterial color={skin} roughness={0.6} />
          </mesh>
          <group ref={rightForearmRef} position={[0, -0.34, 0]}>
            <mesh castShadow position={[0, -0.13, 0]}>
              <capsuleGeometry args={[0.045, 0.18, 6, 12]} />
              <meshStandardMaterial color={skin} roughness={0.6} />
            </mesh>
            <mesh castShadow position={[0, -0.28, 0]}>
              <sphereGeometry args={[0.05, 12, 10]} />
              <meshStandardMaterial color={skin} roughness={0.65} />
            </mesh>
          </group>
        </group>
      </group>

      {/* LEGS — anchored to hip world position (avatar group origin) */}
      <group ref={leftLegRef} position={[-0.09, 0.85, 0]}>
        {/* thigh (shorts) */}
        <mesh castShadow position={[0, -0.16, 0]}>
          <capsuleGeometry args={[0.07, 0.22, 6, 12]} />
          <meshStandardMaterial color={shorts} roughness={0.7} />
        </mesh>
        {/* knee pivot */}
        <group ref={leftKneeRef} position={[0, -0.35, 0]}>
          {/* shin (skin) */}
          <mesh castShadow position={[0, -0.2, 0]}>
            <capsuleGeometry args={[0.06, 0.28, 6, 12]} />
            <meshStandardMaterial color={skin} roughness={0.6} />
          </mesh>
          {/* shoe */}
          <group position={[0, -0.4, 0.04]}>
            <mesh castShadow>
              <boxGeometry args={[0.12, 0.07, 0.22]} />
              <meshStandardMaterial color={shoes} roughness={0.6} />
            </mesh>
            {/* shoe sole */}
            <mesh position={[0, -0.04, 0]}>
              <boxGeometry args={[0.13, 0.02, 0.23]} />
              <meshStandardMaterial color="#0a0d10" />
            </mesh>
          </group>
        </group>
      </group>

      <group ref={rightLegRef} position={[0.09, 0.85, 0]}>
        <mesh castShadow position={[0, -0.16, 0]}>
          <capsuleGeometry args={[0.07, 0.22, 6, 12]} />
          <meshStandardMaterial color={shorts} roughness={0.7} />
        </mesh>
        <group ref={rightKneeRef} position={[0, -0.35, 0]}>
          <mesh castShadow position={[0, -0.2, 0]}>
            <capsuleGeometry args={[0.06, 0.28, 6, 12]} />
            <meshStandardMaterial color={skin} roughness={0.6} />
          </mesh>
          <group position={[0, -0.4, 0.04]}>
            <mesh castShadow>
              <boxGeometry args={[0.12, 0.07, 0.22]} />
              <meshStandardMaterial color={shoes} roughness={0.6} />
            </mesh>
            <mesh position={[0, -0.04, 0]}>
              <boxGeometry args={[0.13, 0.02, 0.23]} />
              <meshStandardMaterial color="#0a0d10" />
            </mesh>
          </group>
        </group>
      </group>
    </group>
  )
}
