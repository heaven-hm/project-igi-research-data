# RES -- Resource Archive

**Extension:** `.res`
**Container:** ILFF with format ID `"IRES"` (at offset 0x10)

RES files bundle multiple named resources (models, textures, scripts, etc.) into a single archive.


## 5.1 Structure

```
[ILFF Header (20 bytes)]
  magic:     "ILFF"
  size:      total file size
  align:     4
  skip:      0
  format_id: "IRES"

[Repeated chunk pairs:]
  NAME chunk:
    fourcc: "NAME" (0x454D414E LE)
    size:   uint32 (length of name string including null terminator)
    data:   null-terminated filename string

  BODY chunk:
    fourcc: "BODY" (0x59444F42 LE)
    size:   uint32 (length of resource data)
    data:   raw binary resource data
```


## 5.2 Chunk Layout


| Field  | FourCC (LE hex) | Description                              |
|--------|-----------------|------------------------------------------|
| NAME   | 0x454D414E      | Resource name (null-terminated string)   |
| BODY   | 0x59444F42      | Resource data (raw bytes)                |


Chunks alternate NAME/BODY pairs. If a BODY chunk appears without a preceding NAME, it is assigned a synthetic name `<unnamed_N>`.


## 5.3 Alignment

All chunks are aligned to 4-byte boundaries. If a chunk's data does not end on a 4-byte boundary, 1-3 padding bytes are skipped before the next chunk.


## 5.4 RES Chunk Detail

Unlike MEF's linked-list chunks, RES uses a simpler 8-byte chunk header:


| Offset | Size | Type     | Description            |
|--------|------|----------|------------------------|
| 0x00   | 4    | uint32   | FourCC identifier      |
| 0x04   | 4    | uint32   | Data size              |


Data follows immediately at offset 0x08 from the chunk start.


## 5.5 Example

```
Offset  Description
0x0000  ILFF header: "ILFF" + file_size + 4 + 0 + "IRES"
0x0014  NAME chunk: "NAME" + 12 + "model_01.mef\0"
0x0028  BODY chunk: "BODY" + 1024 + [1024 bytes of MEF data]
0x042C  NAME chunk: "NAME" + 11 + "texture.tex\0"
0x043F  (1 byte padding to align to 4)
0x0440  BODY chunk: "BODY" + 2048 + [2048 bytes of TEX data]
...
```
