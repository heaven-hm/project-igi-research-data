# MEF -- 3D Model

**Extension:** `.mef`
**Container:** ILFF with format ID `"HSEM"` (at offset 0x10)

MEF files store 3D geometry for buildings, props, characters, and vehicles. The game uses a Z-up coordinate system. Vertex positions in MEF files are stored in native game units; the editor applies a scale factor of **1.0 / 40.96** when importing to convert to meters.

```c
constexpr float kNativeMefImportScale = 1.0f / 40.96f;
```

## 2.1 Chunk Overview

A typical MEF file contains these chunks (order may vary):

| FourCC | Name                | Description                                               |
|--------|---------------------|-----------------------------------------------------------|
| `HSEM` | Mesh Info           | Model metadata including model type                       |
| `XTRV` | Vertices (render)   | Interleaved vertex data for rendering                     |
| `DNER` | Render blocks       | Triangle indices + per-block metadata                     |
| `ECAF` | Face indices        | Separate index buffer (used by Type 1 bone models)        |
| `D3DR` | D3D Render info     | Face/mesh/vertex counts                                   |
| `XTVC` | Collision vertices  | Collision mesh vertices (16 bytes each, IGI 1)            |
| `ECFC` | Collision faces     | Collision mesh face indices (8 bytes each, IGI 1)         |
| `TAMC` | Material config     | Per-face material properties (opacity, diffuse, portal)   |
| `ATTA` | Attachments         | Sub-model attachment points with transform matrix (68 bytes each) |
| `XTVM` | Magic vertices      | Special-purpose vertices for game events (16 bytes each)  |
| `REIH` | Bone hierarchy      | Bone parent/child relationships and rest-pose pivots      |
| `MANB` | Bone names          | Bone name strings (16 bytes each, null-padded)            |
| `TROP` | Portal records      | Portal zone entries (20 bytes each)                       |
| `XVTP` | Portal vertices     | Portal mesh vertex positions (12 bytes each)              |
| `CFTP` | Portal faces        | Portal mesh triangle indices (12 bytes each)              |
| `PMTL` | Portal materials    | Material IDs for portal zones (16 bytes each)             |

## 2.2 HSEM Chunk -- Mesh Info

The HSEM chunk contains model metadata. The model type field is critical for determining vertex layout.

| Offset (in chunk data) | Size | Type   | Description           |
|------------------------|------|--------|-----------------------|
| 0x00                   | 32   | -      | Reserved / unknown    |
| 0x20                   | 4    | uint32 | **Model type** (0, 1, or 3) |

The chunk must be at least 36 bytes to contain the model type field.

## 2.3 Model Types and Vertex Layouts

### Type 0 -- Rigid Model (32-byte vertex)
Used for static props and buildings with no skeletal animation.

| Byte Offset | Size | Type    | Field         |
|-------------|------|---------|---------------|
| 0x00        | 4    | float32 | Position X    |
| 0x04        | 4    | float32 | Position Y    |
| 0x08        | 4    | float32 | Position Z    |
| 0x0C        | 4    | float32 | Normal X      |
| 0x10        | 4    | float32 | Normal Y      |
| 0x14        | 4    | float32 | Normal Z      |
| 0x18        | 4    | float32 | UV U          |
| 0x1C        | 4    | float32 | UV V          |
**Total: 32 bytes per vertex.** UV offset within vertex: 24.

### Type 1 -- Bone/Skeletal Model (40-byte vertex)
Used for animated characters and objects with skeletal rigs.

**Note on Animations & Skeletons:**
They are not in a single file because one animation can be applied to different models. For example, enemy soldiers from level to level have different models but animations are the same. 

But there is a constraint that defines which animations to which models we can apply: the skeleton of the model should be exactly the same as the skeleton of the animation, exactly the same number of bones, exactly the same joints, and exactly the same names.

Some MEFs have two chunks `REIH` (reversed HIER - Bone Hierarchy) and `MANB` (reversed BNAM - Bone names).
* `REIH` contains the bones, their hierarchy, and their offsets.
* `MANB` contains names.

