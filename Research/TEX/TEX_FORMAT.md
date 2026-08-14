# TEX Format - Consolidated Reference

Auto-generated consolidation of 3 research files.

---

## PIC_FORMAT.md

Picture texture. The `.pic` extension is the shared TEX container under a different name — same `LOOP` signature, same versions, same pixel modes — read by the shared `core` TEX parser and converted to `.tga` by the same converter.

See **[TEX Format](TEX_FORMAT.md)** for the full layout, pixel-mode table, and TGA conversion fidelity. There is no PIC-specific behavior.

---

## SPR_FORMAT.md

Sprite texture. The `.spr` extension is the shared TEX container under a different name — same `LOOP` signature, same versions, same pixel modes — read by the shared `core` TEX parser and converted to `.tga` by the same converter.

See **[TEX Format](TEX_FORMAT.md)** for the full layout, pixel-mode table, and TGA conversion fidelity. There is no SPR-specific behavior.

---

## TEX_FORMAT.md

**Extension:** `.tex`
**Container:** None (raw structured binary)

TEX files store texture image data. All versions share a common 8-byte header prefix, followed by version-specific fields and pixel data.

## 3.1 Common Header (8 bytes)

| Offset | Size | Type   | Description                                            |
|--------|------|--------|--------------------------------------------------------|
| 0x00   | 4    | uint32 | Magic: `"LOOP"` (0x504F4F4C, fourcc `'L','O','O','P'`) |
| 0x04   | 4    | int32  | Version (2, 7, 9, or 11)                              |

## 3.2 Color Modes

| Mode ID | Name       | Bits/Pixel | Pixel Format                                                 |
|---------|------------|------------|--------------------------------------------------------------|
| 2       | ARGB1555   | 16         | `ABBBBBGGGGGRRRRR` -- 5 bits each for B, G, R (bits 0-14), alpha bit 15 ignored |
| 3       | RGB24/32   | 24 or 32   | 24-bit: 3 bytes per pixel (swizzled); 32-bit: 4 bytes per pixel (swizzled with alpha) |
| 67      | BGRA8888   | 32         | 4 bytes per pixel: B, G, R, A                               |

**Pixel decoding notes (all modes):**
- Rows are stored top-to-bottom; the loader flips vertically for OpenGL (bottom-left origin).
- Mode 2: Each 16-bit pixel is decoded as `B = bits[4:0], G = bits[9:5], R = bits[14:10]`, each scaled from 5-bit to 8-bit range (`value * 255.0 / 31.0`). Alpha is forced to 255.
- Mode 3: If `line_width / image_width == 4`, treat as 32-bit (BGRA swizzled). Otherwise treat as 24-bit (BGR swizzled to RGB). The output swizzle is `dst[R,G,B,A] = src[channel2, channel0, channel1, alpha]`.
- Mode 67: Treated identically to 32-bit Mode 3 (BGRA swizzled to RGBA).

## 3.3 Version 2 -- Simple Single-Layer

**Header structure: `tex_head_v2_s` (20 bytes)**

| Offset | Size | Type   | Field             |
|--------|------|--------|-------------------|
| 0x00   | 4    | uint32 | ident (`"LOOP"`)  |
| 0x04   | 4    | int32  | version (2)       |
| 0x08   | 4    | int32  | image_mode        |
| 0x0C   | 4    | int32  | unk0              |
| 0x10   | 2    | int16  | image_line_width  |
| 0x12   | 2    | int16  | image_width       |
| 0x14   | 2    | int16  | image_height      |
| 0x16   | 2    | int16  | bytes_per_pixel   |

**Pixel data:** Immediately follows the header at offset 0x18.
**Validation:** `image_line_width / image_width` must equal 2 (16-bit pixels only in v2).
**Pixel data size:** `image_width * image_height * 2` bytes.

## 3.4 Version 7 -- Multi-Layer (Shared Mode)

**Header structure: `tex_head_v7_s` (52 bytes)**

