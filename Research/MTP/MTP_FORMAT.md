# MTP -- Model-Texture Package

**Extension:** `.mtp`
**Container:** FORM/IFF (EA IFF-85 variant with big-endian sizes)

MTP files define which textures belong to which models for a given level or asset group.

## 6.1 File Header (12 bytes)

| Offset | Size | Type         | Description                         |
|--------|------|--------------|-------------------------------------|
| 0x00   | 4    | char[4]      | Magic: `"FORM"`                     |
| 0x04   | 4    | uint32 (BE)  | FORM payload size (big-endian)      |
| 0x08   | 4    | char[4]      | Format ID: `"MTP "` (with trailing space) |

## 6.2 IFF Chunk Header (8 bytes)

| Offset | Size | Type         | Description                    |
|--------|------|--------------|--------------------------------|
| 0x00   | 4    | char[4]      | FourCC chunk type              |
| 0x04   | 4    | uint32 (BE)  | Data size (big-endian)         |

Chunks are aligned to 2-byte boundaries (standard IFF). If data size is odd, one padding byte follows.

## 6.3 Chunk Types

| FourCC | Description                            | Data Format              |
|--------|----------------------------------------|--------------------------|
| `BANM` | Bone animation names                   | String array             |
| `SNDS` | Sound names                            | String array             |
| `SVOL` | Shadow volume names                    | String array             |
| `MODS` | Model filenames                        | String array             |
| `VNAM` | Vertex names                           | String array             |
| `TEXF` | Texture filenames                      | String array             |
| `PALF` | Palette filenames                      | String array             |
| `GTT`  | (Unknown purpose)                      | -                        |
| `INST` | Model-texture instance mappings        | Instance array (see below) |

## 6.4 String Array Format

All string-list chunks (BANM, SVOL, MODS, TEXF, etc.) use this layout:

| Offset | Size | Type   | Description                                    |
|--------|------|--------|------------------------------------------------|
| 0x00   | 4    | uint32 (LE) | count -- number of strings                |
| 0x04   | var  | char[] | `count` null-terminated strings packed sequentially |

Note: The count field is little-endian despite the IFF chunk sizes being big-endian.

## 6.5 INST Chunk -- Instance Mappings

The INST chunk maps each model to its texture list:

| Offset | Size | Type        | Description                           |
|--------|------|-------------|---------------------------------------|
| 0x00   | 4    | uint32 (LE) | count -- number of mapping entries    |

Each entry (variable length):

| Offset | Size       | Type        | Description                           |
|--------|------------|-------------|---------------------------------------|
| 0x00   | 2          | uint16 (LE) | modelIdx -- index into MODS array    |
| 0x02   | 2          | uint16 (LE) | texCount -- number of textures       |
| 0x04   | texCount*2 | uint16 (LE)[] | Array of texture indices into TEXF |

## 6.6 Example Parsing Flow

```
1. Validate "FORM" magic and read BE size
2. Validate "MTP " format ID at offset 8
3. Iterate chunks from offset 12:
   - Parse MODS -> list of model names
   - Parse TEXF -> list of texture names
   - Parse INST -> resolve model/texture indices to names
4. Each INST entry: model_name = MODS[modelIdx], textures = TEXF[texIdx] for each texIdx
```