All IFFs have a chunk `REIH` (bone hierarchy). The binary structure is exactly the same as in MEFs `REIH`. But `MANB` (bone names) in IFFs we don't have. So you should have hardcoded bone names in your animation exporter.
Fortunately, in IGI 2 we have only two variations of skeletons:
* with 31 bones - for 3rd party animations
* with 47 bones - for 1st party animations

| Byte Offset | Size | Type    | Field             |
|-------------|------|---------|-------------------|
| 0x00        | 4    | float32 | Position X        |
| 0x04        | 4    | float32 | Position Y        |
| 0x08        | 4    | float32 | Position Z        |
| 0x0C        | 4    | float32 | Normal X          |
| 0x10        | 4    | float32 | Normal Y          |
| 0x14        | 4    | float32 | Normal Z          |
| 0x18        | 4    | float32 | UV0 U             |
| 0x1C        | 4    | float32 | UV0 V             |
| 0x20        | 4    | float32 | UV1 U / bone data |
| 0x24        | 4    | float32 | UV1 V / bone data |
**Total: 40 bytes per vertex.** Primary UV offset within vertex: 24.

### Type 3 -- Lightmap Model (40-byte vertex)
Used for level geometry with lightmap UVs.

| Byte Offset | Size | Type    | Field              |
|-------------|------|---------|-------------------|
| 0x00        | 4    | float32 | Position X         |
| 0x04        | 4    | float32 | Position Y         |
| 0x08        | 4    | float32 | Position Z         |
| 0x0C        | 4    | float32 | UV0 U (primary)    |
| 0x10        | 4    | float32 | UV0 V (primary)    |
| 0x14        | 4    | float32 | UV1 U (lightmap)   |
| 0x18        | 4    | float32 | UV1 V (lightmap)   |
| 0x1C        | 12   | -       | Additional data    |
**Total: 40 bytes per vertex.** Primary UV offset within vertex: 12.

### Summary Table
| Model Type | Vertex Size | UV Offset | Description |
|------------|-------------|-----------|-------------|
| 0          | 32 bytes    | 24        | Rigid (pos + normal + uv) |
| 1          | 40 bytes    | 24        | Bone/skeletal (pos + normal + uv0 + uv1) |
| 3          | 40 bytes    | 12        | Lightmap (pos + uv0 + uv1 + ...) |
The vertex count is determined by: `XTRV.chunk_data_size / vertex_size`.

## 2.4 D3DR Chunk -- Render Info
The D3DR chunk stores face, mesh, and vertex counts. Its layout depends on the model type.

### Type 0 (Rigid) -- D3DR Layout
| Offset | Size | Type   | Field       |
|--------|------|--------|-------------|
| 0x00   | 4    | uint32 | (unknown)   |
| 0x04   | 4    | uint32 | numFaces    |
| 0x08   | 4    | uint32 | numMeshes   |
| 0x0C   | 4    | uint32 | numVerts    |
Minimum chunk size: 16 bytes.

### Type 1 (Bone) -- D3DR Layout
| Offset | Size | Type   | Field       |
|--------|------|--------|-------------|
| 0x00   | 4    | uint32 | (unknown)   |
| 0x04   | 4    | uint32 | numFaces    |
| 0x08   | 4    | uint32 | numMeshes   |
| 0x0C   | 4    | uint32 | verts0      |
| 0x10   | 4    | uint32 | verts1      |
| 0x14   | 4    | uint32 | numVerts    |
Minimum chunk size: 24 bytes.

### Type 3 (Lightmap) -- D3DR Layout
| Offset | Size | Type   | Field       |
|--------|------|--------|-------------|
| 0x00   | 4    | uint32 | (unknown)   |
| 0x04   | 4    | uint32 | (unknown)   |
| 0x08   | 4    | uint32 | numFaces    |
| 0x0C   | 4    | uint32 | numMeshes   |
| 0x10   | 4    | uint32 | numVerts    |
Minimum chunk size: 20 bytes.

