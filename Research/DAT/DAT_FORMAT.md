# DAT -- Asset List

**Extension:** `.dat`
**Container:** None (plain text)
**Location:** `missions/location0/levelN/levelN.dat`

DAT files are text-based lookup tables that map model IDs to their texture IDs within a specific level.

## 7.1 Format

The file is a sequence of whitespace-separated tokens, one per line. Lines starting with `***` are comments and are skipped. Empty lines are skipped.

```
<total_texture_entry_count>
<model_id_1>
<texture_count_1>
<texture_id_1a>
<texture_id_1b>
...
<model_id_2>
<texture_count_2>
<texture_id_2a>
...
```

## 7.2 Token Sequence

| Token Index | Description                                          |
|-------------|------------------------------------------------------|
| 0           | Total texture entry count (informational, not used for parsing) |
| 1           | First model ID (string, e.g. `"300_01_1"`)           |
| 2           | Number of textures for first model (integer)         |
| 3..N        | Texture IDs for first model (strings)                |
| N+1         | Second model ID                                      |
| ...         | Repeating pattern                                    |

## 7.3 Example

```
*** Level 1 texture assignments ***
15
300_01_1
3
wall_brick
wall_concrete
floor_tile
301_01_1
1
metal_door
```

This maps:
- Model `300_01_1` to textures: `wall_brick`, `wall_concrete`, `floor_tile`
- Model `301_01_1` to texture: `metal_door`

The texture IDs correspond to `.tex` files in the level's `textures/` directory (e.g., `wall_brick.tex`).