| Offset | Size | Type   | Field             |
|--------|------|--------|-------------------|
| 0x00   | 4    | uint32 | ident (`"LOOP"`)  |
| 0x04   | 4    | int32  | version (7)       |
| 0x08   | 4    | int32  | unk0              |
| 0x0C   | 4    | int32  | unk1              |
| 0x10   | 4    | int32  | unk2              |
| 0x14   | 4    | int32  | unk3              |
| 0x18   | 4    | int32  | unk4              |
| 0x1C   | 4    | int32  | footer_offset     |
| 0x20   | 4    | int32  | layer_count       |
| 0x24   | 4    | int32  | unk5              |
| 0x28   | 4    | int32  | image_width       |
| 0x2C   | 4    | int32  | image_height      |
| 0x30   | 4    | int32  | image_mode        |

**Layer descriptors** follow at offset 0x34 (immediately after header). Each layer is `tex_layer_v7_s` (40 bytes):

| Offset | Size | Type   | Field             |
|--------|------|--------|-------------------|
| 0x00   | 4    | int32  | image_offset      |
| 0x04   | 4    | int32  | image_line_width  |
| 0x08   | 2    | int16  | image_width       |
| 0x0A   | 2    | int16  | unk0              |
| 0x0C   | 2    | int16  | image_height      |
| 0x0E   | 26   | -      | reserved          |

All layers share the same `image_mode` from the file header. Pixel data for each layer starts at `file_start + image_offset`.

## 3.5 Version 9 -- Multi-Layer (Per-Layer Mode)

**Header structure: `tex_head_v9_s` (52 bytes)**
Identical layout to v7 header (same offsets and fields).

**Layer descriptors** follow at offset 0x34. Each layer is `tex_layer_s` (32 bytes):

| Offset | Size | Type   | Field             |
|--------|------|--------|-------------------|
| 0x00   | 4    | int32  | image_offset      |
| 0x04   | 4    | int32  | image_mode        |
| 0x08   | 2    | int16  | image_line_width  |
| 0x0A   | 2    | int16  | image_width       |
| 0x0C   | 2    | int16  | image_height      |
| 0x0E   | 2    | int16  | unk0              |
| 0x10   | 16   | -      | reserved          |

**Key difference from v7:** Each layer has its own `image_mode` field (at layer offset 0x04), rather than inheriting from the file header.

**Footer:** A validation footer exists at `file_start + footer_offset`:

| Offset | Size | Type   | Field             |
|--------|------|--------|-------------------|
| 0x00   | 4    | uint32 | ident (`"LOOP"`)  |
| 0x04   | 4    | int32  | version           |
| 0x08   | 2    | int16  | unk0              |
| 0x0A   | 2    | int16  | unk1              |
| 0x0C   | 2    | int16  | unk2              |
| 0x0E   | 2    | int16  | unk3              |
| 0x10   | 4    | int32  | count_x           |
| 0x14   | 4    | int32  | count_y           |

The footer `ident` must match `TEX_IDENT` (`"LOOP"`) or the file is rejected.

## 3.6 Version 11 -- Mipmapped

**Header structure: `tex_head_v11_s` (32 bytes)**

| Offset | Size | Type   | Field              |
|--------|------|--------|--------------------|
| 0x00   | 4    | uint32 | ident (`"LOOP"`)   |
| 0x04   | 4    | int32  | version (11)       |
| 0x08   | 4    | int32  | image_mode         |
| 0x0C   | 4    | int32  | unk0               |
| 0x10   | 4    | int32  | unk1               |
| 0x14   | 2    | int16  | unk2               |
| 0x16   | 2    | int16  | image_width        |
| 0x18   | 2    | int16  | image_height       |
| 0x1A   | 2    | int16  | unk3               |
| 0x1C   | 2    | int16  | unk4               |
| 0x1E   | 2    | int16  | bytes_per_pixel    |

**Pixel data:** Starts at offset 0x20 (immediately after header). Only the first mip level is loaded.
**Line width:** Computed as `unk3 * bytes_per_pixel`. This is the byte stride per row.

## 3.7 Tiles vs. mip levels

The multi-image versions store their extra images for two different reasons:

- **`TEX07` / `TEX09` store tiles.** The trailing `TEX06` footer (seen in the footer tables) carries a `count_x × count_y` grid. Each item is a full-resolution tile, and the bitmap reassembles them row-major into one image. All tiles are read at the parent header's `width`/`height`.
- **`TEX11` stores a mip chain.** Up to ten levels follow the header, each half the dimensions of the previous one (level *n* is `width >> n` × `height >> n`). Level 0 is the full-resolution base image.

---