## 2.5 DNER Chunk -- Render Blocks / Triangle Indices
The DNER chunk encodes triangle indices organized into render blocks (one per material/submesh). There are two parsing strategies depending on the model type.

### 2.5.1 Packed DNER (Type 0 and Type 3, fallback for Type 1)
Each render block has a variable-length header followed by packed uint16 index triples.

**Block header (28 bytes for Type 0/1, 32 bytes for Type 3):**
| Offset | Size | Type   | Field                    | Notes                    |
|--------|------|--------|--------------------------|--------------------------|
| 0x00   | 12   | -      | Reserved/unknown         |                          |
| 0x0C   | 2    | int16  | indexCount               | Number of uint16 indices |
| 0x0E   | 2    | int16  | nextoffs                 | -1 = last block          |
| 0x10   | 2    | int16  | materialSlot (Type 3)    | Only present in Type 3   |
| 0x12   | 2    | uint16 | vertsOffset              | Base vertex offset       |
| 0x14   | 2    | uint16 | vertsCount               | Vertex count for block   |

For Type 0/1, `materialSlot` is the block's sequential index. For Type 0/1, `vertsOffset` is at byte 18 and `vertsCount` at byte 20 (0-indexed within the block header).
**Index data:** Immediately following the header, `indexCount` uint16 values are packed. Every 3 consecutive indices define one triangle. The final vertex index for each triangle is `vertsOffset + local_index`. The linked iteration terminates when `nextoffs == -1`.

### 2.5.2 Split Bone DNER (Type 1 with ECAF)
When a Type 1 model has both DNER and ECAF chunks, the DNER chunk contains fixed-size bone records (32 or 28 bytes each), and the ECAF chunk contains the actual triangle indices.

**DNER bone record (28-byte and 32-byte variants):**
| Offset (28-byte) | Offset (32-byte) | Size | Type    | Field        | Description                                  |
|------------------|------------------|------|---------|--------------|----------------------------------------------|
| 0x00             | 0x00             | 12   | float32 | `px, py, pz` | Joint rest-pose local position translation  |
| 0x0C             | 0x0C             | 2    | uint16  | `numFace`    | Index count (in bytes: `numFace * 2` index)   |
| 0x0E             | 0x0E             | 2    | int16   | `skip`       | Offset index                                 |
| -                | 0x10             | 2    | int16   | `td`         | Texture descriptor index                     |
| 0x10             | 0x12             | 2    | uint16  | `offVerts`   | Base vertex offset                           |
| 0x12             | 0x14             | 2    | uint16  | `numVerts`   | Vertex count in this bone submesh            |
| 0x14             | 0x16             | 2    | uint16  | `rawOpacity` | Base material opacity index                  |
| 0x16             | 0x18             | 1    | uint8   | `eflame`     | Emissive flame multiplier                    |
| 0x17             | 0x19             | 1    | uint8   | `mshine`     | Material shininess factor                    |
| 0x18             | 0x1A             | 1    | uint8   | `scolor`     | Specular color (or diffuse color index)      |
| 0x19             | 0x1B             | 1    | uint8   | `opacitd`    | Opacity detail                               |
| -                | 0x1C             | 4    | uint32  | `_0`         | Padding/alignment zero bytes                 |

* **Record stride detection:** The record size is auto-detected: if `DNER.size % 32 == 0` use 32-byte records; else if `DNER.size % 28 == 0` use 28-byte records; otherwise fall back to packed DNER parsing.
* **ECAF index buffer:** A flat array of uint16 values. For each bone record, read `numFace` indices starting at `ECAF.data + offsetIndex * 2`. Indices in ECAF are **global** vertex indices (no vertsOffset addition needed).

### 2.5.3 Skeletal Archetypes & The "Missing Skeleton" Problem
A major limitation of the original binary `.mef` file format for skeletal models (`modelType == 1`) is that it **completely lacks skeletal tree hierarchy definitions**. The binary files only contain vertex blending weight tables (mapping which vertex is influenced by which raw bone index). They do not store:
1. **Bone Names** (e.g. `"head"`, `"left hand"`, `"shoulders"`).
2. **Parent-Child Linkages** (which joints are connected to which, which is necessary for forward kinematics and joint rotations).
3. **Rest-Pose Bone Lengths/Offsets** (`px, py, pz`).

