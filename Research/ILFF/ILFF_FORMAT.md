# ILFF Container

ILFF ("Innerloop File Format") is the shared binary container used by MEF and RES files. It consists of a 20-byte file header followed by a linked chain of 16-byte chunks.


## 1.1 File Header (20 bytes)


| Offset | Size | Type     | Description                               |
|--------|------|----------|-------------------------------------------|
| 0x00   | 4    | char[4]  | Magic: `"ILFF"` (ASCII, 0x494C4646)      |
| 0x04   | 4    | uint32   | Total file size (must equal actual size)  |
| 0x08   | 4    | uint32   | Alignment (always 4)                      |
| 0x0C   | 4    | uint32   | Skip (always 0 in the outer header)       |
| 0x10   | 4    | char[4]  | Format ID (e.g. `"HSEM"` for MEF, `"IRES"` for RES) |


## 1.2 Chunk Header (16 bytes)

Each chunk inside the ILFF container begins with a 16-byte header:


| Offset | Size | Type     | Description                                         |
|--------|------|----------|-----------------------------------------------------|
| 0x00   | 4    | char[4]  | FourCC chunk identifier (e.g. `"XTRV"`, `"DNER"`)  |
| 0x04   | 4    | uint32   | Data size (bytes following this header)             |
| 0x08   | 4    | uint32   | Alignment                                           |
| 0x0C   | 4    | uint32   | Skip (offset from chunk start to next chunk; 0 = last chunk) |


**Chunk linking:** If `skip == 0`, the chunk is the last in the chain and data follows immediately. Otherwise, the next chunk header begins at `chunk_start + skip`. This linked-list approach allows the engine to skip unknown chunks efficiently.


## 1.3 Example: Minimal ILFF file

```
Offset  Hex                                         ASCII
0x0000  49 4C 46 46  00 01 00 00  04 00 00 00  00 00 00 00   ILFF............
0x0010  48 53 45 4D                                           HSEM
0x0014  [chunk headers and data follow]
```
