# FNT -- Font Format

FNT files store bitmap fonts used for in-game text rendering. Each file is an ILFF container (content type `FONT`) holding a texture atlas with glyph images and metadata that maps character codes to regions within that atlas.


## 10.1 Structure Overview

```text
┌─────────────────────────────────────┐
│ ILFF Header (16 bytes)              │
│   Signature: "ILFF"                 │
│   File size, version, reserved      │
├─────────────────────────────────────┤
│ Content type: "FONT" (4 bytes)      │
├─────────────────────────────────────┤
│ FNTH Chunk — Font header            │
├─────────────────────────────────────┤
│ ANMF Chunk — Glyph metrics          │
├─────────────────────────────────────┤
│ TRN2 Chunk — Character code mapping │
├─────────────────────────────────────┤
│ TEXH Chunk — Texture header         │
├─────────────────────────────────────┤
│ BODY Chunk — RGBA texture atlas     │
└─────────────────────────────────────┘
```

Each chunk follows the standard ILFF chunk layout:


| Field     | Type   | Description                           |
|-----------|--------|---------------------------------------|
| FourCC    | 4s     | Chunk signature (e.g. `FNTH`, `ANMF`) |
| Length    | uint32 | Content length in bytes               |
| Alignment | uint32 | Padding alignment (always 4)          |
| Offset    | uint32 | Offset to next chunk (0 if last)      |


## 10.2 FNTH — Font Header

24 bytes, 6 × uint32 little-endian.


| Offset | Type   | Field       | Description                   |
|--------|--------|-------------|-------------------------------|
| 0      | uint32 | version     | Format version (always 1)     |
| 4      | uint32 | num_glyphs  | Number of glyphs in the font  |
| 8      | uint32 | cell_height | Line height in pixels         |
| 12     | uint32 | unknown_01  | Unknown                       |
| 16     | uint32 | unknown_02  | Unknown (always 1)            |
| 20     | uint32 | unknown_03  | Unknown (same as cell_height) |


Typical values across game files:


| Font file           | Glyphs | Cell height | Texture size |
|---------------------|--------|-------------|--------------|
| font2.fnt           | 158    | 11          | 128 × 64     |
| font1.fnt           | 158    | 13          | 128 × 128    |
| fontmp.fnt          | 154    | 16          | 128 × 128    |
| loadfontbig1024.fnt | 158    | 20          | 256 × 128    |
| loadfontbig1280.fnt | 158    | 25          | 256 × 256    |


## 10.3 ANMF — Glyph Metrics

`num_glyphs × 40` bytes. Each entry describes one glyph's position in the texture atlas and its pixel dimensions.

### Glyph entry (40 bytes)


| Offset | Type   | Field      | Description                                   |
|--------|--------|------------|-----------------------------------------------|
| 0      | float  | v_top      | Top edge V coordinate (normalized 0–1)        |
| 4      | float  | u_left     | Left edge U coordinate (normalized 0–1)       |
| 8      | float  | v_offset   | Vertical offset (normalized, purpose unclear) |
| 12     | float  | u_right    | Right edge U coordinate (normalized 0–1)      |
| 16     | float  | v_bottom   | Bottom edge V coordinate (normalized 0–1)     |
| 20     | uint16 | pad_0      | Padding (always 0)                            |
| 22     | uint16 | width      | Glyph width in pixels                         |
| 24     | uint16 | height     | Glyph height in pixels                        |
| 26     | uint16 | advance_x  | Horizontal advance (typically width + 1)      |
| 28     | uint16 | height_2   | Duplicate of height                           |
| 30     | uint16 | pad_1      | Padding (always 0)                            |
| 32     | uint32 | pad_2      | Padding (usually 0)                           |
| 36     | int32  | unknown_01 | Unknown flag or kerning value                 |


UV coordinates are normalized to the texture dimensions from the TEXH chunk. To convert to pixel coordinates:

```text
pixel_x = int(u_left  × texture_width)
pixel_y = int(v_top   × texture_height)
pixel_w = width
pixel_h = height
```

### Glyph packing

Glyphs are packed left-to-right into rows within the texture atlas. When a row is full, packing continues on a new row. The `v_top` / `v_bottom` coordinates reflect the vertical position of each glyph's row.


## 10.4 TRN2 — Character Code Mapping

`num_glyphs × 2` bytes. An array of uint16 values mapping each glyph index to its character code point.


| Glyph index | Char code | Character |
|-------------|-----------|-----------|
| 0           | 33        | !         |
| 1           | 34        | "         |
| 2           | 35        | #         |


The mapping covers ASCII printable characters (33–126) and extended Latin characters (codes 128–252) for European language support.


## 10.5 TEXH — Texture Header

24 bytes, 12 × uint16 little-endian.


| Offset | Type   | Field       | Description                          |
|--------|--------|-------------|--------------------------------------|
| 0      | uint16 | format      | Texture format (always 3 = ARGB8888) |
| 2–12   | uint16 | unknown     | 6 × padding (always 0)               |
| 14     | uint16 | width       | Texture width in pixels              |
| 16     | uint16 | height      | Texture height in pixels             |
| 18     | uint16 | width_2     | Duplicate of width                   |
| 20     | uint16 | height_2    | Duplicate of height                  |
| 22     | uint16 | pixel_depth | Bits per pixel info (always 32)      |


## 10.6 BODY — Texture Atlas

`width × height × 4` bytes of raw BGRA pixel data (4 bytes per pixel).

The texture stores glyphs as follows:


| Channel | Content                                           |
|---------|---------------------------------------------------|
| B, G, R | Glyph color (typically white `0xFF` or grayscale) |
| A       | Glyph shape / opacity                             |


Some fonts (e.g. `font2.fnt`) are strictly binary — only values `0x00` and `0xFF` — producing sharp pixel fonts. Others (e.g. `fontmp.fnt`) use grayscale alpha values for anti-aliased rendering.