To solve this, the game engine originally compiled the default character skeletons directly into the executable binary (`igi.exe`/`loop.dll`). The Level Editor restores these missing hierarchies at runtime by matching model filenames or the maximum bone counts to hardcoded **Skeletal Archetypes** via the `BoneRigType` enum:

```cpp
enum class BoneRigType {
    JonesCinematic = 0,    // Type 0: David Jones and key cinematic actors
    StandardSoldier = 1,   // Type 1: Default soldiers and player model
    HeavySoldier = 6,      // Type 6: Heavy/special soldier models
    AdvancedFingerRig = 48 // Type 48: Character models with advanced hand rig
};
```
* **JonesCinematic (Type 0):** A 32-bone skeletal rig with custom bone proportions tailored for David Jones (`000_01_1`), `009_02_1`, and `008_01_1` models.
* **StandardSoldier (Type 1):** The default 32-bone rig used by the player model (`001_01_1`) and standard combat NPC AI soldiers.
* **HeavySoldier (Type 6):** An adjusted 32-bone rig with wider shoulder and elbow structures designed to prevent heavy armor plates from clipping on special guards (`012_01_1`, `015_01_1`, `028_01_1`).
* **AdvancedFingerRig (Type 48):** Selected automatically when `maxBoneIdx` matches `48`, mapping a highly articulate 48-bone hand and attachment skeleton.

## 2.6 ECAF Chunk -- Face Index Buffer
A flat array of `uint16` triangle indices, used by Type 1 (bone) models with split DNER parsing. Total index count: `ECAF.size / 2`.

## 2.7 Collision Mesh Chunks
When no render geometry is available (no XTRV/DNER), the parser falls back to collision geometry.

### XTVC -- Collision Vertices (16 bytes each)
| Offset | Size | Type    | Field      |
|--------|------|---------|------------|
| 0x00   | 4    | float32 | Position X |
| 0x04   | 4    | float32 | Position Y |
| 0x08   | 4    | float32 | Position Z |
| 0x0C   | 4    | -       | Padding    |
Vertex count: `XTVC.size / 16`. UVs are synthesized as `(x * 0.1, z * 0.1)`.

### ECFC -- Collision Faces (8 bytes each)
| Offset | Size | Type   | Field       |
|--------|------|--------|-------------|
| 0x00   | 2    | uint16 | Index A     |
| 0x02   | 2    | uint16 | Index B     |
| 0x04   | 2    | uint16 | Index C     |
| 0x06   | 2    | -      | Padding     |
Face count: `ECFC.size / 8`.

## 2.8 ATTA Chunk -- Attachment Points (68 bytes each)
ATTA records place named sub-models onto a parent model with a local position and 3x3 rotation matrix. Sub-models can be static visual parts or MagicObjects with runtime behavior (see MagicObject System).

| Offset | Size | Type     | Field     | Description                                        |
|--------|------|----------|-----------|----------------------------------------------------|
| 0x00   | 16   | char[16] | name      | Sub-model name (null-padded, e.g. `"600_02_1"`)    |
| 0x10   | 4    | float32  | px        | Local position X (raw MEF units, NOT scaled)       |
| 0x14   | 4    | float32  | py        | Local position Y                                   |
| 0x18   | 4    | float32  | pz        | Local position Z                                   |
| 0x1C   | 4    | float32  | r00       | Rotation matrix row 0, col 0                       |
| 0x20   | 4    | float32  | r01       | Rotation matrix row 0, col 1                       |
| 0x24   | 4    | float32  | r02       | Rotation matrix row 0, col 2                       |
| 0x28   | 4    | float32  | r03       | Rotation matrix row 1, col 0                       |
| 0x2C   | 4    | float32  | r04       | Rotation matrix row 1, col 1                       |
| 0x30   | 4    | float32  | r05       | Rotation matrix row 1, col 2                       |
| 0x34   | 4    | float32  | r06       | Rotation matrix row 2, col 0                       |
| 0x38   | 4    | float32  | r07       | Rotation matrix row 2, col 1                       |
| 0x3C   | 4    | float32  | r08       | Rotation matrix row 2, col 2                       |
| 0x40   | 4    | int32    | boneId    | Parent bone index (-1 = not bone-attached)         |

