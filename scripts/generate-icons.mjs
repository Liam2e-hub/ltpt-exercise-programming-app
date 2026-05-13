// Generates PNG app icons for the LTPT PWA using only Node.js built-ins.
// Run: node scripts/generate-icons.mjs
import { writeFileSync, mkdirSync } from 'fs'
import { deflateSync } from 'zlib'

const crcTable = (() => {
  const t = new Uint32Array(256)
  for (let n = 0; n < 256; n++) {
    let c = n
    for (let k = 0; k < 8; k++) c = (c & 1) ? (0xEDB88320 ^ (c >>> 1)) : (c >>> 1)
    t[n] = c
  }
  return t
})()

function crc32(buf) {
  let c = 0xFFFFFFFF
  for (let i = 0; i < buf.length; i++) c = (c >>> 8) ^ crcTable[(c ^ buf[i]) & 0xFF]
  return (c ^ 0xFFFFFFFF) >>> 0
}

function pngChunk(type, data) {
  const lenBuf = Buffer.allocUnsafe(4)
  lenBuf.writeUInt32BE(data.length)
  const typeBuf = Buffer.from(type, 'ascii')
  const crcBuf = Buffer.allocUnsafe(4)
  crcBuf.writeUInt32BE(crc32(Buffer.concat([typeBuf, data])))
  return Buffer.concat([lenBuf, typeBuf, data, crcBuf])
}

function makePNG(size, drawFn) {
  const sig = Buffer.from([137, 80, 78, 71, 13, 10, 26, 10])

  const ihdr = Buffer.allocUnsafe(13)
  ihdr.writeUInt32BE(size, 0)
  ihdr.writeUInt32BE(size, 4)
  ihdr[8] = 8   // bit depth
  ihdr[9] = 2   // color type: RGB
  ihdr[10] = ihdr[11] = ihdr[12] = 0

  const raw = Buffer.allocUnsafe(size * (1 + size * 3))
  for (let y = 0; y < size; y++) {
    raw[y * (size * 3 + 1)] = 0  // filter: None
    for (let x = 0; x < size; x++) {
      const [r, g, b] = drawFn(x, y, size)
      const off = y * (size * 3 + 1) + 1 + x * 3
      raw[off] = r; raw[off + 1] = g; raw[off + 2] = b
    }
  }

  return Buffer.concat([
    sig,
    pngChunk('IHDR', ihdr),
    pngChunk('IDAT', deflateSync(raw)),
    pngChunk('IEND', Buffer.alloc(0)),
  ])
}

// Draws a barbell icon on a dark background
function drawIcon(x, y, size) {
  const nx = x / size
  const ny = y / size

  // Background: zinc-950
  const bg = [9, 9, 11]
  // Barbell: blue-500 with a slight indigo tint
  const fill = [79, 70, 229]   // indigo-600
  const accent = [99, 102, 241] // indigo-500

  // Round the icon with a soft corner mask (super-ellipse)
  const cx = nx - 0.5, cy = ny - 0.5
  const r = 0.42
  if (Math.pow(Math.abs(cx) / r, 8) + Math.pow(Math.abs(cy) / r, 8) > 1) return bg

  // Barbell shapes in normalized coords
  const bar       = nx >= 0.20 && nx <= 0.80 && ny >= 0.45 && ny <= 0.55
  const leftPlate = nx >= 0.10 && nx <= 0.26 && ny >= 0.30 && ny <= 0.70
  const rightPlate= nx >= 0.74 && nx <= 0.90 && ny >= 0.30 && ny <= 0.70
  const grip      = nx >= 0.38 && nx <= 0.62 && ny >= 0.38 && ny <= 0.62

  if (leftPlate || rightPlate || grip) return fill
  if (bar) return accent
  return bg
}

mkdirSync('public/icons', { recursive: true })

for (const size of [192, 512, 180]) {
  const filename = size === 180
    ? 'public/icons/apple-touch-icon.png'
    : `public/icons/icon-${size}.png`
  writeFileSync(filename, makePNG(size, drawIcon))
  console.log(`Generated ${filename}`)
}