**Total: 68 bytes per record.** Count: `ATTA.size / 68`.
Positions are in raw MEF units (divide by 40.96 to get meters). The parent model contains one ATTA record per logical sub-model slot; the same sub-model name can appear multiple times at different offsets.

## 2.9 XTVM Chunk -- Magic Vertices (16 bytes each)
XTVM records mark special-purpose positions within a model used by the game engine for events: gun fire origins, ladder interaction zones, particle emitters, etc. These are *not* rendered — they are invisible game logic hooks.

| Offset | Size | Type    | Field       | Description                                                      |
|--------|------|---------|-------------|------------------------------------------------------------------|
| 0x00   | 4    | float32 | px          | Position X (raw MEF units, NOT scaled)                           |
| 0x04   | 4    | float32 | py          | Position Y                                                       |
| 0x08   | 4    | float32 | pz          | Position Z                                                       |
| 0x0C   | 4    | int32   | magicType   | Magic vertex type ID (unconfirmed; see TASKTYPE constants below) |

**Total: 16 bytes per vertex.** Count: `XTVM.size / 16`.
The `magicType` field meaning is unconfirmed from binary analysis. It likely maps to a `TASKTYPE_*` constant indicating what engine system uses this vertex (gun clip position, ladder zone, etc.). Many entries have `magicType == 0`.

## 2.10 Parsing Algorithm Summary
```
1. Read ILFF header; validate "ILFF" magic and size
2. Parse chunk linked list (follow skip pointers)
3. Read model type from HSEM chunk (offset 0x20)
4. Read D3DR for face/mesh/vertex counts
5. Parse XTRV vertices using model-type-specific stride
6. Parse triangles:
   a. Type 1 with ECAF + valid D3DR -> split bone parse (DNER records + ECAF indices)
   b. Otherwise -> packed DNER parse (inline indices per block)
7. If no render geometry found, fall back to XTVC/ECFC collision mesh
8. Parse ATTA for sub-model attachment points
9. Parse XTVM for magic vertex positions
10. Scale all render positions by 1.0/40.96
```

## 2.11 Text-Based MEF Format (Exported)
The editor also supports a text-based MEF representation (parsed by `mef_parser.cpp`). This is a line-oriented script format:

```
NewObject("building_01");
Material(0, "concrete", 0.8, 0.8, 0.8, 0.1, 0.1, 0.1, 0.9, 0.9, 0.9, 0.0, 0.0, 0.0, 1.0);
MaterialShininess(0, 32.0);
Vertex(0, 100.5, 200.3, 50.0);
Normal(0, 0.0, 0.0, 1.0);
Face(0, 0, 1, 2, 0, 1, 2, 0);
UV(0, 0.0, 1.0);
BreakScript();
```
**Commands:**
| Command             | Arguments                                                   |
|---------------------|-------------------------------------------------------------|
| `NewObject`         | `(name)`                                                    |
| `Material`          | `(index, name, diffR,G,B, ambR,G,B, specR,G,B, emR,G,B, hasCollision)` |
| `MaterialShininess` | `(index, shininess)`                                        |
| `Vertex`            | `(index, x, y, z)`                                         |
| `Normal`            | `(index, nx, ny, nz)`                                      |
| `Face`              | `(faceIdx, v0, v1, v2, n0, n1, n2, materialIdx)`           |
| `UV`                | `(index, u, v, ...)`                                        |
| `BreakScript`       | `()` -- separator, no action                                |
Lines starting with `#` or `//` are comments. Empty lines are skipped.
